# VEX statement registry

Store one CycloneDX 1.6 VEX JSON document per real non-exploitable vulnerability assessment in this directory.

The repository currently has **zero accepted VEX exceptions**. The machine-readable register at `.github/dependabot-vex-exceptions.json` is intentionally empty.

## Adding an exception

1. Triage a real Dependabot general vulnerability alert and identify the exact GHSA, package/version and affected project scope.
2. Create a CycloneDX 1.6 document based on [template.cdx.json](template.cdx.json). Replace every placeholder with actual project, release, component purl, advisory, analysis and evidence.
3. Use `analysis.state = not_affected` only with a recognized justification and evidence for the exact project/component/version. Do not infer non-impact from the absence of a runtime alone.
4. Add a matching record to `.github/dependabot-vex-exceptions.json`, including the exact GHSA ID, package name, VEX path, evidence summary, actual reviewer, review date and expiry.
5. Set expiry no more than 90 days after review. The Ruby validator checks record structure, document linkage, justification, evidence fields and expiry. The Dependabot gate independently validates the exception before it can suppress a matching general alert.
6. Reassess before expiry. Renew only after fresh evidence and a new review. Remove the exception immediately when its scope or evidence is no longer valid.

## Fail-closed handling

- Expired, malformed, placeholder, duplicate, mismatched or unsupported exceptions fail validation.
- Only a matching `not_affected` statement can exempt a general Dependabot alert.
- Malware alerts always block and can never be excepted through VEX.
- `affected`, `fixed` and `under_investigation` statements do not suppress alerts.
- A VEX exception is not a license waiver or permission to ignore remediation deadlines.
- The validator checks structure and matching metadata; it cannot prove the truth of exploitability evidence. The owner remains accountable for the technical decision.

Run locally:

```sh
ruby scripts/validate-vex.rb
ruby tests/vex_validator_test.rb
```

A template, placeholder advisory or unsupported assertion is never an acceptable exception.
