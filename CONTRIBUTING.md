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

## Review and acceptance

All contributions are subject to review and may be revised, deferred, or declined. The repository owner makes the final decision on whether a change is accepted. Opening a pull request does not guarantee acceptance or publication.

By participating, you agree to follow the repository's [Code of Conduct](CODE_OF_CONDUCT.md).

Thank you for helping keep this profile repository accurate, accessible, and professional.

## Developer Certificate of Origin (DCO)

Every commit in a pull request must include a DCO sign-off matching that commit's author identity. Use Git's sign-off option when creating each commit:

```bash
git commit -s -m "type: describe the change"
```

The resulting commit message must contain a trailer such as `Signed-off-by: Your Name <your-verified-email@example.com>`. The sign-off is a legal assertion under the [Developer Certificate of Origin](DCO), not a cryptographic signature. GPG signing and DCO sign-off are separate controls; use both when the repository's signing process requires them. If you amend or recreate a commit, preserve or add its sign-off again. The required `Major change validation` check rejects a pull request if any new commit lacks the matching sign-off. Historical commits before this policy's adoption are not retroactively rewritten.

## Repository QA and security-sensitive changes

This repository runs documentation and configuration checks rather than an application test suite. Contributors should read the [Repository Quality Assurance Policy](docs/REPOSITORY-QA-POLICY.md) for the exact CI triggers, local commands, interpretation of results and major-change test expectations.

Changes to workflows, permissions, credentials, dependency policy, release publication or security controls must include appropriate validation. Do not expose secrets to fork pull requests or unreviewed code, and do not weaken or bypass checks merely to obtain a passing result.

Before proposing a release-related change, review the [Controlled Documentation Release Policy](docs/RELEASE-POLICY.md) and [Release Verification Instructions](docs/RELEASE-VERIFICATION.md). This repository currently distributes documentation/source-configuration snapshots only; it does not publish compiled application binaries.
