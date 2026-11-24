# OpenSSF OSPS Baseline Level 3 — Implementation Register

**Assessment version:** 2026.08.28  
**Repository:** `ErTapanJatakia/ErTapanJatakia`  
**Purpose:** Track evidence and gaps for the 21 Level 3 controls. This register is not a claim of OpenSSF badge award or independent certification.

| Control | Requirement summary | Repository evidence / action | Status |
|---|---|---|---|
| OSPS-AC-04.02 | Minimum CI/CD job permissions | Workflow-level permissions are empty; jobs grant only the permissions needed for their work. | Existing evidence; revalidate on workflow changes |
| OSPS-BR-01.04 | Validate trusted collaborator workflow input | Signed-publish workflow validates branch syntax/ref patterns, commit-message length and ancestry from main. | Existing evidence |
| OSPS-BR-02.02 | Identify each official release asset | Controlled documentation release names each asset with the immutable release tag and records asset hashes in a manifest. | Workflow implemented; first documentation release pending |
| OSPS-BR-07.02 | Secrets and credentials policy | `SECRETS-AND-CREDENTIALS-POLICY.md` defines storage, access, rotation and incident response. | Policy implemented |
| OSPS-DO-03.01 | Release integrity/authenticity verification instructions | `RELEASE-VERIFICATION.md` documents GPG, SHA-256, GitHub attestation and signed-tag verification. | Instructions implemented; first signed documentation release pending |
| OSPS-DO-03.02 | Verify expected release author identity | Instructions constrain GitHub attestation to this repository's release workflow and require independent GPG fingerprint confirmation. | Instructions implemented; first signed documentation release pending |
| OSPS-DO-04.01 | Support scope and duration for each release | `RELEASE-POLICY.md` defines a 90-day security/integrity support window and release-specific end date. | Policy and release preflight implemented; first documentation release pending |
| OSPS-DO-05.01 | State when a release stops receiving security updates | Release policy and manifest specify the end-of-security-support date. | Policy implemented; first documentation release pending |
| OSPS-GV-04.01 | Review collaborators before elevated permissions | `ACCESS-GOVERNANCE.md` defines identity, need, privilege, record and periodic-review requirements. | Policy implemented; future access event needed to evidence operation |
| OSPS-QA-02.02 | SBOM with compiled released software assets | No compiled software assets are produced. The documentation archive is not a compiled binary; the Dependency Graph SBOM is not misrepresented as a binary SBOM. | Not applicable to current release scope |
| OSPS-QA-04.02 | Subprojects enforce primary security requirements | Only one source repository is declared; GitVerse is a mirror, not a subproject. Future multi-repository release requirements are documented. | Not applicable to current structure |
| OSPS-QA-06.02 | Document when/how tests are run | `REPOSITORY-QA-POLICY.md` documents triggers, local commands, CI checks and limitations. | Documentation implemented |
| OSPS-QA-06.03 | Require tests for major changes | QA policy defines major changes and requires appropriate automated checks; future executable code must add suitable tests. | Policy implemented |
| OSPS-QA-07.01 | Require non-author human approval | Current ruleset requires PRs but has zero required approvals; no independent reviewer is available. | Not met; blocked on genuine independent reviewer and ruleset change |
| OSPS-SA-03.02 | Threat model released software attack surfaces | `THREAT-MODEL.md` models repository automation, signing, dependency and release attack paths. No application software is released. | Repository automation threat model implemented; software-specific applicability limited |
| OSPS-VM-04.02 | VEX for non-affecting vulnerabilities | `VEX-PROCESS.md` defines evidence requirements and an explicitly illustrative placeholder; no real non-exploitable advisory is fabricated. | Process/template implemented; actual statement only when a real case exists |
| OSPS-VM-05.01 | SCA remediation thresholds | `SCA-AND-DEPENDENCY-POLICY.md` defines vulnerability severity and license decision thresholds. | Policy implemented |
| OSPS-VM-05.02 | Address SCA violations before release | Release policy requires current Dependabot, Dependency Review, license and SBOM review; Critical/High and malware block publication. | Policy and release preflight implemented; first documentation release pending |
| OSPS-VM-05.03 | Automatically evaluate dependencies and block violations | Dependency Review evaluates PR dependency changes; the alert gate queries both general and malware classifications. General alerts require a current VEX exception; malware alerts always block. GitHub's malware-alert limitation for SHA-pinned Actions remains a manual release review. | Extended gate passed on PR #39 (45347826556) and main (45348018077); required branch-ruleset update still pending |
| OSPS-VM-06.01 | SAST remediation thresholds | `SAST-POLICY.md` defines severity-based triage and remediation deadlines. | Policy implemented |
| OSPS-VM-06.02 | Automatically evaluate and block SAST violations | CodeQL default setup analyzes GitHub Actions. The SAST policy gate waits for the matching `Analyze (actions)` check on the same commit to finish before evaluating Critical/High alerts. | Sequenced gate passed on PR #39 (45347826559) and main (45348017876); CodeQL passed on main (45348018299); required branch-ruleset update still pending |

