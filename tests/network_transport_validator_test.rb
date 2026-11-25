# frozen_string_literal: true
# Copyright (C) 2026 Er. Tapan Jatakia
# SPDX-License-Identifier: GPL-3.0-only

require "minitest/autorun"
require "open3"
require "stringio"
require "tempfile"
require "tmpdir"
require_relative "../scripts/validate-network-transport"

class NetworkTransportValidatorTest < Minitest::Test
  def valid_workflow
    {
      "workflow.yml" => <<~YAML
        steps:
          - run: |
              curl --proto '=https' --tlsv1.2 --proto-redir '=https' --location https://example.test/archive
              status="$(curl --proto '=https' --tlsv1.2 https://api.example.test/status)"
      YAML
    }
  end

  def test_accepts_https_tls_and_redirect_policy
    result = NetworkTransportValidator.validate_workflows(valid_workflow)
    assert result[:valid], result[:errors].join("; ")
    assert_equal 2, result[:curl_count]
  end

  def test_rejects_missing_tls_minimum
    workflow = { "workflow.yml" => "curl --proto '=https' https://example.test\n" }
    result = NetworkTransportValidator.validate_workflows(workflow)
    refute result[:valid]
    assert result[:errors].any? { |error| error.include?("TLS 1.2") }
  end

  def test_rejects_missing_https_only_protocol
    workflow = { "workflow.yml" => "curl --tlsv1.2 https://example.test\n" }
    result = NetworkTransportValidator.validate_workflows(workflow)
    refute result[:valid]
    assert result[:errors].any? { |error| error.include?("HTTPS") }
  end

  def test_rejects_redirect_without_https_redirect_restriction
    workflow = { "workflow.yml" => "curl --proto '=https' --tlsv1.2 --location https://example.test\n" }
    result = NetworkTransportValidator.validate_workflows(workflow)
    refute result[:valid]
    assert result[:errors].any? { |error| error.include?("redirects") }
  end

  def test_rejects_curl_insecure_option
    workflow = { "workflow.yml" => "curl --proto '=https' --tlsv1.2 --insecure https://example.test\n" }
    result = NetworkTransportValidator.validate_workflows(workflow)
    refute result[:valid]
    assert result[:errors].any? { |error| error.include?("insecure option") }
  end

  def test_rejects_git_and_node_certificate_verification_bypasses
    workflow = { "workflow.yml" => "env:\n  GIT_SSL_NO_VERIFY: true\n  NODE_TLS_REJECT_UNAUTHORIZED: 0\n" }
    result = NetworkTransportValidator.validate_workflows(workflow)
    refute result[:valid]
    assert_equal 2, result[:errors].length
  end

  def test_handles_multiline_curl_command
    workflow = {
      "workflow.yml" => "curl --proto '=https' --tlsv1.2 \\\n  --proto-redir '=https' --location https://example.test\n"
    }
    result = NetworkTransportValidator.validate_workflows(workflow)
    assert result[:valid], result[:errors].join("; ")
    assert_equal 1, result[:curl_count]
  end

  def test_directory_validation_reports_file_read_errors
    Dir.mktmpdir do |directory|
      Dir.mkdir(File.join(directory, "not-a-workflow-file.yml"))
      result = NetworkTransportValidator.validate_directory(directory)
      refute result[:valid]
      assert_match(/Unable to read workflow files/, result[:errors].first)
    end
  end

  def test_command_line_entrypoint_validates_workflow_directory
    Dir.mktmpdir do |directory|
      File.write(
        File.join(directory, "workflow.yml"),
        "curl --proto '=https' --tlsv1.2 https://example.test\\n"
      )
      script = File.expand_path("../scripts/validate-network-transport.rb", __dir__)
      original_program_name = $PROGRAM_NAME
      original_argv = ARGV.dup
      begin
        $PROGRAM_NAME = script
        ARGV.replace([directory])
        output, error = capture_io do
          success = assert_raises(SystemExit) { load script }
          assert_equal 0, success.status
        end
        assert_includes output, "Validated 1 curl request"
        assert_empty error
      ensure
        $PROGRAM_NAME = original_program_name
        ARGV.replace(original_argv)
      end
    end
  end

  def test_cli_reports_successful_validation
    Dir.mktmpdir do |directory|
      File.write(File.join(directory, "workflow.yml"), "curl --proto '=https' --tlsv1.2 https://example.test\n")
      output = StringIO.new
      error = StringIO.new
      assert_equal 0, NetworkTransportValidator.run_cli(directory, output: output, error: error)
      assert_includes output.string, "Validated 1 curl request"
      assert_empty error.string
    end
  end

  def test_cli_fails_when_no_workflow_files_exist
    Dir.mktmpdir do |directory|
      output = StringIO.new
      error = StringIO.new
      assert_equal 1, NetworkTransportValidator.run_cli(directory, output: output, error: error)
      assert_match(/No workflow YAML files found/, error.string)
    end
  end
end
