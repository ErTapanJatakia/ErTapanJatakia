# OpenSSF OSPS Baseline Level 3 — Implementation Register

**Assessment version:** 2026-11-24  
**Repository:** `ErTapanJatakia/ErTapanJatakia`  
**Purpose:** Evidence-led tracking of the 21 Level 3 controls. This register is not a claim of OpenSSF badge award or independent certification.

| Control | Requirement summary | Current evidence | Status |
|---|---|---|---|
| OSPS-AC-04.02 | Minimum CI/CD job permissions | Workflow-level permissions are empty; jobs grant only the permissions needed for their work. Revalidate on workflow changes. | Met |
| OSPS-BR-01.04 | Validate trusted collaborator workflow input | Signed-publish workflow validates branch syntax/ref patterns, commit-message length and ancestry from main. | Met |
| OSPS-BR-02.02 | Identify each official release asset | Release `profile-docs-2026.11.24.1` publishes a tag-specific archive, SHA256SUMS, detached GPG signature and JSON manifest. | Met |
| OSPS-BR-07.02 | Secrets and credentials policy | `SECRETS-AND-CREDENTIALS-POLICY.md` defines storage, access, rotation and incident response. | Met |
| OSPS-DO-03.01 | Release integrity/authenticity verification instructions | `RELEASE-VERIFICATION.md` documents GPG, SHA-256, GitHub attestation and signed-tag verification; first signed documentation release completed. | Met |
| OSPS-DO-03.02 | Verify expected release author identity | Instructions constrain GitHub attestation to this repository's release workflow and require independent GPG fingerprint confirmation. Owner-confirmed fingerprint was used for the signed release. | Met |
| OSPS-DO-04.01 | Support scope and duration for each release | `RELEASE-POLICY.md` defines a 90-day security/integrity support window; the release manifest records the release-specific end date. | Met |
| OSPS-DO-05.01 | State when a release stops receiving security updates | Release policy and published manifest specify the end-of-security-support date. | Met |
| OSPS-GV-04.01 | Review collaborators before elevated permissions | Access policy defines identity, need, least privilege, private decision records and annual review. Owner confirms reviewing permissions for the recently added collaborator; full roster/pending-invitation enumeration was not independently available through the connected API. See [dated access review](access-reviews/2026-11-24.md). | Partial — periodic full-roster reconciliation remains |
| OSPS-QA-02.02 | SBOM with compiled released software assets | No compiled software assets are produced. The documentation archive is not a compiled binary; the Dependency Graph SBOM is not misrepresented as a binary SBOM. | N/A |
| OSPS-QA-04.02 | Subprojects enforce primary security requirements | Only one source repository is declared; GitVerse is a mirror, not a subproject. | N/A |
| OSPS-QA-06.02 | Document when/how tests are run | `REPOSITORY-QA-POLICY.md` documents triggers, commands, checks and limitations. | Met |
| OSPS-QA-06.03 | Require tests for major changes | QA workflow has a Major change validation job that fails closed when relevant QA jobs fail for security-sensitive paths. The check is required by the active main ruleset and passed on PR #48. | Met |
| OSPS-QA-07.01 | Require non-author human approval | Active ruleset requires zero approvals; no independent reviewer is available. This limitation is explicit and no self/bot approval is claimed. | Unmet — blocked by reviewer availability |
| OSPS-SA-03.02 | Threat model released software attack surfaces | Threat model was refreshed for repository automation, credentials, permissions, dependency/VEX handling, attestations and release substitution. No application runtime or compiled software is released. | Partial — scoped to repository automation |
| OSPS-VM-04.02 | VEX for non-affecting vulnerabilities | VEX process specifies decision states, evidence, human review, 90-day expiry, revocation and non-exceptionable malware; Ruby validator and six positive/negative regression tests passed in [PR #48 QA run](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45368071797). No real VEX case exists, and no statement is fabricated. | Partial — real case pending |
| OSPS-VM-05.01 | SCA remediation thresholds | `SCA-AND-DEPENDENCY-POLICY.md` defines vulnerability and license thresholds; exact pinned Action licenses are registered and checked in CI. | Met |
| OSPS-VM-05.02 | Address SCA violations before release | Release policy requires current Dependabot, Dependency Review, license and SBOM review; first controlled documentation release completed after preflight. | Met |
| OSPS-VM-05.03 | Automatically evaluate dependencies and block violations | Dependency Review, Dependabot general-alert gate, malware block and VEX exception validation run in CI. All seven security checks are required by the active main ruleset. | Met |
| OSPS-VM-06.01 | SAST remediation thresholds | `SAST-POLICY.md` defines severity-based triage and remediation deadlines. | Met |
| OSPS-VM-06.02 | Automatically evaluate and block SAST violations | CodeQL Actions analysis and sequenced SAST policy gate are active and both are required by the main ruleset. | Met |

## Evidence and scope guardrails

- A documentation release is not a compiled software release; it does not satisfy compiled-binary SBOM or software build-provenance requirements.
- A policy is not proof that a control operated. Operational controls require platform configuration, workflow runs or a real access/release event.
- The Dependency Graph SBOM is not a full filesystem, container, runner-image or binary SBOM.
- A VEX validator checks structure, scope linkage and expiry; it cannot prove the truth of an exploitability assessment. A template is not a VEX statement for a real advisory.
- A threat model for repository automation does not establish an application threat model.
- Self-review or automated bot review does not satisfy non-author human approval.
- The GitHub Release object is not API-reported as immutable. The signed tag is verified and protected, but the two are not equivalent.
- Keep access-governance evidence scoped to the owner's confirmed review; do not imply independent full-roster enumeration. Major-change validation is enforced as a required status check.

## Latest verified repository evidence — 2026-11-24

- Main branch head before this assessment PR: `6f09570866b3013744839893b70a4295741d5898`.
- Active main ruleset: [Protect main - Security & PR Governance](https://github.com/ErTapanJatakia/ErTapanJatakia/rules/27948154), ID `27948154`. It requires seven checks: Gitleaks, zizmor, Dependency Review, Dependabot alert gate, Analyze (actions), SAST policy gate, and Major change validation; it has no bypass actors and zero required approvals.
- Controlled signed documentation release: [profile-docs-2026.11.24.1](https://github.com/ErTapanJatakia/ErTapanJatakia/releases/tag/profile-docs-2026.11.24.1). Tag signature verified; archive, manifest and checksum attestations generated and verified.
- PR #47 merged at `6f09570866b3013744839893b70a4295741d5898`; 43 README badge images were enlarged, and all applicable post-merge checks passed. This was a documentation presentation change, not a software release.
- GPG signing verification: [run 45355347331](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45355347331) completed successfully; the owner confirmed the expected fingerprint.
- Dependency Graph SBOM and provenance evidence: [run 45331157748](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45331157748) and [attestation record](https://github.com/ErTapanJatakia/ErTapanJatakia/attestations/71451141).
- Access governance review: [2026-11-24 access review](access-reviews/2026-11-24.md). The owner confirms reviewing permissions for the recently added collaborator; full collaborator roster/pending-invitation enumeration was not independently available through the connected API.
- VEX exception register remains empty. No advisory was invented or suppressed. The Ruby validator and all six regression tests passed in [PR #48 QA run](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45368071797).
- The Major change validation job passed in [PR #48 QA run](https://github.com/ErTapanJatakia/ErTapanJatakia/actions/runs/45368071797). It is now an additional required check in the active ruleset.
