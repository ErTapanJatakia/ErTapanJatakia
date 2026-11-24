# frozen_string_literal: true

require "minitest/autorun"
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
end
