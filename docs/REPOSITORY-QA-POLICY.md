# Repository Quality Assurance Policy

## 1. Scope

This repository publishes a professional profile, documentation, GitHub Actions automation and five small Ruby command-line validation utilities. It is not an end-user application and has no application runtime or application integration-test suite. The Ruby utilities are maintained software components and are covered by dedicated regression tests and measured branch coverage.

The automated checks validate repository content, policy data, automation configuration and the five maintained Ruby utilities. Contributors can bootstrap the local Ruby test environment with `bash script/setup`. Checks must be described accurately by target; repository-content checks are not application tests, while utility tests are executable software tests.

## 2. When checks run

The `Repository Quality Assurance` workflow runs on:

- Every pull request targeting the repository.
- Every push to `main`.
- A manually requested workflow dispatch.

The security-analysis, CodeQL default setup, Scorecard and dependency-analysis workflows have their own triggers documented in their workflow files.

## 3. Current repository QA checks

| Check | What it validates | Local execution |
|---|---|---|
| Markdown lint | Maintained Markdown documentation; the HTML-heavy profile README is intentionally excluded | `npx --yes markdownlint-cli2@0.24.0 '**/*.md' '!README.md' '!LICENSE'` |
| YAML syntax | YAML files and GitHub Action metadata parse successfully | `ruby -e 'require "yaml"; Dir.glob([".github/**/*.yml", ".github/**/*.yaml"]).each { YAML.parse_file(_1) }'` |
| Markdown links | Internal/offline Markdown links and anchors | `lychee --offline --verbose --no-progress './**/*.md'` |
| GitHub Actions lint | Workflow syntax and common GitHub Actions errors | Install actionlint 1.7.12, verify its published SHA-256, then run `actionlint -color -ignore 'specifying action .*setup-personal-gpg.* in invalid format because ref is missing' -ignore 'unknown permission scope .*vulnerability-alerts.*' .github/workflows/*.yml`; the CI workflow documents its narrow compatibility exception |
| Prettier | Maintained workflow and repository configuration formatting | `npx --yes prettier@3.6.2 --check ".github/workflows/*.yml" ".github/dependabot.yml" ".prettierrc.json"` |
| VEX register validation | Machine-readable exception records, CycloneDX 1.6 statements, expiry, evidence and matching advisory/component references | `ruby scripts/validate-vex.rb` |
| Ruby validator regression tests | Positive and negative cases for VEX exception validation, DCO commit-range validation, SPDX SBOM validation, GitHub SBOM polling-response classification and secure network transport configuration | `ruby scripts/check-branch-coverage.rb` |
| Ruby validator branch coverage | Ruby standard-library Coverage measures executed branch paths across all five maintained Ruby utilities; CI requires at least 80% | Included in `ruby scripts/check-branch-coverage.rb` |
| Ruby validator statement coverage | Ruby standard-library Coverage measures executable source lines across all five maintained Ruby utilities; CI requires at least 80% statement coverage | Included in `ruby scripts/check-branch-coverage.rb` |
| Network transport policy validation | Checks every maintained curl command for HTTPS, TLS 1.2+, HTTPS-only redirects and rejects known certificate-verification bypass settings | `ruby scripts/validate-network-transport.rb .github/workflows` |
| DCO commit validation | Checks every commit in the pull-request range for an exact sign-off matching its author or committer identity | `BASE_SHA=<base> HEAD_SHA=<head> ruby scripts/validate-dco.rb` |

CI is authoritative for the exact pinned action versions and command lines. If a local tool version differs, use the workflow definition as the source of truth.

## 4. Major-change definition and test requirements

A major change is any change that materially alters:

- A workflow's permissions, triggers, credentials, signing or publication behavior.
- A branch ruleset, security control, dependency policy or release process.
- A repository controller, mirroring process or artifact-generation process.
- A documented security claim, credential-handling procedure, VEX exception, threat model or release-verification instruction.
- A validator, test harness or machine-readable security policy.

For major changes, contributors must add or update automated checks that exercise the changed behavior where a meaningful test target exists. The pull request must run the relevant YAML, actionlint, Markdown, link, formatting, VEX-validation and targeted regression checks. Workflow behavior changes must include safe validation of input constraints and permission scope. Security-policy changes must include validation of machine-readable policy files where possible.

The `Major change validation` job is an active required main-branch status check. On every pull request it fails closed unless the VEX regression test suite succeeds and the DCO validator succeeds within the same required job. The DCO sign-off check is activated when the pull request's base branch already contains the root `DCO` policy; the one-time policy-adoption pull request and pre-policy history are grandfathered. From the first commit based on the merged policy, every commit in a pull request must carry an exact `Signed-off-by` trailer matching its author or committer identity. For changes to major/security-sensitive paths, it additionally requires Markdown lint, YAML validation, link validation, actionlint, Prettier and VEX validation to succeed. This makes an automated regression suite a pre-acceptance gate for every pull request, while preserving broader targeted validation for major changes.

The Ruby validators are maintained executable code, so changes to them require targeted positive/negative regression tests and must preserve both the 80% minimum branch-coverage gate and 80% minimum statement-coverage gate. The repository still has no end-user application, application runtime or application-level coverage claim. If an application or additional executable component is introduced, its author must add suitable unit/integration tests and document their local and CI execution before that code is treated as production-ready.

## 5. Pull request acceptance

- All applicable required checks must pass before merge.
- Every pull request must pass the required Major change validation gate, including the automated regression test suite and DCO validation.
- Advisory checks must be reviewed and any failure disposition documented.
- Security-sensitive workflow changes must be reviewed for least privilege, pinned actions, untrusted input handling and secret exposure.
- A check must not be disabled, weakened or bypassed merely to make a pull request green.
- Any exception must state the reason, owner, compensating control and expiry.

## 6. Results and evidence

Workflow runs and check summaries are the execution evidence. A successful repository QA run does not establish application correctness, application-level test coverage, runtime security or release readiness for software binaries. The separate Ruby utility coverage result applies only to the five named Ruby utility scripts. The active main ruleset explicitly requires `Major change validation`; inspect the current ruleset and latest commit checks when auditing enforcement.
