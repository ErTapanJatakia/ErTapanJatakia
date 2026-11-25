#!/usr/bin/env ruby
# frozen_string_literal: true
# Copyright (C) 2026 Er. Tapan Jatakia
# SPDX-License-Identifier: GPL-3.0-only

require "json"

module SbomValidator
  module_function

  def validate_document(document)
    errors = []
    unless document.is_a?(Hash)
      return { valid: false, errors: ["SPDX document must be a JSON object"], package_count: 0, dependency_count: 0 }
    end

    candidate = document["sbom"].is_a?(Hash) ? document["sbom"] : document
    errors << "SPDXID must be SPDXRef-DOCUMENT" unless candidate["SPDXID"] == "SPDXRef-DOCUMENT"
    errors << "spdxVersion must be SPDX-2.3" unless candidate["spdxVersion"] == "SPDX-2.3"

    packages = candidate["packages"]
    relationships = candidate["relationships"]
    errors << "packages must be an array" unless packages.is_a?(Array)
    errors << "relationships must be an array" unless relationships.is_a?(Array)

    dependency_count = if relationships.is_a?(Array)
                         relationships.count do |relationship|
                           relationship.is_a?(Hash) && relationship["relationshipType"] == "DEPENDS_ON"
                         end
                       else
                         0
                       end

    {
      valid: errors.empty?,
      errors: errors,
      package_count: packages.is_a?(Array) ? packages.length : 0,
      dependency_count: dependency_count
    }
  end

  def validate_file(path)
    document = JSON.parse(File.read(path))
    validate_document(document)
  rescue JSON::ParserError => e
    { valid: false, errors: ["Invalid SPDX JSON: #{e.message}"], package_count: 0, dependency_count: 0 }
  rescue SystemCallError => e
    { valid: false, errors: ["Unable to read SPDX document: #{e.message}"], package_count: 0, dependency_count: 0 }
  end

  def run_cli(path, output: $stdout, error: $stderr)
    result = validate_file(path)
    unless result[:valid]
      error.puts result[:errors].map { |message| "::error::#{message}" }.join("\n")
      return 1
    end

    output.puts "SPDX 2.3 document validated."
    output.puts "package_count=#{result[:package_count]}"
    output.puts "dependency_count=#{result[:dependency_count]}"
    output.puts "::notice::Valid SPDX document has no DEPENDS_ON relationships; retain as an empty graph snapshot." if result[:dependency_count].zero?
    0
  end
end

if $PROGRAM_NAME == __FILE__
  path = ARGV.fetch(0) { abort "Usage: ruby scripts/validate-sbom.rb <spdx-json-file>" }
  exit SbomValidator.run_cli(path)
end
