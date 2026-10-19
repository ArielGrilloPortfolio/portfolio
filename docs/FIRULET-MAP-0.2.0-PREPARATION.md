# FIRULET MAP 0.2.0 — prepared, not deployed

User approved the page and both guides on 2026-10-19 and explicitly authorized
commit/push in both repositories. The existing main-push Action deploys the site.
Binary transfer to VPS remains pending and is performed by the user using the
commands below. No claim of complete download publication before that step.
No workflow or Nginx configuration change is needed.

## Assets

Local release: `C:/Code/spec-driven-creation/firulet-map/.local/releases/v0.2.0/`.
VPS upload staging: `.local/release-assets/firulet-map/v0.2.0/` (ignored).

- `FiruletMap-0.2.0-win-x64.zip`: 189675854 bytes; SHA256 `0b499e07650222afa35955043fd1a1c1b07cb544a157c8c7ec2c3468c9ffe330`.
- `FiruletMap-0.2.0-win-x64-installer.zip`: 177589794 bytes; SHA256 `05d61f23ba7678a0d72dda7618fa76a82a1c415aa57a80b6620010dd5886870c`.

The portable is byte-for-byte the previously approved package. Installer ZIP
contains the approved setup EXE (SHA256
5ed36a9398327ebdf2d6b93164a0362f672d437b84dff1813e895b920fe3fe7b),
its sidecar, bilingual first steps, both guides and both release notes.
Guide PDFs/notes are also website assets. No source/test WAV or MIDI distributed.

Prepared routes:

- `/downloads/firulet-map/v0.2.0/FiruletMap-0.2.0-win-x64.zip`
- `/downloads/firulet-map/v0.2.0/FiruletMap-0.2.0-win-x64-installer.zip`
- Both routes plus `.sha256` for checksums.
- `/firulet-map/guides/FIRULET-MAP-0.2.0-guide-ES.pdf` and `...-EN.pdf`.
- `/firulet-map/changelog.html`, plus release notes linked from product/history.

## Local review

`python tooling/scripts/preview-firulet-release.py --port 4338`

Open http://127.0.0.1:4338/firulet-map/#descargas . Preview maps downloads to local
staging, with directory listing off. Both cards/history reviewed on desktop;
mobile viewport not independently tested. Twenty local product/history links
return200. ZIP lengths, valid ZIP media type, attachment headers, sidecars and
wrapper CRC/setup hash checked. Windows preview uses application/x-zip-compressed;
production Nginx explicitly serves application/zip. Both six-page PDFs rendered,
reviewed and feedback URI annotations checked. Exact verification in firulet-map
`docs/releases/v0.2.0/preparation-verification.json`.

Google Form remains unchanged. Ask testers for0.2.0 (Other if absent) and portable
or installer in comments. Do not include test response FM-TEST-20261019-01 in metrics.

## Publication follow-up

1. Transfer the staging directory's two ZIPs and helper
   `install-firulet-release-0.2.0.sh` to a VPS folder such as
   `$HOME/firulet-map-v0.2.0/` using WinSCP/PSCP/SFTP.
2. Verify without writes on the VPS:

```sh
bash "$HOME/firulet-map-v0.2.0/install-firulet-release-0.2.0.sh" "$HOME/firulet-map-v0.2.0" --verify-only
```

3. Install the two files under the existing Nginx download alias, without altering
   old0.1.0 assets. This is the publication action; do not run during preparation:

```sh
sudo bash "$HOME/firulet-map-v0.2.0/install-firulet-release-0.2.0.sh" "$HOME/firulet-map-v0.2.0"
```

The helper pins both hashes, verifies both inputs before writes, refuses different
existing versioned archives, copies atomically per file and writes checksum
sidecars. It does not deploy the site or reload Nginx.

4. Portfolio main push is now explicitly authorized by user and will trigger the
   existing Action. Until the user uploads the two ZIPs, new download links may
   return404; complete the transfer promptly. Site deploy and ZIP upload are
   separate operations.
5. Verify both public ZIP downloads/hashes/content type/attachment/byte ranges,
   PDF links, notes, card navigation and feedback link. Record actual outcomes
   and publication status; do not reuse local results as production evidence.

Historical0.1.0 publication evidence stays in FIRULET-MAP-RELEASE.md.
