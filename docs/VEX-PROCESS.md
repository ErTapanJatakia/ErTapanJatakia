# Vulnerability Exploitability eXchange (VEX) Process

## 1. Purpose and scope

Use VEX to communicate why a known vulnerability in an identified software component does or does not affect a specific project/release. VEX is not a substitute for remediation when a component is affected, and it must not be used to suppress an alert without evidence.

The repository currently has no application runtime and no accepted VEX exceptions. Its Dependency Graph SBOM is a point-in-time dependency inventory, not a complete inventory of every runtime, build or runner component.

## 2. Status and decision handling

Use CycloneDX 1.6 VEX documents stored under `docs/vex/`. Every real statement must be scoped to an identified project version/release and component.

- **not_affected:** permitted only with a recognized justification and reproducible evidence for the exact component/version and project scope.
- **affected:** the vulnerability applies; keep the alert open and track remediation. A VEX record does not suppress it.
- **under_investigation:** evidence is incomplete; retain the alert and assign an owner and review date.
- **fixed:** use only after a fixed component version or effective remediation is present and verified.

Do not translate uncertainty into `not_affected`. Reassess when the component version, configuration, usage path, advisory, release or evidence changes.

## 3. Required evidence and metadata

Each accepted exception record must contain:

- Exact GHSA identifier and package name matching the Dependabot alert.
- A repository-relative path to a real CycloneDX 1.6 VEX document.
- A matching vulnerability entry with `analysis.state = not_affected`.
- A recognized CycloneDX justification, a substantive analysis detail and an affected-component purl.
- A human-readable evidence summary of at least 20 characters.
- The actual reviewer/approver and review date.
- An expiry date no more than 90 days after review.

The VEX document must identify the project/release, component, vulnerability, statement timestamp and evidence. Do not use template placeholders, example GHSA identifiers, fabricated reviewers or generic statements as production evidence.

## 4. Exception approval, expiry and revocation

1. Triage the advisory and identify the exact package/version and affected project scope.
2. Gather reproducible evidence (for example, component inventory, configuration, call-path/reachability analysis, feature state and applicable vendor advisory).
3. If the finding is genuinely not applicable, prepare a CycloneDX VEX document and matching exception-register entry.
4. Have the repository owner review the evidence, justification, compensating controls and expiry. Record the actual reviewer and date; do not imply independent review when none occurred.
5. Run `ruby scripts/validate-vex.rb` and `ruby tests/vex_validator_test.rb`. The Dependabot alert gate also validates every exception before it can be considered.
6. Set expiry at the earliest reasonable date, never more than 90 days after review. Reassess before expiry and renew only with fresh evidence and a new review date.
7. Remove or revoke the exception immediately if evidence changes, the component becomes affected, the advisory is updated, the component/version changes, the scope no longer matches, or the exception expires.

An expired, malformed, mismatched or unsupported exception fails closed. A revoked exception must be removed from the active register; preserve the decision history in an appropriate private record when disclosure would expose sensitive details.

## 5. Malware and other non-exceptionable findings

Dependabot malware alerts always block; they must never be suppressed by a VEX exception. A VEX exception is not a license waiver, a risk acceptance for an exploitable vulnerability, or permission to ignore a security policy. Critical/High findings remain subject to the SCA policy and release block requirements.

## 6. Validation and test coverage

The repository runs a Ruby standard-library validator against the exception register and referenced CycloneDX documents. Unit tests exercise valid records and rejection of expired, malformed, mismatched and non-`not_affected` exceptions. The validator does not create VEX statements, decide exploitability or replace human evidence review.

The dependency alert workflow independently queries general and malware classifications. The VEX register can exempt only a matching, current general Dependabot alert. Malware alerts always block. GitHub's documented limitation for malware detection on full-SHA GitHub Actions references remains a separate owner-side release review.

## 7. Storage and publication

Store real VEX statements under `docs/vex/` and link them from the relevant security advisory or release notes. Do not publish private vulnerability details before coordinated disclosure is appropriate. A template or illustrative example is not evidence that a real vulnerability has been assessed. The repository currently has zero accepted exceptions; no real non-exploitable advisory is asserted by this process document.
