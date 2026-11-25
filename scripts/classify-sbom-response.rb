#!/usr/bin/env ruby
# frozen_string_literal: true

module SbomResponseClassifier
  module_function

  def classify(status)
    case status.to_s
    when "302"
      "ready"
    when "202"
      "pending"
    else
      "unexpected"
    end
  end

  def run_cli(status, output: $stdout)
    output.puts classify(status)
    0
  end
end

if $PROGRAM_NAME == __FILE__
  status = ARGV.fetch(0) { abort "Usage: ruby scripts/classify-sbom-response.rb <http-status>" }
  exit SbomResponseClassifier.run_cli(status)
end
