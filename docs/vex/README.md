# VEX statement registry

Store one CycloneDX 1.6 VEX JSON document per real non-exploitable vulnerability assessment in this directory.

The repository currently has **no accepted VEX exceptions**. The machine-readable register at `.github/dependabot-vex-exceptions.json` is intentionally empty.

To add an exception:

1. Create a CycloneDX VEX document based on [template.cdx.json](template.cdx.json).
2. Replace all placeholders with a real advisory, component purl, affected project/release, evidence-based analysis and review metadata.
3. Use `analysis.state = not_affected` only when the evidence supports that conclusion.
4. Add a matching record to `.github/dependabot-vex-exceptions.json` with the exact GHSA ID, package name, VEX path, evidence summary and an expiry date no more than 90 days away.
5. The dependency policy gate validates the record, document, GHSA identifier, not-affected state, justification and evidence. Expired or incomplete exceptions do not bypass the gate.
6. Reassess before expiry and remove the exception when the vulnerability is fixed, becomes applicable or no longer needs tracking.

A template, placeholder advisory or unsupported assertion is never an acceptable exception.
