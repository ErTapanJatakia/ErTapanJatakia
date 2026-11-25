#!/usr/bin/env ruby
# frozen_string_literal: true
# Copyright (C) 2026 Er. Tapan Jatakia
# SPDX-License-Identifier: GPL-3.0-only

require "date"
require "json"
require "pathname"
require "time"

module VexValidator
  ALLOWED_JUSTIFICATIONS = %w[
    code_not_reachable
    code_not_present
    requires_configuration
    requires_dependency
    requires_environment
    protected_by_compiler
    protected_at_runtime
    protected_by_mitigating_control
    inline_mitigations_already_exist
  ].freeze
  PLACEHOLDER_PATTERN = /PLACEHOLDER|REPLACE-WITH|EXAMPLE|YYYY\.MM\.DD|replace-with/i

  module_function

  def validate_register(root:, today: Date.today)
    root = Pathname(root)
    register_path = root.join(".github/dependabot-vex-exceptions.json")
    errors = []
    return ["Missing VEX exception register: #{register_path}"] unless register_path.file?

    begin
      register = JSON.parse(register_path.read)
    rescue JSON::ParserError => e
      return ["Invalid VEX exception register JSON: #{e.message}"]
    end

    unless register.is_a?(Hash)
      return ["VEX exception register must be a JSON object"]
    end

    errors << "schemaVersion must be 1" unless register["schemaVersion"] == 1
    return errors + ["exceptions must be an array"] unless register["exceptions"].is_a?(Array)

    seen = {}
    register["exceptions"].each_with_index do |exception, index|
      unless exception.is_a?(Hash)
        errors << "exceptions[#{index}] must be an object"
        next
      end
      key = [exception["ghsa_id"], exception["package_name"]]
      errors << "exceptions[#{index}] duplicates an advisory/package pair" if seen[key]
      seen[key] = true
      errors.concat(validate_exception(exception, root: root, today: today).map { |e| "exceptions[#{index}]: #{e}" })
    end
    errors
  end

  def validate_exception(record, root:, today: Date.today)
    errors = []
    required = %w[ghsa_id package_name vex_document status expires_on evidence_summary reviewed_by reviewed_on]
    required.each { |key| errors << "missing #{key}" if record[key].to_s.strip.empty? }

    ghsa = record["ghsa_id"].to_s
    errors << "invalid GHSA identifier" unless ghsa.match?(/\AGHSA-[A-Za-z0-9-]+\z/)
    errors << "status must be not_affected" unless record["status"] == "not_affected"
    errors << "package_name contains a placeholder" if record["package_name"].to_s.match?(PLACEHOLDER_PATTERN)
    errors << "evidence_summary must contain at least 20 characters" if record["evidence_summary"].to_s.strip.length < 20
    errors << "reviewed_by must identify an actual reviewer" if record["reviewed_by"].to_s.match?(PLACEHOLDER_PATTERN)

    reviewed_on = parse_date(record["reviewed_on"], "reviewed_on", errors)
    expires_on = parse_date(record["expires_on"], "expires_on", errors)
    errors << "reviewed_on cannot be in the future" if reviewed_on && reviewed_on > today
    if expires_on
      errors << "exception is expired" if expires_on < today
      errors << "expiry cannot be more than 90 days after review" if reviewed_on && expires_on > reviewed_on + 90
      errors << "expiry must be after review date" if reviewed_on && expires_on <= reviewed_on
    end

    relative = record["vex_document"].to_s
    unless relative.start_with?("docs/vex/") && !relative.include?("..") && relative.end_with?(".json") && !relative.end_with?("template.cdx.json")
      errors << "vex_document must reference a real JSON statement under docs/vex/"
      return errors
    end

    document_path = Pathname(root).join(relative)
    unless document_path.file?
      errors << "VEX document does not exist: #{relative}"
      return errors
    end

    begin
      document = JSON.parse(document_path.read)
    rescue JSON::ParserError => e
      errors << "VEX document is invalid JSON: #{e.message}"
      return errors
    end

    unless document.is_a?(Hash)
      errors << "VEX document must be a JSON object"
      return errors
    end

    errors << "VEX document must use CycloneDX 1.6" unless document["bomFormat"] == "CycloneDX" && document["specVersion"] == "1.6"
    serial = document["serialNumber"].to_s
    errors << "VEX serialNumber is missing or a template placeholder" if serial.empty? || serial.match?(PLACEHOLDER_PATTERN) || serial.include?("00000000-0000-4000-8000-000000000000")

    metadata = document["metadata"]
    unless metadata.is_a?(Hash)
      errors << "project metadata must be an object"
      metadata = {}
    end
    component = metadata["component"]
    unless component.is_a?(Hash)
      errors << "project metadata component must be an object"
      component = {}
    end
    %w[name version purl].each do |field|
      value = component[field].to_s
      errors << "project metadata component #{field} is missing or a placeholder" if value.empty? || value.match?(PLACEHOLDER_PATTERN)
    end
    errors << "project metadata component purl must be a package URL" unless component["purl"].to_s.start_with?("pkg:")

    begin
      Time.iso8601(metadata["timestamp"].to_s)
    rescue ArgumentError
      errors << "metadata.timestamp must be an ISO-8601 timestamp"
    end

    vulnerabilities = document["vulnerabilities"]
    unless vulnerabilities.is_a?(Array)
      errors << "vulnerabilities must be an array"
      vulnerabilities = []
    end
    vulnerability = vulnerabilities.find { |item| item.is_a?(Hash) && item["id"] == ghsa }
    unless vulnerability
      errors << "VEX document does not contain the matching vulnerability ID"
      return errors
    end
    analysis = vulnerability["analysis"]
    unless analysis.is_a?(Hash)
      errors << "VEX analysis must be an object"
      analysis = {}
    end
    errors << "VEX analysis state must be not_affected" unless analysis["state"] == "not_affected"
    errors << "VEX justification is missing or unrecognized" unless ALLOWED_JUSTIFICATIONS.include?(analysis["justification"])
    detail = analysis["detail"].to_s
    errors << "VEX analysis detail must contain at least 40 characters and no placeholders" if detail.length < 40 || detail.match?(PLACEHOLDER_PATTERN)
    refs = Array(vulnerability["affects"]).filter_map { |item| item["ref"] if item.is_a?(Hash) }
    errors << "VEX affects must reference a component purl matching package_name" unless refs.any? { |ref| ref.start_with?("pkg:") && ref.include?(record["package_name"].to_s) && !ref.match?(PLACEHOLDER_PATTERN) }

    errors
  end

  def parse_date(value, label, errors)
    Date.iso8601(value.to_s)
  rescue Date::Error
    errors << "#{label} must use YYYY-MM-DD"
    nil
  end
end

if $PROGRAM_NAME == __FILE__
  errors = VexValidator.validate_register(root: Dir.pwd)
  if errors.empty?
    puts "VEX exception register validated: no malformed, expired or unsupported exceptions."
  else
    warn errors.map { |error| "::error::#{error}" }.join("\n")
    exit 1
  end
end
