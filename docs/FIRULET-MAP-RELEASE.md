# FIRULET MAP 0.1.0 - published and verified

Status: published with explicit user approval on 2026-10-19. Portfolio page,
guides, feedback form and original portable archive are publicly available.

## Public links

- [Product page](https://www.arielgrillo.es/firulet-map/).
- [Portable ZIP](https://www.arielgrillo.es/downloads/firulet-map/v0.1.0/FiruletMap-0.1.0-win-x64.zip).
- [SHA256 sidecar](https://www.arielgrillo.es/downloads/firulet-map/v0.1.0/FiruletMap-0.1.0-win-x64.zip.sha256).
- [Spanish guide](https://www.arielgrillo.es/firulet-map/guides/FIRULET-MAP-0.1.0-guide-ES.pdf).
- [English guide](https://www.arielgrillo.es/firulet-map/guides/FIRULET-MAP-0.1.0-guide-EN.pdf).
- [Feedback form](https://docs.google.com/forms/d/e/1FAIpQLSff61AyI7QJ6uKt__DELQNoMDd3qc9uB71tVndK2lcOV4g_0w/viewform?usp=header).

The page links to the respondent form, never the editor or private response sheet.
No corpus WAV is distributed. The diagram is explicitly an illustration.

## Published artifact and verification

ZIP: 190005419 bytes; SHA256:
`46bc1890aa8e590362952a9a67aeacb76cb66fe5e1cda29d24fcadd89f77ced5`.

The user transferred the approved ZIP to their Ubuntu VPS and ran
`tooling/scripts/install-firulet-download.sh`. Nginx serves it from
`/srv/firulet-map/releases/v0.1.0/`, outside the Git checkout. Local staging:
`.local/release-assets/firulet-map/v0.1.0/` (ignored). Do not commit the ZIP.

Verified over public HTTPS on 2026-10-19:

- Full archive downloaded into a streaming SHA256 calculation: exact byte count
  and original hash match. No engine/package changes.
- Content-Type application/zip; Content-Disposition attachment.
- Public checksum sidecar matches.
- Range bytes=0-3 returns 206, Content-Range bytes 0-3/190005419 and ZIP magic PK.
- Product page serves the correct title and published feedback link. Both guides
  return 200 and actual PDF bytes; homepage card navigation visually reviewed.

This is transport/identity verification, not new application acceptance on a clean
machine. Mobile CSS exists; narrow-viewport rendering has not been independently
checked. Response retention/contact information remains a follow-up decision.

## Deployment history and routing defect PORTFOLIO-FM-001

- fb91fdc: card, page, guides and download setup; Actions run 39297812022 success.
- Initial /firulet-map/ incorrectly returned the root SPA homepage. The explicit
  /firulet-map/index.html and PDFs worked. Recorded before correction.
- fb4ad2b: exact-match Nginx directory routing fix; run 39297940754 success.
  Public slash URL subsequently verified with correct title and feedback link.
- Before binary transfer, the download returned 404 as intended. After the user
  ran the installer, full download/hash/sidecar/range checks above passed.

Workflow uses existing SSH secrets HOST/USERNAME/PASSWORD/PORT. No expired token
was demonstrated; both code deployments succeeded. Every main push runs the
existing deployment action. No credentials were added to source or docs.

## Maintenance

For this exact approved archive, the server installation command is:

```sh
sudo bash /var/www/portfolio/tooling/scripts/install-firulet-download.sh "$HOME/FiruletMap-0.1.0-win-x64.zip"
```

The script verifies the pinned hash, installs atomically and refuses a differing
archive at the same version path. It does not reload Nginx. Never overwrite 0.1.0
with a different release: update version, artifact hash, staging and links together.
Nginx download location has no SPA fallback and directory listing is disabled.

Local preview: `python -m http.server 4337 --bind 127.0.0.1 --directory frontend`.
The plain static preview does not implement the production download alias and
returns 404 for the ZIP. Product links/PDFs and ZIP identity were checked locally;
server script passed `bash -n`; production delivery was checked separately above.

Feedback test `FM-TEST-20261019-01` reached row 2 in the private linked spreadsheet.
Exclude it from all real feedback counts and metrics; it remains for traceability.
