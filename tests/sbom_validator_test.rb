# frozen_string_literal: true

require "minitest/autorun"
require "stringio"
require "tempfile"
require_relative "../scripts/validate-sbom"
require_relative "../scripts/classify-sbom-response"

class SbomValidatorTest < Minitest::Test
  def valid_document
    {
      "SPDXID" => "SPDXRef-DOCUMENT",
      "spdxVersion" => "SPDX-2.3",
      "packages" => [{ "name" => "example" }],
      "relationships" => [{ "relationshipType" => "DEPENDS_ON" }]
    }
  end

  def test_accepts_direct_spdx_document
    result = SbomValidator.validate_document(valid_document)
    assert result[:valid]
    assert_equal 1, result[:package_count]
    assert_equal 1, result[:dependency_count]
  end

  def test_accepts_api_wrapped_spdx_document
    result = SbomValidator.validate_document("sbom" => valid_document)
    assert result[:valid]
    assert_equal 1, result[:package_count]
    assert_equal 1, result[:dependency_count]
  end

  def test_accepts_valid_empty_dependency_graph
    result = SbomValidator.validate_document(valid_document.merge("relationships" => []))
    assert result[:valid]
    assert_equal 0, result[:dependency_count]
  end

  def test_rejects_non_object_document
    result = SbomValidator.validate_document([])
    refute result[:valid]
    assert_includes result[:errors], "SPDX document must be a JSON object"
  end

  def test_rejects_wrong_document_identifier
    result = SbomValidator.validate_document(valid_document.merge("SPDXID" => "SPDXRef-PACKAGE"))
    refute result[:valid]
    assert_includes result[:errors], "SPDXID must be SPDXRef-DOCUMENT"
  end

  def test_rejects_wrong_spdx_version
    result = SbomValidator.validate_document(valid_document.merge("spdxVersion" => "SPDX-2.2"))
    refute result[:valid]
    assert_includes result[:errors], "spdxVersion must be SPDX-2.3"
  end

  def test_rejects_non_array_packages
    result = SbomValidator.validate_document(valid_document.merge("packages" => {}))
    refute result[:valid]
    assert_includes result[:errors], "packages must be an array"
  end

  def test_rejects_non_array_relationships
    result = SbomValidator.validate_document(valid_document.merge("relationships" => nil))
    refute result[:valid]
    assert_includes result[:errors], "relationships must be an array"
  end

  def test_ignores_malformed_relationship_entries_for_dependency_count
    result = SbomValidator.validate_document(valid_document.merge(
      "relationships" => [nil, "not-an-object", { "relationshipType" => "OTHER" }]
    ))
    assert result[:valid]
    assert_equal 0, result[:dependency_count]
  end

  def test_validate_file_accepts_valid_json
    Tempfile.create(["valid-sbom", ".json"]) do |file|
      file.write(JSON.generate(valid_document))
      file.flush
      assert SbomValidator.validate_file(file.path)[:valid]
    end
  end

  def test_validate_file_rejects_malformed_json
    Tempfile.create(["invalid-sbom", ".json"]) do |file|
      file.write("{ invalid")
      file.flush
      result = SbomValidator.validate_file(file.path)
      refute result[:valid]
      assert_match(/Invalid SPDX JSON/, result[:errors].first)
    end
  end

  def test_validate_file_reports_missing_file
    result = SbomValidator.validate_file("/path/that/does/not/exist/sbom.json")
    refute result[:valid]
    assert_match(/Unable to read SPDX document/, result[:errors].first)
  end

  def test_cli_reports_valid_document_and_empty_graph
    Tempfile.create(["empty-sbom", ".json"]) do |file|
      file.write(JSON.generate(valid_document.merge("relationships" => [])))
      file.flush
      output = StringIO.new
      error = StringIO.new
      assert_equal 0, SbomValidator.run_cli(file.path, output: output, error: error)
      assert_includes output.string, "package_count=1"
      assert_includes output.string, "dependency_count=0"
      assert_includes output.string, "empty graph snapshot"
      assert_empty error.string
    end
  end

  def test_cli_returns_failure_for_invalid_document
    Tempfile.create(["bad-sbom", ".json"]) do |file|
      file.write("{}")
      file.flush
      output = StringIO.new
      error = StringIO.new
      assert_equal 1, SbomValidator.run_cli(file.path, output: output, error: error)
      assert_match(/SPDXID must be SPDXRef-DOCUMENT/, error.string)
    end
  end

  def test_classifies_http_302_as_ready
    assert_equal "ready", SbomResponseClassifier.classify("302")
  end

  def test_classifies_http_202_as_pending
    assert_equal "pending", SbomResponseClassifier.classify("202")
  end

  def test_classifies_unexpected_http_statuses
    %w[200 201 400 401 404 500].each do |status|
      assert_equal "unexpected", SbomResponseClassifier.classify(status)
    end
  end

  def test_response_classifier_cli_writes_state
    output = StringIO.new
    assert_equal 0, SbomResponseClassifier.run_cli("302", output: output)
    assert_equal "ready\n", output.string
  end

  def test_sbom_generation_uses_get
    workflow = File.read(File.expand_path("../.github/workflows/repository-dependency-sbom.yml", __dir__))
    assert_match(/--request GET/, workflow)
    refute_match(/--request POST/, workflow)
  end

  def test_local_gpg_action_reference_resolves
    workflow = File.read(File.expand_path("../.github/workflows/documentation-release.yml", __dir__))
    assert_includes workflow, "$/.github/actions/setup-personal-gpg"
    assert File.file?(File.expand_path("../.github/actions/setup-personal-gpg/action.yml", __dir__))
  end
end
