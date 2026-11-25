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

Coverage.start(:all)

Minitest.after_run do
  results = Coverage.result
  total = 0
  covered = 0

  COVERED_SOURCE_FILES.each do |path|
    metrics = results[ path ]
    next unless metrics

    (metrics[:branches] || {}).each_value do |branch_set|
      branch_set.each_value do |execution_count|
        total += 1
        covered += 1 if execution_count.positive?
      end
    end
  end

  if total.zero?
    warn "Branch coverage could not be measured for the maintained Ruby validators."
    exit 1
  end

  percentage = covered.to_f * 100 / total
  puts format("Ruby validator branch coverage: %d/%d (%.2f%%); required: %.2f%%",
              covered, total, percentage, MINIMUM_BRANCH_COVERAGE)

  if percentage < MINIMUM_BRANCH_COVERAGE
    warn "Ruby validator branch coverage is below the required threshold."
    exit 1
  end
end

Dir[File.join(ROOT, "tests", "*_test.rb")].sort.each do |test_file|
  require test_file
end
