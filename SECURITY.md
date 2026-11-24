# Security & Quality Assurance

<!-- markdownlint-disable MD033 -->
<!-- HTML image dimensions are required for 50% badge scaling. -->

<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml"><img src="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml/badge.svg?branch=main" alt="Security Analysis" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/scorecard.yml"><img src="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/scorecard.yml/badge.svg?branch=main" alt="OpenSSF Scorecard workflow" height="30" /></a>
<a href="./SECURITY.md"><img src="https://img.shields.io/badge/Security%20Policy-Published-2ea44f?style=flat-square&logo=github" alt="Security Policy" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/main-branch%20protected-2ea44f?style=flat-square&logo=github" alt="Protected Main" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/Changes-Pull%20Request%20Required-2ea44f?style=flat-square&logo=github" alt="Pull Requests" height="30" /></a>

> **Evidence-first status:** live workflow badges report GitHub Actions workflow state. Descriptive badges identify configured controls; they do not claim that every scan is clean or that no vulnerabilities exist. Deferred, historical-only, unverified and not-applicable controls are explicitly labelled below.
>
> **Implementation tracking:** the dashboard contains 57 displayed badge entries: 5 live workflow badges, 38 configured/published controls, 2 unverified/not-enforced badges and 12 deferred/planned/unconfigured/unmeasured/not-applicable badges. See the [Security Badge Implementation Roadmap](./docs/SECURITY-BADGE-ROADMAP.md) for the evidence-backed inventory, priorities, applicability decisions and verification criteria.

## 1. Security scanning & detection

### Configured security controls

<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml"><img src="https://img.shields.io/badge/Secret%20Detection-Gitleaks%20configured-2ea44f?style=flat-square" alt="Gitleaks" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml"><img src="https://img.shields.io/badge/GitHub%20Actions%20Audit-zizmor%20configured-2ea44f?style=flat-square" alt="zizmor" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/scorecard.yml"><img src="https://img.shields.io/badge/Supply%20Chain-OpenSSF%20Scorecard%20configured-2ea44f?style=flat-square" alt="OpenSSF Scorecard" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/security/code-scanning"><img src="https://img.shields.io/badge/Static%20Analysis-CodeQL%20Actions%20analysis-2ea44f?style=flat-square&logo=github" alt="CodeQL" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/dependency-review.yml"><img src="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/dependency-review.yml/badge.svg?branch=main" alt="Dependency Review and Dependabot alert gate" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/sast-policy-gate.yml"><img src="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/sast-policy-gate.yml/badge.svg?branch=main" alt="SAST Policy Gate" height="30" /></a>

### Additional scanners and platform controls — applicability/status shown per badge

<a href="https://trivy.dev/"><img src="https://img.shields.io/badge/Scanner-Trivy%20deferred%20(no%20supported%20target)-lightgrey?style=flat-square&logo=aqua" alt="Trivy" height="30" /></a>
<a href="https://semgrep.dev/"><img src="https://img.shields.io/badge/SAST-Semgrep%20deferred%20(no%20application%20source)-lightgrey?style=flat-square" alt="Semgrep" height="30" /></a>
<a href="https://github.com/microsoft/DevSkim"><img src="https://img.shields.io/badge/Secure%20Development-DevSkim%20historical%20scan%20only-lightgrey?style=flat-square" alt="DevSkim" height="30" /></a>
<a href="https://docs.bearer.com/"><img src="https://img.shields.io/badge/Data%20Security-Bearer%20historical%20scan%20only-lightgrey?style=flat-square" alt="Bearer" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/security_analysis"><img src="https://img.shields.io/badge/GitHub%20Secret%20Scanning-Enabled%20%28owner--confirmed%29-2ea44f?style=flat-square&logo=github" alt="GitHub Secret Scanning" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/security/dependabot"><img src="https://img.shields.io/badge/Dependabot%20Alerts-Enabled%20%28owner--confirmed%29-2ea44f?style=flat-square&logo=dependabot" alt="Dependabot Alerts" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/Python%20SAST-Bandit%20not%20applicable-lightgrey?style=flat-square" alt="Bandit" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/Node%20Dependency%20Audit-npm%20audit%20not%20applicable-lightgrey?style=flat-square&logo=npm" alt="npm audit" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/DAST-OWASP%20ZAP%20not%20applicable-lightgrey?style=flat-square&logo=owasp" alt="OWASP ZAP" height="30" /></a>

## 2. Supply-chain & dependency assurance

