# FIRULET MAP 0.5.25 — local preparation only

Full desktop UAT accepted2026-10-24;20min human review recorded in app backlog.
Site/source remains on local branch `codex/firulet-map-0.5.25-release`.
`main` unchanged at b0d4c6b806e68791f9b5059e7b79888aeabdef9f; pushing main
triggers deployment and is NOT authorized yet. No Git push, SSH/VPS mutation or
public publication verification performed during this preparation.

Preview: http://127.0.0.1:4343/firulet-map/ (loopback only).
Both ZIPs/checksums staged under `.local/release-assets/firulet-map/v0.5.25`.
Guides ES/EN, notes, history, product/portfolio copy and manual VPS helper updated.
Local links and full streamed ZIP hashes checked; old0.4.3 assets/history retained.
Application release evidence: app repo `docs/releases/v0.5.25/`.

Before publication: user reviews site/guides/packages and installation/update;
then explicitly authorizes publishing main and uploads to VPS. The helper
`tooling/scripts/install-firulet-release-0.5.25.sh` pins both ZIP hashes; its
`--verify-only` mode writes nothing. Later run public HTTP content/hash verification.
No claim of clean-Windows testing, signing or automatic updates.


## Acceptance and publication authorization — 2026-10-24

User accepts guides and website, authorizes commit/push both repositories and
portfolio main deployment. The earlier preparation-only gate is superseded.
ZIP upload/public download verification and installation/update acceptance are
still pending. Deployment is triggered by authorized main push; do not infer
complete release publication from web deployment alone. VPS upload commands
use root@217.160.228.106:/root and the versioned checksum-pinned helper.
