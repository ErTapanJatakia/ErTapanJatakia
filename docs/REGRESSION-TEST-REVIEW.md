# Recent Bug-Fix and Regression-Test Review

**Review date:** 2026-11-25  
**Look-back period:** Repository creation (2026-10-31) through 2026-11-25; this is the complete available project history and is shorter than six months.

## Method

Reviewed merged pull requests with explicit bug-fix intent in the available repository history. The review distinguishes product/workflow defects from cosmetic documentation corrections and maps automated regression tests to the fixes where the behavior can be tested reliably.

## Bug-fix inventory and regression coverage

| Pull request | Defect corrected | Regression evidence |
|---|---|---|
| [#8](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/8) | Controller attestation Markdown generation command formatting | Not yet covered by a dedicated regression test |
| [#22](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/22) | SBOM generation API method/response contract | Covered by the test asserting the maintained workflow uses GET, plus response-classifier tests |
| [#23](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/23) | SBOM polling response handling | Covered by tests for HTTP 202 pending, HTTP 302 ready and unexpected status codes |
| [#24](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/24) | Valid SPDX documents with an empty dependency relationship list | Covered by the empty-graph SPDX validator regression test |
| [#25](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/25) | Direct and API-wrapped SPDX JSON document shapes | Covered by direct-root and wrapped-root SPDX validator tests |
| [#36](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/36) | Duplicate/deferred Prettier badge rendering | Not yet covered by a dedicated regression test |
| [#42](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/42) | Incorrect repository-local GPG composite-action path | Covered by a test that asserts the workflow reference and verifies the action file exists |
| [#45](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/45) | Malformed README badge and icon rendering | Not yet covered by a dedicated regression test |
| [#46](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/46) | X/Twitter badge image-link markup | Not yet covered by a dedicated regression test |

## Result

Five of the nine identified bug-fix pull requests (55.56%) now have automated regression coverage. The SBOM response/document validation and local composite-action path checks run in the repository QA/configuration workflows. PR #68 QA run [45560738278](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45560738278) passed all 63 Ruby regression tests (143 assertions); the four-utility suite measured 88.00% statement coverage and 87.13% branch coverage, above the 80% Silver gates. The separate GitHub Actions static-analysis check identified a ShellCheck warning in the new network-policy validation step. The expression was simplified and the validator excludes its own policy text from the scan; a fresh full CI run is pending. This does not change the successful Ruby regression result recorded above.

The four remaining items are tracked above as test-coverage gaps. Add tests when those areas are materially changed again; do not claim that the historic fixes had tests at the time they were merged.

## Review limitations

- The repository was created on 2026-10-31, so this review covers all available history but not a full six-month observation period.
- The inventory is based on explicit bug-fix pull-request titles and descriptions; cosmetic corrections are included conservatively.
- A regression test added after a fix is identified as retrospective coverage, not evidence that the original change was tested before merge.
- Reassess the numerator and denominator at the six-month mark and after each new bug fix.

## Review history

- 2026-11-25: Initial complete-history review; five of nine identified bug-fix PRs covered by automated regression tests.
