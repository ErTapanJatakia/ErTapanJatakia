# Access and Collaborator Governance

The public decision-making and contribution-acceptance model is defined in [PROJECT-GOVERNANCE.md](PROJECT-GOVERNANCE.md). This document complements that model with access, privilege, vetting and continuity controls.

## 1. Sensitive resources

Sensitive resources include repository administration, branch/ruleset settings, Actions secrets and variables, signing keys, deployment credentials, GitVerse mirroring credentials, release publication permissions and security-alert configuration.

## 2. Current operating model

The repository is operated as a personal repository with one owner and one recently added collaborator confirmed by the owner. The owner retains administrative responsibility. An independent maintainer or reviewer is not currently available; this limitation is recorded rather than represented as an approval control.

## 3. Project members with sensitive-resource access and roles

The following is the public-safe member/role inventory. It intentionally excludes personal vetting details and does not infer permissions that have not been recorded.

| Member/account | Sensitive-resource access | Role and responsibilities | Evidence / limitation |
|---|---|---|---|
| `@ErTapanJatakia` — repository owner | Repository administration; rulesets; repository security configuration; Actions secrets/variables and release administration as owner | Project owner and sole maintainer; approves policy, access, security, dependency and release decisions; maintains repository controls | GitHub repository metadata confirms the owner has `admin` permission |
| Additional collaborator — account identifier withheld from this public record | Effective repository permission: `read` (GitHub collaborator-permission lookup verified 2026-11-25). Read-only access to repository content and public workflow/PR information; no repository write, merge, ruleset administration, Actions-secret administration, signing-key or release-publication permission is granted by this role | Read-only collaborator; may inspect/clone the repository, review public changes, report defects and provide feedback. Any code contribution must be proposed through an authorized pull request; no merge or approval authority is implied | Owner confirms one collaborator and MFA on both accounts; the effective `read` permission is independently verified by GitHub. No separate privileged secret/release grant is recorded. See the supplemental [2026-11-25 role verification](access-reviews/2026-11-24.md#supplemental-role-verification-2026-11-25) |

The owner must maintain the exact account identifier, team/inherited access and separately granted secret/release permissions in a private administrative access register. Update the public-safe table when any role or access boundary changes; the current effective repository role is read-only.

## 4. Collaborator vetting before elevated access

Before granting write, maintain, admin, Actions-secret or release-publication access to a collaborator, the repository owner must:

1. Verify the person's identity through an established professional or organizational channel.
2. Confirm the person's need for access and the exact duties to be performed.
3. Review relevant contribution history, security experience and references proportionate to the requested privilege.
4. Confirm that the account has multi-factor authentication (2FA) enabled before granting any write, maintain, admin, private-vulnerability-report or other sensitive-data access. Do not grant or retain such access if the person cannot demonstrate 2FA enrollment.
5. Prefer phishing-resistant cryptographic factors such as passkeys or FIDO2/WebAuthn security keys. TOTP authenticator applications are preferable to SMS; SMS-only 2FA is not accepted for privileged access where a stronger factor is available.
6. Assign the lowest role that permits the required work; do not grant admin access for routine contribution.
7. Explain confidentiality, secret-handling, incident-reporting and acceptable-use expectations.
8. Record the approver, identity-verification method, requested role, 2FA confirmation, rationale, date and review date in a private administrative record.
9. Reassess access at least annually and after role changes; remove access promptly when no longer required.

Do not publish personal vetting records, identity documents or confidential references in this repository.

## 5. Privilege escalation

Elevated permissions require an explicit owner decision. A pull request, successful CI run or prior contribution does not itself authorize an access escalation. Secret access must be separately reviewed under the [Secrets and Credentials Management Policy](SECRETS-AND-CREDENTIALS-POLICY.md).

## 6. Change approval and sole-maintainer limitation

The repository requires pull requests, conversation resolution, linear history and the configured security checks. The current ruleset does **not** require a non-author approval because no eligible independent reviewer is currently available. Likewise, the personal-repository configuration does not provide an organization-wide 2FA enforcement control. The access policy therefore requires 2FA as a precondition for any future write or sensitive-data grant, but this policy is not misrepresented as a platform-enforced 2FA requirement.

The intended policy is at least one approval by a human other than the change author when a genuine independent reviewer becomes available. Until then, the repository must retain the explicit single-maintainer limitation. Self-approval, bot approval and fabricated reviewer identities are not acceptable substitutes. The owner must reassess this limitation before adding another maintainer or granting elevated access.

## 7. Current platform configuration

The active ruleset is **Protect main - Security & PR Governance** (ID `27948154`), targets the default branch and is active. Its verified configuration:

- Requires pull requests and review-thread resolution.
- Requires seven status checks: `Gitleaks secret detection`, `zizmor GitHub Actions audit`, `Dependency Review`, `Dependabot alert gate`, `Analyze (actions)`, `SAST policy gate` and `Major change validation`.
- Requires linear history and permits squash merges only.
- Blocks branch deletion and non-fast-forward updates.
- Has no bypass actors.
- Requires zero approving reviews.

The connected GitHub permission check confirmed the repository owner's `admin` permission. The dated [access review record](access-reviews/2026-11-24.md) records the scope and the limits of the available evidence.

## 8. Pre-grant access decision record

Before any new collaborator is invited or any role is elevated, complete a private access decision record containing:

- GitHub account and verified identity channel.
- Current and requested permission level.
- Specific business/technical need and requested resources.
- Contribution/security review performed and its outcome.
- Secret and release access decision, separately from repository write access.
- Approver, decision date, rationale, expiry/review date and revocation trigger.

If the identity, need, least-privilege role, or review evidence is incomplete, do not grant the access. Never place sensitive vetting material in this public repository.

## 9. Review cadence and triggers

Review the collaborator/team access list and effective permissions at least annually and before each elevated-access grant. Repeat the review after a maintainer change, security incident, ownership change, ruleset change or permission/secret-scope change. Record the outcome without publishing personal data. A policy or owner statement is not a substitute for checking the live GitHub access list.
