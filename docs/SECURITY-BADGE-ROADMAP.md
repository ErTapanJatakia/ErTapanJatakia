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

**Current dashboard after P1 implementation and historical-scanner reconciliation:** 55 entries remain: 2 live workflow badges, 31 configured/published controls, 4 unverified/not-enforced badges, and 18 planned/unconfigured/unmeasured/not-applicable badges. Four P1 quality controls moved from planned to configured after successful advisory CI verification. The DevSkim and Bearer badges are now explicitly historical-only/not currently configured, moving those two entries out of the unverified group; this is a status correction, not a claim that their historical findings were all resolved.

## Priority roadmap

### P0 — Verify existing security posture before adding scanners

| Work item | Current badge(s) | Required evidence | Exit condition |
|---|---|---|---|
| GitHub Secret Scanning | Platform status unverified | Inspect repository security settings and secret-scanning alert inventory; confirm feature eligibility and enablement separately | Badge accurately says enabled, disabled, unavailable, or not eligible; alert status is reported separately |
| Dependabot vulnerability alerts | Platform status unverified | Inspect repository Dependabot security settings and alert inventory | Setting and open-alert count are recorded; no claim that alerts are clear without evidence |
| DevSkim | Historical scan only; not configured on current `main` | No recurring workflow is present. Treat earlier remediation run as historical evidence only; obtain a fresh, deliberately scoped scan only if a meaningful target and maintenance plan are established | Do not display as current coverage; preserve any historical alert disposition separately |
| Bearer | Historical scan only; not configured on current `main` | No recurring workflow is present. Treat earlier remediation run as historical evidence only; obtain a fresh, deliberately scoped scan only if a meaningful target and maintenance plan are established | Do not display as current coverage; preserve any historical alert disposition separately |
| Commit signing | Signing not enforced | Inspect repository rules and actual commit verification coverage | Keep badge transparent unless signing is enforced for the intended commit scope |
| Independent PR approval | Not required | Reconfirm active ruleset and reviewer availability | Keep the zero-approval policy explicit while no independent human reviewer is available; never manufacture approvals |

**P0 guardrail:** DevSkim and Bearer are historical-only, not current recurring controls. Bandit remains not applicable because maintained Python source is absent. The five currently reported Code Scanning alerts are Scorecard posture findings; retain them pending genuine posture changes or evidence-based disposition. Do not describe historical scanner findings as clean/current without fresh scan evidence.

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
| Trivy | Planned | Consider only if there are containers, filesystems, IaC or dependency targets it can meaningfully scan |
| Semgrep | Planned | Consider when there is supported source code or security-relevant configuration with useful rules |
| Bandit | Not applicable | Python-specific; do not enable unless maintained Python source is introduced |
| npm audit | Not applicable | Requires a relevant Node.js dependency manifest/lockfile; do not create a package solely to obtain a badge |
| OWASP ZAP | Not applicable | Requires an in-scope running web application; this repository does not currently provide one |

Do not add overlapping scanners merely to increase badge count. Select a tool only when it detects a meaningful class of issue that existing checks do not adequately cover.

### P3 — Supply-chain attestations, only when there is something to attest

| Work item | Current status | Applicability decision |
|---|---|---|
| SBOM | Not generated | Generate when the repository produces a meaningful software artifact or dependency inventory |
| SLSA provenance | Not implemented | Implement only for an actual build/release pipeline with verifiable provenance |
| Artifact attestation | Not implemented | Use for produced artifacts where identity and provenance verification provide value |
| Signed releases | Not applicable | Reassess if versioned software releases are introduced |
| CODEOWNERS | Not configured | Optional ownership clarity; does not create an independent reviewer or replace human review |

No artificial package, release, build artifact, or provenance workflow should be created to improve a score.

### P4 — Metrics and platform controls that need a real basis

| Work item | Current status | Applicability decision |
|---|---|---|
| Prettier | Not configured | Adopt only if consistent formatting is useful for maintained file types |
| EditorConfig | Not verified | Lightweight optional consistency improvement |
| SonarQube | Not configured | Reassess only if meaningful source code and an appropriate analysis scope exist |
| Maintainability metric | Not measured | Avoid a numeric claim without a valid codebase and repeatable metric |
| Test coverage | Not measured | No application test suite currently exists; configuration validation is not application coverage |
| Automated application tests | No application test suite | Keep this distinction explicit; existing workflow/configuration checks are real but are not app tests |

## Recommended execution sequence

1. **Close the P0 evidence gaps**: inspect native GitHub alert settings and alert inventories; retain transparent signing and approval statements. DevSkim/Bearer are historical-only, not current P0 scans.
2. **P1 checks are now implemented in advisory mode**: Markdown lint, YAML syntax validation, internal/offline link checking and actionlint all passed together in run 45309272770.
3. **Retain advisory status initially**: gather repeatable results before considering any new required status checks; do not modify branch rules as part of this PR.
4. **Close the P0 evidence gaps** before changing alert-status badges or claiming a clean platform alert inventory.
5. **Reassess P2–P4 when repository scope changes**: do not implement controls whose prerequisites do not exist.

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
| Personal GPG signing | [Verification run 45312695775](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45312695775) | Passed; isolated signed test commit was verified and temporary signing material was removed. |

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

### P0 evidence still outstanding

The connected GitHub integration can read the active ruleset and repository files, but it cannot access the repository's Code Scanning alert endpoint or the branch-protection endpoint (the latter returned HTTP 403). It also does not expose the repository's native Secret Scanning / Dependabot security-setting state. Therefore:

- The five-alert inventory above is recorded from the owner's latest GitHub UI report and the matching Scorecard SARIF evidence; it is not represented as a fresh API enumeration.
- Secret Scanning enablement and its alert inventory remain **unverified**.
- Dependabot vulnerability-alert enablement and its alert inventory remain **unverified**.
- Do not change the corresponding platform-status badges until those settings are inspected in GitHub's repository Security settings.

Historical DevSkim and Bearer remediation was tested in the earlier PR #272 post-merge pipeline (run #243, 7/7 jobs passed). Those scanners are not among the workflows currently present on `main`; their badges are now explicitly historical-only/not currently configured. Bandit remains not applicable because this repository does not maintain Python application source. The earlier pass is not current recurring coverage.

**Next checkpoint:** inspect native GitHub Secret Scanning and Dependabot vulnerability-alert settings, then reconcile the five Scorecard posture alerts without artificial dismissals. The connected integration still cannot enumerate the platform alert inventories or inspect these native settings; owner-provided settings evidence is required.
