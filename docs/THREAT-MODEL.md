# Repository Automation Threat Model

**Scope:** Repository content, GitHub Actions automation, GPG signing, dependency inventory, attestation and controlled documentation release.  
**Out of scope:** An application runtime, network service, compiled product or end-user application; none is maintained in this repository.

## 1. Assets

- Integrity and availability of the public profile repository and its history.
- Confidentiality of GPG private key, passphrase, GitHub Actions secrets and mirroring credentials.
- Integrity of workflow definitions, release tags, release archives, checksums and attestations.
- Authenticity of owner identity and public professional claims.
- Integrity of dependency inventory and security-policy evidence.
- Repository administration, branch rulesets and release-publication permissions.

## 2. Actors and trust boundaries

| Actor / boundary | Trust assumption |
|---|---|
| Repository owner | Authorized administrator; account compromise remains in scope |
| Public contributor / fork PR | Untrusted until reviewed and merged |
| GitHub Actions runner | Ephemeral execution environment; secrets only in trusted jobs |
| Third-party GitHub Action | External code; pinned by full commit SHA and subject to workflow audit |
| GitHub OIDC / Sigstore | External identity and transparency infrastructure used for artifact attestations |
| GitVerse mirror | Separate distribution destination; credentials and commit identity must be protected |
| Public reader / downloader | May receive a modified, incomplete or impersonated release from an untrusted source |

## 3. Attack scenarios and controls

| Threat | Example | Existing / planned mitigation |
|---|---|---|
| Account takeover | Attacker changes README, workflows or secrets | MFA for sensitive repository actions, branch ruleset, pull-request-only changes, audit and credential rotation |
| Malicious contribution | PR adds a workflow that exfiltrates secrets | Fork PRs receive no signing secrets; review before merge; Gitleaks and zizmor; least-privilege token |
| Workflow injection | Manual branch/message input alters shell behavior | Strict allow-list validation, Git ref validation, quoting and bounded commit message |
| Secret disclosure | GPG key/passphrase appears in logs or artifacts | Protected Actions secrets, trusted workflow scope, no secret echo, temporary-file cleanup |
| Dependency compromise | A pinned action or updated dependency has a known vulnerability or malicious release | Full-SHA pinning, Dependabot, Dependency Review, malware alert gate, SCA thresholds |
| Workflow compromise | Third-party action or permission escalation modifies publication | Pinned actions, empty workflow-level permissions, job-level grants, zizmor and CodeQL Actions analysis |
| Release substitution | A mirror or attacker serves a modified archive | Signed tag, detached GPG checksum signature, SHA-256 manifest, GitHub artifact attestation and verification instructions |
| Availability loss | Repository or release assets become unavailable | Git history, controlled mirror and retained release artifacts; no availability SLA is promised |
| Profile integrity abuse | Unauthorized edits alter credentials or personal claims | Explicit owner approval for personal/professional claims and focused pull-request review |

## 4. Critical workflows

1. **Pull-request validation:** untrusted proposed changes are checked without access to signing secrets.
2. **Signed publication:** accepts only a validated staging branch descended from current `main`; signs a publication commit and opens a PR.
3. **Repository controller:** operates only on the explicitly configured repository registry and removes temporary signing material.
4. **Dependency SBOM:** exports Dependency Graph data, validates SPDX structure, computes SHA-256 and attests the SBOM/checksum.
5. **Documentation release:** accepts a constrained version input on `main`, creates a signed tag, builds a source/documentation archive, signs its checksum manifest and generates GitHub artifact attestations.

## 5. Residual risks

- The owner is the sole maintainer; independent review is not currently available.
- GitHub account compromise can affect repository settings and publication workflows.
- The Dependency Graph SBOM is not a complete filesystem, runner-image or binary inventory.
- GPG identity verification depends on the expected public-key fingerprint being obtained through a trusted channel; GitHub artifact attestations independently identify the publishing workflow.
- No application runtime, compiled release asset or production service is covered by this threat model.

## 6. Review triggers

Review this model after a new workflow, secret, external action, distribution channel, maintainer, package ecosystem, executable artifact or release process is introduced, and after any security incident.