<a href="./.github/dependabot.yml"><img src="https://img.shields.io/badge/Dependency%20Updates-Dependabot%20configured-2ea44f?style=flat-square&logo=dependabot" alt="Dependabot Updates" height="30" /></a>
<a href="./.github/workflows/"><img src="https://img.shields.io/badge/GitHub%20Actions-Immutable%20SHA%20pinning%20in%20use-2ea44f?style=flat-square&logo=githubactions" alt="Pinned Actions" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45312695775"><img src="https://img.shields.io/badge/GPG%20Signing-Cryptographic%20signature%20verified-2ea44f?style=flat-square&logo=gnupg" alt="GPG signing verification passed; see run 45312695775" height="30" /></a>
<a href="./.github/workflows/signed-publish.yml"><img src="https://img.shields.io/badge/Publishing-Signed%20publisher%20workflow%20configured-2ea44f?style=flat-square" alt="Signed Publisher" height="30" /></a>
<a href="#governance-transparency"><img src="https://img.shields.io/badge/All%20Commits-Signing%20not%20enforced-yellow?style=flat-square&logo=gnupg" alt="Signed Commits" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/repository-dependency-sbom.yml"><img src="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/repository-dependency-sbom.yml/badge.svg?branch=main" alt="Repository dependency-graph SPDX SBOM export" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/SLSA%20Provenance-Deferred%20(no%20build%20artifacts)-lightgrey?style=flat-square" alt="SLSA Provenance" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/attestations/71451141"><img src="https://img.shields.io/badge/SBOM%20Attestation-SBOM%20%2B%20checksum%20verified-2ea44f?style=flat-square&logo=sigstore" alt="SBOM and checksum provenance attestations generated and verified in run 45331157748" height="30" /></a>
<a href="./.github/workflows/documentation-release.yml"><img src="https://img.shields.io/badge/Documentation%20Releases-Workflow%20configured%20%28first%20release%20pending%29-1f6feb?style=flat-square" alt="Controlled documentation snapshot release workflow configured; first release pending" height="30" /></a>

## 3. Repository governance & access control

<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/Default%20Branch-Protected-2ea44f?style=flat-square&logo=github" alt="Protected Default Branch" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/Merge%20Policy-PR%20required-2ea44f?style=flat-square" alt="Pull Request Required" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/Merge%20Gate-Required%20security%20checks-2ea44f?style=flat-square" alt="Required Status Checks" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/Review%20Hygiene-Conversation%20resolution%20required-2ea44f?style=flat-square" alt="Conversation Resolution" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/History-Squash%20merge%20only-2ea44f?style=flat-square" alt="Squash Only" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/History-Linear%20history-2ea44f?style=flat-square" alt="Linear History" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/Branch%20Safety-Force%20pushes%20blocked-2ea44f?style=flat-square" alt="Force Push Protection" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/Branch%20Safety-Deletion%20restricted-2ea44f?style=flat-square" alt="Deletion Protection" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules"><img src="https://img.shields.io/badge/Ruleset-Bypass%20list%20empty-2ea44f?style=flat-square" alt="No Bypass Actors" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/CODEOWNERS-Deferred%20(single%20maintainer)-lightgrey?style=flat-square" alt="Code Owners" height="30" /></a>
<a href="#governance-transparency"><img src="https://img.shields.io/badge/Independent%20PR%20Approval-Not%20required-yellow?style=flat-square" alt="Human Approval" height="30" /></a>

### Governance transparency

The active default-branch ruleset requires pull requests and the named security status checks, enforces conversation resolution and linear/squash history, blocks force pushes, restricts deletion, and has an empty bypass list. It currently requires **zero approving reviews**. Therefore, this page does not claim that independent human approval is mandatory.

## 4. Code, workflow & documentation quality

### Current automated analysis

<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/security/code-scanning"><img src="https://img.shields.io/badge/CodeQL-Actions%20analysis%20configured-2ea44f?style=flat-square&logo=github" alt="CodeQL Actions" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml"><img src="https://img.shields.io/badge/Workflow%20Security-zizmor%20audit%20configured-2ea44f?style=flat-square" alt="Workflow Audit" height="30" /></a>

### Quality gates — implemented (advisory)

