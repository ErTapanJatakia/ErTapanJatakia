# Central GitHub to GitVerse Repository Controller

This controller manages a deliberately selected allowlist of repositories. It is
not an automatic account-wide mirror: a repository is covered only after it is
added to `config/repositories.json`, enabled, and its GitVerse destination exists.

## Registry operations

Edit `config/repositories.json` on the controller's default branch.

- Add: append an entry with the exact GitHub owner/repository, default branch,
  GitVerse owner/repository, and `"enabled": true`.
- Pause: set `"enabled": false`. The controller skips it on the next run.
- Resume: set `"enabled": true`.
- Remove: delete the entry. This stops future processing; it does not delete
  either remote repository or its history.

Use exact, case-sensitive repository paths. Do not add a destination until the
corresponding GitVerse repository has been created/imported and its SSH access
has been verified.

## Processing model

The scheduled/manual workflow checks each enabled repository's configured
branch. It imports the owner's personal GPG key, verifies the current HEAD,
and if HEAD is not signed by that key, creates a signed no-content attestation
commit whose parent is the current HEAD. It then pushes the fast-forward
history to GitHub and GitVerse without force-pushing.

This preserves the original commits and file tree. It does not rewrite or
silently replace existing commits. The GitVerse head becomes a personal-key
signed commit, while earlier imported commits retain their original signatures
(or lack of signatures).

## Required controller secrets

Already configured in the pilot controller repository:

- `GPG_PRIVATE_KEY`
- `GPG_PASSPHRASE`
- `GPG_SIGNING_KEY`
- `GITVERSE_SSH_PRIVATE_KEY`

Additional GitHub App secrets required before multi-repository operation:

- `REPOSITORY_APP_ID`
- `REPOSITORY_APP_PRIVATE_KEY`

Create a GitHub App owned by the account, grant **Contents: Read and write**
(and Metadata: Read-only), install it only on repositories you intend to manage,
and store its App ID and private key as the two Actions secrets above. The App
token is short-lived and scoped to the repositories selected in that installation.
Do not use a broad personal access token if a GitHub App can meet the need.

The App must be installed on the controller repository and every enabled source
repository. The controller's GitVerse SSH key must have write access to each
configured GitVerse destination.

## Guardrails

- Only entries explicitly marked enabled are processed.
- No force-pushes; divergence or permission failures stop that repository.
- Only the configured branch is processed.
- Signing credentials are used only by this trusted controller workflow.
- Never expose private keys or passphrases in logs, files, or pull-request jobs.
- Review registry changes before merging them to the controller's default branch.
- The workflow does not auto-create GitVerse repositories.
