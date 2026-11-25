# Repository User Guide

This guide explains how to use the public profile repository, find authoritative information, contribute changes, report concerns, and verify published documentation snapshots. It is written for profile visitors, contributors, security researchers and release consumers.

> **Scope:** This repository publishes a professional profile, documentation, policies, configuration, GitHub Actions automation and five small Ruby command-line utilities. It is not an end-user application and has no application runtime, installable end-user product or compiled binary. The procedures below cover the repository's actual user-facing and maintainer-facing workflows, including the validators; they do not imply otherwise.

## 1. Understand the repository

The repository's primary entry point is the root [README](../README.md). It presents the profile, professional capabilities, selected projects and external professional links.

Use these documents as the authoritative references for specific topics:

| Need | Start here |
|---|---|
| Understand the profile and selected projects | [README](../README.md) |
| Understand repository purpose and contribution rules | [Contributing](../CONTRIBUTING.md) |
| Report a suspected security vulnerability | [Security policy](../SECURITY.md) |
| Understand security controls and evidence | [Security and QA](../SECURITY.md) |
| Understand repository validation and local commands | [Build, validation and release instructions](BUILD-AND-TEST-INSTRUCTIONS.md) |
| Understand automated checks and their scope | [Repository QA policy](REPOSITORY-QA-POLICY.md) |
| Understand actors, workflows and trust boundaries | [Automation architecture](REPOSITORY-AUTOMATION-ARCHITECTURE.md) |
| Verify a published documentation snapshot | [Release verification](RELEASE-VERIFICATION.md) |
| Understand release scope and support | [Release policy](RELEASE-POLICY.md) |
| Understand access governance | [Access governance](ACCESS-GOVERNANCE.md) |

The GitHub repository is the authoritative source. GitVerse is a mirror, not a separate authoritative codebase.

## 2. Browse the professional profile

1. Open the [README](../README.md).
2. Use its section headings to navigate profile information, operational capabilities, technologies, projects, recognition and professional links.
3. Open an external profile or project using its labelled link.
4. Treat the repository README as the published profile record; verify time-sensitive credentials, affiliations or external content at the linked authoritative source before relying on it.

**Expected result:** You can identify the profile's stated professional scope and navigate to the selected public projects and external profiles.

**If a link or embedded image fails:** Check the destination directly, then report a broken link or rendering issue through the ordinary contribution process. Do not assume a third-party badge or embed is an independently verified credential.

## 3. Understand repository status and security indicators

The repository displays workflow badges, security-control descriptions and applicability labels.

- A live workflow badge reports the state of the linked GitHub Actions workflow.
- A configured-control badge describes a configured mechanism; it is not proof that every scan is clean.
- A deferred, unverified or not-applicable label must be read literally.
- Repository QA checks validate documentation, configuration, policy data and automation. They are not application unit tests, runtime tests or application coverage measurements.

For detailed evidence and limitations, consult [SECURITY.md](../SECURITY.md), the [Level 1 assessment](OPENSSF-BASELINE-L1-IMPLEMENTATION.md) and the [Repository QA policy](REPOSITORY-QA-POLICY.md).

**Expected result:** You can distinguish a workflow result from a statement of configuration or an internal assessment.

## 4. Propose a correction or improvement

Use this process for ordinary content, formatting, accessibility, link or documentation issues:

