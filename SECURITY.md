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
> **Implementation tracking:** the dashboard contains 55 displayed badge entries: 3 live workflow badges, 34 configured/published controls, 2 unverified/not-enforced badges and 16 deferred/planned/unconfigured/unmeasured/not-applicable badges. See the [Security Badge Implementation Roadmap](./docs/SECURITY-BADGE-ROADMAP.md) for the evidence-backed inventory, priorities, applicability decisions and verification criteria.

## 1. Security scanning & detection

### Configured security controls

<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml"><img src="https://img.shields.io/badge/Secret%20Detection-Gitleaks%20configured-2ea44f?style=flat-square" alt="Gitleaks" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml"><img src="https://img.shields.io/badge/GitHub%20Actions%20Audit-zizmor%20configured-2ea44f?style=flat-square" alt="zizmor" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/scorecard.yml"><img src="https://img.shields.io/badge/Supply%20Chain-OpenSSF%20Scorecard%20configured-2ea44f?style=flat-square" alt="OpenSSF Scorecard" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/security/code-scanning"><img src="https://img.shields.io/badge/Static%20Analysis-CodeQL%20Actions%20analysis-2ea44f?style=flat-square&logo=github" alt="CodeQL" height="30" /></a>

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
<a href="./.github/workflows/gpg-signing-verification.yml"><img src="https://img.shields.io/badge/GPG%20Signing-GPG%20verification%20workflow%20configured-2ea44f?style=flat-square&logo=gnupg" alt="GPG Verification" height="30" /></a>
<a href="./.github/workflows/signed-publish.yml"><img src="https://img.shields.io/badge/Publishing-Signed%20publisher%20workflow%20configured-2ea44f?style=flat-square" alt="Signed Publisher" height="30" /></a>
<a href="#governance-transparency"><img src="https://img.shields.io/badge/All%20Commits-Signing%20not%20enforced-yellow?style=flat-square&logo=gnupg" alt="Signed Commits" height="30" /></a>
<a href="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/repository-dependency-sbom.yml"><img src="https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/repository-dependency-sbom.yml/badge.svg?branch=main" alt="Repository dependency-graph SPDX SBOM export" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/SLSA%20Provenance-Deferred%20(no%20build%20artifacts)-lightgrey?style=flat-square" alt="SLSA Provenance" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/Artifact%20Attestation-Deferred%20(no%20built%20artifact)-lightgrey?style=flat-square" alt="Artifact Attestation" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/Signed%20Releases-Not%20applicable-lightgrey?style=flat-square" alt="Signed Releases" height="30" /></a>

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
<a href="https://prettier.io/"><img src="https://img.shields.io/badge/Formatting-Prettier%20not%20configured-lightgrey?style=flat-square&logo=prettier" alt="Prettier" height="30" /></a>
<a href="https://editorconfig.org/"><img src="https://img.shields.io/badge/Editor%20Consistency-EditorConfig%20configured-2ea44f?style=flat-square" alt="EditorConfig" height="30" /></a>
<a href="https://www.sonarsource.com/products/sonarqube/"><img src="https://img.shields.io/badge/Quality%20Gate-SonarQube%20not%20applicable%20(no%20application%20source)-lightgrey?style=flat-square&logo=sonarqube" alt="SonarQube" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/Maintainability-Not%20applicable%20(no%20application%20source)-lightgrey?style=flat-square" alt="Maintainability" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/Test%20Coverage-Not%20applicable%20(no%20application%20test%20target)-lightgrey?style=flat-square" alt="Test Coverage" height="30" /></a>
<a href="#scope-and-applicability"><img src="https://img.shields.io/badge/Automated%20Tests-No%20application%20test%20suite-lightgrey?style=flat-square" alt="Automated Tests" height="30" /></a>

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
- **Supply-chain scope:** an SPDX SBOM export workflow now targets GitHub's Dependency Graph. Its first successful generation and artifact validation are pending; it inventories only dependencies represented in that graph, not every file, container or binary. SLSA build provenance, artifact attestations and signed software releases remain deferred because no software build/release artifacts are produced. Application test coverage and runtime DAST remain not applicable.
- **Not automatically useful:** language-specific scanners such as Bandit or npm audit unless corresponding Python or Node.js application/dependency manifests are introduced.

## 7. Verification record

The workflow badges above link to their authoritative GitHub Actions pages. For an audit, inspect the latest run on the current `main` commit and the associated job results. A green workflow badge means the workflow completed successfully; it does **not** prove that every security finding is absent.

DevSkim and Bearer were used in historical remediation work but are not configured as recurring scans on the current `main` branch. Their historical pass must not be read as current coverage. GitHub-native Secret Scanning and Dependabot alerts are owner-confirmed enabled as of 2026-11-24. At that observation, the owner saw no open Malware alerts, no open Dependabot alerts, and no auto-dismissed Dependabot alerts. These inventory observations are point-in-time evidence and do not replace Code Scanning review or prove universal dependency cleanliness.

---

## Security reporting

**Do not disclose suspected vulnerabilities in public issues or pull requests.** Use GitHub Private Vulnerability Reporting if enabled for this repository. If that option is unavailable, contact the repository owner through [the GitHub profile](https://github.com/ErTapanJatakia).

Please include a concise impact description, affected file or workflow, safe reproduction steps, and redacted evidence. Never include credentials, access tokens, private keys, personal information, or confidential data.

This is a profile/documentation repository, not a software product or security-response service. Reports are handled on a best-effort basis; there is no published SLA or bug-bounty programme.

## Coordinated disclosure

Please give the repository owner a reasonable opportunity to investigate and address a confirmed issue before public disclosure. Do not access, modify, delete, or exfiltrate data; disrupt services; conduct denial-of-service testing; or test third-party systems without explicit authorisation.

## Out of scope

- Vulnerabilities in third-party websites, services, badges, images, fonts, or embedded resources linked from the profile.
- Compromise of a third-party account or platform.
- Issues requiring access to systems or infrastructure not maintained by this repository.

Please report third-party issues to the relevant service provider through its own security-reporting process.

Thank you for helping keep this repository and its visitors safe.
