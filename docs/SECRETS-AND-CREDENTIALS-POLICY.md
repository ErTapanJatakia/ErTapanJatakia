# Secrets and Credentials Management Policy

**Owner:** Repository owner  
**Applies to:** GitHub repository settings, GitHub Actions, GitVerse mirroring, signing operations and approved external integrations  
**Review cadence:** At least annually and after a security incident or material workflow change

## 1. Approved storage

- Store automation credentials only in GitHub Actions repository or environment secrets, or in an approved provider's equivalent secret store.
- Store public, non-sensitive configuration in version control.
- Never commit private keys, passphrases, access tokens, API keys, recovery codes, session cookies or other authentication material.
- Do not place secrets in workflow inputs, command-line arguments, job summaries, logs, artifacts, release assets, issue comments or pull-request discussions.
- Do not use personal credentials where a narrowly scoped GitHub Actions token or short-lived identity token is sufficient.

## 2. Access

- Grant secret access only to trusted workflows running from protected branches or explicitly approved release events.
- Never expose signing secrets to fork pull requests, unreviewed code, arbitrary workflow dispatch inputs or third-party actions that do not require them.
- Use job-level least-privilege token permissions. Keep workflow-level permissions empty unless a documented requirement exists.
- Restrict repository administration and secret-management access to the repository owner unless a separately reviewed maintainer role is approved.

## 3. Rotation and revocation

- Rotate a credential immediately after suspected disclosure, unauthorized access, personnel/role changes affecting access, or provider notification.
- Rotate long-lived credentials at least every 12 months where the provider and operational model support rotation without service interruption.
- Prefer short-lived, automatically issued credentials and OIDC over static tokens.
- Revoke obsolete credentials and remove unused secrets promptly.
- After rotation, verify the dependent workflow using a controlled run; do not print secret values as evidence.

## 4. Incident handling

1. Stop the affected workflow or integration if continued use could cause harm.
2. Revoke or rotate the exposed credential at its issuing provider.
3. Inspect relevant audit logs and workflow runs.
4. Remove the secret from current files and, where necessary, coordinate history remediation.
5. Record the incident, scope, containment, rotation and validation without reproducing the secret.
6. Report suspected repository vulnerabilities through [private vulnerability reporting](../SECURITY.md).

## 5. Evidence and exceptions

The repository's GPG signing workflow uses the protected secrets `GPG_PRIVATE_KEY`, `GPG_PASSPHRASE` and `GPG_SIGNING_KEY`. Their values must remain confidential. Workflow permissions and secret use are documented in [Personal GPG Signing](PERSONAL-GPG-SIGNING.md) and [Signed Publish Workflow](SIGNED-PUBLISH-WORKFLOW.md).

Any exception must identify the credential, business/technical reason, compensating controls, owner and expiry date. An exception must never contain the credential value itself.

## 6. Review

The repository owner reviews this policy annually and after material changes to repository automation, credential providers or access roles.
