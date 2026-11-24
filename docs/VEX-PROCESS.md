# Vulnerability Exploitability eXchange (VEX) Process

## 1. Purpose

Use VEX to communicate why a known vulnerability in an identified software component does not affect a specific project/release. VEX is not a substitute for remediation when a component is affected, and it must not be used to suppress an alert without evidence.

## 2. Current status

No real non-exploitable vulnerability statement is asserted by this document. The repository's Dependency Graph SBOM is a point-in-time dependency inventory, not a complete inventory of every runtime or build component. If a relevant advisory is identified, the owner must create a release- or commit-scoped VEX statement before classifying it as not affected.

## 3. Required statement fields

Each VEX statement must identify:

- A unique statement/document identifier and creation timestamp.
- The project and affected release or commit.
- The component using a stable package URL (purl) or other unambiguous identifier.
- The vulnerability identifier (for example, a GHSA or CVE).
- The status: affected, not affected, fixed or under investigation.
- A justification and evidence supporting the status.
- Any impact statement, mitigation, remediation plan and expiry/review date.
- The person or process responsible for the assessment.

## 4. Assessment rules

- Use **not affected** only when evidence supports non-reachability, absence of vulnerable code, or another recognized non-exploitability rationale.
- Use **affected** when the vulnerable component is present and the vulnerability is applicable.
- Use **under investigation** when evidence is incomplete.
- Use **fixed** only after a fixed component version or effective remediation is included and verified.
- Reassess when the component version, configuration, usage path or vulnerability advisory changes.

## 5. Illustrative example — not a real advisory

The following is a conceptual example only and must never be submitted as an actual project VEX statement:

```text
Vulnerability: GHSA-EXAMPLE-0000-0000 (placeholder; not a real advisory)
Component: pkg:generic/example-component@1.0.0 (placeholder)
Project release: profile-docs-YYYY.MM.DD.N (placeholder)
Status: not_affected
Justification: vulnerable_code_not_in_execute_path
Evidence: [link to a real code/configuration analysis]
Reviewed by: [actual reviewer]
Reviewed on: [UTC date]
Expires/reassess by: [UTC date]
```

## 6. Storage and publication

Store real VEX statements under `docs/vex/` and link them from the relevant security advisory or release notes. Do not publish private vulnerability details before coordinated disclosure is appropriate. A template or illustrative example is not evidence that a real vulnerability has been assessed.
