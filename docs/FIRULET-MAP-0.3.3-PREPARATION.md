# FIRULET MAP 0.3.3 — local preparation only

Status: published and verified on2026-10-21. Authorized main commit00f13c0 deployed successfully in Action39616659514. User uploaded both ZIPs and ran the checksum/publication helper; full public HTTPS identities and HTTP206 ranges match.
FiruletMap Full UAT approved; release ZIPs rebuilt from accepted application source.
Portfolio changes include both download cards, seven-page ES/EN PDFs, MIDI/synth/
waveform features and limits, release notes, history and homepage card.

Preview: http://127.0.0.1:4341/firulet-map/#descargas
Source release: C:/Code/spec-driven-creation/firulet-map/.local/releases/v0.3.3/
Staged binaries: .local/release-assets/firulet-map/v0.3.3/ (ignored).
Exact hashes: frontend/firulet-map/releases/v0.3.3/release-assets.json.
Previous release assets/links kept; no source recordings included. Form unchanged.

Local product/history links and PDF hashes checked; desktop preview reviewed.
See firulet-map docs/evaluation/iteration-3-session-4 and docs/releases/v0.3.3.
Installer upgrade/lifecycle still requires admin testing: automated probe was
refused before modifying Program Files; existing0.2.0 install unchanged.

## Completed publication procedure — retained for maintenance

1. Transfer the two ZIPs and tooling/scripts/install-firulet-release-0.3.3.sh
   to a VPS staging folder, e.g. $HOME/firulet-map-v0.3.3, using WinSCP/PSCP/SCP.
   VPS217.160.228.106. Completed by the user on2026-10-21.
2. Verify without writes:

```sh
bash "$HOME/firulet-map-v0.3.3/install-firulet-release-0.3.3.sh" "$HOME/firulet-map-v0.3.3" --verify-only
```

3. When publication is authorized, install files under the existing Nginx alias:

```sh
sudo bash "$HOME/firulet-map-v0.3.3/install-firulet-release-0.3.3.sh" "$HOME/firulet-map-v0.3.3"
```

The helper checks both inputs first, refuses different existing files and copies
atomically per archive. It publishes binaries/sidecars; no Nginx/site reload.
4. Only after assets and site review, authorize portfolio main push, which triggers
   the existing deployment Action. Deployment was explicitly authorized; Action39616659514 completed successfully.
5. Verify public download bytes/hashes/content type/attachment/ranges, PDFs,
   release notes, history and feedback links. Record actual publication evidence;
   do not reuse local checks as production success.

Portable189702818bytes; installer ZIP187427910bytes. Published0.1.0/0.2.0
archives must retain their exact bytes. No automatic updater or digital signing.

Public verification evidence: docs/FIRULET-MAP-0.3.3-PUBLIC-VERIFICATION.json.
Previous queued API snapshots are historical; latest workflow result is success.
User subsequently validates installation/update and accepts deliverables. I3:S4 and iteration3 closed; no new uninstall/reinstall or clean-host test inferred.
Published archives/PDFs are immutable; this documentation update changes no ZIP.

Final acceptance2026-10-21: installation/update and deliverables approved.
Earlier pending lifecycle statements describe preparation, not current acceptance.
