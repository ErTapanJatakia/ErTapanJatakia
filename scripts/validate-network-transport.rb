#!/usr/bin/env ruby
# frozen_string_literal: true

module NetworkTransportValidator
  module_function

  COMMAND_PATTERN = /(?:\A[ \t]*curl\b|\$\([ \t]*curl\b)/.freeze
  BYPASS_PATTERNS = {
    "curl insecure option" => /--insecure\b/,
    "curl proxy insecure option" => /--proxy-insecure\b/,
    "Git TLS verification disabled" => /GIT_SSL_NO_VERIFY/,
    "Node TLS verification disabled" => /NODE_TLS_REJECT_UNAUTHORIZED\s*[:=]\s*0/,
    "npm TLS verification disabled" => /strict-ssl\s*=\s*false/i,
    "Git HTTP certificate verification disabled" => /sslVerify\s*=\s*false/i
  }.freeze

  def validate_workflows(workflows)
    errors = []
    curl_count = 0

    workflows.each do |path, content|
      lines = content.lines
      index = 0

      while index < lines.length
        line = lines[index]
        unless line.match?(COMMAND_PATTERN)
          index += 1
          next
        end

        command = line.dup
        while command.rstrip.end_with?("\\") && index + 1 < lines.length
          index += 1
          command << lines[index]
        end
        curl_count += 1
        errors << "#{path}: curl must restrict protocols to HTTPS" unless command.include?("--proto '=https'")
        errors << "#{path}: curl must require TLS 1.2 or later" unless command.include?("--tlsv1.2")
        if command.include?("--location") && !command.include?("--proto-redir '=https'")
          errors << "#{path}: curl redirects must be restricted to HTTPS"
        end
        index += 1
      end

      BYPASS_PATTERNS.each do |description, pattern|
        errors << "#{path}: #{description} is prohibited" if content.match?(pattern)
      end
    end

    { valid: errors.empty?, errors: errors, curl_count: curl_count }
  end

  def validate_directory(directory)
    paths = Dir.glob(File.join(directory, "*.yml")) + Dir.glob(File.join(directory, "*.yaml"))
    return { valid: false, errors: ["No workflow YAML files found in #{directory}"], curl_count: 0 } if paths.empty?

    workflows = paths.to_h { |path| [path, File.read(path)] }
    validate_workflows(workflows)
  rescue SystemCallError => e
    { valid: false, errors: ["Unable to read workflow files: #{e.message}"], curl_count: 0 }
  end

  def run_cli(directory, output: $stdout, error: $stderr)
    result = validate_directory(directory)
    unless result[:valid]
      error.puts result[:errors].map { |message| "::error::#{message}" }.join("\n")
      return 1
    end

    output.puts "Validated #{result[:curl_count]} curl request(s): HTTPS-only, TLS 1.2+ and HTTPS-only redirects."
    output.puts "No known certificate-verification bypass settings were found."
    0
  end
end

if $PROGRAM_NAME == __FILE__
  directory = ARGV.fetch(0, ".github/workflows")
  exit NetworkTransportValidator.run_cli(directory)
end
