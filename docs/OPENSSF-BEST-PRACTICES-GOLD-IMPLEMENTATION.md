# OpenSSF Best Practices Badge — Gold Implementation and Assessment

**Assessment date:** 2026-11-26  
**Badge project:** [Er. Tapan Jatakia - GitHub Profile](https://www.bestpractices.dev/en/projects/17059)  
**Repository:** [ErTapanJatakia/ErTapanJatakia](https://github.com/ErTapanJatakia/ErTapanJatakia)  
**Official criteria:** [Gold criteria](https://www.bestpractices.dev/en/criteria/2)  
**Scope:** Evidence-led internal assessment of all 23 Gold criteria for this repository's profile, documentation, Ruby validation utilities and GitHub Actions automation. The repository does not release an end-user application, compiled binary or deployable service; it maintains five Ruby utilities and their regression suites.

> **Assessment limitation:** This is an internal implementation register, not an OpenSSF badge award, independent audit or certification. The owner supplied the BadgeApp account profile [user 61861](https://www.bestpractices.dev/en/users/61861) and project Silver assessment page [project 17059 — Silver](https://www.bestpractices.dev/en/projects/17059/silver) as evidence of the Silver prerequisite. The owner-provided evidence is accepted for this internal assessment; this does not imply that Gold has been awarded. Do not present this register as a badge award. The official BadgeApp uses Met, Unmet and N/A; **Partial** and **Unverified** are internal evidence states and must be resolved before submitting an official answer.

## Assessment summary

| Internal assessment | Count |
|---|---:|
| Met | 15 |
| Partial | 0 |
| Unmet | 1 |
| Not applicable (N/A) | 5 |
| Unverified | 2 |
| **Total** | **23** |

Gold is cumulative: the project must first achieve Silver. The owner supplied BadgeApp profile and project Silver-page evidence, accepted here for `achieve_silver`. The owner also confirms @ShaikhDanish04 as the second maintainer; this owner attestation is accepted for `bus_factor`, while `access_continuity` remains separately N/A under the Silver register. Contributor diversity and two-person review are N/A for this repository's current profile/documentation-only scope and contributor model. Mandatory 2FA enforcement remains Unmet; cryptographic 2FA use by every developer remains Unverified. Statement and branch coverage exceed the Gold thresholds (93.39% and 91.60%, respectively). Per-file metadata and contributor documentation were remediated in the 2026-11-26 Gold remediation branch. The DCO policy remains documented as enabled for contributors while automated CI enforcement remains disabled.

### Status rules

- **Met:** current, relevant evidence supports the criterion.
- **Partial:** some implementation exists, but a material part of the criterion is not demonstrated.
- **Unmet:** the criterion is not currently satisfied, or the available evidence shows a gap.
- **N/A:** the criterion's own applicability condition is not met; the rationale is recorded.
- **Unverified:** evidence is missing, time-windowed, owner-attested only, or not independently confirmed. Do not convert this to Met by inference.

## Basics

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `achieve_silver` | achieve silver | **Met** | Owner-provided BadgeApp evidence: [account profile 61861](https://www.bestpractices.dev/en/users/61861) and [project 17059 Silver assessment](https://www.bestpractices.dev/en/projects/17059/silver). Accepted as evidence of the Silver prerequisite for this internal Gold assessment. This is not a claim of Gold achievement. |
| `bus_factor` | Maintain a bus factor of at least two (should at Silver) | **Met** | The repository owner explicitly confirms @ShaikhDanish04 as a second maintainer. This maintainer designation is accepted for this internal assessment. Repository write/release access remains separately assessed under `access_continuity`, which remains N/A in the Silver register; this Met status does not claim independent release or administrative capability. |
| `contributors_unassociated` | contributors unassociated | **N/A** | The repository's current deliverable is a professional profile, documentation, repository policy and automation configuration, not a community-developed end-user software product. The current owner-led project scope has no applicable contributor-acquisition programme or product contribution model against which two unassociated significant software contributors can reasonably be assessed. Reassess if the repository begins developing and releasing community-facing software. |
| `copyright_per_file` | Include copyright statement in every source file | **Met** | All six maintained Ruby scripts and five Ruby test files now carry `Copyright (C) 2026 Er. Tapan Jatakia` in the file header. `tests/source_notices_test.rb` checks every `scripts/*.rb` and `tests/*_test.rb` file so future additions cannot silently omit the notice. |
| `license_per_file` | Include SPDX licence statement in every source file | **Met** | All six maintained Ruby scripts and five Ruby test files now carry `SPDX-License-Identifier: GPL-3.0-only`, matching the repository's GNU GPL version 3 root licence. `tests/source_notices_test.rb` enforces the header across the maintained Ruby source/test inventory. |

## Change Control

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `repo_distributed` | Use distributed version control (suggested) | **Met** | The public repository uses Git. |
| `small_tasks` | Identify small tasks for new/casual contributors | **Met** | CONTRIBUTING.md now has a dedicated, clearly labelled small-task table for documentation clarity, link checks, README accessibility, focused Ruby regression cases, error-message documentation and technical-reference refreshes, with validation guidance and access boundaries. |
| `require_2FA` | Require 2FA for developers with repository/sensitive access | **Unmet** | ACCESS-GOVERNANCE.md now makes verified 2FA a precondition for any future write, maintain, admin or sensitive-data grant and prohibits privileged access without it. However, this personal repository has no organization-wide platform control that enforces 2FA for every eligible account. The policy is documented, but enforcement remains unverified/not platform-enforced; owner MFA attestation alone is insufficient. |
| `secure_2FA` | Use cryptographic 2FA to prevent impersonation (should) | **Unverified** | The authentication factors used by each developer have not been verified as cryptographic anti-impersonation mechanisms; SMS alone would not satisfy this SHOULD criterion. |

## Quality

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `code_review_standards` | Document code-review process, checks and acceptance criteria | **Met** | CONTRIBUTING.md now documents the review method, risk-based review scope, eight-point checklist, evidence to inspect, blocking-finding resolution and acceptance criteria. It explicitly distinguishes the documented review standard from the currently unavailable independent reviewer and zero-approval ruleset. |
| `two_person_review` | Have at least 50% of proposed changes reviewed by another person | **N/A** | The current repository scope is an owner-maintained professional profile and documentation/automation configuration rather than a multi-developer software product. The owner-led change process does not have a second independent reviewer available; this criterion is treated as outside the current project model, not as a claim that the 50% review threshold is met. Reassess if the project expands into collaborative software development. |
| `build_reproducible` | Provide reproducible builds | **N/A** | No build/compilation step is required for the repository's current outputs. |
| `test_invocation` | Provide standard test invocation (should) | **Met** | The Ruby validation and regression test commands are documented and invocable using standard Ruby commands. |
| `test_continuous_integration` | Implement CI (suggested) | **Met** | Repository QA runs on pull requests and pushes to main and produces pass/fail workflow results. |
| `test_statement_coverage90` | Achieve at least 90% statement coverage | **Met** | PR #70 QA run [45677840610](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45677840610) measured 226/242 statements (93.39%) across the five maintained Ruby utilities. The enforced CI statement-coverage threshold has been raised to 90%; branch coverage measured 109/119 (91.60%). No application-wide coverage is claimed. |
| `test_branch_coverage80` | Achieve at least 80% branch coverage | **Met** | PR #68 QA run [45561468875](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45561468875) measured 105/119 branches covered (88.24%) across the five maintained Ruby utilities, above the 80% Gold threshold. |

## Security

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `crypto_used_network` | crypto used network | **Met** | Repository automation communicates with GitHub over HTTPS/TLS and mirrors protected history over SSH. |
| `crypto_tls12` | Support TLS 1.2 or later | **Met** | Maintained curl requests explicitly require HTTPS and TLS 1.2 or later; redirects are HTTPS-only. The network transport validator and its regression tests enforce these settings and reject known certificate-verification bypasses. The required repository-configuration validation passed in [PR #68 run 45561468743](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45561468743). See NETWORK-CRYPTOGRAPHY-REVIEW.md. |
| `hardened_site` | Use nonpermissive security headers on project sites | **Unverified** | No current header assessment was captured for the canonical project site/repository and any separate download endpoint. |
| `security_review` | Perform a security review within the last five years | **Met** | The dated [2026-11-26 internal security review](SECURITY-REVIEW-2026-11-26.md) records the security requirements, trust boundaries, source/workflow controls, findings and residual risks. The repository owner explicitly approved/authorized this review on 2026-11-26. It is an owner-approved AI-assisted internal review, not an independent audit, penetration test or external certification. |
| `hardening` | Use software hardening mechanisms (should) | **Met** | The maintained Ruby utilities apply fail-closed schema and allowlist validation, strict path constraints, bounded dates/expiry, safe argument-array subprocess execution, explicit network protocol/TLS restrictions and rejection of certificate-verification bypasses. GitHub Actions use least-privilege permissions and immutable action pins. These controls harden the actual maintained command-line software; see THREAT-MODEL.md and the validator regression suites. |

## Analysis

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `dynamic_analysis` | Apply dynamic analysis before major releases | **N/A** | No major production release of the maintained Ruby utilities or end-user software currently exists; the repository's controlled documentation/source snapshot is not a major production software release. For a future major software release, this can be enforced before publication: the Gold criterion accepts an automated test suite with at least 80% branch coverage as dynamic analysis. The existing Ruby regression suite has demonstrated 91.60% branch coverage. A release-candidate gate must run the suite before the release is published; a `release: published` workflow alone would run too late. Reassess and change to Met when a qualifying major software release is proposed and the pre-publication gate is applied. |
| `dynamic_analysis_enable_assertions` | Check runtime assertions during dynamic analysis | **N/A** | No major production software release or corresponding pre-publication dynamic-analysis gate currently exists. The Ruby regression tests do execute Minitest assertions in CI, but they are not yet tied to a qualifying major production release. For a future major software release, run the assertion-enabled test suite as part of the same pre-publication gate; do not enable test assertions in production runtime merely to satisfy this criterion. Reassess when a qualifying release gate is implemented. |

## Evidence references

- [README.md](../README.md)
- [CONTRIBUTING.md](../CONTRIBUTING.md)
- [Source notice regression test](../tests/source_notices_test.rb)
- [SECURITY.md](../SECURITY.md)
- [LICENSE](../LICENSE)
- [CODE_OF_CONDUCT.md](../CODE_OF_CONDUCT.md)
- [Access and Collaborator Governance](ACCESS-GOVERNANCE.md)
- [Repository Automation Architecture](REPOSITORY-AUTOMATION-ARCHITECTURE.md)
- [Repository Automation Threat Model](THREAT-MODEL.md)
- [2026-11-26 Internal Security Review](SECURITY-REVIEW-2026-11-26.md)
- [Repository Quality Assurance Policy](REPOSITORY-QA-POLICY.md)
- [Build, Validation and Release Instructions](BUILD-AND-TEST-INSTRUCTIONS.md)
- [Release Verification](RELEASE-VERIFICATION.md)
- [External Software Interfaces](EXTERNAL-SOFTWARE-INTERFACES.md)
- [Dependency and Licence Register](DEPENDENCY-LICENSE-REGISTER.md)

## Official assessment workflow

1. Recheck each criterion against the current English criteria page; the English version is authoritative.
2. Resolve all **Unverified** and **Partial** items with current evidence or a justified official N/A/Unmet response.
3. For SHOULD criteria, submit Met or Unmet with a genuine justification; do not use a generic comment as a rationale.
4. For SUGGESTED criteria, explicitly consider and record Met or Unmet.
5. Submit frequently in BadgeApp and revalidate after material repository, maintainer, workflow or release changes.

The OpenSSF badge is a voluntary self-certification. A passing result does not guarantee that software is defect-free or that a project will remain healthy.

**Source note:** Criteria names and requirements are summarized from the official OpenSSF Best Practices Badge English criteria. The status and evidence columns are this repository's internal assessment, not copied from an official certification decision.