<a href="https://github.com/rhysd/actionlint"><img src="https://img.shields.io/badge/Workflow%20Lint-actionlint%20configured-2ea44f?style=flat-square" alt="actionlint" height="30" /></a>
<a href="https://github.com/DavidAnson/markdownlint"><img src="https://img.shields.io/badge/Documentation%20Lint-Markdownlint%20configured-2ea44f?style=flat-square" alt="Markdown Lint" height="30" /></a>
<a href="https://www.ruby-lang.org/en/documentation/stdlib/yaml/"><img src="https://img.shields.io/badge/Configuration%20Validation-YAML%20syntax%20checks%20configured-2ea44f?style=flat-square" alt="YAML Validation" height="30" /></a>
<a href="https://github.com/lycheeverse/lychee"><img src="https://img.shields.io/badge/Documentation%20Links-Internal%20link%20checks%20configured-2ea44f?style=flat-square" alt="Link Checker" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/repository-quality-assurance.yml"><img src="https://img.shields.io/badge/Formatting-Prettier%20configuration%20check%20configured-2ea44f?style=flat-square&logo=prettier" alt="Prettier configuration formatting" height="30" /></a>
<a href="https://editorconfig.org/"><img src="https://img.shields.io/badge/Editor%20Consistency-EditorConfig%20configured-2ea44f?style=flat-square" alt="EditorConfig" height="30" /></a>
<a href="https://www.sonarsource.com/products/sonarqube/"><img src="https://img.shields.io/badge/Quality%20Gate-SonarQube%20not%20applicable%20(no%20application%20source)-lightgrey?style=flat-square&logo=sonarqube" alt="SonarQube" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/Maintainability-Not%20applicable%20(no%20application%20source)-lightgrey?style=flat-square" alt="Maintainability" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/Test%20Coverage-Not%20applicable%20(no%20application%20test%20target)-lightgrey?style=flat-square" alt="Test Coverage" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/repository-quality-assurance.yml"><img src="https://img.shields.io/badge/Repository%20QA-Five%20advisory%20CI%20checks%20configured-2ea44f?style=flat-square" alt="Repository QA: five advisory CI checks; not an application test suite" height="30" /></a>

## 5. Policy, disclosure & transparency

<a href="./SECURITY.md"><img src="https://img.shields.io/badge/Vulnerability%20Reporting-Policy%20published-2ea44f?style=flat-square" alt="Security Policy" height="30" /></a>
<a href="./SECURITY.md"><img src="https://img.shields.io/badge/Coordinated%20Disclosure-Guidance%20published-2ea44f?style=flat-square" alt="Responsible Disclosure" height="30" /></a>
<a href="./CONTRIBUTING.md"><img src="https://img.shields.io/badge/Contribution%20Guidance-Published-2ea44f?style=flat-square" alt="Contributing" height="30" /></a>
<a href="./CODE_OF_CONDUCT.md"><img src="https://img.shields.io/badge/Code%20of%20Conduct-Published-2ea44f?style=flat-square" alt="Code of Conduct" height="30" /></a>
<a href="./.github/dependabot.yml"><img src="https://img.shields.io/badge/Dependency%20Policy-Configuration%20published-2ea44f?style=flat-square" alt="Dependabot Policy" height="30" /></a>

<!-- markdownlint-enable MD033 -->

## Scope and applicability

This repository primarily hosts a GitHub profile README, documentation, repository configuration, and GitHub Actions workflows. It is not a conventional application repository with a package manifest, deployable service, or application runtime.

Accordingly:

