# Direct GitHub Actions Dependency License Register

**Snapshot date:** 2026-11-24  
**Repository:** `ErTapanJatakia/ErTapanJatakia`  
**Scope:** Direct external GitHub Actions referenced by maintained workflow files, checked at the exact pinned commit.

This register covers the 10 distinct external Action repositories found in the current workflow `uses:` declarations. Scorecard reports 21/21 GitHub-owned and 5/5 third-party Action references pinned; repeated references to the same Action repository are consolidated here. The Dependency and Malware Alert Policy workflow checks that each external pinned Action reference remains represented in this register.

## License inventory

| Action repository | Pinned commit | License at pinned commit | License evidence |
|---|---|---|---|
| `actions/checkout` | `3d3c42e5aac5ba805825da76410c181273ba90b1` | MIT | [LICENSE](https://github.com/actions/checkout/blob/3d3c42e5aac5ba805825da76410c181273ba90b1/LICENSE); Git blob `a67dca8b4f65d6bd351f6b1e333ce2cd84d843a5` |
| `actions/dependency-review-action` | `a1d282b36b6f3519aa1f3fc636f609c47dddb294` | MIT | [LICENSE](https://github.com/actions/dependency-review-action/blob/a1d282b36b6f3519aa1f3fc636f609c47dddb294/LICENSE); Git blob `cdfebd4e4322284fde560f21808182055976d9bf` |
| `actions/attest` | `1e69f48acb82d1966a394da916b4c1698aa569d6` | MIT | [LICENSE](https://github.com/actions/attest/blob/1e69f48acb82d1966a394da916b4c1698aa569d6/LICENSE); Git blob `5f9e342dcc1e39277b96077541676ce6307de2c7` |
| `actions/upload-artifact` | `b7c566a772e6b6bfb58ed0dc250532a479d7789f` | MIT | [LICENSE](https://github.com/actions/upload-artifact/blob/b7c566a772e6b6bfb58ed0dc250532a479d7789f/LICENSE); Git blob `a67dca8b4f65d6bd351f6b1e333ce2cd84d843a5` |
| `DavidAnson/markdownlint-cli2-action` | `696eb3f2509270d7b882d2aa68347bc676e7af34` | MIT | [LICENSE](https://github.com/DavidAnson/markdownlint-cli2-action/blob/696eb3f2509270d7b882d2aa68347bc676e7af34/LICENSE); Git blob `75c778e52d8dea682c9a25a9950cebd1b74afc69` |
| `lycheeverse/lychee-action` | `e7477775783ea5526144ba13e8db5eec57747ce8` | Apache-2.0 OR MIT (dual-licensed) | [LICENSE-APACHE](https://github.com/lycheeverse/lychee-action/blob/e7477775783ea5526144ba13e8db5eec57747ce8/LICENSE-APACHE), Git blob `912ad5d424d69101e337567c8bc55d2b171b4746`; [LICENSE-MIT](https://github.com/lycheeverse/lychee-action/blob/e7477775783ea5526144ba13e8db5eec57747ce8/LICENSE-MIT), Git blob `65a3ce398f8f066564390386f5e7a1a81556fd9e` |
| `ossf/scorecard-action` | `fa7117db83c52d787ae5a89f350999701505d78e` | Apache-2.0 | [LICENSE](https://github.com/ossf/scorecard-action/blob/fa7117db83c52d787ae5a89f350999701505d78e/LICENSE); Git blob `15a7423eddef84d1813215755a5cd1a012f13a69` |
| `github/codeql-action` | `1bd86f2fdb4b86187fa4059f16f31a3202acc9ea` | MIT | [LICENSE](https://github.com/github/codeql-action/blob/1bd86f2fdb4b86187fa4059f16f31a3202acc9ea/LICENSE); Git blob `b50625eb63949013cae604b1cadd42cfa1eaf825` |
| `gitleaks/gitleaks-action` | `e0c47f4f8be36e29cdc102c57e68cb5cbf0e8d1e` | Proprietary Gitleaks Action EULA; no SPDX identifier | [LICENSE.txt](https://github.com/gitleaks/gitleaks-action/blob/e0c47f4f8be36e29cdc102c57e68cb5cbf0e8d1e/LICENSE.txt); Git blob `174ea5e1c78a77414e43d239eba26c37ffd947b5` |
| `zizmorcore/zizmor-action` | `45d7276c9ca790aabd705e31ca99c6185c3e76dd` | MIT | [LICENSE](https://github.com/zizmorcore/zizmor-action/blob/45d7276c9ca790aabd705e31ca99c6185c3e76dd/LICENSE); Git blob `362fbe8e62cca908f22e9036b361a5be1de2a468` |

## Gitleaks Action EULA review

The pinned Gitleaks Action commit contains a proprietary End-User License Agreement, not an OSI-approved open-source license. The EULA states that a License Key is not required when scanning repositories owned by a Personal Account; it requires a key for Organization Account repositories. It also restricts redistribution, modification and use as part of a product/service providing similar functionality.

Current repository treatment:

- The repository is owned by a Personal Account, so the EULA's personal-account provision applies as written.
- The repository references the Action by full commit SHA; it does not copy or bundle the Action's source code.
- The controlled documentation release archive contains the workflow reference only, not the Gitleaks Action implementation.
- Reassess before moving this repository to an Organization Account, redistributing the Action source, or using it as part of a product/service with similar functionality.

This is a separate proprietary workflow-tool license and must not be described as GPL-3.0 code or as an open-source dependency.

## Scope and refresh rules

- This register covers direct Action repository license files at the exact pinned commits listed above.
- It does not inventory transitive dependencies bundled inside those Actions, GitHub-hosted runner images, GitHub platform services, or dependencies of the CodeQL default setup that are not explicit `uses:` references in this repository.
- Refresh this register whenever an Action repository or pinned SHA changes, before a public release, and at least annually.
- A missing, changed, custom or proprietary license requires owner review before release. Do not infer SPDX compatibility from a repository's name or a badge.
