# Repository Automation Architecture and System Design

## 1. Purpose and system boundary

This document describes the system design of the released repository assets: the profile/documentation source tree, Ruby policy validators, GitHub Actions automation, controlled documentation release process and GitVerse mirror. It is not an application architecture or a design for an end-user runtime.

The system's principal outcomes are:

1. Maintain and review public profile/documentation content.
2. Validate repository content, workflow configuration, DCO sign-offs and VEX data.
3. Detect secret, dependency, workflow and static-analysis policy violations.
4. Produce a signed and attested documentation/source-configuration snapshot when explicitly authorized.
5. Mirror the protected Git history to GitVerse.

## 2. Actors and responsibilities

| Actor | Type | Actions and permissions |
|---|---|---|
| Repository owner `@ErTapanJatakia` | Human / administrator | Maintains policies, reviews access, accepts changes, manages secrets, authorizes releases and handles security reports |
| Collaborator `@`| Human / contributor | Proposes changes within the exact repository role assigned by the owner; must not assume access to secrets, signing keys or release administration |
| External contributor / pull-request author | Human / untrusted input source until reviewed | Submits issues and pull requests; supplies commit metadata and DCO sign-offs; cannot access privileged publication secrets through pull-request QA |
| GitHub platform | External system / trust anchor | Stores Git history, enforces the main ruleset, runs Actions, hosts security advisories and release assets, provides Dependency Graph and artifact attestation services |
| GitHub Actions runner | Execution environment | Executes isolated workflow jobs with only the permissions and secrets granted to each job |
| Dependabot | Automated external actor | Proposes GitHub Actions dependency updates through pull requests |
| OpenSSF Scorecard, CodeQL, Gitleaks and zizmor | Security-analysis tools | Evaluate repository/workflow posture and report findings to the configured GitHub checks/security interfaces |
| GitVerse | External mirror service | Receives protected `main` history and tags over SSH; it is a mirror, not the authoritative source |
| Downstream reader / release consumer | External user | Reads the profile/documentation and verifies a published archive, checksums, GPG signature and attestations |
| Security researcher | External reporter | Submits a suspected vulnerability through the configured private reporting channel and coordinates disclosure |

The exact collaborator account identifier and effective role remain recorded in the owner's private access register; the public access policy does not infer them.

## 3. Components

| Component | Responsibility | Main interfaces |
|---|---|---|
| Git repository and `main` ruleset | Authoritative source, public history and merge enforcement | Git HTTPS/SSH, GitHub pull requests and required status checks |
| Repository Quality Assurance workflow | Markdown/YAML/link/workflow formatting checks, VEX regression tests and DCO checks | Pull-request and push events; Ruby, npm/npx, actionlint and lychee |
| Security-analysis workflows | Secret scanning, workflow security audit, CodeQL, dependency review and alert policy | GitHub Actions, GitHub Security, Dependabot and CodeQL |
| Ruby VEX validator | Validate VEX register structure, evidence metadata, advisory/component linkage and expiry | Local JSON files, Ruby standard library and process exit status |
| Ruby DCO validator | Verify every post-adoption pull-request commit contains an exact sign-off matching the commit author or committer | Git commit history, base/head SHA environment values and process exit status |
| Controlled documentation release workflow | Validate owner request, verify checks, package source, sign, attest and publish | Workflow-dispatch inputs, Git, GPG, GitHub API/CLI and artifact attestations |
| GitVerse mirror workflow | Push protected history and tags to the secondary mirror | Git transport over SSH and protected repository secret |
| Security policy and advisory process | Receive, triage, coordinate and publish confirmed vulnerability information | GitHub Private Vulnerability Reporting and GitHub Security Advisories |

## 4. Actions and workflow sequence

### Pull-request path

1. A contributor creates a pull request against the repository.
2. GitHub creates a pull-request event and exposes the proposed commit range.
3. Read-only QA and security jobs inspect the proposed content. Pull-request workflows do not receive GPG signing keys, GitVerse credentials or release secrets.
4. The VEX validator and regression tests execute; the DCO validator checks every commit in the pull-request range after DCO policy adoption.
5. The required `Major change validation` check fails if the automated test suite or DCO validation does not succeed. For major/security-sensitive paths, it also requires the relevant Markdown, YAML, link, actionlint, Prettier and VEX checks.
6. The owner reviews the proposed change and merges only after required checks pass. The active ruleset does not claim independent human approval because no independent reviewer is currently available.

### Documentation release path

1. The owner dispatches the controlled release workflow from protected `main` with the required version and review confirmations.
2. The workflow validates the input format, source ancestry, clean checkout and current security-check results.
3. The workflow configures the protected GPG signing key in an isolated runner and creates or verifies the signed tag.
4. Git archives the source/documentation tree. The workflow generates a release manifest and SHA-256 checksums.
5. GPG signs the checksum file. GitHub artifact attestations are generated and verified for the archive, manifest and checksum file.
6. The workflow publishes the release assets and removes temporary signing material.
7. Consumers verify the tag, signature, checksums and attestations before use.

### Main-branch mirror path

1. A push to protected `main` triggers the mirror workflow.
2. The runner authenticates to GitVerse using the dedicated SSH secret and a pinned host key.
3. The runner pushes `main` and tags without force-push. Unexpected divergence fails rather than overwriting the mirror.

### Vulnerability-report path

1. A researcher submits a report through GitHub Private Vulnerability Reporting when enabled.
2. The owner acknowledges and triages the report according to the response targets in `SECURITY.md`.
3. The owner investigates privately, coordinates a fix or mitigation and agrees a disclosure timeline.
4. For a confirmed vulnerability, the owner publishes a GitHub Security Advisory with affected scope and remediation details. No advisory is fabricated for an unconfirmed or non-affected report.

## 5. Trust boundaries and security assumptions

- Unreviewed pull-request content is untrusted and receives read-only workflow permissions only.
- Privileged signing and mirror credentials are restricted to trusted workflow paths and are not exposed to untrusted pull-request execution.
- GitHub is the authoritative VCS and release platform; GitVerse is a secondary mirror.
- The owner is the only current administrator and retains responsibility for security and release decisions.
- External Actions are pinned to full commit SHAs; Dependabot proposes updates and the license register records the reviewed exact commits.
- DCO sign-off is a legal assertion and is distinct from GPG commit/tag signing.
- The documentation release is not a compiled application, deployable service or application runtime.

## 6. Maintenance and change triggers

Update this architecture when a new workflow, actor, privileged credential, external service, release asset type, package ecosystem, repository role or trust boundary is introduced. Review it at least annually and after a material security incident or ownership change.

Related documents: [Build and Test Instructions](BUILD-AND-TEST-INSTRUCTIONS.md), [External Software Interfaces](EXTERNAL-SOFTWARE-INTERFACES.md), [Threat Model](THREAT-MODEL.md), [Access Governance](ACCESS-GOVERNANCE.md), [Repository QA Policy](REPOSITORY-QA-POLICY.md) and [Release Policy](RELEASE-POLICY.md).
