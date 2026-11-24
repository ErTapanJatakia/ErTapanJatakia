# Multi-Repository and Subproject Security Policy

## 1. Current project structure

The current OpenSSF assessment target is the single repository `ErTapanJatakia/ErTapanJatakia`. The file `config/repositories.json` currently lists this same repository as the only enabled sign-and-mirror target. A GitVerse mirror is a distribution mirror, not a separate source-code subproject.

No multi-repository software release or independently versioned subproject is currently declared.

## 2. Policy if subprojects are introduced

Before a release includes multiple source-code repositories:

1. Publish an inventory of every source repository, owner, purpose, primary branch and release relationship.
2. Assign a responsible maintainer for each subproject.
3. Require each subproject to enforce security requirements at least as strict as the primary repository, including branch protection, least-privilege CI/CD permissions, secret handling, dependency analysis, SAST where source languages are supported, vulnerability reporting and release integrity.
4. Require a current security assessment and dependency inventory for each subproject.
5. Block the combined release if a subproject does not meet the baseline or has an unresolved Critical/High security finding.
6. Record exceptions, compensating controls, approver and expiry in the release record.

## 3. Applicability

This policy establishes a future governance rule; it does not claim that multiple subprojects currently exist or that a cross-repository enforcement mechanism is operating. Reassess OSPS-QA-04.02 if the project begins publishing a release comprising multiple source repositories.
