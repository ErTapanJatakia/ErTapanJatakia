# Security Badge Implementation Roadmap

**Repository:** [ErTapanJatakia/ErTapanJatakia](https://github.com/ErTapanJatakia/ErTapanJatakia)  
**Baseline commit:** `24ee55e02615be5e32093c28b1b855db0d457348`  
**Baseline date:** 2026-11-24  
**Source inventory:** [SECURITY.md](../SECURITY.md)

## Purpose

This document turns the badge dashboard into an evidence-led work plan. A badge is presentation, not proof by itself. Status changes require verifiable repository configuration, a successful relevant run, or a platform setting that has actually been inspected.

## Baseline inventory

A direct count of Markdown badge elements in `SECURITY.md` at the baseline commit gives **55 displayed badge entries**:

| Status group | Count | Meaning |
|---|---:|---|
| Live workflow status | 2 | GitHub Actions workflow badges linked to their workflow pages |
| Configured / published controls | 27 | Green descriptive badges; configuration or policy is present, but this is not a clean-scan guarantee |
| Unverified / not enforced | 6 | Yellow badges whose status or enforcement needs confirmation |
| Planned / unconfigured / unmeasured / not applicable | 20 | Grey badges; these are not implemented controls |
| **Total** | **55** | Includes repeated concepts in separate sections |

The count is of rendered badge entries, not unique products, scanners, or independent controls. For example, CodeQL, zizmor, branch protection and security policy are represented more than once.

**Current dashboard after PR #38 OpenSSF Baseline Level 3 hardening:** 57 entries: 5 live workflow badges, 38 configured/published controls, 2 unverified/not-enforced badges, and 12 deferred/planned/unconfigured/unmeasured/not-applicable badges. The Dependency Review/Dependabot alert gate and SAST policy gate are now recurring workflows; the controlled documentation-release workflow is configured but its first release is pending. The former grey Signed Releases badge now describes the documentation-release workflow, while compiled software releases remain out of scope. The four P1 quality controls moved from planned to configured after successful advisory CI verification. Prettier is now configured as an additional advisory check for maintained GitHub YAML/JSON configuration. The DevSkim and Bearer badges are explicitly historical-only/not currently configured; this is a status correction, not a claim that their historical findings were all resolved.

## Priority roadmap

### P0 — Verify existing security posture before adding scanners

| Work item | Current badge(s) | Required evidence | Exit condition |
|---|---|---|---|
| GitHub Secret Scanning | **Enabled (owner-confirmed 2026-11-24)** | Owner inspected Settings → Security & analysis and confirmed the control enabled; no open Malware alerts were displayed at the observation | Badge identifies owner-confirmed enablement; keep alert inventory time-bounded and distinct from the toggle |
| Dependabot vulnerability alerts | **Enabled (owner-confirmed 2026-11-24)** | Owner confirmed the setting enabled; no open Dependabot alerts and no auto-dismissed Dependabot alerts were displayed at the observation | Badge identifies owner-confirmed enablement; keep open and auto-dismissed inventory observations time-bounded |
| DevSkim | Historical scan only; not configured on current `main` | No recurring workflow is present. Treat earlier remediation run as historical evidence only; obtain a fresh, deliberately scoped scan only if a meaningful target and maintenance plan are established | Do not display as current coverage; preserve any historical alert disposition separately |
| Bearer | Historical scan only; not configured on current `main` | No recurring workflow is present. Treat earlier remediation run as historical evidence only; obtain a fresh, deliberately scoped scan only if a meaningful target and maintenance plan are established | Do not display as current coverage; preserve any historical alert disposition separately |
| Commit signing | Signing not enforced | Inspect repository rules and actual commit verification coverage | Keep badge transparent unless signing is enforced for the intended commit scope |
| Independent PR approval | Not required | Reconfirm active ruleset and reviewer availability | Keep the zero-approval policy explicit while no independent human reviewer is available; never manufacture approvals |

**P0 guardrail:** DevSkim and Bearer are historical-only, not current recurring controls. Bandit remains not applicable because maintained Python source is absent. GitHub Secret Scanning and Dependabot alerts are owner-confirmed enabled; their inventories showed no open Malware alerts, no open Dependabot alerts, and no auto-dismissed Dependabot alerts on 2026-11-24. These are point-in-time observations. The five currently reported Code Scanning alerts are Scorecard posture findings; retain them pending genuine posture changes or evidence-based disposition. Do not describe historical scanner findings as clean/current without fresh scan evidence.

### P1 — Add low-risk quality checks suited to this repository

The repository is primarily a profile README, Markdown documentation, configuration and GitHub Actions workflows. Documentation/configuration checks have a better fit than application-oriented scanners.

| Work item | Current status | Proposed implementation | Gate before enabling |
|---|---|---|---|
| Markdownlint | **Verified** | Advisory markdownlint-cli2 check on maintained Markdown documentation; README excluded because its HTML-heavy visual layout is intentional | Passed in [quality run 45309272770](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309272770) |
| YAML syntax validation | **Verified** | Ruby Psych parses all `.github/**/*.yml` and `.yaml` files, including composite-action metadata | Passed in [quality run 45309272770](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309272770) |
| Link checker | **Verified (internal/offline)** | Lychee checks Markdown links and anchors without relying on external network responses | Passed in [quality run 45309272770](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309272770); prior online pass verified 167 links, while X profile endpoints returned HTTP 403 and remain unverified |
| actionlint | **Verified with narrow compatibility exception** | actionlint v1.7.12 analyzes workflow definitions; one parser diagnostic is excluded for the exact GitHub-documented `$/` self-repository reference, which this actionlint release does not yet recognise | Passed in [quality run 45309272770](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309272770); no workflow reference was rewritten |

Every added GitHub Action must be pinned to a full commit SHA, use least-privilege permissions, and have a documented update path through Dependabot. Prefer tools that can run without introducing an unnecessary third-party Action.

### P2 — Evaluate additional security scanners only against real targets

| Work item | Current status | Applicability decision |
|---|---|---|
| Trivy | **Deferred / not currently applicable** | Trivy's strongest misconfiguration coverage targets containers, IaC and supported deployment manifests; this repository has no such target. Gitleaks and workflow-focused CodeQL/zizmor already cover the relevant secrets and workflow-analysis scope. Reassess if containers, IaC or deployable artifacts are introduced |
| Semgrep | **Deferred / not currently applicable** | No maintained application source is present; GitHub Actions are already covered by CodeQL and zizmor. Adding a generic YAML scan without a distinct, validated rule set would duplicate existing coverage. Reassess when meaningful application source or a specific uncovered rule set exists |
| Bandit | Not applicable | Python-specific; do not enable unless maintained Python source is introduced |
| npm audit | Not applicable | Requires a relevant Node.js dependency manifest/lockfile; do not create a package solely to obtain a badge |
| OWASP ZAP | Not applicable | Requires an in-scope running web application; this repository does not currently provide one |

Do not add overlapping scanners merely to increase badge count. Select a tool only when it detects a meaningful class of issue that existing checks do not adequately cover.

### P3 — Supply-chain attestations, only when there is something to attest

| Work item | Current status | Applicability decision |
|---|---|---|
| GitHub Dependency Graph SBOM | **Verified — SPDX export and provenance attestation (2026-11-24)** | Latest run [45331157748](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331157748) validated SPDX 2.3 with 10 package records and 9 `DEPENDS_ON` relationships, generated and verified Sigstore-backed provenance attestations for the SBOM JSON and SHA-256 checksum, and uploaded the 30-day artifact. [Attestation record](https://github.com/ErTapanJatakia/ErTapanJatakia/attestations/71451141). Scope remains limited to dependencies represented in the GitHub Dependency Graph; it is not a full filesystem, container or binary SBOM. The first successful export [45329290238](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45329290238) recorded 9 packages and 8 relationships |
| SLSA provenance | **Deferred / no build artifacts** | The signed-publish workflow signs a Git commit and opens a PR; it does not build a software artifact. Commit signing is not SLSA build provenance. Reassess when a build/release pipeline produces artifacts |
| Artifact attestation | **Verified — SBOM JSON and checksum only (2026-11-24)** | The SBOM export workflow generated Sigstore-backed provenance attestations for the actual SPDX JSON and SHA-256 checksum files. Both passed `gh attestation verify` with the signer constrained to this repository's SBOM workflow; GitHub reported a public-good Sigstore certificate and Rekor transparency-log upload. [Run 45331157748](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331157748) · [Attestation record](https://github.com/ErTapanJatakia/ErTapanJatakia/attestations/71451141). This does not attest a software binary or release; no such artifact is produced. Preserve signer-identity verification and revalidate each scheduled SBOM export |
| Documentation snapshot releases | **Workflow configured; first release pending** | A main-only workflow creates a signed source/documentation archive, SHA-256 manifest/signature and GitHub artifact attestations. This is not a compiled software release or package; first publication requires owner review and a protected tag pattern |
| CODEOWNERS | **Deferred / single maintainer** | A self-owned CODEOWNERS file would not create an independent reviewer or add meaningful review assurance. Reassess if genuine additional maintainers or component owners join |

No artificial package, release, build artifact, or provenance workflow should be created to improve a score.

### P4 — Metrics and platform controls that need a real basis

| Work item | Current status | Applicability decision |
|---|---|---|
| Prettier | **Configured — repository configuration formatting check** | Exact Prettier version 3.6.2 checks `.github/workflows/*.yml`, `.github/dependabot.yml` and `.prettierrc.json` in advisory QA. This is configuration-format enforcement, not application-source formatting. The five advisory QA jobs, including Prettier, passed in post-merge [Quality Assurance run 45337720318](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337720318) |
| EditorConfig | **Verified** | Root `.editorconfig` defines UTF-8, LF, final newlines, two-space indentation and Markdown trailing-space preservation. The repository configuration validation passed after adding explicit assertions for these settings in post-merge run [45325182343](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45325182343) on commit `0967983192f472845d0e95c06774a41138f85a02`. Keep verified through the configuration workflow |
| SonarQube | **Not applicable** | No maintained application source or build target exists. Reassess only if the repository gains meaningful source code and a supported analysis scope |
| Maintainability metric | **Not applicable** | No maintained application code exists for a meaningful code maintainability metric. Keep this distinct from documentation quality checks |
| Test coverage | **Not applicable** | There is no application test target or coverage instrumentation. Configuration/workflow validation must not be presented as application code coverage |
| Automated application tests | **No application test suite** | Existing workflow, YAML, Markdown and configuration checks are real CI checks, but this repository has no application runtime or application-level test suite |
| Repository QA aggregate badge | **Configured — five advisory CI checks** | The dashboard badge now represents Markdown lint, YAML syntax validation, internal link checking, actionlint and Prettier configuration formatting. It is not an application test-suite or code-coverage claim |

## Recommended execution sequence

1. **Maintain P0 evidence**: native GitHub security settings and alert inventories were owner-confirmed on 2026-11-24; retain the time-bounded evidence and transparent signing/approval statements. DevSkim/Bearer remain historical-only, not current scans.
2. **P1 checks are now implemented in advisory mode**: Markdown lint, YAML syntax validation, internal/offline link checking and actionlint all passed together in run 45309272770.
3. **Retain advisory status initially**: gather repeatable results before considering any new required status checks; do not modify branch rules as part of this PR.
4. **Refresh platform evidence only when warranted**; do not ask the owner to recheck unchanged alert inventories or claim a universal clean bill from point-in-time observations.
5. **Reassess P2–P4 when repository scope changes**: do not implement controls whose prerequisites do not exist.

### Status-focused badge audit and implementation — 2026-11-24

This review prioritises the non-green and non-current badge states rather than repeating the already verified platform-control checks.

| Badge / control | Previous label | Decision and work completed | Reassessment trigger |
|---|---|---|---|
| Trivy | Planned | Deferred: no container, IaC, deployable filesystem or dependency target that adds distinct coverage. Existing Gitleaks and workflow-focused CodeQL/zizmor checks cover the relevant current scope | Introduce containers, IaC or a meaningful supported target |
| Semgrep | Planned | Deferred: no maintained application source; generic workflow scanning would overlap CodeQL Actions and zizmor without a distinct validated ruleset | Add application source or identify a specific uncovered rule set |
| DevSkim | Historical scan only | Retain historical-only status; no recurring current-main workflow exists | Reintroduce only with a scoped target, maintained rules and recurring CI |
| Bearer | Historical scan only | Retain historical-only status; no application data-flow target exists | Add an application with meaningful data flows |
| GitHub Dependency Graph SBOM | **Verified — SPDX export and attestation (2026-11-24)** | Latest [run 45331157748](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331157748) validated SPDX 2.3 with 10 package records and 9 `DEPENDS_ON` relationships, attested the SBOM JSON and checksum, verified both attestations against the expected signer workflow, and uploaded the 30-day artifact. [Attestation record](https://github.com/ErTapanJatakia/ErTapanJatakia/attestations/71451141). Scope is limited to dependencies represented in GitHub's Dependency Graph, not a complete filesystem, container or binary inventory | Continue scheduled runs and review graph coverage as repository dependencies change |
| SLSA provenance | Not implemented | Deferred: signed Git commits are not build provenance; no artifact build pipeline exists | Introduce a build/release pipeline |
| Artifact attestation | **Verified — SBOM JSON and checksum only** | Provenance attestations are generated and verified for the actual SPDX JSON and companion SHA-256 checksum. No software binary or release artifact is produced, so software-build attestation remains out of scope | Reassess if a distributable software artifact is introduced |
| CODEOWNERS | Not configured | Deferred: a self-only ownership file would not create independent review or meaningful approval assurance | Add genuine maintainers/component owners |
| Prettier | Not configured | Implemented: explicit `.prettierrc.json` and a recurring advisory QA job run Prettier 3.6.2 against maintained GitHub YAML/JSON configuration. The successful PR check is recorded in [run 45337588468](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337588468), and the post-merge five-job Quality Assurance workflow passed in [run 45337720318](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337720318) | Keep the pinned version current and retain successful QA runs |
| EditorConfig | Not verified | Verified: root `.editorconfig` and required policy-key assertions passed in post-merge configuration run [45325182343](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45325182343) | Keep verified through the configuration workflow |
| SonarQube | Not configured | Not applicable: no maintained application source or build target | Add meaningful source code and an analysis scope |
| Maintainability metric | Not measured | Not applicable: no application codebase for a meaningful code maintainability metric | Add maintained application source |
| Test coverage | Not measured | Not applicable: no application test target or coverage instrumentation | Add application tests and coverage instrumentation |
| Automated application tests | No application test suite | Retain explicit wording: configuration and workflow CI checks exist, but they are not application tests | Add a maintained application runtime/test suite |

**Interpretation:** “deferred” is an active scope decision, not an implemented control. “Not applicable” is not a green security result. Historical scanner passes are not current coverage. The SBOM workflow's first run succeeded; it must still not be described as a complete software inventory. No artificial package, build artifact, source code, test suite, fuzzer or reviewer has been created to improve badge counts.

**Badge presentation:** all badge images in `README.md` and `SECURITY.md` are being resized to 150% of their previous rendered height. For Shields.io `for-the-badge` images, the target height is 42 px; for standard/flat-square and GitHub workflow badges, it is 30 px. Image scaling enlarges the embedded badge text proportionally. This is a presentation change only and does not change the underlying control status.

### PR #34 completion — Prettier configuration formatting check — 2026-11-24

**Main commit:** `408af53c32b155b83c3a0be7ef0cd8014446a245` (PR #34, merged).

Prettier is now configured as a recurring advisory repository-configuration formatting check. The workflow uses exact Prettier version 3.6.2 and checks `.github/workflows/*.yml`, `.github/dependabot.yml` and `.prettierrc.json`. It does not claim application-source formatting or application-level quality coverage.

The PR check passed in [run 45337588468](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337588468). All six post-merge workflow groups completed successfully:

| Control | Run | Result |
|---|---|---|
| Repository Quality Assurance (including Prettier) | [45337720318](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337720318) | All five advisory jobs passed |
| Repository Configuration Validation | [45337720137](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337720137) | Passed |
| Repository Security Analysis (Gitleaks + zizmor) | [45337720063](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337720063) | Passed |
| GitVerse mirror | [45337720053](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337720053) | Passed |
| Repository Dependency Graph SBOM | [45337720169](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337720169) | Passed |
| OpenSSF Scorecard | [45337720078](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45337720078) | Assessment and SARIF upload passed |

**Dashboard effect at that historical checkpoint:** the deferred Prettier badge moved to configured, and the former “No application test suite” badge was replaced with an accurately scoped Repository QA badge backed by five advisory CI checks. The roadmap still explicitly records that no application test suite exists. The inventory then contained 55 entries: 3 live workflow badges, 37 configured/published controls, 2 unverified/not-enforced badges and 13 deferred/planned/unconfigured/unmeasured/not-applicable badges. Prettier remains advisory and is not a required branch-protection check.

## Evidence and governance rules

- A green workflow badge means the workflow completed successfully; it does not prove that every finding is absent.
- A configured-tool badge means the integration exists; it does not prove the latest scan is clean.
- Platform alert counts must be checked independently from workflow status.
- A finding is closed only after remediation or a documented, evidence-based false-positive / accepted-risk decision.
- Do not fabricate GitHub approvals, contributors, releases, tests, package manifests, fuzzers, or attestations.
- ChatGPT-assisted review can provide substantive technical analysis, but it is not a separate authenticated GitHub human approval.
- Keep branch protections, required security checks, SHA pinning, GPG verification and least-privilege permissions intact.
- Apply the repository's three-failure rule: after three consecutive failures of the same test/CI strategy, stop repeating that strategy and change approach or defer; do not weaken or delete tests.

## Status update format

For each work item, record:

| Field | Required content |
|---|---|
| Status | Not started / In progress / Verified / Blocked / Not applicable |
| Evidence | Workflow run, settings page, alert record, scan output or commit |
| Findings | Open, fixed, dismissed with rationale, or none observed in the checked scope |
| Decision | Enable, defer, retain as not applicable, or remove an obsolete badge |
| Last verified | Date and commit SHA |

**P1 evidence:** quality run [45309272770](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309272770), commit `aeaf81dcff6ceee809efeeeb53fda09ed18ca0bd`. All four quality jobs passed. The checks remain advisory and are not required branch protections.

## Latest verification snapshot — 2026-11-24

**Verified main commit at PR #13 snapshot:** `97580573c7604d18a6c9400582b90fb08b3aa415` (PR #13, merged). The subsequent documentation-only PR #14 is recorded below.

| Control | Latest evidence | Result / interpretation |
|---|---|---|
| Gitleaks | [Security Analysis run 45309601904](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309601904) | Passed; log reports **no leaks found** in the pushed commit. Push events use an incremental commit range; this is not a full-history result. |
| zizmor | [Security Analysis run 45309601904](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309601904) | Passed; audited the current workflow, local-action and Dependabot configuration files it discovered and reported no findings, with 15 findings suppressed by its effective configuration. |
| CodeQL | [CodeQL run 45309601412](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309601412) | Passed; scanned 9/9 GitHub Actions files and uploaded SARIF successfully. This is workflow analysis, not application-language coverage. |
| OpenSSF Scorecard | [Scorecard run 45309601974](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309601974) | Passed; measured score **6.9/10**. A successful run does not mean every posture check scores 10. |
| Quality checks | [Quality run 45309601895](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309601895) | All four advisory jobs passed: YAML syntax, actionlint, Markdown lint and internal/offline Markdown link validation. |
| Repository configuration | [Validation run 45309601879](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309601879) | Passed. |
| GitVerse mirror | [Mirror run 45309601988](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45309601988) | Passed. |
| Personal GPG signing | [Verification run 45312695775](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45312695775) | Passed; isolated signed test commit passed `git verify-commit`, and temporary signing material was removed. GnuPG reported a good signature but warned that the key was not certified in the local trust database; this is cryptographic verification, not independent identity certification or repository-wide enforcement. |

### PR #14 post-merge verification — commit `ad5293e265488cc7db5f0689cc8191db0e6cc8c5`

PR #14 (`docs(security): record latest security posture evidence`) was merged after its pre-merge checks passed. Post-merge verification completed successfully:

| Control | Run | Result |
|---|---|---|
| Repository Security Analysis (Gitleaks + zizmor) | [45313655994](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45313655994) | Passed |
| Repository Quality Assurance (four advisory jobs) | [45313655992](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45313655992) | All four jobs passed |
| Repository Configuration Validation | [45313656145](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45313656145) | Passed |
| GitVerse mirror | [45313656029](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45313656029) | Passed |
| CodeQL Actions analysis | [45313656907](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45313656907) | Passed; analysis completed |
| OpenSSF Scorecard | [45313656089](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45313656089) | Passed; SARIF upload completed |

This verifies workflow execution on the PR #14 merge commit. It does not close the five Scorecard posture alerts or verify native Secret Scanning/Dependabot platform settings.

### Scorecard findings and Code Scanning disposition

The latest Scorecard result reports these low-scoring posture checks:

| Check | Score | Evidence / disposition |
|---|---:|---|
| Code-Review | 0 | The active ruleset requires PRs but currently requires zero approving reviews. Do not manufacture an independent reviewer or claim mandatory human approval. |
| Maintained | 0 | Scorecard reports that the repository is less than 90 days old. Time-based; do not generate artificial activity to influence this result. |
| Branch-Protection | 4 | The active ruleset protects the default branch, requires PRs and status checks, requires conversation resolution, permits squash only, enforces linear history, blocks deletion and non-fast-forward updates, and has no bypass actors. Scorecard notes that approving reviews, stale-review dismissal, CODEOWNERS review and last-push approval are not required. |
| Fuzzing | 0 | No fuzzing integration is detected. This repository has no application runtime or meaningful fuzzing target at present. |
| CII-Best-Practices | 0 | No OpenSSF Best Practices badge application is detected. This is an optional programme, not evidence of an exploitable code defect. |

The five Code Scanning alerts most recently reported by the repository owner correspond to Scorecard posture findings, not five demonstrated exploitable vulnerabilities. Retain them unless the underlying posture is genuinely improved or a documented, evidence-based disposition is appropriate. Do not dismiss them merely to obtain a green dashboard.

The same Scorecard report assigns 10 to its Vulnerabilities check (reporting zero known vulnerabilities in its checked scope), Dangerous-Workflow, Pinned-Dependencies, Token-Permissions, Security-Policy, SAST, License and CI-Tests. These scores are useful evidence, not a substitute for reviewing the platform's separate alert inventories.

### Active governance evidence

The current active repository ruleset, **Protect main - Security & PR Governance** (ID `27948154`), applies to the default branch and has an empty bypass list. Its required status checks are exactly:

- `Gitleaks secret detection`
- `zizmor GitHub Actions audit`

The ruleset requires pull requests, conversation resolution, squash-only merging and linear history; it blocks deletion and non-fast-forward updates. It currently requires **zero approving reviews**. Advisory quality jobs and CodeQL/Scorecard runs are not required status checks under this ruleset.

Dependabot configuration is present for **GitHub Actions** only, on a weekly Monday schedule at 04:00 Asia/Kolkata, with a seven-day cooldown and a five-PR limit. This confirms update configuration; it does **not** establish whether GitHub Dependabot vulnerability alerts are enabled.

### Dependabot alert inventory — owner-observed, 2026-11-24

The repository owner inspected both GitHub Security alert views. Each reported dependency files checked approximately one hour before the observation and **no open alerts**:

| Inventory | Owner-observed state | Interpretation |
|---|---|---|
| Malware alerts | No open alerts | No currently open package-malware alerts were displayed |
| Dependabot alerts | No open alerts | No currently open Dependabot vulnerability alerts were displayed |
| Auto-dismissed alerts | Owner-confirmed empty inventory, including the separate auto-dismissed filter | No auto-dismissed Dependabot alerts were displayed at the 2026-11-24 observation; this is a point-in-time inventory result, not proof that no alerts were ever generated |

The owner also confirmed the GitHub-managed auto-triage presets: **Enabled** — “Dismiss low-impact alerts for development-scoped dependencies”; **Disabled** — “Dismiss package malware alerts” (match: `malware:package`).

The enabled development-scoped rule can remove qualifying alerts from the open inventory without fixing the underlying dependency. The owner separately confirmed that the auto-dismissed Dependabot inventory was also empty at the 2026-11-24 observation. These are point-in-time inventory observations, not proof that no alerts were ever generated or that all dependencies are vulnerability-free. The malware-dismissal preset being disabled means that particular rule is not configured to dismiss package-malware alerts; it does not establish the absence of every other possible dismissal mechanism.

**Setting-state distinction:** the owner separately inspected Settings → Security & analysis and confirmed Dependency Graph, automatic dependency submission, Dependabot alerts, Malware alerts, Dependabot security updates, grouped security updates, Dependabot version updates, CodeQL default setup, Secret Scanning/push protection and private vulnerability reporting enabled. This remains owner-confirmed UI evidence rather than an independent API read-back. No platform settings were changed as part of the documentation updates.

### Native GitHub security settings — owner-confirmed, 2026-11-24

The repository owner inspected **Settings → Security & analysis** and confirmed that the displayed security controls are enabled. This is owner-provided UI evidence, not an independent API read-back by the connected integration.

| Control | Owner-confirmed state | Scope / interpretation |
|---|---|---|
| Private vulnerability reporting | Enabled | Community can privately report potential vulnerabilities to repository maintainers |
| Dependency Graph | Enabled | GitHub dependency graph is enabled |
| Automatic dependency submission | Enabled | GitHub automatic dependency submission is enabled for supported ecosystems; this does not imply every ecosystem or build-time dependency is covered |
| Dependabot alerts | Enabled | Vulnerability alerts are enabled |
| Malware alerts | Enabled | Package-malware alerts are enabled |
| Dependabot security updates | Enabled | Security-fix pull requests are enabled when an applicable patch is available |
| Grouped security updates | Enabled | Grouping is enabled for applicable security updates |
| Dependabot version updates | Enabled | Version-update automation is enabled; the current `.github/dependabot.yml` config covers GitHub Actions only |
| CodeQL default setup | Enabled | Default setup is active; the settings page reported the last scan approximately nine minutes before the owner's observation |
| Push protection | Enabled | Supported secrets are blocked at push time |

The settings page also displayed AI Scan for repositories, AI Scan for pull requests, Scan for AI applications, Copilot Autofix and Agentic Autofix as available capabilities. Their display on the page is **not** evidence that those optional capabilities are enabled or used; no status is claimed for them.

The owner separately confirmed that dependency files had been checked approximately one hour before the 2026-11-24 observation and that the open Malware alerts, open Dependabot alerts, and auto-dismissed Dependabot inventory were all empty. The GitHub-managed auto-triage preset “Dismiss low-impact alerts for development-scoped dependencies” is enabled; “Dismiss package malware alerts” is disabled. These are point-in-time inventory observations; they do not establish that alerts never existed or that every dependency is vulnerability-free.

The connected integration still cannot independently read the native security-setting toggles or enumerate the Code Scanning alert endpoint. Accordingly, the above is explicitly labelled owner-confirmed; it is not represented as an API-verified state. No native settings or alert dispositions were changed during this documentation update.

Historical DevSkim and Bearer remediation was tested in the earlier PR #272 post-merge pipeline (run #243, 7/7 jobs passed). Those scanners are not among the workflows currently present on `main`; their badges are now explicitly historical-only/not currently configured. Bandit remains not applicable because this repository does not maintain Python application source. The earlier pass is not current recurring coverage.

**Next checkpoint:** retain the five Scorecard posture findings with the applicability decisions below; revisit only when repository ownership, age, code scope or governance capacity materially changes. Do not dismiss alerts solely to improve the dashboard score.

### PR #17 completion and current posture triage — 2026-11-24

**Main commit:** `2a4bc7e7f582b6d4e6a7b02787424e569e938d38` (PR #17, merged).

All six post-merge workflows completed successfully on this commit:

| Control | Run | Result |
|---|---|---|
| Repository Security Analysis | [45319668848](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45319668848) | Passed |
| Repository Configuration Validation | [45319668846](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45319668846) | Passed |
| Repository Quality Assurance | [45319668797](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45319668797) | All four advisory jobs passed: actionlint, YAML syntax, Markdown links and Markdown lint |
| GitVerse mirror | [45319668780](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45319668780) | Passed |
| OpenSSF Scorecard | [45319668811](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45319668811) | Assessment and SARIF upload passed |
| CodeQL Actions analysis | [45319668583](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45319668583) | Analysis completed successfully |

#### Five Scorecard posture findings — disposition

These are posture findings, not five confirmed exploitable vulnerabilities. Current decisions are:

| Alert | Finding | Decision | Rationale / trigger for reassessment |
|---:|---|---|---|
| #10 | Code-Review | **Retain; no control change** | The project has a sole maintainer and no independent human reviewer. Keep PR-based change control and required security checks; do not fabricate an approval or configure a nominal reviewer. Reassess when a genuine independent reviewer becomes available. |
| #11 | Maintained | **Time-based; defer** | Scorecard's finding is based on the repository being younger than 90 days. Do not generate artificial commits or activity. Reassess after the repository naturally passes the age threshold. |
| #1 | Branch-Protection | **Retain current ruleset; no artificial review gate** | Ruleset `27948154` already requires PRs, conversation resolution and the two security checks, enforces squash-only/linear history, blocks deletion and force-push, and has no bypass actors. Review-dependent controls such as stale-approval dismissal and last-push approval do not provide meaningful protection when no independent approval is required. CODEOWNERS may clarify ownership but cannot create an independent reviewer. Reassess if the maintainer/reviewer model changes. |
| #14 | Fuzzing | **Not applicable; defer** | This repository has no maintained application runtime or meaningful fuzzing target. Do not add a dummy target or claim fuzzing coverage. Reassess if executable code or a suitable parser/runtime is introduced. |
| #13 | CII-Best-Practices | **Optional; defer** | The OpenSSF Best Practices badge is a voluntary programme, not a vulnerability fix. Reassess if the repository's scope and governance documentation justify a substantive application; do not pursue it solely to clear a Code Scanning alert. |

**Alert handling:** retain these findings in Code Scanning. No alert was dismissed, suppressed, or marked fixed as part of this triage. The appropriate outcomes are genuine remediation when feasible, or continued transparent tracking where a finding is time-based, optional or not applicable.

#### Dependabot inventory correction

The repository owner confirmed that, as of 2026-11-24, all three inspected inventories were empty: open Malware alerts, open Dependabot alerts, and the separate auto-dismissed Dependabot inventory. Dependency files had been checked approximately one hour before the observation. This supersedes the earlier note that the auto-dismissed inventory still needed a separate review. The observation is time-bounded and does not establish that alerts never existed or that dependencies are universally vulnerability-free.

The owner also confirmed the native GitHub security controls listed in the preceding section as enabled. Those platform settings remain labelled owner-confirmed rather than independently API-verified. No alert disposition or repository security setting was changed during this triage.

**Outcome:** the remaining five Scorecard alerts are understood and have evidence-based dispositions. Four are deferred/retained for explicit applicability or governance reasons; one is time-based. None warrants a cosmetic dismissal or a fabricated implementation. Revisit only when the underlying repository conditions change.

### PR #18 completion and latest Scorecard evidence — 2026-11-24

**Main commit:** `f120a413136b14415be65581362cd3bb594e7cfc` (PR #18, merged).

All six post-merge workflows completed successfully on this commit:

| Control | Run | Result |
|---|---|---|
| Repository Security Analysis (Gitleaks + zizmor) | [45320723881](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45320723881) | Passed |
| Repository Configuration Validation | [45320723836](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45320723836) | Passed |
| Repository Quality Assurance (four advisory jobs) | [45320724001](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45320724001) | All four jobs passed |
| GitVerse mirror | [45320723882](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45320723882) | Passed |
| CodeQL Actions analysis | [45320724060](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45320724060) | Passed; analysis processing completed |
| OpenSSF Scorecard | [45320723853](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45320723853) | Passed; SARIF uploaded and processing completed |

The latest Scorecard job log reports an overall score of **6.9/10**. The following details are from that run's generated report:

| Scorecard check | Score | Current interpretation |
|---|---:|---|
| Maintained | 0 | Repository was created within the last 90 days; time-based |
| Code-Review | 0 | No approved changesets detected; no independent human approval is required |
| Branch-Protection | 4 | PRs, status checks, up-to-date branch, deletion and force-push controls detected; review-dependent controls remain absent |
| Fuzzing | 0 | No fuzzer integration; no suitable application fuzzing target currently exists |
| CII-Best-Practices | 0 | No optional OpenSSF Best Practices badge application detected |
| Contributors | 3 | Score normalized from contributions by one detected organization; do not manufacture contributors |
| Packaging | -1 | No packaging workflow detected; not applicable to this documentation/profile repository |
| Signed-Releases | -1 | No releases found; not applicable while no software release artifacts are published |
| Vulnerabilities | 10 | Zero existing vulnerabilities detected within Scorecard's checked scope |
| Dangerous-Workflow | 10 | No dangerous workflow patterns detected |
| Token-Permissions | 10 | Workflow token permissions scored least-privilege overall; two jobs intentionally require `contents: write` and `pull-requests: write` to push signed branches and open review PRs |
| Pinned-Dependencies | 10 | All 13 GitHub-owned and all 5 third-party Actions dependencies pinned |
| Security-Policy | 10 | Security policy detected |
| SAST | 10 | All 12 checked commits covered by a SAST tool |
| CI-Tests | 10 | All 12 checked merged PRs had CI tests |

Packaging and Signed-Releases at -1 are applicability results, not security failures or additional Code Scanning alerts. Contributors is a community-diversity metric and must not be gamed. The five retained Code Scanning findings remain the five posture items described above; no finding was dismissed or marked fixed.

**SARIF note:** the Scorecard upload succeeded and GitHub completed processing. The upload log emitted warnings that several Scorecard results used the placeholder location text “no file associated with this alert” rather than a source-file URI. This is consistent with repository-level posture findings and does not indicate a failed upload. Do not invent file locations to silence the warning.

**Permission review:** Scorecard identifies `contents: write` in `.github/workflows/repository-controller.yml` and `.github/workflows/signed-publish.yml`. Inspection confirms these jobs create and push signed attestation/publication branches and open pull requests. The write permissions are scoped to those jobs; top-level workflow permissions remain empty. No narrower permission can support those operations, so retain the current job-level permissions and continue auditing the scripts and target validation.

**Historical badge count after native-setting confirmation and EditorConfig implementation (before SBOM workflow):** 55 displayed entries — 2 live workflow badges, 34 configured/published controls, 2 unverified/not-enforced badges, and 17 deferred/planned/unconfigured/unmeasured/not-applicable badges. The Secret Scanning and Dependabot Alerts badges now say “Enabled (owner-confirmed)” rather than “Platform status unverified”; the evidence source is explicitly disclosed in the badge text and this roadmap.

### PR #25 completion — SPDX SBOM successfully generated — 2026-11-24

**Main commit:** `2181183ac9c57d7f995b81268c91a5b06d061c3b` (PR #25, merged).

PR #25 corrected SPDX validation to accept both the legacy API wrapper (`.sbom`) and a direct SPDX JSON document root, while retaining strict checks for `SPDXRef-DOCUMENT`, SPDX 2.3, and array-valued `packages` and `relationships`.

The first post-merge execution of the Dependency Graph SBOM workflow completed successfully:

| Evidence | Result |
|---|---|
| Workflow run | [45329290238](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45329290238) — success |
| SPDX format | SPDX 2.3; structural validation passed |
| Package records | **9** |
| `DEPENDS_ON` relationships | **8** |
| Checksum | SHA-256 checksum file generated and included in the artifact |
| Artifact | [repository-dependency-sbom-45329290238](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45329290238/artifacts/14891280949) — uploaded successfully; 30-day retention |
| Uploaded archive digest | `sha256:ec67ac78be3df4179d1c17f95191526c8d4cab2bae4bf9bbee763182b636b47b` |

The artifact contains the SPDX JSON report and its companion `.sha256` file. The workflow log confirms the checksum file was generated from the downloaded SBOM before upload. The archive digest above is GitHub's artifact ZIP digest; it is not the checksum of the raw SPDX JSON file.

**Coverage interpretation:** this is a populated GitHub Dependency Graph snapshot with 9 package records and 8 dependency relationships. It is not a complete filesystem, container, binary or runtime inventory. The workflow badge may now be treated as a successfully executing workflow, while the roadmap continues to disclose the source and limits of its coverage. No claim is made that all software dependencies in every possible build/runtime context are represented.

### PR #31 completion — SPDX SBOM artifacts attested — 2026-11-24

**Main commit:** `f367bb68ca620223f27399e870a18d67b86743cf` (PR #31, merged).

The first post-merge run with artifact attestations completed successfully:

| Evidence | Result |
|---|---|
| Workflow run | [45331157748](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331157748) — success |
| SPDX output | SPDX 2.3; structural validation passed |
| Package records | **10** |
| `DEPENDS_ON` relationships | **9** |
| Attested subjects | SPDX JSON and companion SHA-256 checksum |
| Attestation | [GitHub attestation record 71451141](https://github.com/ErTapanJatakia/ErTapanJatakia/attestations/71451141) |
| Signature | Public-good Sigstore signing certificate; signature uploaded to the Rekor transparency log |
| Verification | Both files passed `gh attestation verify` with signer constrained to `github.com/ErTapanJatakia/ErTapanJatakia/.github/workflows/repository-dependency-sbom.yml` |
| SBOM artifact | [repository-dependency-sbom-45331157748](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331157748/artifacts/14892405876) — 30-day retention |

**Scope:** these attestations establish provenance for the generated SBOM JSON and checksum files. They do not establish build provenance for a software binary, container or release. The underlying inventory remains limited to GitHub Dependency Graph data. SLSA software-build provenance remains deferred/not applicable until a real software build artifact exists. At the time of this historical entry, no release was introduced; PR #38 subsequently configured a separate documentation/source-configuration snapshot release workflow, but the first release has not yet been published.

### Latest post-merge Scorecard and CI evidence — 2026-11-24

**Main commit:** `4185abcd200d6b9a3b29ad1d559da58f53cca9ce` (PR #32, merged).

All six post-merge workflow groups completed successfully:

| Control | Run | Result |
|---|---|---|
| OpenSSF Scorecard | [45331495256](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331495256) | Passed; **6.9/10** |
| CodeQL Actions analysis | [45331495316](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331495316) | Passed |
| Repository Security Analysis (Gitleaks + zizmor) | [45331495318](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331495318) | Passed |
| Repository Configuration Validation | [45331495532](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331495532) | Passed |
| Repository Quality Assurance | [45331495425](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331495425) | All four advisory jobs passed |
| GitVerse mirror | [45331495380](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331495380) | Passed |

The Scorecard 6.9/10 result contains these check outcomes:

| Check | Score | Evidence-based interpretation |
|---|---:|---|
| Maintained | 0 | Repository is younger than 90 days; time-based, not a defect to game |
| Code-Review | 0 | 0/29 approved changesets detected; no independent reviewer is currently available |
| Branch-Protection | 4 | PRs, status checks, up-to-date branches, deletion and force-push controls are active; approvals, CODEOWNERS review, stale-review dismissal and last-push approval are not required |
| Fuzzing | 0 | No suitable application fuzzing target exists |
| CII-Best-Practices | 0 | Optional OpenSSF Best Practices badge has not been pursued |
| Contributors | 3 | One contributing institution detected; do not manufacture contributors |
| Packaging | -1 | No software package/publishing workflow; not applicable to this documentation/profile repository |
| Signed-Releases | -1 | No software release is detected; the new documentation snapshot workflow is configured but not yet published and does not create a compiled software release |
| Vulnerabilities | 10 | Zero existing vulnerabilities detected within Scorecard's checked scope |
| Dangerous-Workflow | 10 | No dangerous workflow patterns detected |
| Dependency-Update-Tool | 10 | Dependabot configuration detected |
| Token-Permissions | 10 | Least-privilege workflow permissions detected; write permissions remain scoped to jobs that need them |
| Pinned-Dependencies | 10 | 15/15 GitHub-owned and 5/5 third-party Actions dependencies pinned |
| Security-Policy | 10 | Security policy detected |
| Binary-Artifacts | 10 | No generated executable binaries found in the repository |
| License | 10 | GPL-3.0 license detected |
| SAST | 10 | All 25 checked commits covered by a SAST tool |
| CI-Tests | 10 | All 25 checked merged PRs had CI checks |

**Interpretation at this checkpoint:** the score remains 6.9/10 because the remaining low scores reflect repository age, the lack of independent reviewers, the absence of a suitable fuzzing target and optional CII participation. Packaging remains not applicable. Scorecard does not yet detect a software release; the documentation snapshot workflow is configured but its first publication is pending. Do not create a software package, fake contributor, dummy fuzzer or self-approval process to alter these results. Reassess only when the repository's actual scope or maintainer structure changes.

### PR #38 completion — OpenSSF Baseline Level 3 hardening — 2026-11-24

**Main commit:** `099708d2225f65e3ad31cbd4ac2fc44a8f17458c` (PR #38, merged).

The PR added repository-scoped governance and security policies for secrets, collaborator access, repository QA, SCA, SAST, VEX, threat modelling, release support/EOL, release verification and future subproject governance. It also added Dependency Review, a Dependabot alert gate with evidence-backed VEX exception validation, a CodeQL SAST policy gate and a manual controlled documentation-release workflow.

| Evidence | Result |
|---|---|
| PR #38 | [Merged](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/38) |
| Repository Security Analysis | [45347044175](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044175) — Gitleaks and zizmor passed |
| Dependency and Malware Alert Policy | [45347044223](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044223) — Dependabot alert gate passed; no unresolved general or malware Dependabot alerts returned |
| Dependency Review | [45346939758](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45346939758) — PR #38 dependency review passed |
| SAST Policy Gate | [45347044217](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044217) — passed |
| CodeQL Actions analysis | [45347044354](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044354) — passed |
| Repository Quality Assurance | [45347044201](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044201) — all five advisory checks passed |
| Repository Configuration Validation | [45347044245](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044245) — passed |
| Dependency Graph SBOM | [45347044206](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044206) — passed |
| OpenSSF Scorecard | [45347044243](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044243) — passed; score remains **6.9/10** |
| GitVerse mirror | [45347044193](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044193) — passed |

The Scorecard run now reports CI-Tests **10** (30/30 merged PRs checked by CI) and SAST **10** (30 commits checked). Branch-Protection remains **4** because independent approvals, CODEOWNERS review and related review controls are not enabled. The repository still has one maintainer; no artificial reviewer was added.

**Release scope:** the new workflow publishes only a versioned source/documentation/configuration snapshot, not compiled software. It creates a signed tag, archive, SHA-256 checksum manifest and detached GPG signature, release manifest and GitHub artifact attestations. The workflow is configured and validated by repository QA, but no public release has been published yet. First publication requires owner dispatch, a current review of full-SHA GitHub Actions dependencies, license review and a GitHub tag ruleset for `profile-docs-*`. PR #39 extends the Dependabot gate to query both general and malware alert classifications; this update is pending validation. GitHub's malware-alert limitation for SHA-pinned Actions remains a manual review item.

**Remaining platform actions:** the active main ruleset still requires only Gitleaks and zizmor. Add the successful PR check names `Dependency Review`, `Dependabot alert gate`, `Analyze (actions)` and `SAST policy gate` as required checks. The non-author approval control remains unmet until a genuine independent reviewer is available. Compiled-asset SBOM and multi-repository subproject controls remain not applicable.
