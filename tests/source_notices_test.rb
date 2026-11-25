# frozen_string_literal: true
# Copyright (C) 2026 Er. Tapan Jatakia
# SPDX-License-Identifier: GPL-3.0-only

require "minitest/autorun"

class SourceNoticesTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)
  MAINTAINED_RUBY_FILES = (
    Dir[File.join(ROOT, "scripts", "*.rb")] +
    Dir[File.join(ROOT, "tests", "*_test.rb")]
  ).sort.freeze

  def test_every_maintained_ruby_source_and_test_has_copyright_and_spdx_notice
    refute_empty MAINTAINED_RUBY_FILES

    MAINTAINED_RUBY_FILES.each do |path|
      header = File.readlines(path, chomp: true).first(8).join("\n")
      assert_includes header, "Copyright (C) 2026 Er. Tapan Jatakia", path
      assert_includes header, "SPDX-License-Identifier: GPL-3.0-only", path
    end
  end
end
