# Documentation Release Verification

These instructions apply to releases named `profile-docs-YYYY.MM.DD.N`. They verify a source/documentation snapshot, not a compiled application.

## 1. Download the release

Download the following assets from the official GitHub Releases page:

- `<tag>.tar.gz` — source and documentation archive.
- `<tag>-SHA256SUMS` — SHA-256 manifest.
- `<tag>-SHA256SUMS.asc` — detached GPG signature.
- `<tag>-release-manifest.json` — release identity, source commit, asset names, hashes and support end date.

Use HTTPS and confirm the repository owner and repository name are exactly `ErTapanJatakia/ErTapanJatakia`.

## 2. Verify GitHub artifact provenance and workflow identity

Install a current GitHub CLI version with artifact-attestation support, then run:

```bash
gh attestation verify <tag>.tar.gz \
  --repo ErTapanJatakia/ErTapanJatakia \
  --signer-workflow github.com/ErTapanJatakia/ErTapanJatakia/.github/workflows/documentation-release.yml

gh attestation verify <tag>-SHA256SUMS \
  --repo ErTapanJatakia/ErTapanJatakia \
  --signer-workflow github.com/ErTapanJatakia/ErTapanJatakia/.github/workflows/documentation-release.yml

gh attestation verify <tag>-release-manifest.json \
  --repo ErTapanJatakia/ErTapanJatakia \
  --signer-workflow github.com/ErTapanJatakia/ErTapanJatakia/.github/workflows/documentation-release.yml
```

The expected signer is the GitHub Actions workflow in this repository, not an arbitrary account or workflow. Review the verified certificate identity, source repository, workflow path, commit and transparency-log evidence reported by GitHub CLI.

## 3. Verify the detached GPG signature and archive checksum

Obtain the repository owner's public GPG key from the owner's independently trusted publication channel. Do not trust a public key solely because it was downloaded alongside the release.

```bash
gpg --import owner-public-key.asc
gpg --verify <tag>-SHA256SUMS.asc <tag>-SHA256SUMS
sha256sum --check <tag>-SHA256SUMS
```

Before relying on the GPG result, compare the full primary-key fingerprint shown by `gpg --show-keys --with-fingerprint owner-public-key.asc` with the fingerprint independently confirmed by the repository owner.

A valid GPG signature proves that the checksum manifest was signed by the corresponding private key; it does not, by itself, independently establish the key owner's real-world identity.

## 4. Verify the manifest

Inspect the JSON manifest and confirm:
- The tag matches the release page.
- The source commit is the commit associated with the signed tag.
- The archive filename and SHA-256 digest match the checksum file.
- The release scope is `source-and-documentation-snapshot`.
- The manifest states that no compiled software assets are included.
- The support end date matches the release notes.

## 5. Verify the signed tag

If Git is installed:

```bash
git fetch --tags https://github.com/ErTapanJatakia/ErTapanJatakia.git
git verify-tag <tag>
git show --no-patch --format=fuller <tag>
```

Use the same independently confirmed GPG key fingerprint when validating the tag.

## 6. Failure handling

If any signature, attestation, tag, manifest or checksum check fails, do not use or redistribute the archive. Preserve the files and verification output, then report the issue through the repository's private vulnerability-reporting channel. Never work around a failed integrity check by trusting a different mirror or checksum source.