- **Relevant now:** secret scanning, workflow security auditing, Scorecard, Actions static analysis, dependency-update configuration, branch governance, signed-commit workflow validation, Markdown/YAML/workflow linting, and link checking.
- **Owner-confirmed platform controls (2026-11-24):** GitHub Secret Scanning and Dependabot alerts are enabled. The owner also observed no open Malware alerts, no open Dependabot alerts, and no auto-dismissed Dependabot alerts at that time. These are time-bounded UI observations, not an assertion that alerts never existed or that every dependency is vulnerability-free. Code Scanning findings and the published Scorecard report remain separate evidence sources.
- **Supply-chain scope:** an SPDX SBOM export workflow now targets GitHub's Dependency Graph. Its first successful generation completed in [run 45329290238](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45329290238): SPDX 2.3 validation passed, with 9 package records and 8 `DEPENDS_ON` relationships; the SBOM and SHA-256 checksum file were uploaded as a 30-day artifact. The latest run, [45331157748](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331157748), validated 10 package records and 9 `DEPENDS_ON` relationships, generated Sigstore-backed provenance attestations for the SBOM JSON and checksum, and verified both against this repository's SBOM workflow; see [attestation record 71451141](https://github.com/ErTapanJatakia/ErTapanJatakia/attestations/71451141). These attestations cover only the two generated files, not software binaries or releases. The inventory includes only dependencies represented in GitHub's Dependency Graph, not every file, container or binary. SLSA build provenance for compiled software binaries remains not applicable because no software build artifacts are produced. A controlled documentation/source-configuration release workflow has now been configured; its first release has not yet been published. Its signed archive, checksum manifest and GitHub artifact attestations must not be described as compiled software build provenance. Application test coverage and runtime DAST remain not applicable. Repository-specific policies and the controlled documentation-release process are documented in [the OpenSSF Baseline Level 3 implementation register](docs/OPENSSF-BASELINE-L3-IMPLEMENTATION.md), [secrets policy](docs/SECRETS-AND-CREDENTIALS-POLICY.md), [access governance](docs/ACCESS-GOVERNANCE.md), [SCA policy](docs/SCA-AND-DEPENDENCY-POLICY.md), [SAST policy](docs/SAST-POLICY.md), [VEX process](docs/VEX-PROCESS.md), [repository QA policy](docs/REPOSITORY-QA-POLICY.md), [build and test instructions](docs/BUILD-AND-TEST-INSTRUCTIONS.md), [repository automation architecture](docs/REPOSITORY-AUTOMATION-ARCHITECTURE.md), [external software interfaces](docs/EXTERNAL-SOFTWARE-INTERFACES.md), [threat model](docs/THREAT-MODEL.md), [release policy](docs/RELEASE-POLICY.md) and [release verification instructions](docs/RELEASE-VERIFICATION.md).
- **Not automatically useful:** language-specific scanners such as Bandit or npm audit unless corresponding Python or Node.js application/dependency manifests are introduced.

## 7. Verification record

The personal GPG signing verification workflow passed in [run 45312695775](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45312695775): the reusable action imported the configured key, created an isolated signed test commit, and `git verify-commit` succeeded; temporary signing material was removed. GnuPG reported a good cryptographic signature but also warned that the key was not certified in the local trust database. This evidence verifies the signature against the imported key; it does not claim independent identity certification or repository-wide signed-commit enforcement. The workflow badges above link to their authoritative GitHub Actions pages. The Dependency Graph SBOM workflow's first successful export is recorded in [run 45329290238](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45329290238), with its [SBOM artifact](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45329290238/artifacts/14891280949). The latest export and provenance verification are recorded in [run 45331157748](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331157748), with [attestation record 71451141](https://github.com/ErTapanJatakia/ErTapanJatakia/attestations/71451141) and [SBOM artifact](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331157748/artifacts/14892405876). For an audit, inspect the latest run on the current `main` commit and the associated job results. A green workflow badge means the workflow completed successfully; it does **not** prove that every security finding is absent.

DevSkim and Bearer were used in historical remediation work but are not configured as recurring scans on the current `main` branch. Their historical pass must not be read as current coverage. GitHub-native Secret Scanning and Dependabot alerts are owner-confirmed enabled as of 2026-11-24. At that observation, the owner saw no open Malware alerts, no open Dependabot alerts, and no auto-dismissed Dependabot alerts. These inventory observations are point-in-time evidence and do not replace Code Scanning review or prove universal dependency cleanliness.

---

## Security reporting

**Do not disclose suspected vulnerabilities in public issues, pull requests, discussions, or commit messages.**

The intended private reporting channel is [GitHub Private Vulnerability Reporting](https://github.com/ErTapanJatakia/ErTapanJatakia/security/advisories). When enabled, open the repository's **Security and quality → Advisories → Report a vulnerability** form and submit the report there. The feature is separate from this `SECURITY.md` policy; its repository-level enablement has not yet been independently confirmed. If the **Report a vulnerability** control is not visible, contact the repository owner through [the GitHub profile](https://github.com/ErTapanJatakia) and request a private channel before sending sensitive technical details. Do not place vulnerability details in a public issue.

The repository owner must enable the feature at **Settings → Advanced Security → Private vulnerability reporting → Enable**, then verify that the public Advisories page displays the **Report a vulnerability** action. The owner should also subscribe to repository security-advisory notifications and confirm that notifications reach an actively monitored account. Until that platform step is confirmed, this policy does not claim that private reporting is fully operational.

Please include a concise impact description, affected file or workflow, safe reproduction steps, and redacted evidence. Never include credentials, access tokens, private keys, personal information, or confidential data.

## Coordinated vulnerability disclosure and response targets

The repository is maintained by an individual owner and is not a staffed security-response service. The following response targets apply to reports received through a monitored private channel:

- **Initial acknowledgement:** within 5 business days of receipt.
- **Initial triage and status:** within 10 business days of receipt, including whether the report is reproducible, needs more information, or is being investigated.
- **Progress updates:** at least every 10 business days while an accepted report remains open, or sooner when a material change occurs.
- **Missed target:** if circumstances prevent a target from being met, the owner will send a status update and a revised estimate rather than silently allowing the target to lapse.

These are response and communication targets, not a guarantee that a fix will be delivered within a particular period. Remediation timing depends on severity, reproducibility, affected scope, available mitigation and the nature of the issue. There is no bug-bounty programme.

## Coordinated disclosure and public advisories

The reporter and owner should coordinate a disclosure date and avoid public release of exploit details while affected users remain exposed. The default objective is to publish after a fix or effective mitigation is available; where practical, aim to complete coordination within 90 calendar days of the initial report. A different timeline may be agreed where complexity, exploitation, downstream impact or a reporter's circumstances justify it.

For a confirmed vulnerability, the owner will create and publicly publish a GitHub Security Advisory when disclosure is coordinated. The advisory should identify the affected repository/component and affected versions or commit range, severity and impact, patched version/commit or mitigation, remediation/workaround guidance, relevant references and a CVE identifier when assigned. Credit is included only with the reporter's consent. If a report is determined not to be a vulnerability or the repository is not affected, the owner will document the rationale in the private report and will not publish a misleading advisory. A VEX statement may be used only where its criteria and evidence requirements are met.

This repository currently distributes profile/documentation and source-configuration snapshots only; it is not an application runtime or security-response service. The policy nevertheless establishes the response and publication process for any confirmed issue affecting the repository, its automation or its release integrity.

## Out of scope

- Vulnerabilities in third-party websites, services, badges, images, fonts, or embedded resources linked from the profile.
- Compromise of a third-party account or platform.
- Issues requiring access to systems or infrastructure not maintained by this repository.

Please report third-party issues to the relevant service provider through its own security-reporting process.

Thank you for helping keep this repository and its visitors safe.

## OpenSSF Baseline implementation

The repository's assessment registers are maintained in [Baseline Level 1](docs/OPENSSF-BASELINE-L1-IMPLEMENTATION.md), [Baseline Level 2](docs/OPENSSF-BASELINE-L2-IMPLEMENTATION.md) and [Baseline Level 3](docs/OPENSSF-BASELINE-L3-IMPLEMENTATION.md). PR [#38](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/38) introduced the governance/security policies and controlled documentation-release workflow. PR [#39](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/39) refreshed the dashboard and hardened the malware and SAST gates.

### PR #39 validation

- [Dependency and Malware Alert Policy run 45347826556](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347826556): general and malware classifications queried; no unresolved alerts returned.
- [SAST Policy Gate run 45347826559](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347826559): passed after waiting for the matching CodeQL analysis.
- [CodeQL Actions analysis run 45347823329](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347823329): passed.
- [Repository Security Analysis run 45347826563](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347826563), [Repository Quality Assurance run 45347826535](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347826535) and [Repository Configuration Validation run 45347826533](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347826533): passed.

### Current main-branch validation

Post-merge commit `88e1d16a13c7fc72fdaaacbbb995bd320070f8b8` passed all applicable workflows:

- [Repository Security Analysis 45348017923](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45348017923): Gitleaks and zizmor passed.
- [Dependency and Malware Alert Policy 45348018077](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45348018077): no unresolved general or malware Dependabot alerts returned.
- [SAST Policy Gate 45348017876](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45348017876): passed after [CodeQL Analyze (actions) 45348018299](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45348018299) completed successfully.
- [Repository Quality Assurance 45348017809](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45348017809), [Repository Configuration Validation 45348017942](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45348017942), [Dependency Graph SBOM 45348017820](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45348017820), [OpenSSF Scorecard 45348017963](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45348017963) and [GitVerse mirror 45348017956](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45348017956): passed.

GitHub's malware-alert coverage for GitHub Actions is limited to semantic-version references; this repository pins Actions to full SHAs. The owner must therefore review the pinned Actions dependency inventory before each release as a compensating control. See the [SCA policy](docs/SCA-AND-DEPENDENCY-POLICY.md) and [pinned GitHub Actions license register](docs/DEPENDENCY-LICENSE-REGISTER.md).

The new Dependency Review, Dependabot alert gate, CodeQL and SAST policy checks are **not yet merge-blocking**. Add `Dependency Review`, `Dependabot alert gate`, `Analyze (actions)` and `SAST policy gate` to the main-branch ruleset's required status checks. The current ruleset still requires Gitleaks and zizmor only.

Independent human approval remains unavailable because the repository has one maintainer. The controlled documentation-release workflow is configured but no public release has been created. Before the first release, configure the `profile-docs-*` tag ruleset and complete the owner-side malware/Actions dependency and license review.
