# OpenSSF Best Practices Badge — Silver Implementation and Assessment

**Assessment date:** 2026-11-25  
**Badge project:** [Er. Tapan Jatakia - GitHub Profile](https://www.bestpractices.dev/en/projects/17059)  
**Repository:** [ErTapanJatakia/ErTapanJatakia](https://github.com/ErTapanJatakia/ErTapanJatakia)  
**Official criteria:** [Silver criteria](https://www.bestpractices.dev/en/criteria/1)  
**Scope:** Evidence-led internal assessment of all 55 Silver criteria for this repository's profile, documentation, Ruby validation utilities and GitHub Actions automation. The repository does not release an end-user application, compiled binary or deployable service.

> **Assessment limitation:** This is an internal implementation register, not an OpenSSF badge award, independent audit or certification. The public BadgeApp profile currently reports **in_progress**; its visible category counters are 0 and no Silver achievement is shown. Do not present this register as a badge award. The official BadgeApp uses Met, Unmet and N/A; **Partial** and **Unverified** are internal evidence states and must be resolved before submitting an official answer.

## Assessment summary

| Internal assessment | Count |
|---|---:|
| Met | 39 |
| Partial | 0 |
| Unmet | 1 |
| Not applicable (N/A) | 15 |
| Unverified | 0 |
| **Total** | **55** |

Silver is cumulative: the project must first achieve Passing. The owner supplied the OpenSSF BadgeApp user-profile evidence at https://www.bestpractices.dev/en/users/61861 confirming the Passing prerequisite. The owner also confirms @ShaikhDanish04 is a second maintainer; this resolves the bus-factor item. However, GitHub currently reports that collaborator's effective repository permission as `read`, so independent write/release access and operational continuity are not yet demonstrated. The repository front page now links both the OpenSSF Baseline status and the OpenSSF Best Practices achievement badges at the top of README.md.

### Status rules

- **Met:** current, relevant evidence supports the criterion.
- **Partial:** some implementation exists, but a material part of the criterion is not demonstrated.
- **Unmet:** the criterion is not currently satisfied, or the available evidence shows a gap.
- **N/A:** the criterion's own applicability condition is not met; the rationale is recorded.
- **Unverified:** evidence is missing, time-windowed, owner-attested only, or not independently confirmed. Do not convert this to Met by inference.

## Basics

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `achieve_passing` | Prerequisite: achieve Passing | **Met** | Owner-provided OpenSSF BadgeApp user-profile evidence: [OpenSSF BadgeApp user profile 61861](https://www.bestpractices.dev/en/users/61861). The repository owner confirms that the project has received the Passing prerequisite. |
| `contribution_requirements` | State acceptable contribution requirements | **Met** | CONTRIBUTING.md defines acceptable contributions, licensing, review and QA requirements. |
| `dco` | Use a legal contribution authorization mechanism (should) | **Met** | CONTRIBUTING.md defines the DCO legal assertion and sign-off procedure; the DCO validator checks every post-adoption commit in a pull-request range against the author or committer identity, and the required Major change validation gate fails if DCO validation fails. Pre-policy history is explicitly grandfathered. |
| `governance` | Document the project governance/decision model | **Met** | PROJECT-GOVERNANCE.md defines the owner-governed model, decision categories, contribution/acceptance process, emergency decisions, dispute handling, roles and transparency boundaries; ACCESS-GOVERNANCE.md complements it with sensitive-resource controls. |
| `code_of_conduct` | Adopt a published code of conduct | **Met** | CODE_OF_CONDUCT.md is published at the repository root. |
| `roles_responsibilities` | Document key roles and responsibilities | **Met** | PROJECT-GOVERNANCE.md and ACCESS-GOVERNANCE.md define owner/admin and collaborator responsibilities. A GitHub collaborator-permission lookup verified the sole collaborator's effective `read` role on 2026-11-25; the public-safe access record explains the read-only boundaries and responsibilities without exposing the account identifier. |
| `access_continuity` | Continue core project operations if one person is lost | **Unmet** | The owner identifies @ShaikhDanish04 as a second maintainer, but GitHub's effective permission lookup on 2026-11-25 returns `read`. That role does not demonstrate the ability to accept repository changes or perform controlled releases if the owner becomes unavailable. Reassess after the collaborator has the necessary access and a documented continuity handover. |
| `bus_factor` | Maintain a bus factor of at least two (should at Silver) | **Met** | The repository owner explicitly confirms that @ShaikhDanish04 is a second maintainer. The maintainer designation is accepted for this internal assessment; repository write/release access remains separately assessed under `access_continuity`. |
| `documentation_roadmap` | Publish a roadmap for at least one year | **Met** | The root ROADMAP.md defines the 2026-11-25 to 2027-11-24 planning horizon, intended work, ongoing commitments, explicit out-of-scope items and governance for changes. |
| `documentation_architecture` | Document software architecture | **Met** | REPOSITORY-AUTOMATION-ARCHITECTURE.md documents the released repository assets, actors, components and workflows; the repository does not claim an application runtime. |
| `documentation_security` | Document software security requirements | **Met** | SECURITY.md, THREAT-MODEL.md and SECURITY-ASSURANCE-CASE.md document the repository security objectives, trust boundaries, secure-design controls, release integrity controls, reporting process and residual limitations for the actual maintained outputs. |
| `documentation_quick_start` | Provide a quick-start guide | **Met** | BUILD-AND-TEST-INSTRUCTIONS.md and the repository user guide provide clone, validation and contribution entry points for the actual repository outputs. |
| `documentation_current` | Keep documentation consistent with current results | **Met** | DOCUMENTATION-MAINTENANCE.md records a 2026-11-25 cross-document reconciliation of all 40 Markdown files against current workflow definitions, access/security evidence, repository settings observations and the Passing/Silver/Gold/OSPS assessment registers. The review corrected private-reporting enablement, collaborator role, DCO enforcement, Ruby utility/coverage scope, network TLS, developer setup, accessibility and regression-test evidence inconsistencies. Reassess after material changes and at least quarterly. |
| `documentation_achievements` | Link achievements from repository front page within 48h | **Met** | The top of the repository's README.md now displays and links the OpenSSF Best Practices achievement badge and the separate OpenSSF Baseline status badge. The Best Practices badge links directly to the public BadgeApp project profile; the Baseline badge links to its published status. Both are presented on the repository front page. |
| `accessibility_best_practices` | Follow accessibility best practices (should) | **Met** | ACCESSIBILITY-REVIEW.md records a 2026-11-25 source-level review. The README heading hierarchy was corrected; all 53 README images have descriptive alt text; status badges include text alternatives; tables use simple header structures; and no custom interactive controls were found. Repository configuration CI enforces image alternatives and sequential heading levels. Screen-reader testing of GitHub's rendered page/external embeds is explicitly not claimed. |
| `internationalization` | Internationalize user-facing software where applicable (should) | **N/A** | The repository does not produce end-user software with localized human-readable UI; its outputs are professional profile and repository documentation. |
| `sites_password_security` | Secure stored external-user passwords | **N/A** | The project does not operate a site that stores external users' authentication passwords; GitHub handles account authentication. |

## Change Control

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `maintenance_or_update` | Maintain older versions or document upgrade path | **N/A** | The repository does not distribute independently installed product versions requiring maintenance of older releases or an end-user upgrade path. |

## Reporting

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `report_tracker` | Use an issue tracker (should) | **Met** | GitHub Issues are used to track individual reports. |
| `vulnerability_report_credit` | Credit resolved vulnerability reporters or use N/A | **N/A** | The repository owner confirmed that no vulnerability reports have been received through GitHub Advisories, email or any private channel since the repository was created on 2026-10-31. Therefore, no vulnerability report was resolved in the preceding 12 months; the official criterion explicitly permits N/A when there have been no vulnerabilities resolved in that period. Reassess if a report is received and resolved. |
| `vulnerability_response_process` | Document vulnerability-response process | **Met** | SECURITY.md documents triage, acknowledgement, status-update and coordinated-disclosure expectations. |

## Quality

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `coding_standards` | Identify and require language-specific coding standards | **Met** | CODING-STANDARDS.md identifies required standards for Markdown, YAML/GitHub Actions, Ruby, JSON, shell and configuration; CONTRIBUTING.md requires contributors to follow the applicable standard. |
| `coding_standards_enforced` | Automatically enforce coding standards | **Met** | CI automatically enforces Markdown lint, YAML parsing, Prettier and actionlint where applicable. |
| `build_standard_variables` | Honor compiler/linker environment variables | **N/A** | No native binary build system is maintained. |
| `build_preserve_debug` | Preserve debugging information when requested (should) | **N/A** | No build/installation system exists that emits native binaries or handles debug-symbol flags. |
| `build_non_recursive` | Avoid recursive builds with cross-dependencies | **N/A** | No recursive build system or cross-dependent subdirectory build is maintained. |
| `build_repeatable` | Make build outputs bit-for-bit repeatable | **N/A** | No compilation/build-generation process is used for the repository's current outputs. |
| `installation_common` | Provide conventional install/uninstall | **N/A** | The repository does not provide an installable end-user software product. |
| `installation_standard_variables` | Honor standard install destination variables | **N/A** | There is no end-user installation system or install destination convention. |
| `installation_development_quick` | Provide conventional developer setup/install | **Met** | The repository provides an idempotent `script/setup` bootstrap, invoked as `bash script/setup`, which checks Git and Ruby 3.2+, ensures Minitest is available in the user's gem directory, reports optional Node/npm availability, and is documented in BUILD-AND-TEST-INSTRUCTIONS.md and CONTRIBUTING.md. CI validates its shell syntax. |
| `external_dependencies` | List external dependencies machine-readably | **Met** | GitHub Actions dependencies are declared in workflow YAML and npm/npx QA tools are version-pinned; the dependency inventory records external Action identities and licences. |
| `dependency_monitoring` | Monitor dependencies for vulnerabilities | **Met** | Dependabot, dependency review and repository security workflows monitor dependencies and policy violations. |
| `updateable_reused_components` | Make reused components easy to update | **Met** | Actions are pinned to full commit SHAs and Dependabot proposes updates; standard system/runtime components are used where appropriate. |
| `interfaces_current` | Avoid deprecated APIs where alternatives exist (should) | **Met** | INTERFACE-CURRENCY-REVIEW.md records a dated review of the maintained Ruby APIs, workflows and external interfaces. The review found no legacy GitHub Actions workflow commands or node16 runtime declarations and no deprecated Ruby APIs; actionlint and zizmor passed on the current PR validation. Reassess after toolchain or interface changes. |
| `automated_integration_testing` | Run automated tests on every shared-repository check-in | **Met** | Repository QA runs on every pull request and every push to main and reports check outcomes. |
| `regression_tests_added50` | Add regression tests for at least 50% of recent bugs | **Met** | REGRESSION-TEST-REVIEW.md audits all nine identified bug-fix pull requests in the repository's available history (2026-10-31 through 2026-11-25). Five of nine (55.56%) have automated regression coverage: SBOM API method, polling response states, empty dependency graph, direct/wrapped SPDX JSON shape, and local composite-action path. The expanded Ruby suite passed in [PR #68 QA run 45561468875](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45561468875) with 72 tests and 165 assertions. Four older fixes remain without dedicated tests and are transparently identified. |
| `test_statement_coverage80` | Achieve at least 80% statement coverage | **Met** | The Ruby standard-library Coverage tool measures executable source lines in all five maintained Ruby utilities: the DCO validator, VEX validator, SPDX SBOM validator, SBOM response classifier and network transport validator. The CI gate requires at least 80% statement coverage and 80% branch coverage. [PR #68 QA run 45561468875](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45561468875) passed with 196/220 statements (89.09%) and 105/119 branches (88.24%); 72 tests and 165 assertions passed. This is repository utility coverage, not an application-wide coverage claim. |
| `test_policy_mandated` | Formally require tests for major new functionality | **Met** | REPOSITORY-QA-POLICY.md is a formal written policy requiring tests for major changes where meaningful test targets exist. |
| `tests_documented_added` | Document test-addition policy (suggested) | **Met** | CONTRIBUTING.md and REPOSITORY-QA-POLICY.md communicate the test-addition policy to change proposers. |
| `warnings_strict` | Use maximally strict warnings where practical | **Met** | The repository applies strict formatting/lint/workflow checks in CI. |

## Security

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `implement_secure_design` | Implement applicable secure-design principles | **Met** | THREAT-MODEL.md maps least privilege, complete mediation, fail-safe defaults, separation of duties, defense in depth, attack-surface minimization, secure defaults and auditability to repository controls; SECURITY-ASSURANCE-CASE.md links these controls to requirements, verification and residual risks. |
| `crypto_weaknesses` | Avoid algorithms/modes with serious weaknesses (should) | **N/A** | No project-produced application cryptographic mechanism is present. |
| `crypto_algorithm_agility` | Support multiple cryptographic algorithms (should) | **N/A** | The repository does not expose configurable cryptographic algorithms to application users. |
| `crypto_credential_agility` | Separate credentials/keys from config and allow replacement | **N/A** | The repository does not provide an end-user application that stores and rotates user credentials/private keys; CI signing credentials are managed as protected platform secrets. |
| `crypto_used_network` | crypto used network | **Met** | Repository automation uses HTTPS/TLS for GitHub services and SSH for the GitVerse mirror; insecure protocols are not intentionally configured. |
| `crypto_tls12` | Support TLS 1.2 or later | **Met** | Maintained curl requests explicitly require HTTPS and TLS 1.2 or later; GitHub REST/release endpoints, GitHub CLI and Node.js use TLS-capable clients with TLS 1.2 support. See NETWORK-CRYPTOGRAPHY-REVIEW.md and the passing required repository-configuration check in [PR #68 run 45561468743](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45561468743). |
| `crypto_certificate_verification` | Verify TLS certificates by default | **Met** | curl/libcurl, Git, GitHub CLI's Go TLS client and Node.js retain their default peer/hostname certificate verification. No insecure flags or known verification-disable settings are configured; repository configuration CI rejects known bypass settings. See NETWORK-CRYPTOGRAPHY-REVIEW.md and the passing required repository-configuration check in [PR #68 run 45561468743](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45561468743). |
| `crypto_verification_private` | Verify certificates before sending private HTTP headers | **Met** | Private Authorization headers are sent only through the standard HTTPS clients documented in NETWORK-CRYPTOGRAPHY-REVIEW.md. TLS handshake and server-certificate verification occur before HTTP request headers are transmitted; maintained curl requests require HTTPS/TLS 1.2+ and CI rejects known certificate-verification bypass settings. |
| `signed_releases` | Cryptographically sign releases and document verification | **Met** | The controlled documentation release uses a verified signed Git tag, detached GPG signature, checksums and attestations; RELEASE-VERIFICATION.md explains key/signature verification. |
| `version_tags_signed` | Sign important release tags (suggested) | **Met** | The controlled release tag is cryptographically signed and verifiable. |
| `input_validation` | Validate untrusted inputs with allowlists | **Met** | Ruby VEX/DCO validators and privileged workflow input checks validate structured data, refs, branch names and bounded metadata before use. |
| `hardening` | Use software hardening mechanisms (should) | **N/A** | The repository does not produce an end-user application/runtime to which application hardening mechanisms can be applied. |
| `assurance_case` | Provide a structured security assurance case | **Met** | SECURITY-ASSURANCE-CASE.md provides a top-level claim, context/assumptions, decomposed subclaims, control-to-evidence mapping, verification plan and explicit residual limitations. |

## Analysis

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `static_analysis_common_vulnerabilities` | Use SAST rules for common vulnerabilities | **Met** | CodeQL/SAST and zizmor workflow analysis include security-focused checks. |
| `dynamic_analysis_unsafe` | Use memory-safety dynamic analysis if unsafe languages exist (suggested) | **N/A** | No memory-unsafe C/C++ software is maintained or released. |

## Evidence references

- [README.md](../README.md)
- [CONTRIBUTING.md](../CONTRIBUTING.md)
- [SECURITY.md](../SECURITY.md)
- [LICENSE](../LICENSE)
- [CODE_OF_CONDUCT.md](../CODE_OF_CONDUCT.md)
- [Access and Collaborator Governance](ACCESS-GOVERNANCE.md)
- [Project Governance](PROJECT-GOVERNANCE.md)
- [Project Governance](PROJECT-GOVERNANCE.md)
- [Twelve-month Roadmap](../ROADMAP.md)
- [Coding and Documentation Standards](CODING-STANDARDS.md)
- [Repository Security Assurance Case](SECURITY-ASSURANCE-CASE.md)
- [Accessibility Review](ACCESSIBILITY-REVIEW.md)
- [Documentation Maintenance](DOCUMENTATION-MAINTENANCE.md)
- [External Interface Currency Review](INTERFACE-CURRENCY-REVIEW.md)
- [Network Transport and Certificate Verification Review](NETWORK-CRYPTOGRAPHY-REVIEW.md)
- [Recent Bug-Fix and Regression-Test Review](REGRESSION-TEST-REVIEW.md)
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
