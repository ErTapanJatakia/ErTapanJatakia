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

**Current dashboard after P1 implementation:** 55 entries remain: 2 live workflow badges, 31 configured/published controls, 6 unverified/not-enforced badges, and 16 planned/unconfigured/unmeasured/not-applicable badges. Four P1 quality controls moved from planned to configured after successful advisory CI verification.

## Priority roadmap

### P0 — Verify existing security posture before adding scanners

| Work item | Current badge(s) | Required evidence | Exit condition |
|---|---|---|---|
| GitHub Secret Scanning | Platform status unverified | Inspect repository security settings and secret-scanning alert inventory; confirm feature eligibility and enablement separately | Badge accurately says enabled, disabled, unavailable, or not eligible; alert status is reported separately |
| Dependabot vulnerability alerts | Platform status unverified | Inspect repository Dependabot security settings and alert inventory | Setting and open-alert count are recorded; no claim that alerts are clear without evidence |
| DevSkim | Status to verify | Re-run or inspect the latest authoritative scan and its SARIF/alert inventory | Findings are classified as open, fixed, dismissed with rationale, or not applicable |
| Bearer | Status to verify | Re-run or inspect the latest authoritative scan and its SARIF/alert inventory | Findings are classified with evidence; do not dismiss unresolved findings merely to improve a badge |
| Commit signing | Signing not enforced | Inspect repository rules and actual commit verification coverage | Keep badge transparent unless signing is enforced for the intended commit scope |
| Independent PR approval | Not required | Reconfirm active ruleset and reviewer availability | Keep the zero-approval policy explicit while no independent human reviewer is available; never manufacture approvals |

**P0 guardrail:** prior alert inventories mentioned DevSkim, Bearer, Bandit and Scorecard findings. Their current remediation state is not established by this badge inventory. Reconcile the actual alert records before describing them as fixed or clean.

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

1. **Close the P0 evidence gaps**: inspect native GitHub alert settings and alert inventories; reconcile DevSkim/Bearer findings; retain transparent signing and approval statements.
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

**Next checkpoint:** complete P0 evidence verification before changing platform-alert badges or claiming an improved security posture.
