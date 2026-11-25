# Static Application Security Testing Policy

## 1. Scope

GitHub CodeQL default setup analyzes the maintained Ruby validator scripts and GitHub Actions workflows in this repository. The Ruby analysis covers the command-line validation utilities; the Actions analysis covers workflow configuration. Neither is represented as application-runtime analysis.

zizmor separately audits GitHub Actions workflow security patterns. Gitleaks scans repository history for secrets. These tools have different purposes and must not be represented as interchangeable SAST engines.

## 2. Severity thresholds

| Finding | Required response |
|---|---|
| Critical | Block merge/release; investigate and remediate before publication |
| High | Block merge/release; investigate and remediate before publication |
| Medium | Triage within 7 calendar days; remediate within 30 calendar days; the SAST gate fails on any open Medium CodeQL alert older than 30 days |
| Low | Triage within 30 calendar days; remediate within 90 calendar days |
| Informational | Review and disposition during normal maintenance |

Known exploitation, exposure of credentials, unsafe privileged workflow behavior or a material attack path may require immediate containment regardless of scanner severity.

## 3. Enforcement

- CodeQL default setup must analyze both maintained languages (Ruby and GitHub Actions) on pull requests and pushes to the primary branch.
- The SAST policy gate waits for both `Analyze (ruby)` and `Analyze (actions)` checks on the same commit to complete successfully before it queries the repository-wide CodeQL alert inventory; this prevents the gate from racing ahead of either analysis.
- The gate blocks all open Critical/High CodeQL findings and any open Medium finding older than 30 days. It records the current severity counts in the workflow summary; Low findings remain subject to owner review and disposition.
- Gitleaks and zizmor remain required checks under the current branch ruleset.
- The CodeQL checks named `Analyze (ruby)` and `Analyze (actions)`, plus the SAST policy gate, should be added as required status checks in the main-branch ruleset after their successful check runs are visible.
- Until those checks are required by the ruleset, CodeQL analysis is configured but its merge-blocking enforcement is not claimed.
- Findings must be reviewed before release; Critical/High findings block release.
- Do not dismiss or suppress findings without a documented, evidence-based rationale.

## 4. False positives and non-exploitable findings

A finding may be dismissed or suppressed only after the owner records the affected path, rule, evidence, exploitability analysis, compensating controls and review date. If the issue is a vulnerability in a dependency that does not affect the project, use the VEX process rather than treating a generic scanner suppression as VEX.

## 5. Applicability changes

If additional executable source languages or an application runtime are introduced, the project must define the supported languages, configure suitable SAST coverage for those languages, and add language-specific test and analysis requirements before that code is considered production-ready.