1. Read [CONTRIBUTING.md](../CONTRIBUTING.md) and the [Code of Conduct](../CODE_OF_CONDUCT.md).
2. Search existing [issues](https://github.com/ErTapanJatakia/ErTapanJatakia/issues) and pull requests to avoid duplication.
3. For a substantial change, open an issue first and describe the problem and proposed solution.
4. Create a focused pull request against `main`. Explain the rationale, affected files and any external links or services involved.
5. Review the checks shown on the pull request. Use the [Build, Validation and Release Instructions](BUILD-AND-TEST-INSTRUCTIONS.md) for local validation where applicable.
6. Address failures rather than disabling, weakening or bypassing checks. The repository owner makes the final acceptance decision.

Do not change the owner's personal details, professional claims, credentials, affiliations, contact information or external profile links without explicit approval. Do not add secrets, private information, tracking scripts, remote code or third-party services.

**Expected result:** A focused, reviewable proposal with relevant validation evidence. Opening a pull request does not guarantee acceptance or publication.

## 5. Report an ordinary defect

For a broken link, typo, inaccurate description, inaccessible content or other non-security issue:

1. Check whether an existing issue already describes it.
2. Open a [GitHub issue](https://github.com/ErTapanJatakia/ErTapanJatakia/issues).
3. Include the affected page or file, a concise description, steps to reproduce, expected behaviour and (where useful) a screenshot.
4. Avoid including personal data, credentials or confidential material.

**Expected result:** The issue is publicly recorded for review. Do not use a public issue for suspected vulnerabilities.

## 6. Report a suspected security vulnerability

**Never publish vulnerability details in a public issue, pull request, discussion or commit message.**

1. Read the [Security reporting instructions](../SECURITY.md#security-reporting).
2. If GitHub Private Vulnerability Reporting is enabled and the repository displays **Report a vulnerability**, submit the report through that private form.
3. The repository's private-reporting enablement has not been independently confirmed. If the private report control is not visible, contact the owner through the [GitHub profile](https://github.com/ErTapanJatakia) and request a private channel before sending sensitive technical details.
4. Include a concise impact description, affected file/workflow, safe reproduction steps and redacted evidence.
5. Never include credentials, access tokens, private keys, personal information or confidential data.

**Expected result:** The report is shared privately through a channel agreed with the owner. The response targets and coordinated-disclosure process are described in [SECURITY.md](../SECURITY.md).

## 7. Validate repository changes locally

This is a documentation/configuration repository, not an application build. There is no end-user application to compile, install or run. The five Ruby utilities (DCO and VEX validators, SPDX SBOM validator, SBOM response classifier and network transport validator) are executable command-line tools and can be run directly with Ruby.

Contributors who need local validation should:

1. Install the tools and versions listed in [Build, Validation and Release Instructions](BUILD-AND-TEST-INSTRUCTIONS.md).
2. Clone the repository using Git.
3. Run `ruby scripts/validate-vex.rb` to validate the current VEX exception register.
4. Run `ruby scripts/check-branch-coverage.rb` to execute both Ruby validator regression suites and enforce the minimum branch-coverage threshold.
5. Run the applicable documentation/configuration checks documented in the build instructions.
6. Compare local tool versions and commands with the authoritative workflow definitions.
7. Review the pull request's required and advisory check results.

**Expected result:** Repository content, policy data and automation changes pass the relevant repository QA checks. A successful run does not establish application correctness or runtime security.

**If a check fails:** Read the failing job output, reproduce with the documented toolchain, and fix the underlying issue. Do not remove or weaken a test to obtain a green result.

## 8. Verify a published documentation release

Only use this procedure when a tagged documentation release exists. Releases are source/documentation snapshots, not compiled software.

1. Download the archive, SHA-256 file, detached GPG signature and release manifest from the official [GitHub Releases page](https://github.com/ErTapanJatakia/ErTapanJatakia/releases).
2. Confirm the repository owner and name are exactly `ErTapanJatakia/ErTapanJatakia`.
3. Follow [Release Verification](RELEASE-VERIFICATION.md) to verify GitHub artifact attestations, the detached GPG signature, checksum, manifest and signed Git tag.
4. Obtain the owner's public GPG key from an independently trusted channel and compare its full fingerprint with the fingerprint independently confirmed by the owner.
5. Confirm the manifest identifies the asset as a `source-and-documentation-snapshot` and does not claim to contain compiled software.

**Expected result:** All provenance, signature, manifest and checksum checks succeed and identify the expected repository, workflow and source commit.

**If any verification fails:** Do not use or redistribute the archive. Preserve the files and verification output, then report the issue through the private security-reporting process. Do not substitute an untrusted mirror or checksum.

## 9. User-guide requirements and acceptance criteria

The following requirements define the minimum maintained user guidance for this repository.

| ID | Requirement | Acceptance evidence |
|---|---|---|
| UG-01 | Explain repository purpose, boundaries and intended audiences. | Scope statement distinguishes profile/documentation workflows from an application runtime. |
| UG-02 | Explain navigation to the README, policies, projects and authoritative documentation. | Working links to the relevant maintained resources. |
| UG-03 | Explain how to interpret badges, security indicators and assessment limitations. | Explicit distinction between live workflow status, configured controls and internal assessment. |
| UG-04 | Explain ordinary defect reporting and contribution procedures. | Issue and pull-request steps, expected information and conduct/scope constraints. |
| UG-05 | Explain private security reporting and safe fallback when the private reporting feature is unavailable. | No public vulnerability disclosure; instructions align with the current SECURITY.md status. |
| UG-06 | Explain repository QA and automation from a user/contributor perspective. | Local-validation entry point, CI scope, expected outcomes and failure handling. |
| UG-07 | Explain release consumption and cryptographic verification. | Asset list, trusted-key requirement, verification steps and fail-closed response. |
| UG-08 | Define guide ownership, review cadence and change triggers. | Repository owner maintains the guide; review at least annually and after material workflow, policy, release or repository-scope changes. |

### Acceptance criteria

The guide is accepted as maintained documentation when:

- It is discoverable from the root README.
- All internal links resolve and referenced procedures agree with their authoritative policy documents.
- It contains prerequisites, actionable steps, expected outcomes and failure handling for applicable workflows.
- It does not claim that an application, compiled build, private reporting feature or security control exists unless supported by current evidence.
- It is reviewed through the repository's normal pull-request and QA process.
- Its content is reviewed at least annually and whenever a referenced workflow, policy, release process or repository boundary materially changes.

### Applicability boundary for OpenSSF OSPS-DO-01.01

This guide improves usability of the repository's actual profile, contribution, reporting, QA and release-consumption workflows. It does **not** create an end-user software product or invent application functionality. The Level 1 control's stated condition is user guides for basic functionality when software is released. Because this repository currently releases documentation/source-configuration snapshots only, OSPS-DO-01.01 remains **N/A** under the documented project boundary. Reassess the control if an end-user software product or application functionality is introduced.

## 10. Maintenance

The repository owner is responsible for accuracy and publication. Review this guide at least annually and after changes to the README structure, contribution process, security-reporting route, CI/QA procedures, release assets, or repository scope. Update linked policy documents first when they are authoritative; then align this guide with them. Record substantive changes through the normal pull-request process.
