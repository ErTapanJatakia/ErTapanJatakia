# Contributing

Thank you for your interest in improving this repository.

This repository contains the public GitHub profile README and related professional/profile materials for Er. Tapan Jatakia. Contributions should improve clarity, accessibility, correctness, maintainability, or the presentation of the repository without misrepresenting the profile owner.

## Ways to contribute

Useful contributions may include:

- Fixing Markdown, HTML, spelling, grammar, or broken formatting.
- Improving accessibility, including descriptive image alt text and readable structure.
- Identifying broken links, outdated badges, or non-functional embeds.
- Suggesting improvements to documentation or repository presentation.
- Reporting security, privacy, or content-integrity concerns privately.

## Before opening an issue or pull request

1. Check existing issues and pull requests to avoid duplicate work.
2. For substantial changes, open an issue first and explain the proposed change.
3. Keep changes focused and explain the problem they solve.
4. Do not change personal details, professional claims, credentials, affiliations, contact information, or external profile links without the profile owner's explicit approval.
5. Do not add tracking scripts, analytics, remote code, executable content, or new third-party services without prior approval.
6. Use only images, logos, fonts, and other assets that you have the right to submit. Include attribution or licence details where required.

## Pull request expectations

A pull request should:

- Describe the change and its purpose.
- Identify any affected files, links, images, or external services.
- Include before/after screenshots for material visual changes, where practical.
- Confirm that no credentials, tokens, private correspondence, personal data, or confidential information have been added.
- Preserve existing working content unless the change specifically addresses it.

Please use clear commit messages and keep each pull request limited to one coherent change.

## Licensing

The repository's root `LICENSE` contains the GNU General Public License, version 3 (GPL-3.0). Contributions intended for inclusion must be your original work or work you are authorised to submit, and must be compatible with the repository's GPL-3.0 licensing. By submitting a contribution for inclusion, you agree that the contribution may be distributed under the terms of GPL-3.0. You retain any copyright you hold in your contribution.

Do not submit material copied from sources whose terms are incompatible with GPL-3.0 or whose rights you cannot establish.

## Small tasks for new and casual contributors

The following bounded tasks are suitable starting points. They do not require repository administration, access to secrets, or changes to the profile owner's personal claims. Check the issue tracker before starting so work is not duplicated; open an issue if you intend to take one.

| Task | Scope | Suggested validation |
|---|---|---|
| Improve documentation clarity | Fix a confusing sentence or add a short explanation in an existing guide without changing policy meaning | Markdown lint and link validation |
| Check documentation links | Identify and report a broken or redirected link in a Markdown document | Offline link validation plus a documented source check |
| Improve README accessibility | Propose descriptive alt text or a heading-structure correction without changing profile claims | README image-alt-text and heading checks |
| Add a Ruby validator regression case | Add one focused positive or negative test for an existing validator using temporary fixtures | `ruby scripts/check-branch-coverage.rb` |
| Improve error-message documentation | Clarify an existing validator's documented error or remediation path | Ruby regression suite and Markdown lint |
| Refresh a technical reference | Update a stale external standards/tool reference with an authoritative source and review date | Link validation and reviewer source check |

These are contribution opportunities, not claims that an issue has already been assigned or completed. New contributors must not modify credentials, access settings, release workflows, signing material, security exceptions, or owner-controlled profile facts without explicit authorization.

## Code review method and acceptance criteria

Every pull request is reviewed against the change's risk and scope before acceptance. The review is conducted in GitHub's pull-request diff and conversation, with the relevant workflow results and local validation output inspected. For code, workflow, dependency, permission, release, or security-policy changes, the reviewer must also inspect the affected execution path and trust boundary rather than relying on a passing CI badge alone.

The review checklist is:

1. **Purpose and scope:** the change solves the stated problem, is minimal, and does not include unrelated edits.
2. **Correctness:** logic, edge cases, error handling, compatibility and failure behavior are appropriate.
3. **Security and privacy:** no secret exposure, unsafe input handling, path traversal, command injection, privilege expansion, unnecessary data collection or insecure network fallback is introduced.
4. **Supply chain:** new dependencies and GitHub Actions are justified, licence-checked and pinned to immutable revisions where supported.
5. **Testing:** new behavior has focused positive and negative regression tests; bug fixes include a reproducible regression case where practical; existing tests are not weakened or deleted.
6. **Documentation:** commands, supported scope, policy statements, evidence links and limitations match the implementation.
7. **Accessibility and presentation:** rendered Markdown, headings, tables, images and links remain usable.
8. **CI and release safety:** all applicable required checks pass; release/signing changes follow the controlled release policy.

