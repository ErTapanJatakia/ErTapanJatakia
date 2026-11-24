# frozen_string_literal: true

require "date"
require "fileutils"
require "json"
require "minitest/autorun"
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
      "package_name" => "example-package",
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
          "name" => "Example project",
          "version" => "1.0.0",
          "purl" => "pkg:generic/example-project@1.0.0"
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
          "affects" => [{ "ref" => "pkg:generic/example-package@1.2.3" }]
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
end
