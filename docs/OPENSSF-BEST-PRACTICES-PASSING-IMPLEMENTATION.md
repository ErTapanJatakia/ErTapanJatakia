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
| Met | 38 |
| Partial | 0 |
| Unmet | 2 |
| Not applicable (N/A) | 16 |
| Unverified | 11 |
| **Total** | **67** |

Passing includes the repository/project basics, change control, reporting, quality, security and analysis criteria. This register keeps the profile's application scope explicit: repository QA is not described as application testing, and no application build or runtime is claimed.

### Status rules

- **Met:** current, relevant evidence supports the criterion.
- **Partial:** some implementation exists, but a material part of the criterion is not demonstrated.
- **Unmet:** the criterion is not currently satisfied, or the available evidence shows a gap.
- **N/A:** the criterion's own applicability condition is not met; the rationale is recorded.
- **Unverified:** evidence is missing, time-windowed, owner-attested only, or not independently confirmed. Do not convert this to Met by inference.

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
| `documentation_basics` | Provide install/start/use/security user documentation | **N/A** | The repository does not release an end-user application or software product requiring install/start/use/security user documentation; it publishes profile material, policies and repository automation. |
| `documentation_interface` | Document external software interfaces | **N/A** | No public application API, SDK, CLI product interface or runtime endpoint is released; external repository automation interfaces are separately inventoried. |
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
| `release_notes_vulns` | Identify publicly known vulnerabilities fixed in release | **Unverified** | No release-by-release vulnerability-fix inventory or complete public vulnerability history was independently verified for this assessment. |

## Reporting

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `report_process` | Provide a bug-reporting process | **Met** | CONTRIBUTING.md explains ordinary defect reporting; GitHub Issues are enabled. |
| `report_tracker` | Use an issue tracker (should) | **Met** | GitHub Issues provide an issue tracker. |
| `report_responses` | Acknowledge a majority of recent bug reports | **Unverified** | The majority-response requirement is time-windowed; the relevant 2–12 month bug-report population and acknowledgements were not audited. |
| `enhancement_responses` | Respond to >50% of recent enhancement requests (should) | **Unverified** | The >50% response rate for enhancement requests in the relevant 2–12 month window was not measured. |
| `report_archive` | Maintain a public searchable report archive | **Met** | GitHub Issues and pull requests provide a public, searchable archive. |
| `vulnerability_report_process` | Publish vulnerability reporting process | **Met** | SECURITY.md publishes coordinated vulnerability disclosure instructions and response targets. |
| `vulnerability_report_private` | Explain private reporting when supported | **Unverified** | SECURITY.md describes GitHub private reporting, but the active feature toggle and reporter-facing form have not been independently verified. |
| `vulnerability_report_response` | Respond to vulnerability reports within 14 days | **Unverified** | No complete record of vulnerability reports received in the preceding six months was available to establish the required response-time result or N/A. |

## Quality

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `build` | Provide automatic build system if needed | **N/A** | The repository does not require compilation or a build step to use its profile/documentation and interpreted Ruby validation utilities. |
| `build_common_tools` | Use common build tools (suggested) | **N/A** | No application build system is required for the repository's current outputs. |
| `build_floss_tools` | Build using FLOSS tools (should) | **N/A** | No application build system is required; Ruby and repository validation tools are used directly. |
| `test` | Use and document a public FLOSS automated test suite | **Met** | Public FLOSS Ruby regression suites validate VEX and DCO utilities; CI documents and runs them. |
| `test_invocation` | Provide standard test invocation (should) | **Met** | BUILD-AND-TEST-INSTRUCTIONS.md documents standard Ruby commands for the validator and regression suites. |
| `test_most` | Cover most code branches and functionality (suggested) | **Unverified** | The repository explicitly does not claim application branch/input coverage; comprehensive coverage of all validator and repository-QA branches has not been measured. |
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
| `know_secure_design` | Primary developer knows secure-design principles | **Unverified** | The owner's professional cybersecurity background is relevant, but no criterion-specific evidence/attestation covering all listed secure-design principles was recorded in this register. |
| `know_common_errors` | Primary developer knows common vulnerability classes/mitigations | **Unverified** | No criterion-specific record maps common implementation vulnerability classes for the repository's Ruby/workflow assets to mitigation knowledge of a primary developer. |
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
| `vulnerabilities_fixed_60_days` | No medium+ public vulnerabilities unpatched >60 days | **Unverified** | A complete public vulnerability/advisory history and current vulnerability disposition were not independently established for this criterion. |
| `vulnerabilities_critical_fixed` | Rapidly fix critical vulnerabilities (should) | **Unverified** | No complete report/triage history was available to prove the treatment of all critical findings. |
| `no_leaked_credentials` | Do not leak valid private credentials in public repositories | **Met** | Gitleaks scans repository history in CI and the security workflow is part of the protected repository checks; this is a control, not a guarantee that credentials were never exposed. |

## Analysis

| Criterion ID | Requirement | Assessment | Evidence / implementation / remaining gap |
|---|---|---|---|
| `static_analysis` | Apply static analysis before major production releases | **Met** | CodeQL/SAST and workflow security analysis are active in repository security automation. |
| `static_analysis_common_vulnerabilities` | Use SAST rules for common vulnerabilities | **Met** | CodeQL provides security-focused analysis; zizmor audits GitHub Actions workflow risks. |
| `static_analysis_fixed` | Fix confirmed medium+ SAST vulnerabilities | **Unverified** | The SAST policy defines severity handling, but a complete current finding inventory and remediation evidence was not reviewed for this criterion. |
| `static_analysis_often` | Run SAST every commit or daily (suggested) | **Met** | Security analysis runs on pushes and pull requests and has a scheduled weekly run. |
| `dynamic_analysis` | Apply dynamic analysis before major releases | **Unmet** | No dynamic-analysis tool or test suite with demonstrated 80% branch coverage is currently evidenced; the project is a profile/documentation and repository-automation project. |
| `dynamic_analysis_unsafe` | Use memory-safety dynamic analysis if unsafe languages exist (suggested) | **N/A** | The repository's maintained Ruby/Markdown/YAML/JavaScript workflow assets do not include memory-unsafe C/C++ software. |
| `dynamic_analysis_enable_assertions` | Check runtime assertions during dynamic analysis | **Unmet** | No dynamic-analysis configuration with systematic runtime assertions is evidenced. |
| `dynamic_analysis_fixed` | Fix confirmed medium+ dynamic-analysis vulnerabilities | **N/A** | No dynamic-analysis findings are recorded because the project does not currently run dynamic code analysis. |

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
