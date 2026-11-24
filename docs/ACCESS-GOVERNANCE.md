# Access and Collaborator Governance

## 1. Sensitive resources

Sensitive resources include repository administration, branch/ruleset settings, Actions secrets and variables, signing keys, deployment credentials, GitVerse mirroring credentials, release publication permissions and security-alert configuration.

## 2. Current operating model

The repository is operated as a single-maintainer personal repository. The owner retains administrative responsibility. An independent maintainer or reviewer is not currently available; this limitation is recorded rather than represented as an approval control.

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

## 5. Change approval and sole-maintainer limitation

The repository requires pull requests, conversation resolution, linear history and the configured security checks. The current ruleset does **not** require a non-author approval because no eligible independent reviewer is currently available.

The intended policy is at least one approval by a human other than the change author when a genuine independent reviewer becomes available. Until then, the repository must retain the explicit single-maintainer limitation. Self-approval, bot approval and fabricated reviewer identities are not acceptable substitutes. The owner must reassess this limitation before adding another maintainer or granting elevated access.

## 6. Current platform configuration

The active ruleset is **Protect main - Security & PR Governance** (ID `27948154`), targets the default branch and is active. Its verified configuration:

- Requires pull requests and review-thread resolution.
- Requires these six status checks: `Gitleaks secret detection`, `zizmor GitHub Actions audit`, `Dependency Review`, `Dependabot alert gate`, `Analyze (actions)` and `SAST policy gate`.
- Requires linear history and permits squash merges only.
- Blocks branch deletion and non-fast-forward updates.
- Has no bypass actors.
- Requires zero approving reviews.

The connected GitHub permission check confirmed the repository owner's `admin` permission. The dated [access review record](access-reviews/2026-11-24.md) records the scope and the limits of the available evidence.

## 7. Pre-grant access decision record

Before any new collaborator is invited or any role is elevated, complete a private access decision record containing:

- GitHub account and verified identity channel.
- Current and requested permission level.
- Specific business/technical need and requested resources.
- Contribution/security review performed and its outcome.
- Secret and release access decision, separately from repository write access.
- Approver, decision date, rationale, expiry/review date and revocation trigger.

If the identity, need, least-privilege role, or review evidence is incomplete, do not grant the access. Never place sensitive vetting material in this public repository.

## 8. Review cadence and triggers

Review the collaborator/team access list and effective permissions at least annually and before each elevated-access grant. Repeat the review after a maintainer change, security incident, ownership change, ruleset change or permission/secret-scope change. Record the outcome without publishing personal data. A policy or owner statement is not a substitute for checking the live GitHub access list.
