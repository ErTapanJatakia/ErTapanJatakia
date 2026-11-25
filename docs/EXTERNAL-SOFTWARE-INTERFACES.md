# External Software Interfaces

## 1. Scope

This inventory documents the external software interfaces used by the released repository automation and source/configuration assets. The repository does not expose a public application API, network service, SDK or runtime endpoint. The interfaces below belong to GitHub-hosted repository automation, documentation distribution and mirroring.

## 2. Interface inventory

| Interface | Direction and purpose | Data / authentication | Maintained integration points |
|---|---|---|---|
| GitHub Git repository interface | Contributors clone/fetch; authorized workflows fetch history and push tags or changes | Git objects, refs, commit metadata; HTTPS or SSH authentication | Repository remote; signed-publish, documentation-release and mirror workflows |
| GitHub pull-request and Actions event interface | GitHub invokes QA/security workflows for pull requests, pushes and explicit dispatches | Event payload, repository/ref/SHA metadata, workflow inputs; platform-provided event token | `.github/workflows/*.yml`; especially repository-quality-assurance and controlled release workflows |
| GitHub Actions `GITHUB_TOKEN` permissions interface | Jobs access only the GitHub scopes explicitly granted to the workflow/job | Scoped short-lived token; no token is passed to untrusted scripts beyond declared job permissions | Workflow-level `permissions` declarations and job-level overrides |
| GitHub REST API / GitHub CLI | Release workflow reads commit check-runs and publishes release metadata/assets; security workflows query supported alert and repository data | JSON, HTTP status, repository/commit/release identifiers; `GITHUB_TOKEN` or `GH_TOKEN` | `gh api`, `gh release`, `gh attestation` in workflow definitions |
| GitHub artifact attestation service | Release workflow records and verifies provenance for release files | Artifact digest, OIDC identity, signer workflow identity; `id-token: write` and `attestations: write` permissions | `actions/attest` and `gh attestation verify` in `documentation-release.yml` |
| GitHub Dependency Graph and Dependabot | GitHub supplies represented dependency inventory and proposes GitHub Actions updates | Repository dependency metadata and update pull requests; GitHub platform integration | `.github/dependabot.yml`, dependency-review and repository-dependency-sbom workflows |
| GitHub Security Advisories / Private Vulnerability Reporting | Researchers privately submit suspected vulnerabilities; owner triages and publishes confirmed advisories | Vulnerability description, affected scope, impact and remediation data; GitHub security permissions and notifications | `SECURITY.md` and GitHub repository security settings |
| GitHub Marketplace Actions | Workflows invoke external actions for checkout, linting, dependency review, attestation, artifact upload and security analysis | Action inputs/outputs and runner environment; each external Action is pinned to a full commit SHA | Workflow `uses:` declarations and `DEPENDENCY-LICENSE-REGISTER.md` |
| npm package registry via npm/npx | QA jobs obtain pinned Markdown lint and Prettier command-line packages | Package names and exact versions; public package registry HTTPS | `repository-quality-assurance.yml` and local QA instructions |
| actionlint release distribution | QA workflow downloads the versioned actionlint archive | HTTPS archive and a pinned SHA-256 digest checked before extraction | `repository-quality-assurance.yml` |
| VEX validator command-line interface | Reads the JSON exception register and referenced CycloneDX VEX documents; emits validation results and exits 0 on success or 1 on invalid/missing evidence | Local repository files; no network calls or credentials | `scripts/validate-vex.rb`; regression tests in `tests/vex_validator_test.rb` |
| DCO range validator command-line interface | Requires `BASE_SHA` and `HEAD_SHA`; enumerates the Git commit range and checks exact author/committer sign-off trailers; emits findings and exits 0 or 1 | Git history, environment variables and Git subprocess output; no network calls or credentials | `scripts/validate-dco.rb`; regression tests in `tests/dco_validator_test.rb` |
| Ruby interpreter, standard library Coverage and Minitest | Executes both validators' regression tests and measures branch execution for the maintained Ruby scripts | Local source/test files and runtime counters; no network calls or credentials | `scripts/check-branch-coverage.rb`, `tests/*.rb` |
| OpenPGP/GnuPG interface | Signs and verifies release tags and checksum files | OpenPGP key material, signature and digest; private key/passphrase supplied through protected Actions secrets | `.github/actions/setup-personal-gpg` and controlled release workflows |
| GitVerse SSH Git endpoint | Receives the protected main branch and tags as a secondary mirror | Git refs and objects over SSH; dedicated private key and pinned host key | `mirror-gitverse.yml` |
| Public external profile/resource links | Readers navigate from README badges and profile links to external websites | HTTPS URLs and ordinary browser navigation; no credentials are sent by repository automation | `README.md` and referenced badge/image URLs |

## 3. Network transport and certificate verification

- Maintained curl calls to GitHub APIs, GitHub release downloads and temporary SBOM downloads explicitly use HTTPS-only protocol selection and require TLS 1.2 or later.
- curl/libcurl peer and hostname certificate verification remains enabled; no insecure option is used.
- Git and GitHub CLI use their standard TLS-capable clients with certificate verification enabled by default. The project does not configure certificate verification bypasses.
- npm/npx uses the standard Node.js TLS client and default certificate verification; no strict-ssl=false setting is configured.
- The workflow configuration validator checks all maintained curl invocations for HTTPS/TLS 1.2 options and rejects known certificate-verification bypass settings.
- The TLS handshake and certificate verification occur before HTTP request headers, including authorization headers, are transmitted.
- GitVerse mirroring uses SSH with strict host-key verification, not TLS.

See [Network Transport and Certificate Verification Review](NETWORK-CRYPTOGRAPHY-REVIEW.md) for the dated review and verification scope.

## 4. Input/output and trust constraints

- Pull-request metadata and commit messages are treated as untrusted inputs until validated.
- Workflow jobs use workflow-level `permissions: {}` or a read-only `contents: read` baseline, with explicit job-level grants for privileged operations.
- Pull-request QA does not receive the GPG signing key, passphrase or GitVerse SSH key.
- Release attestations are scoped to the exact archive, manifest and checksum file digests.
- GitVerse receives a mirror of Git history; it is not authoritative and no force-push is used.
- Security reports are intended to be private. Public issues, PRs and README links are not vulnerability-reporting channels.
- The two Ruby command-line interfaces are local repository-maintenance tools, not public network APIs or end-user application interfaces.
- The VEX validator fails closed on malformed, expired, placeholder or mismatched exception evidence; the DCO validator fails closed when commit metadata or sign-off evidence is unavailable.
- No external application API is exposed by the repository itself.

## 4. Interface maintenance

Review this inventory whenever a workflow adds or removes an external Action, API, package registry, Git remote, credential, attestation provider or reporting channel. Update the dependency license register and threat model at the same time. The inventory is scoped to the repository's released automation/configuration assets and must not be represented as an application API specification.
