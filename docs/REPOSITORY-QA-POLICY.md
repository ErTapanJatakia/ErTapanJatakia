# Repository Quality Assurance Policy

## 1. Scope

This repository is a professional profile and documentation repository with GitHub Actions automation. It is not an application codebase and does not claim to have an application runtime, application unit/integration test suite or application code-coverage measurement.

The automated checks below validate repository content and automation configuration. They must be described as repository QA, not application tests.

## 2. When checks run

The `Repository Quality Assurance` workflow runs on:

- Every pull request targeting the repository.
- Every push to `main`.
- A manually requested workflow dispatch.

The security-analysis, CodeQL default setup, Scorecard and dependency-analysis workflows have their own triggers documented in their workflow files.

## 3. Current repository QA checks

| Check | What it validates | Local execution |
|---|---|---|
| Markdown lint | Maintained Markdown documentation; the HTML-heavy profile README is intentionally excluded | `npx --yes markdownlint-cli2@0.18.1 '**/*.md' '!README.md' '!LICENSE'` |
| YAML syntax | YAML files and GitHub Action metadata parse successfully | `ruby -e 'require "yaml"; Dir.glob("{.github/**/*.yml,.github/**/*.yaml}").each { |f| YAML.parse_file(f); puts "Valid YAML: #{f}" }'` |
| Markdown links | Internal/offline Markdown links and anchors | `lychee --offline --verbose --no-progress './**/*.md'` |
| GitHub Actions lint | Workflow syntax and common GitHub Actions errors | Install actionlint 1.7.12, verify its published SHA-256, then run `actionlint -color -ignore 'specifying action .*setup-personal-gpg.* in invalid format because ref is missing' .github/workflows/*.yml`; the CI workflow documents its narrow compatibility exception |
| Prettier | Maintained workflow and repository configuration formatting | `npx --yes prettier@3.6.2 --check ".github/workflows/*.yml" ".github/dependabot.yml" ".prettierrc.json"` |

CI is authoritative for the exact pinned action versions and command lines. If a local tool version differs, use the workflow definition as the source of truth.

## 4. Major-change test policy

A major change is any change that materially alters:
- A workflow's permissions, triggers, credentials, signing or publication behavior.
- A branch ruleset, security control, dependency policy or release process.
- A repository controller, mirroring process or artifact-generation process.
- A documented security claim, credential-handling procedure or release-verification instruction.

For major changes, contributors must add or update automated checks that exercise the changed behavior where a meaningful test target exists. At minimum, the pull request must run the relevant YAML, actionlint, Markdown and formatting checks. Workflow behavior changes should include safe validation of input constraints and permission scope. Security-policy changes should include validation of machine-readable policy files where possible.

Because this repository has no application source or application test suite, contributors must not invent meaningless unit tests or claim application test coverage. If a change introduces maintained executable code, its author must add suitable unit/integration tests and document their local and CI execution before that code is treated as production-ready.

## 5. Pull request acceptance

- All applicable required checks must pass before merge.
- Advisory checks must be reviewed and any failure disposition documented.
- Security-sensitive workflow changes must be reviewed for least privilege, pinned actions, untrusted input handling and secret exposure.
- A check must not be disabled, weakened or bypassed merely to make a pull request green.
- Any exception must state the reason, owner, compensating control and expiry.

## 6. Results and evidence

Workflow runs and check summaries are the execution evidence. A successful repository QA run does not establish application correctness, application test coverage, runtime security or release readiness for software binaries.
