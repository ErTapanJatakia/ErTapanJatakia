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
| 2026-11-25 | Initial process definition | Full cross-document review still required; this row records establishment of the process, not completion of that audit | Conduct a complete evidence reconciliation and record its results in a follow-up change |

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
