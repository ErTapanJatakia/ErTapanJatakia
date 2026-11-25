# frozen_string_literal: true

require "minitest/autorun"
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
end
