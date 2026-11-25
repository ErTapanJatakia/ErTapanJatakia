# Internal Security Review — 2026-11-26

**Review status:** Owner-approved internal review (2026-11-26)  
**Review type:** AI-assisted internal source, workflow and security-boundary review  
**Reviewer independence:** This is an AI-assisted internal review approved by the repository owner. It is not an independent human review, penetration test, external audit or certification.  
**Scope:** Public profile repository, six maintained Ruby scripts, Ruby regression tests, GitHub Actions workflow configuration, dependency controls, DCO policy/enforcement distinction, release integrity and repository access governance.

## 1. Review objective and method

This review considers whether the documented security requirements and trust boundaries are reflected in the maintained repository automation. The review examined the current source and tests for:

- Input validation, schema handling, path constraints and fail-closed behavior.
- Shell/process execution and command-injection exposure.
- Network protocol restrictions and certificate-verification bypasses.
- Workflow permissions, third-party action pinning and secret boundaries.
- DCO contribution-policy documentation versus actual CI enforcement.
- Release integrity controls and residual risks documented in the threat model.

The review is limited to the repository state represented by the Gold remediation branch. It does not test GitHub's infrastructure, account security factors, live HTTP response headers, the private vulnerability-reporting interface, or the integrity of external services.

## 2. Security requirements and boundaries reviewed

| Requirement / boundary | Evidence reviewed | Review observation |
|---|---|---|
| Untrusted pull-request content must not receive release/signing secrets | Repository workflows and THREAT-MODEL.md | The documented model isolates signing and publication credentials from untrusted pull-request execution; retain this boundary during future workflow changes. |
| Workflow permissions should be least-privilege | Workflow-level and job-level `permissions` declarations | The workflows use restrictive permission scopes and grant additional permissions at job level where needed. Recheck every new job and third-party action. |
| Third-party workflow code should be immutable and reviewable | Full-SHA `uses:` references, Dependabot and dependency review | The maintained workflow inventory uses full commit SHA pins; pin changes still require source, permission and licence review. |
| Repository network requests should use secure transport | `scripts/validate-network-transport.rb` and its regression tests | The validator checks curl commands for HTTPS-only protocols, TLS 1.2+, HTTPS-only redirects and known certificate-verification bypass settings. Its scope is workflow YAML pattern validation, not a universal runtime network monitor. |
| Security exception evidence must be constrained and time-bounded | `scripts/validate-vex.rb`, VEX fixtures and tests | The validator restricts evidence paths to `docs/vex/`, rejects traversal/template paths, checks dates and expiry, and links the exception to the advisory/package evidence. |
| SBOM responses must be structurally validated | `scripts/validate-sbom.rb`, `scripts/classify-sbom-response.rb` and tests | SPDX 2.3 document shape and response states are validated. This is not a claim that the upstream Dependency Graph is a complete filesystem or binary SBOM. |
| DCO contribution authorization must be documented accurately | Root `DCO`, CONTRIBUTING.md, Build and Test Instructions and workflow definitions | DCO 1.1 remains documented as an enabled contributor-policy requirement. Automated sign-off enforcement is disabled in practice and is not claimed as an active CI control. |
| Release integrity should be verifiable | RELEASE-VERIFICATION.md, documentation release workflow and threat model | Signed tags, checksums, detached GPG signatures and artifact attestations provide distinct integrity/provenance evidence for the documentation/source snapshot. They do not establish a compiled application build. |

## 3. Findings and recommended disposition

### SR-2026-01 — VEX document structural type handling

**Severity:** Low / robustness  
**Observation:** The validator rejects many malformed values and fails the workflow closed, but some valid-JSON documents with unexpected root or nested value types may raise Ruby type/method errors rather than returning a stable validation message.  
**Impact:** A malformed repository-controlled VEX record can cause a noisy CI failure. The observed behavior is fail-closed; no silent acceptance was identified in the reviewed paths.  
**Recommendation:** Add explicit Hash/Array checks for the register root, CycloneDX document root, metadata/component, vulnerability entries and analysis/affects objects. Add regression tests for each malformed type.  
**Disposition:** Recommended improvement; not a reason to weaken validation.

### SR-2026-02 — Network validator scope

**Severity:** Informational / scope limitation  
**Observation:** The network transport validator inspects curl patterns and a defined set of known TLS-verification bypass settings in GitHub Actions YAML. It does not inspect every possible network client, third-party Action's internal network behavior, or dynamically generated command.  
**Impact:** Passing this validator is evidence for the maintained workflow patterns only; it is not proof that all possible network traffic is secure.  
**Recommendation:** Keep the claim scoped. Review new network-capable Actions and commands manually, and extend the validator when a new transport mechanism is introduced.  
**Disposition:** Accepted scope limitation for the current repository automation.

### SR-2026-03 — DCO enforcement distinction

**Severity:** Governance / contribution-integrity residual risk  
**Observation:** The published DCO 1.1 policy and contributor sign-off instructions remain enabled, while automated CI enforcement is disabled.  
**Impact:** Contributors are instructed to sign off, but the workflow does not automatically reject unsigned commits.  
**Recommendation:** Keep the distinction explicit in all assessment and QA documentation. Do not claim active enforcement unless the workflow is deliberately re-enabled and tested.  
**Disposition:** Retained by repository-owner direction; CI enforcement remains de-enforced.

### SR-2026-04 — Privileged-access and independent-review constraints

**Severity:** Governance / operational  
**Observation:** The live collaborator permission check reports read-only access for the additional collaborator. The active ruleset requires zero approving reviews, and the personal repository does not provide an organization-wide 2FA enforcement control.  
**Impact:** The repository cannot currently demonstrate an operational two-person maintenance/review model, mandatory platform-enforced 2FA for every privileged developer, or the Gold 50% independent-review threshold.  
**Recommendation:** Before granting privileged access, require and verify 2FA, prefer phishing-resistant factors, elevate a qualified second maintainer only after owner approval, and require independent human review when an eligible reviewer is available.  
**Disposition:** Open; do not represent these controls as Met based on policy text alone.

### SR-2026-05 — Site security-header evidence

**Severity:** Evidence gap  
**Observation:** The current record does not contain a dated scan of the canonical GitHub-hosted project profile/repository and any separate download endpoint showing actual security-header names and nonpermissive values.  
**Impact:** The Gold `hardened_site` criterion cannot yet be independently substantiated from the repository record.  
**Recommendation:** Capture a current scan of the exact canonical URLs and retain the response-header values, scan date and tool/source.  
**Disposition:** Unverified pending current evidence.

## 4. Overall conclusion

The reviewed source and workflow controls show a reasonable defence-in-depth design for the repository's actual scope: documentation, GitHub Actions automation and small Ruby command-line validators. The controls include least-privilege workflow permissions, immutable action references, fail-closed validation, constrained VEX evidence paths, secure curl transport policy, regression testing and signed documentation-release artifacts.

The review also identifies material limits: the network validator is pattern-scoped; DCO enforcement is disabled in CI; the second collaborator currently has read-only permission; independent review is unavailable; and current site-header evidence is missing.

**Owner approval:** The repository owner approved/authorized this review on 2026-11-26 and accepted it as the repository's completed internal security review for this assessment cycle. Residual risks remain recorded above. No independent auditor or external reviewer is implied.
