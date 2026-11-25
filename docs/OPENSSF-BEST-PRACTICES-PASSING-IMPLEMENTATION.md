# OpenSSF Best Practices Badge — Passing Implementation and Assessment

**Assessment date:** 2026-11-25  
**Badge project:** [Er. Tapan Jatakia - GitHub Profile](https://www.bestpractices.dev/en/projects/17059)  
**Repository:** [ErTapanJatakia/ErTapanJatakia](https://github.com/ErTapanJatakia/ErTapanJatakia)  
**Official criteria:** [Passing criteria](https://www.bestpractices.dev/en/criteria/0)  
**Scope:** Evidence-led internal assessment of all 67 Passing criteria for this repository's profile, documentation, Ruby validation utilities and GitHub Actions automation. The repository does not release an end-user application, compiled binary or deployable service.

> **Assessment limitation:** This is an internal implementation register, not an OpenSSF badge award, independent audit or certification. The public BadgeApp profile currently reports **in_progress**; its visible category counters are 0 and no Passing achievement is shown. Do not present this register as a badge award. The official BadgeApp uses Met, Unmet and N/A; **Partial** and **Unverified** are internal evidence states and must be resolved before submitting an official answer.

## Assessment summary

| Internal assessment | Count |
|---|---:|
| Met | 52 |
| Partial | 0 |
| Unmet | 0 |
| Not applicable (N/A) | 15 |
| Unverified | 0 |
| **Total** | **67** |

Passing includes the repository/project basics, change control, reporting, quality, security and analysis criteria. This register distinguishes the two maintained Ruby command-line validators and their regression/branch-coverage tests from an end-user application; no application runtime or compiled application build is claimed.

### Status rules

- **Met:** current, relevant evidence supports the criterion.
- **Partial:** some implementation exists, but a material part of the criterion is not demonstrated.
- **Unmet:** the criterion is not currently satisfied, or the available evidence shows a gap.
- **N/A:** the criterion's own applicability condition is not met, or the official criterion explicitly permits N/A for the evidenced circumstances; the rationale is recorded.
- **Unverified:** evidence is missing, time-windowed, owner-attested only, or not independently confirmed. Do not convert this to Met by inference.

## N/A re-evaluation — 2026-11-25

All 15 criteria previously marked **N/A** were re-reviewed against their individual official applicability provisions and the repository's current scope. The review found no evidence-based basis to convert any of them to **Met**. N/A is retained where the criterion explicitly permits it or where the relevant capability/software type is not part of this repository; changing those statuses without changing the project scope or producing the required evidence would overstate conformance.

| Criterion group | Criteria | Count | Re-evaluation outcome |
|---|---|---:|---|
| Release vulnerability notes | `release_notes_vulns` | 1 | No publicly known project-runtime vulnerability was identified as fixed in the assessed documentation/source-configuration release; the criterion permits N/A in the absence of publicly known vulnerabilities. |
| Vulnerability response timing | `vulnerability_report_response` | 1 | The repository owner confirmed that no vulnerability reports had been received through GitHub Advisories, email or another private channel since repository creation on 2026-10-31. The official criterion permits N/A when no reports were received in the preceding six months. |
| Application build system | `build`, `build_common_tools`, `build_floss_tools` | 3 | The repository's current deliverables are profile/documentation content and interpreted Ruby validation utilities; no application compilation/build system is required. |
| Application cryptography | `crypto_published`, `crypto_call`, `crypto_floss`, `crypto_keylength`, `crypto_working`, `crypto_weaknesses`, `crypto_pfs`, `crypto_password_storage`, `crypto_random` | 9 | The repository does not produce an application implementing cryptographic functions, key agreement, password storage or cryptographic key/nonce generation. Standard Git/GPG/HTTPS platform tooling is not a project-produced application cryptography feature. |
| Memory-unsafe language analysis | `dynamic_analysis_unsafe` | 1 | The maintained project assets do not include memory-unsafe C/C++ software to which this criterion applies. |
| **Total retained N/A** | | **15** | **No status changes; all 15 remain justified N/A.** |

This review did not add artificial product functionality, weaken criteria, or treat prospective controls as proof of historical performance. The assessment tally therefore remains **52 Met, 15 N/A, 0 Partial, 0 Unmet and 0 Unverified (67 total)**. These are internal assessment results, not an official OpenSSF badge award.

## Basics

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `description_good` | Describe the project's purpose in plain language | **Met** | README describes the repository and its professional/profile purpose in plain language. |
| `interact` | Explain how to obtain, report feedback and contribute | **Met** | README, CONTRIBUTING.md and SECURITY.md provide routes to obtain information, report issues/security concerns and contribute. |
| `contribution` | Explain the contribution process | **Met** | Root CONTRIBUTING.md explains issue-first guidance and pull-request submission. |
| `contribution_requirements` | State acceptable contribution requirements | **Met** | CONTRIBUTING.md documents acceptable changes, licensing, content/privacy restrictions and review expectations. |
| `floss_license` | Release project software under a FLOSS licence | **Met** | Root LICENSE contains GNU GPL-3.0; GitHub metadata also identifies GPL-3.0. |
| `floss_license_osi` | Use an OSI-approved licence (suggested) | **Met** | GPL-3.0 is an OSI-approved licence. |
| `license_location` | Publish licence in a standard repository location | **Met** | The root LICENSE file is in a standard repository location. |
| `documentation_basics` | Provide install/start/use/security user documentation | **Met** | The Repository User Guide, Build and Test Instructions, Repository QA Policy and Security Policy explain the purpose, safe use, local execution, validation and security boundaries of the maintained Ruby validators and repository automation. |
| `documentation_interface` | Document external software interfaces | **Met** | External Software Interfaces documents the VEX and DCO validator command-line interfaces, required inputs, files read, outputs, exit behavior and trust constraints; it separately inventories GitHub Actions and external service interfaces. |
| `sites_https` | Use HTTPS/TLS for project, repository and download sites | **Met** | The canonical repository and official distribution links use HTTPS; the controlled release uses authenticated Git/HTTPS delivery. |
| `discussion` | Provide searchable, URL-addressable public discussion | **Met** | GitHub Issues and pull-request discussions are public, searchable and URL-addressable. |
| `english` | Support English documentation and reports (should) | **Met** | The repository documentation and contribution/reporting channels are maintained in English. |
| `maintained` | Maintain the project | **Met** | The repository is actively maintained, with recent reviewed changes and active CI/security workflows. |

## Change Control

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `repo_public` | Provide a public version-controlled source repository | **Met** | GitHub confirms the repository is public and readable. |
| `repo_track` | Track changes, authors and timestamps | **Met** | Git history and pull requests record changes, authorship and timestamps. |
| `repo_interim` | Publish interim versions for review | **Met** | Changes are proposed and reviewed through interim pull requests before merge; the repository is not release-only. |
| `repo_distributed` | Use distributed version control (suggested) | **Met** | The authoritative source repository uses Git. |
| `version_unique` | Give each release a unique version identifier | **Met** | The controlled documentation release uses a unique date-based identifier such as profile-docs-2026.11.24.1. |
| `version_semver` | Use SemVer or CalVer (suggested) | **Met** | The release identifier uses a date-based scheme with a micro-level component. |
| `version_tags` | Identify releases with VCS tags (suggested) | **Met** | The controlled release is identified by a Git tag. |
| `release_notes` | Provide human-readable release notes | **Met** | The controlled release provides human-readable notes describing scope, source commit, support period and verification. |
| `release_notes_vulns` | Identify publicly known vulnerabilities fixed in release | **N/A** | The published `profile-docs-2026.11.24.1` result is a profile/documentation/source-configuration snapshot with no runtime application or compiled product; no publicly known project runtime vulnerability was identified as fixed in that release. The criterion expressly permits N/A when there have been no publicly known vulnerabilities in the project results. |

## Reporting

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `report_process` | Provide a bug-reporting process | **Met** | CONTRIBUTING.md explains ordinary defect reporting; GitHub Issues are enabled. |
| `report_tracker` | Use an issue tracker (should) | **Met** | GitHub Issues provide an issue tracker. |
| `report_responses` | Acknowledge a majority of recent bug reports | **Met** | Public issue-tracker audit on 2026-11-25 returned 63 issue-endpoint records, all of which were pull requests; zero actual issue records/bug reports were present in the repository tracker. There were therefore no public bug reports in the assessment window awaiting acknowledgement. This does not count any reports received outside the documented issue channel. |
| `enhancement_responses` | Respond to >50% of recent enhancement requests (should) | **Met** | The same 2026-11-25 public issue-tracker audit found zero actual issue records, including zero enhancement-request issues; there were no public enhancement requests awaiting a response. Pull requests were excluded from the issue count. |
| `report_archive` | Maintain a public searchable report archive | **Met** | GitHub Issues and pull requests provide a public, searchable archive. |
| `vulnerability_report_process` | Publish vulnerability reporting process | **Met** | SECURITY.md publishes coordinated vulnerability disclosure instructions and response targets. |
| `vulnerability_report_private` | Explain private reporting when supported | **Met** | SECURITY.md identifies GitHub Private Vulnerability Reporting, links directly to the repository's GitHub Advisories page, explains the reporter-facing navigation/form, and instructs reporters not to disclose sensitive details publicly. This satisfies the criterion's documentation requirement. The GitHub feature toggle and live form availability remain an operational check and are not represented here as independently verified. |
| `vulnerability_report_response` | Respond to vulnerability reports within 14 days | **N/A** | The repository owner confirmed on 2026-11-25 that no vulnerability reports had been received through GitHub Advisories, email or any other private channel since the repository was created on 2026-10-31. The official criterion permits N/A when no vulnerability reports were received in the preceding six months; no response-time history is therefore applicable. |

## Quality

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `build` | Provide automatic build system if needed | **N/A** | The repository does not require compilation or a build step to use its profile/documentation and interpreted Ruby validation utilities. |
| `build_common_tools` | Use common build tools (suggested) | **N/A** | No application build system is required for the repository's current outputs. |
| `build_floss_tools` | Build using FLOSS tools (should) | **N/A** | No application build system is required; Ruby and repository validation tools are used directly. |
| `test` | Use and document a public FLOSS automated test suite | **Met** | Public FLOSS Ruby regression suites validate VEX and DCO utilities; CI documents and runs them. |
| `test_invocation` | Provide standard test invocation (should) | **Met** | BUILD-AND-TEST-INSTRUCTIONS.md documents standard Ruby commands for the validator and regression suites. |
| `test_most` | Cover most code branches and functionality (suggested) | **Met** | The maintained Ruby validators have a standard-library branch-coverage gate. CI run [45515536242](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45515536242) executed 43 tests and 82 assertions and measured 64/74 branches covered (86.49%), above the 80% target. This measurement is limited to `validate-dco.rb` and `validate-vex.rb`. |
| `test_continuous_integration` | Implement CI (suggested) | **Met** | Repository QA runs on pull requests and pushes to main; security and analysis workflows also run on scheduled/manual triggers. |
| `test_policy` | Have a policy to add tests for major functionality | **Met** | REPOSITORY-QA-POLICY.md requires relevant tests to be added or updated for major changes where meaningful test targets exist. |
| `tests_are_added` | Show recent evidence of adding tests | **Met** | The VEX validator has positive/negative regression tests and the repository's major-change QA process requires targeted checks; PR #48 provides concrete regression-suite evidence. |
| `tests_documented_added` | Document test-addition policy (suggested) | **Met** | CONTRIBUTING.md links the QA and build/test instructions; REPOSITORY-QA-POLICY.md documents test expectations. |
| `warnings` | Enable compiler warnings/safe mode/linter | **Met** | Markdown lint, YAML parsing, actionlint, Prettier and other validation tools are enabled in CI. |
| `warnings_fixed` | Address warnings | **Met** | The required QA workflow fails when the configured linters/validators report errors; narrowly documented compatibility exceptions are explicit. |
| `warnings_strict` | Use maximally strict warnings where practical | **Met** | Formatting and workflow checks are run in check mode and enforced by the repository QA process. |

## Security

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `know_secure_design` | Primary developer knows secure-design principles | **Met** | On 2026-11-25, the repository owner explicitly confirmed/attested to understanding the secure-design principles documented in the threat model, including least privilege, complete mediation, fail-safe defaults, separation of trust boundaries, defense in depth, attack-surface minimization, secure defaults and auditability. Owner attestation recorded in the project conversation; this is a self-attestation, not an independent examination. |
| `know_common_errors` | Primary developer knows common vulnerability classes/mitigations | **Met** | On 2026-11-25, the repository owner explicitly confirmed/attested to understanding the common vulnerability classes and mitigations documented in the threat model, including command injection, path traversal, malformed security evidence, authorization confusion, supply-chain substitution, secret leakage, denial of service and error-handling failures. Owner attestation recorded in the project conversation; this is a self-attestation, not an independent examination. |
| `crypto_published` | Use public, expert-reviewed crypto when crypto is used | **N/A** | The repository does not implement cryptographic functionality in a released application; cryptography is provided by standard Git/GPG/HTTPS platform tooling. |
| `crypto_call` | Use established crypto libraries rather than reimplementing | **N/A** | The repository does not release an application or library that implements cryptographic functions. |
| `crypto_floss` | Crypto-dependent functionality must be implementable with FLOSS | **N/A** | No application cryptographic functionality is produced by the repository; release signing uses standard FLOSS tooling. |
| `crypto_keylength` | Meet minimum cryptographic key lengths | **N/A** | No project-produced application security mechanism configures cryptographic key lengths. |
| `crypto_working` | Do not rely on broken crypto by default | **N/A** | No project-produced application cryptographic mechanism or cipher mode is present. |
| `crypto_weaknesses` | Avoid algorithms/modes with serious weaknesses (should) | **N/A** | No project-produced application cryptographic mechanism depends on a cryptographic algorithm or mode. |
| `crypto_pfs` | Use perfect forward secrecy for key agreement (should) | **N/A** | The repository does not implement key-agreement/session protocols. |
| `crypto_password_storage` | Store external-user passwords using salted iterative hashes | **N/A** | The repository does not store passwords for external-user authentication. |
| `crypto_random` | Generate keys/nonces with a CSPRNG | **N/A** | The repository does not generate cryptographic keys or nonces in project-produced application code. |
| `delivery_mitm` | Protect delivery against MITM | **Met** | The controlled release is distributed over HTTPS and has a verified signed Git tag, detached GPG signature, SHA-256 checksums and artifact attestations. |
| `delivery_unsigned` | Do not trust unsigned hashes retrieved over HTTP | **Met** | Release checksums are accompanied by cryptographic signature/attestation verification instructions; the process does not rely on an unsigned HTTP hash. |
| `vulnerabilities_fixed_60_days` | No medium+ public vulnerabilities unpatched >60 days | **Met** | On 2026-11-25, CodeQL reported zero open alerts across the Ruby and GitHub Actions analyses; the SAST gate blocks open Critical/High alerts and Medium alerts older than 30 days. The same revision's Dependabot gate reported zero unresolved general alerts outside validated VEX exceptions and zero open malware alerts. This is a point-in-time evidence snapshot, backed by stricter-than-60-day enforcement for Medium CodeQL findings. |
| `vulnerabilities_critical_fixed` | Rapidly fix critical vulnerabilities (should) | **Met** | The 2026-11-25 CodeQL inventory contained zero open alerts, including Critical/High; the SAST gate blocks any open Critical/High finding. The same revision's Dependabot gate reported zero unresolved general alerts and zero open malware alerts. Critical/High findings therefore cannot pass the configured merge gate while unresolved. |
| `no_leaked_credentials` | Do not leak valid private credentials in public repositories | **Met** | Gitleaks scans repository history in CI and the security workflow is part of the protected repository checks; this is a control, not a guarantee that credentials were never exposed. |

## Analysis

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `static_analysis` | Apply static analysis before major production releases | **Met** | CodeQL default setup analyzes the maintained Ruby validators and GitHub Actions workflows; zizmor audits workflow security patterns. The SAST policy gate now waits for both CodeQL language analyses before evaluating the alert inventory. |
| `static_analysis_common_vulnerabilities` | Use SAST rules for common vulnerabilities | **Met** | CodeQL provides security-focused analysis; zizmor audits GitHub Actions workflow risks. |
| `static_analysis_fixed` | Fix confirmed medium+ SAST vulnerabilities | **Met** | The 2026-11-25 CodeQL alert inventory contained zero open findings across Ruby and GitHub Actions. The SAST gate waits for both analyses, blocks all open Critical/High findings and blocks Medium findings older than 30 days; the inventory summary is recorded in [SAST Policy Gate run 45516088052](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45516088052). |
| `static_analysis_often` | Run SAST every commit or daily (suggested) | **Met** | Security analysis runs on pushes and pull requests and has a scheduled weekly run. |
| `dynamic_analysis` | Apply dynamic analysis before major releases | **Met** | The automated Ruby validator test suite is executed dynamically and provides 86.49% branch coverage (64/74 branches) in CI, exceeding the criterion's 80% branch-coverage alternative. See run [45515536242](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45515536242). |
| `dynamic_analysis_unsafe` | Use memory-safety dynamic analysis if unsafe languages exist (suggested) | **N/A** | The repository's maintained Ruby/Markdown/YAML/JavaScript workflow assets do not include memory-unsafe C/C++ software. |
| `dynamic_analysis_enable_assertions` | Check runtime assertions during dynamic analysis | **Met** | The dynamic Ruby test configuration executes Minitest assertions throughout the validator regression suites; the coverage run recorded 82 assertions. These assertions are test-only and are not enabled in a production runtime. |
| `dynamic_analysis_fixed` | Fix confirmed medium+ dynamic-analysis vulnerabilities | **Met** | The dynamic Ruby regression suite completed 43 tests and 82 assertions with no failures; no medium-or-higher exploitable vulnerability was confirmed from those test executions. Any future confirmed dynamic-analysis finding is subject to the SAST remediation policy, including the 30-day Medium remediation limit and immediate Critical/High release block. |

## Evidence snapshots and remaining owner confirmations

- **Ruby dynamic test evidence:** [Repository Quality Assurance run 45515536242](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45515536242) — 43 tests, 82 assertions, 64/74 branch outcomes covered (86.49%); the enforced threshold is 80%. The run completed without test failures or errors.
- **Public report tracker snapshot:** the repository's [public issue tracker](https://github.com/ErTapanJatakia/ErTapanJatakia/issues) was queried on 2026-11-25. The GitHub issue endpoint returned 63 records, all pull requests; no actual issue records were returned. This supports the zero-public-bug-report and zero-public-enhancement-request response findings, but it does not cover reports received outside the issue tracker.
- **Vulnerability response history:** The repository owner confirmed on 2026-11-25 that no vulnerability reports had been received since repository creation on 2026-10-31. Accordingly, `vulnerability_report_response` is N/A under the criterion's explicit no-reports provision; the published 7-calendar-day initial-response target remains a prospective commitment for any future report.
- **Current vulnerability inventory:** [SAST Policy Gate run 45516088052](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45516088052) completed both CodeQL language analyses and reported zero open CodeQL alerts across Ruby and GitHub Actions. [Dependency and Malware Alert Policy run 45516088143](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45516088143) reported zero unresolved general Dependabot alerts outside the validated VEX register and zero open malware alerts. These are point-in-time inventories, not proof that no vulnerability ever existed.
- **Operational follow-up (not an outstanding criterion status):** independently verify that GitHub Private Vulnerability Reporting is enabled and that the reporter-facing form is visible. The documentation criterion is assessed Met based on the published private-reporting instructions; this operational verification is deliberately not claimed.
- **Owner confirmation recorded:** no vulnerability reports were received through any private channel since repository creation. The response criterion is therefore N/A, not Met, as expressly permitted by the official criteria.
- **Other evidence controls:** retain the owner attestations for secure-design/common-error knowledge and refresh the CodeQL/dependency/advisory evidence snapshots before future BadgeApp submissions.

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
- [Repository User Guide](USER-GUIDE.md)
- [Ruby validator branch-coverage runner](../scripts/check-branch-coverage.rb)
- [Dependency and Licence Register](DEPENDENCY-LICENSE-REGISTER.md)

## Official assessment workflow

1. Recheck each criterion against the current English criteria page; the English version is authoritative.
2. Resolve all **Unverified** and **Partial** items with current evidence or a justified official N/A/Unmet response.
3. For SHOULD criteria, submit Met or Unmet with a genuine justification; do not use a generic comment as a rationale.
4. For SUGGESTED criteria, explicitly consider and record Met or Unmet.
5. Submit frequently in BadgeApp and revalidate after material repository, maintainer, workflow or release changes.

The OpenSSF badge is a voluntary self-certification. A passing result does not guarantee that software is defect-free or that a project will remain healthy.

**Source note:** Criteria names and requirements are summarized from the official OpenSSF Best Practices Badge English criteria. The status and evidence columns are this repository's internal assessment, not copied from an official certification decision.
