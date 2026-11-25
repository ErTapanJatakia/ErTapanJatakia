#!/usr/bin/env ruby
# frozen_string_literal: true
# Copyright (C) 2026 Er. Tapan Jatakia
# SPDX-License-Identifier: GPL-3.0-only

require "open3"

module DcoValidator
  SIGNOFF_PREFIX = "Signed-off-by:"

  def self.valid_signoff?(message, identity_name, identity_email)
    expected = "#{SIGNOFF_PREFIX} #{identity_name} <#{identity_email}>"
    message.each_line.any? { |line| line.chomp == expected }
  end

  def self.valid_commit_signoff?(message, author_name, author_email, committer_name, committer_email)
    valid_signoff?(message, author_name, author_email) ||
      valid_signoff?(message, committer_name, committer_email)
  end

  def self.validate_range(base_sha, head_sha)
    commits, status = Open3.capture2("git", "rev-list", "--reverse", "#{base_sha}..#{head_sha}")
    raise "Unable to enumerate pull-request commits" unless status.success?

    commit_ids = commits.lines.map(&:strip).reject(&:empty?)
    raise "No commits found in the pull-request range" if commit_ids.empty?

    errors = []
    commit_ids.each do |commit|
      author_data, author_status = Open3.capture2("git", "show", "-s", "--format=%an%x00%ae", commit)
      committer_data, committer_status = Open3.capture2("git", "show", "-s", "--format=%cn%x00%ce", commit)
      message, message_status = Open3.capture2("git", "show", "-s", "--format=%B", commit)
      unless author_status.success? && committer_status.success? && message_status.success?
        errors << "#{commit}: unable to read commit metadata"
        next
      end

      author_name, author_email = author_data.chomp.split("\0", 2)
      committer_name, committer_email = committer_data.chomp.split("\0", 2)
      unless valid_commit_signoff?(message, author_name, author_email, committer_name, committer_email)
        errors << "#{commit}: missing exact DCO sign-off matching the commit author or committer identity"
      end
    end

    errors
  end

  def self.run_cli(base_sha, head_sha, output: $stdout, error: $stderr)
    if [base_sha, head_sha].any? { |value| value.nil? || value.empty? }
      error.puts "BASE_SHA and HEAD_SHA must be provided by the pull-request workflow."
      return 1
    end

    errors = validate_range(base_sha, head_sha)
    unless errors.empty?
      error.puts "DCO validation failed:"
      errors.each { |message| error.puts " - #{message}" }
      error.puts "Add a Signed-off-by trailer matching the commit author or committer identity (for example, git commit -s)."
      return 1
    end

    output.puts "DCO validation passed for every commit in #{base_sha}..#{head_sha}."
    0
  end
end

if $PROGRAM_NAME == __FILE__
  exit DcoValidator.run_cli(ENV["BASE_SHA"], ENV["HEAD_SHA"])
end
