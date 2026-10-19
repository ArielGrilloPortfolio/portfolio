# FIRULET MAP 0.1.0 - prepared website release

Status: local preparation only. Do not push to main until publication is
authorized: `.github/workflows/ci-cd.yml` deploys automatically on a main push.
No workflow run, SSH connection or server changes performed for this preparation.

## Included

- Portfolio personal-project card links to `/firulet-map/`.
- Static product page, local icon and both PDF guides (already contain feedback
  links). Explanatory map graphic is explicitly an illustration, not a screenshot.
- Public Google Forms respondent URL, not the editor or private response sheet.
- Download URL:
  `/downloads/firulet-map/v0.1.0/FiruletMap-0.1.0-win-x64.zip`.
- Local ZIP and checksum staging:
  `.local/release-assets/firulet-map/v0.1.0/` (ignored by Git).
- Archive SHA256:
  `46bc1890aa8e590362952a9a67aeacb76cb66fe5e1cda29d24fcadd89f77ced5`.
- Nginx route `/downloads/firulet-map/` maps to `/srv/firulet-map/releases/`,
  outside the Git checkout. Missing binaries return 404, never the SPA HTML.
  Listing disabled; files delivered as attachments. HTTPS remains unchanged.

The ZIP is 190005419 bytes. Do not commit it to Git or upload any corpus WAV.
The existing portable remains unchanged; no sample recording is distributed.

## Future publication order - not executed

1. Obtain explicit deployment approval. Confirm SSH access with the server
   administrator. Workflow currently uses HOST/USERNAME/PASSWORD/PORT secrets;
   no expired token has been demonstrated.
2. Transfer the approved ZIP to a temporary location on the web server using
   the established secure channel. Do not place credentials in source/docs.
3. Run on the server:

   ```sh
   sudo bash /path/to/install-firulet-download.sh /path/to/FiruletMap-0.1.0-win-x64.zip
   ```

   Use `tooling/scripts/install-firulet-download.sh` from this checkout. It checks
   the pinned archive hash before installing into `/srv/firulet-map/releases/v0.1.0`,
   refuses a differing existing archive and stages the copy before renaming.
   It creates the checksum sidecar; it does not reload Nginx or deploy the site.
   The web server needs traversal/read access to that directory. No Python/.NET
   install is needed on the web server; it only serves a file.
4. Once assets are ready, review and authorize publishing the portfolio changes.
   A push to main triggers the existing action: git pull, Nginx config copy,
   `nginx -t` and reload. No workflow modifications are part of this change.
5. Verify HTTPS homepage/card, `/firulet-map/`, both guides, Forms link, ZIP and
   checksum. ZIP Content-Type must be application/zip; downloaded hash must match.
   Check missing binary URL returns 404 and a byte-range request returns 206.
   Missing downloads must never produce the homepage or a 200 HTML response.

## Local preview

From `frontend`: `python -m http.server 4337 --bind 127.0.0.1`.
Open `http://127.0.0.1:4337/firulet-map/` and the homepage personal-project section.
Use a narrow window to review mobile layout. This plain static preview does not
implement the server download alias: its download URL returns 404 until a real
Nginx deployment and separate asset transfer are approved. This is intentional;
do not claim a local static-server preview verifies production delivery.

The server installer and Nginx config require host-side validation before launch.
Public hostname, current secrets and server filesystem have not been modified.

## Preparation checks performed

- Existing repository was clean before editing; main push workflow unchanged.
- Desktop browser rendering reviewed for product page, guides/feedback section
  and homepage card; card-to-product navigation works. Mobile CSS included;
  a narrow-viewport render has not been independently checked.
- Local anchors, local file targets and back links verified. Both PDF endpoints
  return 200 with PDF content and match the approved guide files by SHA256.
- Staged local ZIP matches the pinned release hash. Plain static preview download
  returns a truthful 404; this does not validate the production Nginx alias.
- Server installer script passed Git Bash `bash -n`; it was not executed on a
  server. Nginx is unavailable locally: `nginx -t`, HTTP range/attachment headers
  and the production filesystem alias remain host-side publication checks.
- No commit, push, workflow dispatch, server upload or production modification.