## Assessment guardrails

- A documentation release is not a compiled software release; its release-specific evidence must not be used to claim compiled-binary SBOM or software build provenance.
- A policy is not evidence that a control has operated; operational controls need workflow runs, platform configuration or a real access/release event.
- The Dependency Graph SBOM is not a full filesystem/container/binary SBOM.
- A VEX template is not a VEX statement for a real advisory.
- A threat model for repository automation does not establish an application threat model.
- A self-review or automated bot review does not satisfy non-author human approval.
- The Level 3 assessment must be updated only after the evidence above is verified.

## Latest post-merge evidence — 2026-11-24

PR [#38](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/38) was merged as commit `099708d2225f65e3ad31cbd4ac2fc44a8f17458c`.

- [Repository Security Analysis](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044175): Gitleaks and zizmor passed.
- [Dependency and Malware Alert Policy](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044223): Dependabot alert gate passed; the separate Malware alerts interface remains a manual pre-release review.
- [SAST Policy Gate](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044217) and [CodeQL Analyze (actions)](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044354): passed.
- [Repository Quality Assurance](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044201): all five advisory checks passed.
- [Repository Configuration Validation](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044245), [Dependency Graph SBOM](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044206), [OpenSSF Scorecard](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044243) and [GitVerse mirror](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45347044193): passed.

The active main ruleset still requires only Gitleaks and zizmor. Add `Dependency Review`, `Dependabot alert gate`, `Analyze (actions)` and `SAST policy gate` as required checks after verifying the successful PR #38 results. The controlled documentation-release workflow is configured, but the first public release has not been created. The tag ruleset and first release require owner-side GitHub settings/dispatch actions.

## Latest verified evidence — PR #39 and main — 2026-11-24

PR [#39](https://github.com/ErTapanJatakia/ErTapanJatakia/pull/39) was merged as commit `88e1d16a13c7fc72fdaaacbbb995bd320070f8b8`.

- Dependency and malware alert gate passed on PR #39 (45347826556) and main (45348018077); no open general or malware Dependabot alerts were returned.
- SAST policy gate passed on PR #39 (45347826559) and main (45348017876), after the matching CodeQL analysis completed. Main CodeQL run: 45348018299.
- Repository Security Analysis (45348017923), Repository QA (45348017809), Configuration Validation (45348017942), SBOM (45348017820), Scorecard (45348017963) and GitVerse mirror (45348017956) passed.
- The latest Scorecard remains 6.9/10. Token Permissions, Pinned Dependencies, SAST and CI-Tests each score 10. Branch-Protection remains 4 because no independent reviewer/approval is available. Packaging and Signed-Releases remain -1 because no software package or release has been published.
- The main ruleset still needs four additional required checks: `Dependency Review`, `Dependabot alert gate`, `Analyze (actions)` and `SAST policy gate`.
- The controlled documentation release is configured but not yet published. The first release still requires the owner-side tag ruleset and malware/Actions dependency/license review.
