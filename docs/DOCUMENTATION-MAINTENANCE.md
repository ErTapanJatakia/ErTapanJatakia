# Documentation Maintenance and Currency

**Owner:** Repository owner  
**Review cadence:** Quarterly, and after every material change to repository behavior, security controls, release process, dependency scope or project governance.

## Purpose

The project MUST make a reasonable, traceable effort to keep documentation consistent with the current repository results and maintained automation. Known material inaccuracies MUST be corrected or tracked for correction.

## Authoritative sources

| Subject | Authoritative source |
|---|---|
| Public profile claims and external links | Owner-approved profile source and current README |
| Repository access and roles | Live GitHub repository permissions, rulesets and dated access review |
| Workflow behavior | Current .github/workflows/ files and their successful run records |
| Ruby validator behavior | scripts/, tests/ and current CI results |
| Dependency scope and licenses | Current workflow/action inventory, Dependabot/Dependency Review and DEPENDENCY-LICENSE-REGISTER.md |
| Security reporting and release verification | SECURITY.md, release workflow, signed tag, checksums and verification instructions |
| Project scope and planned work | ROADMAP.md |
| OpenSSF internal assessments | Relevant Passing, Silver and Gold implementation registers, checked against official English criteria |

## Quarterly review procedure

1. Compare each documentation claim about a workflow, check, permission, dependency, credential, release or repository setting with the current implementation or live platform evidence.
2. Check that commands, tool versions, file paths, workflow names and links still exist.
3. Check that time-bounded claims include an observation date and are not presented as timeless facts.
4. Check that planned commitments are clearly distinguished from completed controls.
5. Check that the Passing, Silver and Gold registers agree on shared criteria and current project scope.
6. Fix known defects in the same pull request where practical; otherwise create a tracked issue with an owner and target date.
7. Record the review date, commit SHA, reviewed areas, findings and remediation links below.

## Review record

| Date | Commit / scope | Findings | Remediation |
|---|---|---|---|
| 2026-11-25 | Full repository documentation reconciliation; 40 Markdown files, current workflow definitions, access/security evidence and Passing/Silver/Gold/OSPS assessment cross-links | Corrected inconsistent private-reporting enablement statements; reconciled the collaborator's read-only role; updated DCO enforcement, Ruby utility inventory/coverage, network TLS, developer setup, accessibility and regression-test evidence across affected documents | The 2026-11-25 reconciliation includes the tested network transport validator, five-utility coverage gate (72 tests/165 assertions), owner-confirmed private reporting, verified read-only collaborator role, and current Silver tally. PR #68 QA run 45561468875 and configuration run 45561468743 provide implementation evidence; re-audit after material repository changes |
| 2026-11-26 | Gold remediation PR #70 review snapshot at `70927c1548bcdf408cbb3e32b88e3b7aff0cfdde`; Gold/Silver/Baseline registers, CONTRIBUTING, access governance, build/QA guidance, threat model, Ruby utilities and regression tests | Added per-file copyright/SPDX notices with regression enforcement; reconciled DCO policy versus disabled CI enforcement; documented small contributor tasks and code-review standards; added 2FA precondition for future privileged access; raised statement-coverage gate to 90%; hardened VEX structure validation; prepared a dated AI-assisted security review pending owner validation | PR #70 contains the implementation and assessment updates. QA run 45678467412 passed after the VEX structural-guard changes with 87 tests, 268 assertions, 93.39% statement coverage and 91.60% branch coverage. The 90% statement and 80% branch gates both passed. The Gold assessment retains independent-review, contributor-diversity, operational bus-factor, platform-enforced 2FA, site-header and owner-review evidence gaps |

## Review triggers

Review affected documents immediately after a material change to:

- Main-branch rulesets, required checks, repository roles or collaborators.
- GitHub Actions permissions, triggers, pinned action revisions or secrets.
- Vulnerability reporting channels, response targets or actual vulnerability cases.
- Release signing, artifact generation, mirror behavior or verification commands.
- Ruby validator behavior, test suite, supported Ruby versions or coverage measurement.
- Project scope, supported outputs or roadmap commitments.

## Evidence discipline

Do not mark a criterion Met solely because a policy or checklist has been written. Record the implementation, current observation or successful test that demonstrates the criterion. Owner-attested observations must be identified as such and dated. Independent review must not be implied unless a person other than the author actually performed it.
