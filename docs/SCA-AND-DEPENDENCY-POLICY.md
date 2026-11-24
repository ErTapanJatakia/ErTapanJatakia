# Software Composition Analysis and Dependency Policy

## 1. Scope

The repository currently has no application package manifest or lockfile. Its maintained third-party dependency surface is primarily GitHub Actions referenced by workflow files. GitHub Dependency Graph and Dependabot are enabled; the repository's SPDX export is explicitly limited to Dependency Graph data.

This policy applies to dependencies represented by the Dependency Graph, GitHub Actions references, and any future package manifests, lockfiles, vendored components or release assets.

## 2. Intake and approval

- Prefer maintained upstream projects and official actions.
- Pin GitHub Actions to full commit SHAs; include a human-readable version comment.
- Use Dependabot for scheduled GitHub Actions update proposals.
- Review the source repository, maintainer activity, license, release history, provenance and known security advisories before introducing a new dependency.
- Do not add a package, lockfile, container or runtime merely to create a scanner target or badge.
- Do not introduce dependencies with unknown or incompatible licensing without review.

## 3. Vulnerability remediation thresholds

| Finding | Required response |
|---|---|
| Critical | Block merge/release; contain and remediate before publication |
| High | Block merge/release; remediate before publication |
| Moderate | Triage within 7 calendar days; remediate within 30 calendar days |
| Low | Triage within 30 calendar days; remediate within 90 calendar days |
| Malware or confirmed malicious package | Block immediately regardless of severity; remove/replace and investigate exposure |

A shorter deadline applies when exploitation is known, the dependency is reachable in a sensitive workflow, or the maintainer determines that impact warrants immediate action.

## 4. License thresholds

- A dependency with a clearly identified license compatible with the repository's intended distribution may proceed after review.
- A prohibited, incompatible, custom, unknown or missing license blocks release until the rights and distribution implications are resolved.
- Review SPDX identifiers and license expressions; do not infer compatibility from a package name or a repository badge.
- Record the package, version, license, affected release, decision, reviewer and rationale for any accepted exception.

## 5. Pull-request and release enforcement

- Dependency Review runs on pull requests and fails on High or Critical dependency vulnerabilities.
- The policy job queries open Dependabot alerts separately with `classification=general` and `classification=malware`. General vulnerability alerts fail closed unless a current, evidence-backed VEX exception is registered; any malware alert blocks immediately with no exception.
- Dependabot alerts and malware detection remain enabled in GitHub. GitHub documents that malware alerts for GitHub Actions are generated only for semantic-version references, not full-SHA references. Because this repository pins Actions to full SHAs, the API gate cannot establish malware coverage for those pinned Actions. The release workflow therefore retains an owner review confirmation for the Actions dependency inventory and Malware alerts UI.
- Before any official release, review the current Dependabot alert inventory, Dependency Review result, license information and the latest Dependency Graph SBOM. No unresolved Critical/High or malware finding may be included in a release.
- Moderate/Low findings may be released only if the applicable remediation deadline is still met and the risk is recorded; a documented VEX exception is required when asserting that a vulnerability does not affect the project.

The automated checks are not a full filesystem, container or binary SCA scanner. See [GitHub's Dependabot malware-alert limitations](https://docs.github.com/en/code-security/concepts/supply-chain-security/malware-alerts) and [Dependabot alerts API](https://docs.github.com/en/rest/dependabot/alerts) for the supported malware classification and GitHub Actions SHA-reference limitation. If those asset types are introduced, extend the inventory and enforcement scope before release.

## 6. Direct Action license inventory

The direct GitHub Actions license inventory is maintained in [DEPENDENCY-LICENSE-REGISTER.md](DEPENDENCY-LICENSE-REGISTER.md). It records license evidence at the exact pinned commits. The register identifies the Gitleaks Action's proprietary EULA separately from the repository's GPL-3.0 license; its personal-account provision and non-redistribution boundary are documented. The register does not cover transitive Action dependencies or runner images and must be refreshed whenever a pinned Action changes.

## 7. Exceptions and VEX

An exception must identify the advisory, component/version, affected scope, evidence, exploitability decision, compensating controls, approver, expiry and remediation plan. A non-exploitable vulnerability must be documented using the [VEX process](VEX-PROCESS.md). Exceptions must not be used to conceal an unresolved exploitable issue.

## 8. Evidence limits

The current SBOM represents GitHub Dependency Graph data only. It does not establish that every file, action implementation, runner image, transitive runtime dependency, container or binary has been inventoried. The policy must be reassessed if the repository begins distributing executable software.
