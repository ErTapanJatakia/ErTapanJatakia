# frozen_string_literal: true

require "minitest/autorun"
require "tmpdir"
require_relative "../scripts/validate-dco"

class DcoValidatorTest < Minitest::Test
  def test_accepts_exact_author_signoff
    message = "docs: update policy\n\nSigned-off-by: Er. Tapan Jatakia <tapan@example.com>\n"
    assert DcoValidator.valid_signoff?(message, "Er. Tapan Jatakia", "tapan@example.com")
  end

  def test_rejects_missing_signoff
    refute DcoValidator.valid_signoff?("docs: update policy\n", "Er. Tapan Jatakia", "tapan@example.com")
  end

  def test_rejects_signoff_from_different_identity
    message = "docs: update policy\n\nSigned-off-by: Other Person <other@example.com>\n"
    refute DcoValidator.valid_signoff?(message, "Er. Tapan Jatakia", "tapan@example.com")
  end

  def test_rejects_quoted_or_embedded_signoff_text
    message = "docs: update policy\n\n> Signed-off-by: Er. Tapan Jatakia <tapan@example.com>\n"
    refute DcoValidator.valid_signoff?(message, "Er. Tapan Jatakia", "tapan@example.com")
  end

  def test_requires_exact_email
    message = "docs: update policy\n\nSigned-off-by: Er. Tapan Jatakia <other@example.com>\n"
    refute DcoValidator.valid_signoff?(message, "Er. Tapan Jatakia", "tapan@example.com")
  end

  def test_validates_commit_range_with_author_matching_signoff
    with_git_repository do |base_sha|
      create_commit("change with sign-off", "Signed-off-by: Test Author <test@example.com>")
      assert_empty DcoValidator.validate_range(base_sha, git!("rev-parse", "HEAD"))
    end
  end

  def test_accepts_committer_signoff_when_author_differs
    with_git_repository do |base_sha|
      create_commit(
        "contribution by original author",
        "Signed-off-by: Test Author <test@example.com>",
        author: "Original Author <original@example.com>"
      )
      assert_empty DcoValidator.validate_range(base_sha, git!("rev-parse", "HEAD"))
    end
  end

  def test_rejects_commit_range_without_signoff
    with_git_repository do |base_sha|
      create_commit("change without sign-off", nil)
      errors = DcoValidator.validate_range(base_sha, git!("rev-parse", "HEAD"))
      assert_equal 1, errors.length
      assert_match(/missing exact DCO sign-off/, errors.first)
    end
  end

  def test_rejects_unavailable_commit_range
    error = assert_raises(RuntimeError) do
      DcoValidator.validate_range("not-a-real-base", "not-a-real-head")
    end
    assert_equal "Unable to enumerate pull-request commits", error.message
  end

  def test_rejects_empty_commit_range
    with_git_repository do |base_sha|
      error = assert_raises(RuntimeError) { DcoValidator.validate_range(base_sha, base_sha) }
      assert_equal "No commits found in the pull-request range", error.message
    end
  end

  private

  def with_git_repository
    Dir.mktmpdir("dco-validator-test") do |directory|
      Dir.chdir(directory) do
        git!("init", "-q")
        git!("config", "user.name", "Test Author")
        git!("config", "user.email", "test@example.com")
        File.write("tracked.txt", "base\n")
        git!("add", "tracked.txt")
        git!("commit", "-q", "-m", "base")
        base_sha = git!("rev-parse", "HEAD")
        yield base_sha
      end
    end
  end

  def create_commit(subject, signoff, author: nil)
    File.write("tracked.txt", "#{subject}\n")
    git!("add", "tracked.txt")
    args = ["commit", "-q"]
    args += ["--author", author] if author
    args += ["-m", subject]
    args += ["-m", signoff] if signoff
    git!(*args)
  end

  def git!(*args)
    output, error, status = Open3.capture3("git", *args)
    raise "git #{args.join(" ")} failed: #{error}" unless status.success?

    output.strip
  end
end
