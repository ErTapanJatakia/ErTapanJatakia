# Security & Quality Assurance

[![Security Analysis](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml/badge.svg?branch=main)](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml)
[![OpenSSF Scorecard workflow](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/scorecard.yml/badge.svg?branch=main)](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/scorecard.yml)
[![Security Policy](https://img.shields.io/badge/Security%20Policy-Published-2ea44f?style=flat-square&logo=github)](./SECURITY.md)
[![Protected Main](https://img.shields.io/badge/main-branch%20protected-2ea44f?style=flat-square&logo=github)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![Pull Requests](https://img.shields.io/badge/Changes-Pull%20Request%20Required-2ea44f?style=flat-square&logo=github)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)

> **Evidence-first status:** live workflow badges report GitHub Actions workflow state. Descriptive badges identify configured controls; they do not claim that every scan is clean or that no vulnerabilities exist. Planned and unverified controls are explicitly labelled below.

## 1. Security scanning & detection

### Configured security controls

[![Gitleaks](https://img.shields.io/badge/Secret%20Detection-Gitleaks%20configured-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml)
[![zizmor](https://img.shields.io/badge/GitHub%20Actions%20Audit-zizmor%20configured-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml)
[![OpenSSF Scorecard](https://img.shields.io/badge/Supply%20Chain-OpenSSF%20Scorecard%20configured-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/scorecard.yml)
[![CodeQL](https://img.shields.io/badge/Static%20Analysis-CodeQL%20Actions%20analysis-2ea44f?style=flat-square&logo=github)](https://github.com/ErTapanJatakia/ErTapanJatakia/security/code-scanning)

### Additional scanners — proposed, not yet enabled

[![Trivy](https://img.shields.io/badge/Scanner-Trivy%20planned-lightgrey?style=flat-square&logo=aqua)](https://trivy.dev/)
[![Semgrep](https://img.shields.io/badge/SAST-Semgrep%20planned-lightgrey?style=flat-square)](https://semgrep.dev/)
[![DevSkim](https://img.shields.io/badge/Secure%20Development-DevSkim%20status%20to%20verify-yellow?style=flat-square)](https://github.com/microsoft/DevSkim)
[![Bearer](https://img.shields.io/badge/Data%20Security-Bearer%20status%20to%20verify-yellow?style=flat-square)](https://docs.bearer.com/)
[![GitHub Secret Scanning](https://img.shields.io/badge/GitHub%20Secret%20Scanning-Platform%20status%20unverified-yellow?style=flat-square&logo=github)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/security_analysis)
[![Dependabot Alerts](https://img.shields.io/badge/Dependabot%20Alerts-Platform%20status%20unverified-yellow?style=flat-square&logo=dependabot)](https://github.com/ErTapanJatakia/ErTapanJatakia/security/dependabot)
[![Bandit](https://img.shields.io/badge/Python%20SAST-Bandit%20not%20applicable-lightgrey?style=flat-square)](#scope-and-applicability)
[![npm audit](https://img.shields.io/badge/Node%20Dependency%20Audit-npm%20audit%20not%20applicable-lightgrey?style=flat-square&logo=npm)](#scope-and-applicability)
[![OWASP ZAP](https://img.shields.io/badge/DAST-OWASP%20ZAP%20not%20applicable-lightgrey?style=flat-square&logo=owasp)](#scope-and-applicability)

## 2. Supply-chain & dependency assurance

[![Dependabot Updates](https://img.shields.io/badge/Dependency%20Updates-Dependabot%20configured-2ea44f?style=flat-square&logo=dependabot)](./.github/dependabot.yml)
[![Pinned Actions](https://img.shields.io/badge/GitHub%20Actions-Immutable%20SHA%20pinning%20in%20use-2ea44f?style=flat-square&logo=githubactions)](./.github/workflows/)
[![GPG Verification](https://img.shields.io/badge/GPG%20Signing-GPG%20verification%20workflow%20configured-2ea44f?style=flat-square&logo=gnupg)](./.github/workflows/gpg-signing-verification.yml)
[![Signed Publisher](https://img.shields.io/badge/Publishing-Signed%20publisher%20workflow%20configured-2ea44f?style=flat-square)](./.github/workflows/signed-publish.yml)
[![Signed Commits](https://img.shields.io/badge/All%20Commits-Signing%20not%20enforced-yellow?style=flat-square&logo=gnupg)](#governance-transparency)
[![SBOM](https://img.shields.io/badge/SBOM-Not%20generated-lightgrey?style=flat-square)](#scope-and-applicability)
[![SLSA Provenance](https://img.shields.io/badge/SLSA%20Provenance-Not%20implemented-lightgrey?style=flat-square)](#scope-and-applicability)
[![Artifact Attestation](https://img.shields.io/badge/Artifact%20Attestation-Not%20implemented-lightgrey?style=flat-square)](#scope-and-applicability)
[![Signed Releases](https://img.shields.io/badge/Signed%20Releases-Not%20applicable-lightgrey?style=flat-square)](#scope-and-applicability)

## 3. Repository governance & access control

[![Protected Default Branch](https://img.shields.io/badge/Default%20Branch-Protected-2ea44f?style=flat-square&logo=github)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![Pull Request Required](https://img.shields.io/badge/Merge%20Policy-PR%20required-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![Required Status Checks](https://img.shields.io/badge/Merge%20Gate-Required%20security%20checks-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![Conversation Resolution](https://img.shields.io/badge/Review%20Hygiene-Conversation%20resolution%20required-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![Squash Only](https://img.shields.io/badge/History-Squash%20merge%20only-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![Linear History](https://img.shields.io/badge/History-Linear%20history-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![Force Push Protection](https://img.shields.io/badge/Branch%20Safety-Force%20pushes%20blocked-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![Deletion Protection](https://img.shields.io/badge/Branch%20Safety-Deletion%20restricted-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![No Bypass Actors](https://img.shields.io/badge/Ruleset-Bypass%20list%20empty-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/settings/rules)
[![Code Owners](https://img.shields.io/badge/CODEOWNERS-Not%20configured-lightgrey?style=flat-square)](#scope-and-applicability)
[![Human Approval](https://img.shields.io/badge/Independent%20PR%20Approval-Not%20required-yellow?style=flat-square)](#governance-transparency)

**Governance transparency:** the active default-branch ruleset requires pull requests and the named security status checks, enforces conversation resolution and linear/squash history, blocks force pushes, restricts deletion, and has an empty bypass list. It currently requires **zero approving reviews**. Therefore, this page does not claim that independent human approval is mandatory.

## 4. Code, workflow & documentation quality

### Current automated analysis

[![CodeQL Actions](https://img.shields.io/badge/CodeQL-Actions%20analysis%20configured-2ea44f?style=flat-square&logo=github)](https://github.com/ErTapanJatakia/ErTapanJatakia/security/code-scanning)
[![Workflow Audit](https://img.shields.io/badge/Workflow%20Security-zizmor%20audit%20configured-2ea44f?style=flat-square)](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/workflows/security-analysis.yml)

### Quality gates — proposed

[![actionlint](https://img.shields.io/badge/Workflow%20Lint-actionlint%20planned-lightgrey?style=flat-square)](https://github.com/rhysd/actionlint)
[![Markdown Lint](https://img.shields.io/badge/Documentation%20Lint-Markdownlint%20planned-lightgrey?style=flat-square)](https://github.com/DavidAnson/markdownlint)
[![YAML Lint](https://img.shields.io/badge/Configuration%20Lint-YAML%20lint%20planned-lightgrey?style=flat-square)](https://github.com/adrienverge/yamllint)
[![Link Checker](https://img.shields.io/badge/Documentation%20Links-Link%20check%20planned-lightgrey?style=flat-square)](https://github.com/lycheeverse/lychee)
[![Prettier](https://img.shields.io/badge/Formatting-Prettier%20not%20configured-lightgrey?style=flat-square&logo=prettier)](https://prettier.io/)
[![EditorConfig](https://img.shields.io/badge/Editor%20Consistency-EditorConfig%20not%20verified-lightgrey?style=flat-square)](https://editorconfig.org/)
[![SonarQube](https://img.shields.io/badge/Quality%20Gate-SonarQube%20not%20configured-lightgrey?style=flat-square&logo=sonarqube)](https://www.sonarsource.com/products/sonarqube/)
[![Maintainability](https://img.shields.io/badge/Maintainability-Metric%20not%20measured-lightgrey?style=flat-square)](#scope-and-applicability)
[![Test Coverage](https://img.shields.io/badge/Test%20Coverage-Not%20measured-lightgrey?style=flat-square)](#scope-and-applicability)
[![Automated Tests](https://img.shields.io/badge/Automated%20Tests-No%20application%20test%20suite-lightgrey?style=flat-square)](#scope-and-applicability)

## 5. Policy, disclosure & transparency

[![Security Policy](https://img.shields.io/badge/Vulnerability%20Reporting-Policy%20published-2ea44f?style=flat-square)](./SECURITY.md)
[![Responsible Disclosure](https://img.shields.io/badge/Coordinated%20Disclosure-Guidance%20published-2ea44f?style=flat-square)](./SECURITY.md)
[![Contributing](https://img.shields.io/badge/Contribution%20Guidance-Published-2ea44f?style=flat-square)](./CONTRIBUTING.md)
[![Code of Conduct](https://img.shields.io/badge/Code%20of%20Conduct-Published-2ea44f?style=flat-square)](./CODE_OF_CONDUCT.md)
[![Dependabot Policy](https://img.shields.io/badge/Dependency%20Policy-Configuration%20published-2ea44f?style=flat-square)](./.github/dependabot.yml)

## 6. Scope and applicability

This repository primarily hosts a GitHub profile README, documentation, repository configuration, and GitHub Actions workflows. It is not a conventional application repository with a package manifest, deployable service, or application runtime.

Accordingly:

- **Relevant now:** secret scanning, workflow security auditing, Scorecard, Actions static analysis, dependency-update configuration, branch governance, signed-commit workflow validation, Markdown/YAML/workflow linting, and link checking.
- **Requires platform verification:** GitHub-native secret-scanning alerts, Dependabot vulnerability alerts, code-scanning alert inventory, and the current published Scorecard result.
- **Not currently evidenced:** SBOM generation, SLSA build provenance, artifact attestations, signed software releases, application test coverage, and runtime DAST. These must not be represented as implemented.
- **Not automatically useful:** language-specific scanners such as Bandit or npm audit unless corresponding Python or Node.js application/dependency manifests are introduced.

## 7. Verification record

The workflow badges above link to their authoritative GitHub Actions pages. For an audit, inspect the latest run on the current `main` commit and the associated job results. A green workflow badge means the workflow completed successfully; it does **not** prove that every security finding is absent.

Outstanding security-alert inventories and any earlier DevSkim, Bearer, or Bandit findings must be reviewed separately before a clean security posture can be claimed.

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
