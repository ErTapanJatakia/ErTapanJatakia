# Build, Validation and Release Instructions

## 1. Project outputs and build scope

This repository contains a public profile README, documentation and policy records, GitHub Actions workflow definitions, and small Ruby validation utilities. It does not contain an application runtime, compiled binary, deployable service, or package intended for installation by end users.

There is therefore **no compilation or application build step**. The maintained Ruby utilities are interpreted directly by Ruby. The controlled release process creates a source-and-documentation archive using Git; it does not compile software or resolve application packages.

These instructions describe how to reproduce the repository's validation and documentation-release preparation without implying that an application binary exists.

## 2. Required toolchain

| Tool | Purpose | Version / dependency handling |
|---|---|---|
| Git | Clone, inspect history, validate commits and create source archives | Current supported Git release |
| Ruby | Run repository validators and regression tests | Ruby 3.x; validator scripts use the Ruby standard library |
| Minitest | Positive/negative tests for the Ruby validators | Ruby's Minitest gem; no application gem bundle or Gemfile is maintained |
| Bash, jq, coreutils, gzip, tar | Workflow validation, JSON processing, checksums and source archive packaging | Provided by the GitHub-hosted Ubuntu runner |
| Node.js and npm/npx | Run Markdown lint and Prettier checks | Tool versions are explicitly pinned in workflow commands; no application package manifest is used |
| actionlint | Static analysis of GitHub Actions workflow syntax | 1.7.12; downloaded over HTTPS and verified against a pinned SHA-256 digest in CI |
| lychee | Offline Markdown link and anchor validation | 0.24.2 in CI |
| GnuPG | Sign and verify the controlled documentation release | Runner package; private key and passphrase are supplied only through protected GitHub Actions secrets |
| GitHub CLI (`gh`) | Query checks, verify artifact attestations and publish the controlled release | GitHub-hosted runner installation; authenticated with the workflow token |

The CI workflows are the authoritative source for exact Action commit SHAs, command versions, checksums and permission scopes. External GitHub Actions are pinned to full commit SHAs and updated through the GitHub Actions ecosystem in Dependabot.

## 3. Clone and validate the repository

```bash
git clone https://github.com/ErTapanJatakia/ErTapanJatakia.git
cd ErTapanJatakia
```

Run the Ruby validators and regression suites:

```bash
ruby scripts/validate-vex.rb
ruby tests/vex_validator_test.rb
ruby tests/dco_validator_test.rb
```

For a pull request, the DCO range validator is invoked by CI with the exact base and head commit SHAs:

```bash
BASE_SHA=<base-commit-sha> HEAD_SHA=<head-commit-sha> ruby scripts/validate-dco.rb
```

Every commit added after DCO policy adoption must contain a `Signed-off-by` trailer matching its author name and email. Create commits with:

```bash
git commit -s -m "type: describe the change"
```

Run the repository content/configuration checks using the versions and options in `.github/workflows/repository-quality-assurance.yml`:

- Markdown lint: `npx --yes markdownlint-cli2@0.24.0 '**/*.md' '!README.md' '!LICENSE'`
- YAML parsing: Ruby's YAML standard library against the maintained `.github/**/*.yml` and `.github/**/*.yaml` files.
- Markdown links: `lychee --offline --verbose --no-progress './**/*.md'`
- Workflow syntax: actionlint 1.7.12 with the documented narrow compatibility exclusions.
- Formatting: `npx --yes prettier@3.6.2 --check ".github/workflows/*.yml" ".github/dependabot.yml" ".prettierrc.json"`

The CI workflow is authoritative. A local tool version mismatch must be resolved by using the versions documented in the workflow, not by weakening CI.

## 4. Dependency model

There is no application dependency manifest or lockfile because the repository does not package an application. The maintained external dependency surface is primarily GitHub Actions:

- Workflow Actions are declared with GitHub's native `uses:` mechanism and pinned to full commit SHAs.
- Dependabot uses the standard `github-actions` package ecosystem and proposes updates weekly.
- Exact Action license evidence is recorded in [DEPENDENCY-LICENSE-REGISTER.md](DEPENDENCY-LICENSE-REGISTER.md).
- The workflow's Prettier and Markdown lint commands use npm/npx with explicit package versions.
- actionlint is downloaded as a versioned archive and verified against a pinned SHA-256 digest.
- Ruby validation scripts use the standard library plus Minitest for regression tests.

Do not add a package manager, framework, SDK or runtime dependency merely to create a build target. If an application or compiled software component is introduced, add its manifest and lockfile, build instructions, dependency inventory and corresponding security/test gates before release.

## 5. Documentation release packaging

The only current release product is a documentation and source-configuration snapshot. The controlled workflow packages the protected `main` tree using Git archive semantics, then generates:

- A tag-specific `.tar.gz` source/documentation archive.
- A JSON release manifest identifying the source commit and archive hash.
- A SHA-256 checksum file.
- A detached GPG signature over the checksum file.
- GitHub artifact attestations for the archive, manifest and checksum file.

The package operation is conceptually:

```bash
git archive --format=tar --prefix="<release-tag>/" HEAD | gzip -n > "<release-tag>.tar.gz"
```

Publication is performed only by the controlled [documentation release workflow](../.github/workflows/documentation-release.yml) after its owner confirmations and required security checks. Do not manually create a release tag, publish a release, or upload release assets outside that approved workflow.

## 6. Build and release scope guardrails

- No application binary, container image, deployable service or compiled library is produced.
- The documentation archive is not an application build artifact.
- The Dependency Graph SBOM describes GitHub's represented dependency graph; it is not a complete binary/filesystem SBOM.
- GPG signatures and GitHub artifact attestations establish integrity/provenance for the stated documentation assets; they do not imply a compiled software build.
- If the project scope changes, update these instructions, the dependency inventory, the design/interface documentation, the threat model and all applicable OSPS Baseline assessments together.
