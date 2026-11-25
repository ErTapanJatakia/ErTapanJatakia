# Network Transport and Certificate Verification Review

**Review date:** 2026-11-25  
**Scope:** Network calls made by repository-maintained automation and source/configuration tooling. The Ruby VEX and DCO validators themselves do not make network requests.

## Network interface inventory

| Client / interface | Destination and purpose | Transport baseline | Certificate verification |
|---|---|---|---|
| curl in SBOM workflow | GitHub Dependency Graph API and temporary GitHub SBOM download | HTTPS-only; explicitly requires TLS 1.2 or later with --proto '=https' and --tlsv1.2 | curl/libcurl peer and hostname verification remain enabled by default; no insecure override is used |
| curl in QA workflow | Official GitHub actionlint release archive | HTTPS-only; explicitly requires TLS 1.2 or later with --proto '=https' and --tlsv1.2 | curl/libcurl peer and hostname verification remain enabled by default; archive SHA-256 is checked after download |
| Git / GitHub HTTPS | Repository fetch, push and release operations | GitHub HTTPS endpoints; Git uses its TLS-capable HTTPS transport | Git/libcurl certificate verification remains enabled by default; no sslVerify=false or GIT_SSL_NO_VERIFY override is configured |
| GitHub CLI | GitHub REST API, releases and artifact attestations | GitHub HTTPS endpoints; Go TLS client baseline supports TLS 1.2 or later | Go's standard HTTP/TLS client verifies server certificates by default |
| npm / npx | Pinned QA tools from the npm registry | HTTPS; supported Node.js TLS stack | Node.js TLS certificate verification is enabled by default; no strict-ssl=false or TLS verification bypass is configured |
| GitVerse mirror | Secondary Git remote | SSH with pinned host-key verification, not TLS | SSH host-key verification is strict; the mirror does not use unauthenticated HTTP |

## Security controls

- All maintained curl requests explicitly restrict the protocol to HTTPS and require TLS 1.2 or later.
- curl's default peer and hostname verification is retained.
- Git, GitHub CLI and Node.js use their standard TLS implementations and certificate-verification defaults; the repository does not disable those checks.
- Private authorization headers are sent only through the established TLS/HTTPS client path; the TLS handshake and certificate verification occur before HTTP request headers are transmitted.
- The workflow configuration validation checks that every maintained curl invocation retains HTTPS-only/TLS 1.2 options and rejects known certificate-verification bypass settings.
- The SBOM workflow additionally validates the downloaded SPDX document and checks its checksum; the actionlint archive is checked against a pinned SHA-256 digest.
- GitVerse uses SSH with strict host-key checking rather than TLS.

## Verification and limitations

The review covers repository-maintained network calls and their client configuration. GitHub-hosted Actions, GitHub REST services and npm registry infrastructure remain external dependencies; their server-side TLS policies are not implemented by this repository. Reassess when a new destination, client, proxy, custom CA, TLS library or authentication-header path is introduced.

## Review history

- 2026-11-25: Reviewed the current network interface inventory and added explicit TLS 1.2+ and HTTPS-only options to all maintained curl requests. Certificate verification remains enabled using the standard client defaults.
