# Repository Automation Threat Model

**Assessment date:** 2026-11-24  
**Scope:** Public profile content, repository administration, GitHub Actions automation, GPG signing, dependency inventory, attestations, GitVerse mirroring and controlled documentation releases.  
**Out of scope:** An application runtime, network service, compiled product or end-user application; none is maintained or released by this repository.

The repository's released automation assets and their actors/actions are described in [Repository Automation Architecture](REPOSITORY-AUTOMATION-ARCHITECTURE.md); external interfaces are inventoried in [External Software Interfaces](EXTERNAL-SOFTWARE-INTERFACES.md); toolchain and reproducible validation/package instructions are in [Build and Test Instructions](BUILD-AND-TEST-INSTRUCTIONS.md).

## 1. Method and security objectives

This model identifies assets, actors, trust boundaries, abuse cases, existing safeguards and residual risks. It is reviewed when a workflow, credential, external action, distribution channel, maintainer, package ecosystem, executable artifact or release process changes, and after a security incident.

Security objectives are confidentiality of signing/mirroring credentials, integrity of repository history and release artifacts, authenticity of owner and release identity, and availability of public repository content.

## 2. Assets

- Integrity and availability of the public profile repository and its history.
- Confidentiality of GPG private key, passphrase, GitHub Actions secrets and mirroring credentials.
- Integrity of workflow definitions, rulesets, release tags, archives, checksums and attestations.
- Authenticity of owner identity and public professional claims.
- Integrity and completeness boundaries of dependency inventory and security-policy evidence.
- Repository administration, collaborator permissions, branch rulesets and release-publication permissions.

## 3. Actors and trust boundaries

| Actor / boundary | Trust assumption and boundary |
|---|---|
| Repository owner | Authorized administrator; account compromise remains in scope |
| Public contributor / fork PR | Untrusted input; must not receive signing or publication secrets |
| GitHub Actions runner | Ephemeral execution environment; only trusted jobs receive narrowly scoped secrets |
| Third-party GitHub Action | External code; pinned by full commit SHA and subject to license and workflow review |
| GitHub API / Dependabot | External source of alert and dependency metadata; API scope and known coverage limitations apply |
| GitHub OIDC / Sigstore | External identity and transparency infrastructure used for artifact attestations |
| GitVerse mirror | Separate distribution destination; credentials and commit identity must be protected |
| Public reader / downloader | May receive a modified, incomplete or impersonated release from an untrusted source |

## 4. Threat scenarios and safeguards

| Threat | Abuse case | Existing safeguards | Residual risk / required response |
|---|---|---|---|
| Account takeover | Attacker changes README, workflows, secrets or release settings | Protected main ruleset, seven required checks, PR-only changes, no bypass actors, owner-side account security | Account compromise can still affect administration; maintain MFA, recovery hygiene and credential rotation |
| Unauthorized privilege escalation | Unvetted contributor receives write/admin/secret/release access | Least-privilege vetting policy, access-decision record requirements and review triggers | Single-owner model; inspect live collaborator/team access before every grant and at least annually |
| Malicious contribution | PR adds a workflow that exfiltrates secrets | Fork PRs do not receive signing secrets; Gitleaks, zizmor, CodeQL Actions, least-privilege token and required checks | No independent reviewer is currently available; preserve this as a documented limitation, not a false approval claim |
| Workflow injection | Manual branch/version/message input alters shell behavior | Strict allow-list validation, Git ref/ancestry checks, quoting and bounded input | Re-test validation whenever inputs or shell boundaries change |
| Secret disclosure | GPG key/passphrase appears in logs or artifacts | Protected Actions secrets, trusted workflow scope, no secret echo and temporary-file cleanup | Runner compromise remains possible; rotate signing credentials after suspected exposure |
| Dependency compromise | Pinned action or updated dependency contains a vulnerability or malicious release | Full-SHA pinning, Dependabot, Dependency Review, malware alert gate, license register and SCA thresholds | Malware alert coverage for full-SHA Actions is limited by GitHub; perform owner-side dependency and malware review before release |
| Workflow compromise | Third-party action or permission escalation changes publication behavior | Pinned actions, empty workflow-level permissions, job-level grants, zizmor and CodeQL Actions analysis | Review new/updated action source, permissions and license before merge |
| Release substitution | Mirror or attacker serves a modified archive | Signed Git tag, detached GPG checksum signature, SHA-256 manifest, GitHub artifact attestations and verification instructions | GitHub Release object is not API-reported as immutable; validate signed tag and artifact hashes independently |
| Stale/incorrect VEX exception | Expired or mismatched exception hides a relevant alert | Fail-closed VEX validator, GHSA/package matching, evidence, reviewer/date, 90-day expiry and malware non-exception rule | Exploitability still requires human assessment; validator checks structure and linkage, not truth of evidence |
| Availability loss | Repository or release assets become unavailable | Git history, controlled mirror and retained release artifacts | No availability SLA or independent disaster-recovery service is promised |
| Profile integrity abuse | Unauthorized edits alter credentials or personal claims | PR workflow, protected main, owner review of professional claims and required security checks | Owner account remains the principal trust anchor |

## 5. Critical workflows and security gates

1. **Pull-request validation:** untrusted proposed changes are checked without access to signing secrets.
2. **Major-change QA:** security-sensitive workflow, policy, release, VEX and threat-model changes are identified; relevant YAML, actionlint, Markdown, link, formatting and VEX tests must pass. The check must be added to the active ruleset before it is treated as an enforced merge gate.
3. **Signed publication:** accepts only a validated staging branch descended from current `main`; signs a publication commit and opens a PR.
4. **Repository controller:** operates only on the explicitly configured repository registry and removes temporary signing material.
5. **Dependency alert gate:** validates VEX exceptions, blocks unresolved general alerts and blocks every malware alert.
6. **Dependency SBOM:** exports Dependency Graph data, validates SPDX structure, computes SHA-256 and attests the SBOM/checksum.
7. **Documentation release:** accepts a constrained version input on `main`, creates a signed tag, builds a source/documentation archive, signs its checksum manifest and generates GitHub artifact attestations.

## 6. Residual risk and scope limits

- The owner is the sole maintainer; independent human approval is not currently available.
- GitHub account compromise can affect repository settings and publication workflows.
- The Dependency Graph SBOM is not a complete filesystem, runner-image or binary inventory.
- GitHub malware-alert coverage does not fully cover SHA-pinned GitHub Actions; manual review remains necessary.
- The GitHub Release object is not platform-enforced immutable even though the signed tag is protected and verified.
- This model covers repository automation and documentation distribution, not application software, runtime infrastructure or a production service.

## 7. Review triggers and ownership

The repository owner maintains this model. Review it at least annually and whenever a trigger in Section 1 occurs. For each review, record the date, changed assets/workflows, newly introduced trust boundaries, changed safeguards and accepted residual risks. A material change must include updated threat scenarios and relevant automated tests in its pull request.
