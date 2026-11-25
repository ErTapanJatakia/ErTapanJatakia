# frozen_string_literal: true
# Copyright (C) 2026 Er. Tapan Jatakia
# SPDX-License-Identifier: GPL-3.0-only

require "date"
require "fileutils"
require "json"
require "minitest/autorun"
require "open3"
require "pathname"
require "tmpdir"
require_relative "../scripts/validate-vex"

class VexValidatorTest < Minitest::Test
  TODAY = Date.new(2026, 11, 24)

  def setup
    @root = Pathname(Dir.mktmpdir("vex-validator"))
    (@root.join(".github")).mkpath
    (@root.join("docs/vex")).mkpath
  end

  def teardown
    FileUtils.remove_entry(@root) if @root&.exist?
  end

  def valid_record
    {
      "ghsa_id" => "GHSA-abcd-1234-efgh",
      "package_name" => "sample-package",
      "vex_document" => "docs/vex/statement.json",
      "status" => "not_affected",
      "expires_on" => "2026-12-24",
      "evidence_summary" => "Reviewed component inventory and execution paths for the scoped release.",
      "reviewed_by" => "Repository owner",
      "reviewed_on" => "2026-11-24"
    }
  end

  def write_register(record)
    @root.join(".github/dependabot-vex-exceptions.json").write(
      JSON.pretty_generate("schemaVersion" => 1, "exceptions" => [record])
    )
  end

  def write_statement(record)
    document = {
      "bomFormat" => "CycloneDX",
      "specVersion" => "1.6",
      "serialNumber" => "urn:uuid:12345678-1234-4234-8234-123456789abc",
      "version" => 1,
      "metadata" => {
        "timestamp" => "2026-11-24T00:00:00Z",
        "component" => {
          "type" => "application",
          "name" => "Sample project",
          "version" => "1.0.0",
          "purl" => "pkg:generic/sample-project@1.0.0"
        }
      },
      "vulnerabilities" => [
        {
          "id" => record["ghsa_id"],
          "analysis" => {
            "state" => "not_affected",
            "justification" => "code_not_reachable",
            "detail" => "Evidence review confirmed this component path is not present in the scoped release."
          },
          "affects" => [{ "ref" => "pkg:generic/sample-package@1.2.3" }]
        }
      ]
    }
    @root.join(record["vex_document"]).write(JSON.pretty_generate(document))
  end

  def test_accepts_complete_current_matching_exception
    record = valid_record
    write_statement(record)
    write_register(record)
    assert_empty VexValidator.validate_register(root: @root, today: TODAY)
  end

  def test_rejects_expired_exception
    record = valid_record.merge("expires_on" => "2026-11-23")
    write_statement(record)
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "expired"
  end

  def test_rejects_exception_that_is_not_not_affected
    record = valid_record.merge("status" => "affected")
    write_statement(record)
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "status must be not_affected"
  end

  def test_rejects_missing_matching_vulnerability
    record = valid_record
    write_statement(record)
    document_path = @root.join(record["vex_document"])
    document = JSON.parse(document_path.read)
    document["vulnerabilities"][0]["id"] = "GHSA-other-1234-abcd"
    document_path.write(JSON.pretty_generate(document))
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "matching vulnerability ID"
  end

  def test_rejects_expiry_beyond_90_days
    record = valid_record.merge("expires_on" => "2027-03-01")
    write_statement(record)
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "more than 90 days"
  end

  def test_rejects_placeholder_document_path
    record = valid_record.merge("vex_document" => "docs/vex/template.cdx.json")
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "real JSON statement"
  end
  def test_rejects_missing_register
    FileUtils.rm_f(@root.join(".github/dependabot-vex-exceptions.json"))
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "Missing VEX exception register"
  end

  def test_rejects_invalid_register_json
    @root.join(".github/dependabot-vex-exceptions.json").write("{")
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "Invalid VEX exception register JSON"
  end

  def test_rejects_wrong_schema_version
    @root.join(".github/dependabot-vex-exceptions.json").write(JSON.generate("schemaVersion" => 2, "exceptions" => []))
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "schemaVersion must be 1"
  end

  def test_rejects_non_array_exceptions
    @root.join(".github/dependabot-vex-exceptions.json").write(JSON.generate("schemaVersion" => 1, "exceptions" => {}))
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "exceptions must be an array"
  end

  def test_rejects_non_object_exception
    write_register("not-an-object")
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "must be an object"
  end

  def test_rejects_duplicate_advisory_package_pair
    record = valid_record
    write_statement(record)
    @root.join(".github/dependabot-vex-exceptions.json").write(
      JSON.pretty_generate("schemaVersion" => 1, "exceptions" => [record, record])
    )
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "duplicates an advisory/package pair"
  end

  def test_rejects_missing_required_field
    assert_invalid_record({ "reviewed_by" => "" }, "missing reviewed_by")
  end

  def test_rejects_invalid_advisory_identifier
    assert_invalid_record({ "ghsa_id" => "not-a-ghsa" }, "invalid GHSA identifier")
  end

  def test_rejects_placeholder_package_name
    assert_invalid_record({ "package_name" => "REPLACE-WITH-package" }, "contains a placeholder")
  end

  def test_rejects_short_evidence_summary
    assert_invalid_record({ "evidence_summary" => "too short" }, "at least 20 characters")
  end

  def test_rejects_placeholder_reviewer
    assert_invalid_record({ "reviewed_by" => "REPLACE-WITH-reviewer" }, "actual reviewer")
  end

  def test_rejects_future_review_date
    assert_invalid_record({ "reviewed_on" => "2027-01-01" }, "cannot be in the future")
  end

  def test_rejects_invalid_review_date
    assert_invalid_record({ "reviewed_on" => "not-a-date" }, "reviewed_on must use YYYY-MM-DD")
  end

  def test_rejects_invalid_expiry_date
    assert_invalid_record({ "expires_on" => "not-a-date" }, "expires_on must use YYYY-MM-DD")
  end

  def test_rejects_expiry_on_or_before_review_date
    assert_invalid_record({ "expires_on" => "2026-11-24" }, "expiry must be after review date")
  end

  def test_rejects_missing_vex_document
    record = valid_record
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "VEX document does not exist"
  end

  def test_rejects_invalid_vex_document_json
    record = valid_record
    @root.join(record["vex_document"]).write("{")
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "VEX document is invalid JSON"
  end

  def test_rejects_wrong_cyclonedx_version
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["specVersion"] = "1.5" }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "must use CycloneDX 1.6"
  end

  def test_rejects_placeholder_serial_number
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["serialNumber"] = "REPLACE-WITH-UUID" }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "serialNumber is missing or a template placeholder"
  end

  def test_rejects_missing_component_name
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["metadata"]["component"]["name"] = "" }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "component name is missing or a placeholder"
  end

  def test_rejects_non_package_url_component_identifier
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["metadata"]["component"]["purl"] = "not-a-purl" }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "must be a package URL"
  end

  def test_rejects_invalid_timestamp
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["metadata"]["timestamp"] = "not-a-timestamp" }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "must be an ISO-8601 timestamp"
  end

  def test_rejects_missing_matching_vulnerability_id
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["vulnerabilities"][0]["id"] = "GHSA-other-1234-abcd" }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "does not contain the matching vulnerability ID"
  end

  def test_rejects_wrong_vulnerability_analysis_state
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["vulnerabilities"][0]["analysis"]["state"] = "affected" }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "analysis state must be not_affected"
  end

  def test_rejects_unknown_vex_justification
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["vulnerabilities"][0]["analysis"]["justification"] = "unknown" }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "justification is missing or unrecognized"
  end

  def test_rejects_short_vex_analysis_detail
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["vulnerabilities"][0]["analysis"]["detail"] = "short" }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "detail must contain at least 40 characters"
  end

  def test_rejects_unmatched_affected_component_reference
    record = valid_record
    write_statement(record)
    mutate_statement(record) { |document| document["vulnerabilities"][0]["affects"] = [] }
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), "must reference a component purl matching package_name"
  end

  def test_cli_reports_success_for_current_repository_register
    root = File.expand_path("..", __dir__)
    script = File.join(root, "scripts/validate-vex.rb")
    output, error, status = Open3.capture3("ruby", script, chdir: root)
    assert status.success?, error
    assert_includes output, "VEX exception register validated"
    assert_empty error
  end

  def test_cli_fails_closed_when_register_is_missing
    Dir.mktmpdir("vex-cli") do |directory|
      script = File.expand_path("../scripts/validate-vex.rb", __dir__)
      output, error, status = Open3.capture3("ruby", script, chdir: directory)
      refute status.success?
      assert_empty output
      assert_match(/Missing VEX exception register/, error)
    end
  end

  private

  def assert_invalid_record(changes, expected)
    record = valid_record.merge(changes)
    write_statement(record)
    write_register(record)
    assert_includes VexValidator.validate_register(root: @root, today: TODAY).join(" "), expected
  end

  def mutate_statement(record)
    path = @root.join(record["vex_document"])
    document = JSON.parse(path.read)
    yield document
    path.write(JSON.pretty_generate(document))
  end

end