A change is acceptable only when blocking findings are resolved, required checks pass, the patch is consistent with repository policy, and the authorized decision-maker approves it. Changes affecting personal/professional claims require the profile owner's explicit approval. A reviewer must not approve their own changes.

The current repository ruleset requires pull requests and status checks but has zero required approving reviews because an independent reviewer is not presently available. This is a disclosed operating limitation, not a claim that the 50% independent-review threshold is met. When an eligible independent reviewer becomes available, the owner should require and record human review for at least half of proposed modifications before release.

## Review and acceptance

All contributions are subject to review and may be revised, deferred, or declined. The repository owner makes the final decision on whether a change is accepted. Opening a pull request does not guarantee acceptance or publication.

By participating, you agree to follow the repository's [Code of Conduct](CODE_OF_CONDUCT.md).

Thank you for helping keep this profile repository accurate, accessible, and professional.

## Developer Certificate of Origin (DCO)

This repository retains the unmodified [Developer Certificate of Origin 1.1](DCO). Contributors are expected to understand and follow its certification when submitting work for inclusion. The DCO confirms that the contributor has the right to submit the work under the applicable open-source licence or is otherwise authorized to submit it.

To record the DCO certification in a commit, use Git's sign-off option:

```bash
git commit -s -m "type: describe the change"
```

Git adds a `Signed-off-by` trailer containing the commit author's name and email. Use your own accurate identity details. The DCO policy is enabled as a documented contribution requirement: contributors are expected to include the certification in their commit history using the sign-off procedure above. The root DCO 1.1 text and these instructions remain authoritative policy documentation. **Automated CI enforcement and mandatory sign-off validation are currently disabled in practice**; this is an implementation limitation, not a suspension of the documented contributor policy. Do not claim that GitHub Actions presently checks every commit.

## Developer setup

After cloning the repository, run `bash script/setup` to verify the local Git/Ruby toolchain and ensure Minitest is available. The [Build, Validation and Release Instructions](docs/BUILD-AND-TEST-INSTRUCTIONS.md) document the complete local toolchain and validation commands.

## Coding standards and project direction

Contributors MUST follow the language-specific requirements in [Coding and Documentation Standards](docs/CODING-STANDARDS.md). The current project scope and planned work are published in the [twelve-month roadmap](ROADMAP.md). Security-sensitive changes must be consistent with the [Repository Security Assurance Case](docs/SECURITY-ASSURANCE-CASE.md).

When proposing major new functionality, include automated tests for the new behavior where a meaningful test target exists. This applies to validators, scripts, repository controllers and workflow logic; documentation-only changes should include appropriate link, formatting, structure or policy validation. Bug fixes should include a regression test whenever the defect can be reproduced in an automated test.

## Repository QA and security-sensitive changes

This repository runs documentation and configuration checks rather than an application test suite. Contributors should read the [Repository Quality Assurance Policy](docs/REPOSITORY-QA-POLICY.md) and [Build, Validation and Release Instructions](docs/BUILD-AND-TEST-INSTRUCTIONS.md) for the exact CI triggers, local commands, toolchain and major-change test expectations.

Changes to workflows, permissions, credentials, dependency policy, release publication or security controls must include appropriate validation. Do not expose secrets to fork pull requests or unreviewed code, and do not weaken or bypass checks merely to obtain a passing result.

Before proposing a release-related change, review the [Controlled Documentation Release Policy](docs/RELEASE-POLICY.md), [Repository Automation Architecture](docs/REPOSITORY-AUTOMATION-ARCHITECTURE.md), [External Software Interfaces](docs/EXTERNAL-SOFTWARE-INTERFACES.md) and [Release Verification Instructions](docs/RELEASE-VERIFICATION.md). This repository currently distributes documentation/source-configuration snapshots only; it does not publish compiled application binaries.
