# Controlled Documentation Release Policy

## 1. Release scope

This repository may publish a **documentation and source-configuration snapshot** of its public profile, policies, Markdown content, configuration and GitHub Actions definitions. Such a release is not an application, compiled binary, deployable service or software package.

The release workflow must state this limitation in the release title/notes and manifest. It must not imply that a software product, application test suite or binary build exists.

## 2. Versioning and assets

- Use immutable tags in the form `profile-docs-YYYY.MM.DD.N`.
- Each release asset filename must include the exact release tag.
- Publish a source/documentation archive, JSON release manifest, SHA-256 checksum file and detached GPG signature of the checksum file.
- Generate GitHub artifact attestations for the archive, manifest and checksum file.
- Never overwrite or reuse a published version identifier.
- A release must be created from the protected `main` branch by the controlled release workflow.
- Configure a GitHub tag ruleset for `profile-docs-*` that prevents tag updates and deletion. The workflow refuses to replace an existing tag, but that workflow check alone does not prevent an administrator from deleting a tag outside the workflow.

## 3. Release contents and change log

The release notes must identify the source commit, publication date, scope, material documentation/security changes, verification instructions and support end date. The manifest associates each distributed asset with the release identifier and its SHA-256 digest.

## 4. Support scope and duration

Each documentation snapshot receives **90 calendar days of security/integrity support** from its publication date. Support is limited to corrections for security-policy errors, integrity/verification defects, exposed secrets or materially misleading security claims. It does not include feature requests, application support, runtime support or a service-level commitment.

A newer release supersedes the previous snapshot. The previous snapshot's support ends on the earlier of its stated end date or the publication of a superseding release. The release manifest and notes must state the resulting end date.

## 5. End of security support

At the end of the stated support window, the release is end-of-security-support and will not receive further corrections. Users should move to the latest supported documentation snapshot. The repository's current `main` branch remains the primary source for current information; release snapshots are immutable historical distributions.

## 6. Pre-release security review

Before publishing:
1. Confirm the source commit is on `main`.
2. Review current required and advisory workflow results.
3. Review open Dependabot and malware alerts.
4. Review CodeQL findings and the latest security analysis.
5. Review license and third-party action changes.
6. Generate and validate the release manifest and checksums.
7. Verify the signed tag and detached signature.
8. Generate and verify GitHub artifact attestations.
9. Confirm no private data, credentials or unapproved personal-profile changes are included.

A Critical/High SCA or SAST finding, any unresolved malware alert, an exposed secret or a failed integrity check blocks publication.

## 7. No compiled assets

The current release workflow distributes a source/documentation archive only. It does not create compiled software assets. Therefore a compiled-asset SBOM requirement remains not applicable until compiled software is actually produced and distributed. The repository Dependency Graph SBOM must not be represented as a full binary SBOM.
