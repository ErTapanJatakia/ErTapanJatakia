# OpenSSF Best Practices Badge — Gold Implementation and Assessment

**Assessment date:** 2026-11-26  
**Badge project:** [Er. Tapan Jatakia - GitHub Profile](https://www.bestpractices.dev/en/projects/17059)  
**Repository:** [ErTapanJatakia/ErTapanJatakia](https://github.com/ErTapanJatakia/ErTapanJatakia)  
**Official criteria:** [Gold criteria](https://www.bestpractices.dev/en/criteria/2)  
**Scope:** Evidence-led internal assessment of all 23 Gold criteria for this repository's profile, documentation, Ruby validation utilities and GitHub Actions automation. The repository does not release an end-user application, compiled binary or deployable service; it maintains five Ruby utilities and their regression suites.

> **Assessment limitation:** This is an internal implementation register, not an OpenSSF badge award, independent audit or certification. The public BadgeApp profile currently reports **in_progress**; its visible category counters are 0 and no Gold achievement is shown. Do not present this register as a badge award. The official BadgeApp uses Met, Unmet and N/A; **Partial** and **Unverified** are internal evidence states and must be resolved before submitting an official answer.

## Assessment summary

| Internal assessment | Count |
|---|---:|
| Met | 11 |
| Partial | 1 |
| Unmet | 6 |
| Not applicable (N/A) | 3 |
| Unverified | 2 |
| **Total** | **23** |

Gold is cumulative: the project must first achieve an official Silver badge. This repository has completed an internal Silver register but the public BadgeApp profile remains in_progress and does not show an awarded Silver badge. The contributor-diversity, operational bus-factor, two-person review, 2FA enforcement, coverage and site-header requirements remain evidence-gated. Per-file metadata and contributor documentation were remediated in the 2026-11-26 Gold remediation branch. The DCO policy remains documented as enabled for contributors while automated CI enforcement remains disabled.

### Status rules

- **Met:** current, relevant evidence supports the criterion.
- **Partial:** some implementation exists, but a material part of the criterion is not demonstrated.
- **Unmet:** the criterion is not currently satisfied, or the available evidence shows a gap.
- **N/A:** the criterion's own applicability condition is not met; the rationale is recorded.
- **Unverified:** evidence is missing, time-windowed, owner-attested only, or not independently confirmed. Do not convert this to Met by inference.

## Basics

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `achieve_silver` | achieve silver | **Unmet** | The internal Silver register is complete, but the public BadgeApp profile remains in_progress and does not show an official Silver achievement. Repository documentation or an internal tally cannot substitute for the BadgeApp award. |
| `bus_factor` | Maintain a bus factor of at least two (should at Silver) | **Unmet** | The owner confirms @ShaikhDanish04 as a second maintainer, but the live GitHub collaborator-permission lookup on 2026-11-26 reports effective `read` access. The collaborator cannot currently write, merge, administer rulesets or publish releases. A designation without the access and operational capability to maintain the project does not demonstrate a Gold bus factor of two. |
| `contributors_unassociated` | contributors unassociated | **Unmet** | Two unassociated significant contributors are not evidenced; the current project has one maintainer and one collaborator whose significant independent contribution status is not established. |
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
| `two_person_review` | Have at least 50% of proposed changes reviewed by another person | **Unmet** | CONTRIBUTING.md now defines a complete review process and acceptance checklist, but the active ruleset requires zero approving reviews and the owner has confirmed that an eligible independent reviewer is not currently available. Documentation cannot establish the historical/prospective 50% independent-review rate. |
| `build_reproducible` | Provide reproducible builds | **N/A** | No build/compilation step is required for the repository's current outputs. |
| `test_invocation` | Provide standard test invocation (should) | **Met** | The Ruby validation and regression test commands are documented and invocable using standard Ruby commands. |
| `test_continuous_integration` | Implement CI (suggested) | **Met** | Repository QA runs on pull requests and pushes to main and produces pass/fail workflow results. |
| `test_statement_coverage90` | Achieve at least 90% statement coverage | **Met** | PR #70 QA run [45677840610](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45677840610) measured 209/223 statements (93.72%) across the five maintained Ruby utilities. The enforced CI statement-coverage threshold has been raised to 90%; branch coverage measured 109/119 (91.60%). No application-wide coverage is claimed. |
| `test_branch_coverage80` | Achieve at least 80% branch coverage | **Met** | PR #68 QA run [45561468875](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45561468875) measured 105/119 branches covered (88.24%) across the five maintained Ruby utilities, above the 80% Gold threshold. |

## Security

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `crypto_used_network` | crypto used network | **Met** | Repository automation communicates with GitHub over HTTPS/TLS and mirrors protected history over SSH. |
| `crypto_tls12` | Support TLS 1.2 or later | **Met** | Maintained curl requests explicitly require HTTPS and TLS 1.2 or later; redirects are HTTPS-only. The network transport validator and its regression tests enforce these settings and reject known certificate-verification bypasses. The required repository-configuration validation passed in [PR #68 run 45561468743](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45561468743). See NETWORK-CRYPTOGRAPHY-REVIEW.md. |
| `hardened_site` | Use nonpermissive security headers on project sites | **Unverified** | No current header assessment was captured for the canonical project site/repository and any separate download endpoint. |
| `security_review` | Perform a security review within the last five years | **Partial** | THREAT-MODEL.md and the Baseline implementation assessments document human security analysis, assets, trust boundaries and safeguards, but there is no distinct dated security-review record within the five-year window explicitly reviewing security requirements and boundaries. |
| `hardening` | Use software hardening mechanisms (should) | **Met** | The maintained Ruby utilities apply fail-closed schema and allowlist validation, strict path constraints, bounded dates/expiry, safe argument-array subprocess execution, explicit network protocol/TLS restrictions and rejection of certificate-verification bypasses. GitHub Actions use least-privilege permissions and immutable action pins. These controls harden the actual maintained command-line software; see THREAT-MODEL.md and the validator regression suites. |

## Analysis

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `dynamic_analysis` | Apply dynamic analysis before major releases | **N/A** | The repository does not publish a major production release of its Ruby utilities or any end-user software. Its only release product is a source/documentation snapshot. The Ruby utilities are exercised by CI regression tests on proposed changes, but that does not create a major production software release; the criterion's N/A path is therefore used rather than inventing a release event. Reassess if the utilities become separately released production software. |
| `dynamic_analysis_enable_assertions` | Check runtime assertions during dynamic analysis | **N/A** | No major production software release or corresponding dynamic-analysis release gate exists within the current documentation/source-snapshot scope. The regression tests use Minitest assertions during CI, but these are not represented as a production-release dynamic-analysis configuration. Reassess if production software releases are introduced. |

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
