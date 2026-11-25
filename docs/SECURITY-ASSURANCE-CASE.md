# Repository Security Assurance Case

**Assessment date:** 2026-11-25  
**Scope:** Public profile content, repository configuration, Ruby validation utilities, GitHub Actions automation, dependency inventory, signing, attestations, mirroring and controlled documentation releases.  
**Out of scope:** End-user application, compiled product, hosted application service or production runtime; none is currently produced or operated by this repository.

This document is a structured argument supported by the linked repository evidence. It is not an independent audit, penetration test, certification or guarantee that defects are absent.

## Top-level claim G0

The repository's maintained content and automation are operated with proportionate safeguards to protect the confidentiality of repository credentials, integrity and authenticity of changes/releases, and availability and accuracy of the public profile.

### Context and assumptions

- **C1 — Project boundary:** The repository produces profile/documentation content, configuration, Ruby validation utilities and automation; it does not produce an end-user application or compiled application binary.
- **C2 — Platform boundary:** GitHub supplies repository hosting, account authentication, Actions runners, Dependabot and CodeQL services. Platform controls are relied upon only within their documented scope.
- **A1 — Account security:** The owner and collaborator protect their accounts and recovery methods; platform account compromise remains a residual risk.
- **A2 — Evidence freshness:** Workflow runs, settings observations and access reviews are point-in-time evidence and must be refreshed after relevant changes.

## Claim decomposition

| Claim | Argument | Supporting evidence | Residual risk / treatment |
|---|---|---|---|
| G1 — Changes are authorized and traceable | Contributions enter through pull requests, DCO sign-off is validated for applicable commits, and branch rulesets require automated checks | CONTRIBUTING.md, ACCESS-GOVERNANCE.md, REPOSITORY-QA-POLICY.md, current GitHub ruleset and PR check records | One maintainer means independent human approval is not currently assured; do not claim independent review |
| G2 — Automation limits privilege and isolates secrets | Workflow permissions are restrictive; trusted signing/publication jobs are separated from untrusted PR execution; third-party Actions are SHA-pinned | REPOSITORY-AUTOMATION-ARCHITECTURE.md, workflow YAML, SECRETS-AND-CREDENTIALS-POLICY.md, zizmor and CodeQL Actions results | Runner/platform compromise and owner account compromise remain possible |
| G3 — Untrusted inputs are validated | Ruby validators reject malformed or expired VEX records and invalid DCO evidence; workflow inputs and refs are constrained | scripts/validate-vex.rb, scripts/validate-dco.rb, tests/, VEX-PROCESS.md, CI test reports | Tests cover defined behavior, not every possible defect; maintain regression tests and coverage |
| G4 — Dependencies and external actions are reviewed | Actions are pinned, Dependabot and Dependency Review are used, licenses are inventoried, and SBOM export/attestation evidence is retained | SCA-AND-DEPENDENCY-POLICY.md, DEPENDENCY-LICENSE-REGISTER.md, SBOM workflow and attestation records | GitHub Dependency Graph and malware alert coverage have known limits; manual review remains necessary |
| G5 — Published snapshots can be authenticated and checked for integrity | Controlled documentation releases use signed tags, detached signatures, checksums and verification instructions | RELEASE-POLICY.md, RELEASE-VERIFICATION.md, PERSONAL-GPG-SIGNING.md, signed tag and workflow records | No compiled software provenance is claimed; a signed release authenticates the signed material, not its correctness |
| G6 — Security issues can be reported and handled | A public security policy defines private reporting, triage, updates and coordinated disclosure | SECURITY.md, VEX-PROCESS.md | Repository-level private vulnerability reporting enablement and historical response performance must be verified independently; prospective policy targets are not historical evidence |
| G7 — Public content and evidence remain accurate | Roadmap, documentation review process, accessibility guidance and criterion registers define maintenance expectations | ROADMAP.md, DOCUMENTATION-MAINTENANCE.md, ACCESSIBILITY-REVIEW.md, Silver/Passing registers | Owner review is not independent assurance; dated records and issue/PR links should support completed reviews |

## Security requirements and control mapping

| Requirement | Control / evidence | Verification |
|---|---|---|
| Protect signing and mirror credentials | Protected GitHub secrets, trusted-job boundaries, no secret access to fork PRs | Review workflow permissions and secret references; inspect logs for accidental exposure |
| Preserve repository integrity | PR-only changes, rulesets, required checks, DCO validation | Inspect live ruleset and check-run results |
| Prevent unsafe workflow execution | Input allowlists, quoted parameters, argument-array subprocesses, zizmor and CodeQL | Review changed workflows/scripts and run automated analysis |
| Prevent false security exceptions | VEX schema, date, expiry, advisory, package and evidence validation | Run ruby scripts/validate-vex.rb and the positive/negative regression tests |
| Detect dependency risks | Dependabot, Dependency Review, CodeQL, pinned-action inventory and license review | Inspect latest successful runs and current dependency inventory |
| Authenticate releases | Signed tags, detached signature, checksum manifest and documented verification | Follow RELEASE-VERIFICATION.md using the published release assets |
| Handle vulnerability reports responsibly | Private reporting instructions, response targets and coordinated disclosure process | Verify platform reporting control and retain private case timestamps |
| Maintain continuity | Access/continuity policy and protected recovery material | Conduct and record an owner-unavailability exercise; currently a material gap until a second authorized person is capable |

## Verification plan

1. On each material workflow, permission, dependency, credential or release change, update the relevant threat-model section and this assurance case.
2. For every pull request, inspect applicable required checks and review any advisory failure; do not treat a green workflow badge as proof that all threats are mitigated.
3. At least annually, reconcile repository access, secrets, rulesets, dependency inventory, release verification and documentation claims against live platform state.
4. After a security incident or suspected credential exposure, preserve relevant logs, rotate affected credentials, assess release integrity and update the threat model.
5. Record review date, reviewer role, commit SHA, findings, remediation issue/PR and unresolved risks in the relevant review record.

## Explicit limitations

- No independent security reviewer is currently evidenced.
- No second maintainer is currently evidenced as capable of administering the repository and releasing within one week.
- Platform security settings and historical vulnerability-response performance require live or historical evidence; policy text alone is insufficient.
- No application runtime, compiled binary, application TLS stack, application cryptographic subsystem or memory-unsafe native component is in scope.
- This assurance case does not claim a Passing, Silver or Gold badge award.

## Review history

- 2026-11-25: Initial structured assurance case published, mapped to the current repository threat model and security policies.
