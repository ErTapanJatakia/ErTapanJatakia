# Access and Collaborator Governance

## 1. Sensitive resources

Sensitive resources include repository administration, branch/ruleset settings, Actions secrets and variables, signing keys, deployment credentials, GitVerse mirroring credentials, release publication permissions and security-alert configuration.

## 2. Current operating model

The repository is currently maintained by one owner. No independent maintainer or reviewer is represented as available. The owner retains administrative responsibility and reviews proposed access changes.

## 3. Collaborator vetting before elevated access

Before granting write, maintain, admin, Actions-secret or release-publication access to a collaborator, the repository owner must:

1. Verify the person's identity through an established professional or organizational channel.
2. Confirm the person's need for access and the exact duties to be performed.
3. Review relevant contribution history, security experience and references proportionate to the requested privilege.
4. Assign the lowest role that permits the required work; do not grant admin access for routine contribution.
5. Explain confidentiality, secret-handling, incident-reporting and acceptable-use expectations.
6. Record the approver, identity-verification method, requested role, rationale, date and review date in a private administrative record.
7. Reassess access at least annually and after role changes; remove access promptly when no longer required.

Do not publish personal vetting records, identity documents or confidential references in this repository.

## 4. Privilege escalation

Elevated permissions require an explicit owner decision. A pull request, successful CI run or prior contribution does not itself authorize an access escalation. Secret access must be separately reviewed under the [Secrets and Credentials Management Policy](SECRETS-AND-CREDENTIALS-POLICY.md).

## 5. Change approval

The repository requires pull requests, conversation resolution, linear history and the configured security checks. The current ruleset does **not** require a non-author approval because the repository has one maintainer and no eligible independent reviewer is currently available.

The intended policy is at least one approval by a human other than the change author before a second maintainer is allowed to merge changes. This control becomes operational only after a genuine independent reviewer is available and the ruleset is changed to require that approval. Self-approval, bot approval and fabricated reviewer identities are not acceptable substitutes.

## 6. Current platform configuration

The active ruleset is named **Protect main - Security & PR Governance**. It protects the default branch, blocks deletion and force-push, requires pull requests, resolves review conversations, permits squash merges only, and requires the Gitleaks and zizmor checks. Its current required approving review count is zero. This document does not claim otherwise.

## 7. Required status-check hardening

After the new workflows have completed successfully on a pull request, update the active main-branch ruleset to require these additional check names:

- `Dependency Review`
- `Dependabot alert gate`
- `Analyze (actions)`
- `SAST policy gate`

Retain the existing required checks:

- `Gitleaks secret detection`
- `zizmor GitHub Actions audit`

The current ruleset has not yet been changed to include the additional checks. A check appearing in Actions is not a merge gate until it is explicitly required by the ruleset. Do not add a check before it has produced a successful run on a pull request.

Review the ruleset whenever a maintainer is added or repository permissions change.
