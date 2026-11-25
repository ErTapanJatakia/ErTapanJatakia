# Coding and Documentation Standards

**Applies to:** Markdown, YAML, Ruby, shell snippets, JSON and GitHub Actions maintained in this repository.  
**Policy owner:** Repository owner  
**Review cadence:** Annually and whenever the relevant language/toolchain changes.

## General requirements

All proposed changes MUST be readable, minimal, maintainable and consistent with the standards below. A pull request MUST identify the affected language or configuration format and run the applicable repository checks. Exceptions MUST be explained in the pull request and accepted by the repository owner; a tool limitation is not permission to silently ignore a defect.

## Language-specific standards

| Language / format | Required standard | Validation |
|---|---|---|
| Markdown | CommonMark-compatible Markdown; descriptive headings, meaningful link text, accessible tables and descriptive image alternatives; avoid raw HTML except where a documented README presentation requirement needs it | Markdownlint CLI2 and offline Lychee checks |
| YAML / GitHub Actions | YAML 1.2-compatible syntax where supported by the parser; two-space indentation; quoted strings where YAML typing could be ambiguous; least-privilege permissions; pinned third-party Actions; explicit shell and safe input handling | Ruby Psych YAML parsing, actionlint, Prettier and zizmor |
| Ruby | Ruby standard style: two-space indentation, snake_case methods/locals, CamelCase modules/classes, frozen string literals for standalone scripts, explicit error handling, standard-library-first dependencies, argument-array subprocess execution, and no unsafe shell interpolation | Ruby syntax checks, Minitest regression tests, branch/statement coverage gate, CodeQL |
| JSON | Valid JSON; stable, explicit schema and field names; no comments or trailing commas; deterministic formatting | JSON parser and the relevant schema/domain validator |
| Shell examples/scripts | POSIX shell where portability is intended; otherwise explicitly declare Bash; quote expansions, use strict mode for Bash scripts, validate untrusted inputs and avoid eval | actionlint for workflow shell integration and review of executable scripts |
| Configuration | Keep configuration declarative, version-controlled and documented; do not commit credentials, tokens, private keys or personal/confidential data | Repository configuration validation, Gitleaks and pull-request review |

## Secure coding requirements

- Treat pull-request metadata, workflow dispatch inputs, issue content, external API responses and repository files as untrusted input.
- Use allowlists and bounded values for refs, paths, identifiers and user-controlled parameters.
- Do not interpolate untrusted data into shell command strings. Use argument arrays or safely quoted, validated inputs.
- Do not grant write, signing, release or secret access to untrusted pull-request code.
- Set workflow permissions to the minimum required; use explicit job-level permissions.
- Pin third-party GitHub Actions to full commit SHAs and retain a human-readable version comment.
- Fail closed when security evidence is malformed, missing, expired or inconsistent.
- Keep test fixtures synthetic; do not use real secrets or personal information.
- Add or update regression tests for defects and material behavior changes.

## Required checks

The repository's authoritative commands and CI definitions are maintained in BUILD-AND-TEST-INSTRUCTIONS.md and REPOSITORY-QA-POLICY.md. The current checks include Markdown lint, YAML parsing, link validation, actionlint, Prettier, Ruby validator regression tests, VEX validation, branch coverage, CodeQL and zizmor.

A green advisory check does not make it a required merge gate. The active branch ruleset and required-check list remain authoritative for merge enforcement.

## Contribution requirements

The applicable standard MUST be followed for each modified file type. If a change introduces a new language, build system, dependency ecosystem or executable component, the contributor MUST propose:
1. The applicable language/style guide.
2. A pinned or reproducible validation tool where practical.
3. Local setup and execution instructions.
4. Automated checks appropriate to the changed behavior.
5. Dependency, license and security review requirements.

The repository owner may reject a change that introduces an unmaintainable toolchain or an unjustified external dependency.

## Review history

- 2026-11-25: Initial language-specific coding and documentation standards published.
