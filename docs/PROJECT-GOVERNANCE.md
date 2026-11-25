# Project Governance

**Effective date:** 2026-11-25  
**Project type:** Individually maintained professional profile and repository automation project.

## Governance model

The repository is owner-governed. The repository owner is accountable for project scope, public profile accuracy, acceptance of contributions, repository administration, security policy, access grants, release authorization and resolution of project-level disputes. This is a disclosed single-owner governance model, not a committee or foundation governance structure.

## Decision process

1. **Routine corrections:** spelling, formatting, broken links and non-substantive documentation improvements may be proposed directly through pull requests.
2. **Substantive changes:** changes to profile claims, project scope, roadmap, governance, external services, dependencies, security controls or release behavior should first be discussed in a GitHub issue or pull request description.
3. **Security-sensitive changes:** changes to workflow permissions, credentials, signing, dependency policy, vulnerability reporting, release publication or access controls require explicit security rationale and relevant automated validation.
4. **Acceptance:** changes are accepted through pull requests after required checks pass. The owner makes the final acceptance decision. A contributor must not approve their own change on behalf of the owner.
5. **Disagreement:** unresolved technical or policy disagreements are recorded in the issue/PR discussion. The owner records the final decision and rationale; contributors may request reconsideration with new evidence.
6. **Emergency action:** the owner may take immediate containment action for suspected compromise or active exposure, then document the action, scope, rationale and follow-up review in a tracked record.

## Roles and responsibilities

| Role | Responsibilities | Authority boundary |
|---|---|---|
| Repository owner / project lead | Scope, roadmap, final decisions, repository administration, access, secrets, security response, release authorization and policy maintenance | Holds owner/admin authority; remains the sole evidenced maintainer until a second maintainer is formally designated |
| Collaborator (effective repository role: read) | Read-only inspection/clone, review public changes, report defects and provide feedback; may propose code changes through an authorized pull request | GitHub collaborator-permission lookup verified `read` on 2026-11-25. No repository write, merge, ruleset administration, Actions-secret, signing-key or release-publication authority is implied; reassess before any role change |
| External contributor | Propose focused changes, report defects, follow contribution/security requirements and provide tests/evidence | No repository write, administrative, secret, signing or release authority is implied |
| Automated CI services | Execute configured validation, analysis and policy checks and publish machine-readable results | Automation does not exercise project governance judgment or substitute for independent human review |

## Transparency and records

- Public project policies and the roadmap are maintained in this repository.
- Material decisions should be traceable to an issue, pull request or dated policy record.
- Private access details, identity-vetting records, recovery materials and credentials must not be published.
- The project must not claim independent review, committee oversight or a second maintainer unless those arrangements actually exist.
- Governance changes must update this document and ACCESS-GOVERNANCE.md.

## Review

Review this model annually and whenever ownership, maintainer count, collaborator responsibilities, repository permissions or project scope changes.

## Review history

- 2026-11-25: Initial owner-governed decision and responsibility model published.
