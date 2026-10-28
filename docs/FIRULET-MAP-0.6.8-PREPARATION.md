# FIRULET MAP 0.6.8 - prepared, not deployed

The branch `codex/firulet-map-0.6.8-release` contains the website, release history, 11-page ES/EN guides, release notes, metadata and versioned VPS helper. Production `main` remains on 0.5.26 until the new ZIP upload. Binaries are staged in ignored `.local/release-assets/` and are not committed.

Accepted application source: `ac4916ff88ba759d13064c5c410576bf7f27534e`.
Local release: `C:/Code/spec-driven-creation/firulet-map/.local/releases/v0.6.8/`.
Preview: http://127.0.0.1:4342/firulet-map/#descargas

Transfer the two ZIPs and the local `install-firulet-release-0.6.8.sh` helper to `/root/`. Do not assume the helper is in the server's main checkout yet. The helper pins both SHA256 values and refuses changed overwrites; `--verify-only` performs no writes.

After upload/helper execution, verify the public ZIPs and merge this branch into main under the existing website-update request. This avoids broken new download links before the files exist. Public download verification, installation/upgrade and deliverable acceptance remain separate release gates.

Local checks: 34 internal links, exact guide bytes, download sizes/checksums, desktop download-card layout and notes reviewed. No public deployment is inferred from local preview or branch push.
