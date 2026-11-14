# Publishing changes with your personal GPG signature

This repository uses a GitHub Actions workflow to publish changes with the
owner's personal GPG key to both GitHub and GitVerse.

## Procedure

1. Open the repository on GitHub and create a branch named
   `staging/<short-description>` from the latest `main` branch.
2. Make your README or other file changes on that staging branch. Do not
   commit these changes directly to `main`.
3. Open **Actions** and select **Signed Publish to GitHub and GitVerse**.
4. Select **Run workflow**, enter the exact staging branch name, and provide
   a concise commit message.
5. Start the workflow and wait for every step to complete successfully.
6. Check the resulting commit on GitHub and GitVerse. Both should contain the
   same commit SHA and the personal GPG signature should verify.

## Safety and behavior

- The workflow only accepts valid branch names beginning with `staging/`.
- The staging branch must descend from the current `main` branch.
- Changes are squash-published as one new commit on top of `main`.
  Intermediate staging commits are not copied to the published history.
- The workflow verifies the personal GPG signature before pushing.
- The exact same signed commit is pushed to GitHub and GitVerse.
- If a merge conflict, signature verification, or push fails, publication
  stops. Resolve the issue and run the workflow again; do not force-push.
- The staging branch remains available after publication and can be deleted
  manually once the result has been checked.

## Important

GitHub web-editor commits made directly on `main` are not automatically
re-signed by this workflow. Always prepare changes on a staging branch and
use the signed publishing workflow to publish them.
