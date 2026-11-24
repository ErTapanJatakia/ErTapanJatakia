# OpenSSF Best Practices Badge — Gold Implementation and Assessment

**Assessment date:** 2026-11-25  
**Badge project:** [Er. Tapan Jatakia - GitHub Profile](https://www.bestpractices.dev/en/projects/17059)  
**Repository:** [ErTapanJatakia/ErTapanJatakia](https://github.com/ErTapanJatakia/ErTapanJatakia)  
**Official criteria:** [Gold criteria](https://www.bestpractices.dev/en/criteria/2)  
**Scope:** Evidence-led internal assessment of all 23 Gold criteria for this repository's profile, documentation, Ruby validation utilities and GitHub Actions automation. The repository does not release an end-user application, compiled binary or deployable service.

> **Assessment limitation:** This is an internal implementation register, not an OpenSSF badge award, independent audit or certification. The public BadgeApp profile currently reports **in_progress**; its visible category counters are 0 and no Gold achievement is shown. Do not present this register as a badge award. The official BadgeApp uses Met, Unmet and N/A; **Partial** and **Unverified** are internal evidence states and must be resolved before submitting an official answer.

## Assessment summary

| Internal assessment | Count |
|---|---:|
| Met | 4 |
| Partial | 2 |
| Unmet | 12 |
| Not applicable (N/A) | 2 |
| Unverified | 3 |
| **Total** | **23** |

Gold is cumulative: the project must first achieve Silver. Its contributor-diversity, bus-factor, two-person review, 2FA enforcement, per-file metadata, coverage and dynamic-analysis requirements are assessed separately; owner-attested MFA is not treated as repository-wide enforcement.

**Status rules**
- **Met:** current, relevant evidence supports the criterion.
- **Partial:** some implementation exists, but a material part of the criterion is not demonstrated.
- **Unmet:** the criterion is not currently satisfied, or the available evidence shows a gap.
- **N/A:** the criterion's own applicability condition is not met; the rationale is recorded.
- **Unverified:** evidence is missing, time-windowed, owner-attested only, or not independently confirmed. Do not convert this to Met by inference.

## Basics

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `achieve_silver` | achieve silver | **Unmet** | The public BadgeApp profile is in_progress; Silver has not been achieved. |
| `bus_factor` | Maintain a bus factor of at least two (should at Silver) | **Unmet** | The documented operating model identifies one maintainer. |
| `contributors_unassociated` | contributors unassociated | **Unmet** | Two unassociated significant contributors are not evidenced; the current project has one maintainer and one collaborator whose significant independent contribution status is not established. |
| `copyright_per_file` | Include copyright statement in every source file | **Unmet** | The Ruby source files and other maintained source files have not been verified to contain a copyright statement identifying the copyright holder. |
| `license_per_file` | Include SPDX licence statement in every source file | **Unmet** | A root LICENSE exists, but SPDX license statements have not been verified in each applicable source file. |

## Change Control

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `repo_distributed` | Use distributed version control (suggested) | **Met** | The public repository uses Git. |
| `small_tasks` | Identify small tasks for new/casual contributors | **Unmet** | CONTRIBUTING.md does not currently identify and label small tasks suitable for new or casual contributors. |
| `require_2FA` | Require 2FA for developers with repository/sensitive access | **Unmet** | Owner confirmation that MFA is enabled on both known accounts is not equivalent to a repository/project mechanism requiring 2FA for every developer with central-repository or sensitive-data access. |
| `secure_2FA` | Use cryptographic 2FA to prevent impersonation (should) | **Unverified** | The authentication factors used by each developer have not been verified as cryptographic anti-impersonation mechanisms; SMS alone would not satisfy this SHOULD criterion. |

## Quality

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `code_review_standards` | Document code-review process, checks and acceptance criteria | **Partial** | CONTRIBUTING.md and REPOSITORY-QA-POLICY.md define PR expectations and automated checks, but do not yet document a complete human code-review checklist, review method and acceptance criteria. |
| `two_person_review` | Have at least 50% of proposed changes reviewed by another person | **Unmet** | The active ruleset does not require a non-author human approval, and the owner has confirmed that an independent reviewer is not currently available. |
| `build_reproducible` | Provide reproducible builds | **N/A** | No build/compilation step is required for the repository's current outputs. |
| `test_invocation` | Provide standard test invocation (should) | **Met** | The Ruby validation and regression test commands are documented and invocable using standard Ruby commands. |
| `test_continuous_integration` | Implement CI (suggested) | **Met** | Repository QA runs on pull requests and pushes to main and produces pass/fail workflow results. |
| `test_statement_coverage90` | Achieve at least 90% statement coverage | **Unmet** | No coverage report demonstrates at least 90% statement coverage for the maintained Ruby validators; no application coverage is claimed. |
| `test_branch_coverage80` | Achieve at least 80% branch coverage | **Unmet** | No coverage report demonstrates at least 80% branch coverage for the maintained Ruby validators. |

## Security

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `crypto_used_network` | crypto used network | **Met** | Repository automation communicates with GitHub over HTTPS/TLS and mirrors protected history over SSH. |
| `crypto_tls12` | Support TLS 1.2 or later | **Unverified** | The project relies on hosted platform/runtime TLS; the TLS minimum for every relevant connection has not been independently verified. |
| `hardened_site` | Use nonpermissive security headers on project sites | **Unverified** | No current header assessment was captured for the canonical project site/repository and any separate download endpoint. |
| `security_review` | Perform a security review within the last five years | **Partial** | THREAT-MODEL.md and the Baseline implementation assessments document human security analysis, assets, trust boundaries and safeguards, but there is no distinct dated security-review record within the five-year window explicitly reviewing security requirements and boundaries. |
| `hardening` | Use software hardening mechanisms (should) | **N/A** | The repository does not release an application or runtime to which software hardening mechanisms apply. |

## Analysis

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `dynamic_analysis` | Apply dynamic analysis before major releases | **Unmet** | No dynamic-analysis tool is applied to a proposed major release of the repository's produced software assets. |
| `dynamic_analysis_enable_assertions` | Check runtime assertions during dynamic analysis | **Unmet** | No evidence shows a dynamic-analysis configuration that enables and checks many runtime assertions. |

## Evidence references

- [README.md](../README.md)
- [CONTRIBUTING.md](../CONTRIBUTING.md)
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
