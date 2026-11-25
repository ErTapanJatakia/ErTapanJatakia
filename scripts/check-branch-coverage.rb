#!/usr/bin/env ruby
# frozen_string_literal: true

require "coverage"
require "minitest/autorun"

ROOT = File.expand_path("..", __dir__)
COVERED_SOURCE_FILES = %w[
  scripts/validate-dco.rb
  scripts/validate-vex.rb
].map { |path| File.expand_path(path, ROOT) }.freeze
MINIMUM_BRANCH_COVERAGE = 80.0
MINIMUM_STATEMENT_COVERAGE = 80.0

Coverage.start(:all)

Minitest.after_run do
  results = Coverage.result
  branch_total = 0
  branch_covered = 0
  statement_total = 0
  statement_covered = 0

  COVERED_SOURCE_FILES.each do |path|
    metrics = results[path]
    next unless metrics

    (metrics[:branches] || {}).each_value do |branch_set|
      branch_set.each_value do |execution_count|
        branch_total += 1
        branch_covered += 1 if execution_count.positive?
      end
    end

    Array(metrics[:lines]).each do |execution_count|
      next if execution_count.nil?

      statement_total += 1
      statement_covered += 1 if execution_count.positive?
    end
  end

  if branch_total.zero? || statement_total.zero?
    warn "Ruby validator coverage could not be measured."
    exit 1
  end

  branch_percentage = branch_covered.to_f * 100 / branch_total
  statement_percentage = statement_covered.to_f * 100 / statement_total
  puts format("Ruby validator branch coverage: %d/%d (%.2f%%); required: %.2f%%",
              branch_covered, branch_total, branch_percentage, MINIMUM_BRANCH_COVERAGE)
  puts format("Ruby validator statement coverage: %d/%d (%.2f%%); required: %.2f%%",
              statement_covered, statement_total, statement_percentage, MINIMUM_STATEMENT_COVERAGE)

  if branch_percentage < MINIMUM_BRANCH_COVERAGE
    warn "Ruby validator branch coverage is below the required threshold."
    exit 1
  end

  if statement_percentage < MINIMUM_STATEMENT_COVERAGE
    warn "Ruby validator statement coverage is below the required threshold."
    exit 1
  end
end

Dir[File.join(ROOT, "tests", "*_test.rb")].sort.each do |test_file|
  require test_file
end
