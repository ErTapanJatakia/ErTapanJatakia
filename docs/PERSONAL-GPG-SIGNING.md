# Personal GPG signing in GitHub Actions

This repository provides a reusable composite action at
`.github/actions/setup-personal-gpg`. It imports the owner's personal GPG
private key into an isolated, permission-restricted runner directory and
configures Git so subsequent commits in that job are signed with that key.

## Required repository Actions secrets

- `GPG_PRIVATE_KEY`: armored private key.
- `GPG_PASSPHRASE`: private-key passphrase.
- `GPG_SIGNING_KEY`: primary key ID or fingerprint.

Do not print these values, write them to artifacts, expose them to pull-request
code from forks, or pass them to third-party actions. Only invoke the action
from trusted workflows in this repository.

## Use it in a trusted commit-producing workflow

Check out the target branch first, then set up signing immediately before
creating the commit:

```yaml
permissions:
  contents: write

steps:
  - name: Check out target branch
    uses: actions/checkout@v4
    with:
      ref: main
      fetch-depth: 0

  - name: Configure personal GPG signing
    uses: ./.github/actions/setup-personal-gpg
    with:
      private-key: ${{ secrets.GPG_PRIVATE_KEY }}
      passphrase: ${{ secrets.GPG_PASSPHRASE }}
      signing-key: ${{ secrets.GPG_SIGNING_KEY }}
      git-name: ErTapanJatakia
      git-email: tapan_ditu_17.20@outlook.com

  # Add trusted steps that make the intended changes here.

  - name: Create and verify signed commit
    run: |
      set -euo pipefail
      git add --all
      if git diff --cached --quiet; then
        echo "No staged changes; no commit is needed."
        exit 0
      fi
      git commit -S -m "chore: apply automated update"
      git verify-commit HEAD

  - name: Push signed commit
    run: git push origin HEAD:refs/heads/main

  - name: Remove temporary signing material
    if: always()
    run: |
      rm -f "$RUNNER_TEMP/personal-gpg-passphrase" \
            "$RUNNER_TEMP/personal-gpg-private.asc" \
            "$RUNNER_TEMP/personal-gpg-wrapper"
      rm -rf "$HOME/.gnupg"
```

Adapt the change-generation and commit message to the specific workflow.
Do not blindly use `git add --all` if the job may produce unrelated files;
stage only the intended paths instead.

## Important boundaries

- This action configures signing; it does not create or push commits by itself.
- It must run in the same job, after checkout and before `git commit`.
- The workflow needs `contents: write` to push.
- GitVerse mirroring should receive the exact signed commit object. It should
  not amend, rebase, cherry-pick, or recreate that commit.
- GitHub web-editor and GitHub Contents API commits are not automatically
  signed with this personal key. A push-triggered workflow cannot add a
  signature to an already-created commit without replacing the commit.
- Never use this action in workflows triggered by untrusted fork pull requests
  or workflows that execute untrusted code while the signing secrets are
  available.
- The setup action stores temporary key material under the ephemeral runner's
  `RUNNER_TEMP`. Every caller must include an `if: always()` cleanup step,
  as shown above.
