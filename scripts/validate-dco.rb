#!/usr/bin/env ruby
# frozen_string_literal: true

require "open3"

module DcoValidator
  SIGNOFF_PREFIX = "Signed-off-by:"

  def self.valid_signoff?(message, author_name, author_email)
    expected = "#{SIGNOFF_PREFIX} #{author_name} <#{author_email}>"
    message.each_line.any? { |line| line.chomp == expected }
  end

  def self.validate_range(base_sha, head_sha)
    commits, status = Open3.capture2("git", "rev-list", "--reverse", "#{base_sha}..#{head_sha}")
    raise "Unable to enumerate pull-request commits" unless status.success?

    commit_ids = commits.lines.map(&:strip).reject(&:empty?)
    raise "No commits found in the pull-request range" if commit_ids.empty?

    errors = []
    commit_ids.each do |commit|
      author_data, author_status = Open3.capture2("git", "show", "-s", "--format=%an%x00%ae", commit)
      message, message_status = Open3.capture2("git", "show", "-s", "--format=%B", commit)
      unless author_status.success? && message_status.success?
        errors << "#{commit}: unable to read commit metadata"
        next
      end

      author_name, author_email = author_data.chomp.split("\0", 2)
      unless author_name && author_email && valid_signoff?(message, author_name, author_email)
        errors << "#{commit}: missing exact DCO sign-off for #{author_name} <#{author_email}>"
      end
    end

    errors
  end
end

if $PROGRAM_NAME == __FILE__
  base_sha = ENV["BASE_SHA"]
  head_sha = ENV["HEAD_SHA"]
  abort "BASE_SHA and HEAD_SHA must be provided by the pull-request workflow." if [base_sha, head_sha].any?(&:nil?) || [base_sha, head_sha].any?(&:empty?)

  errors = DcoValidator.validate_range(base_sha, head_sha)
  unless errors.empty?
    warn "DCO validation failed:"
    errors.each { |error| warn " - #{error}" }
    warn "Add a Signed-off-by trailer matching each commit author's Git identity (for example, git commit -s)."
    exit 1
  end

  puts "DCO validation passed for every commit in #{base_sha}..#{head_sha}."
end
