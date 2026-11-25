# Temple 0.2.2 — publication prepared

Status: local package and website prepared; user upload, public verification and website activation pending. The existing distribution procedure is docs/firulet-map-publication.md. No binaries were rebuilt: the verified 0.2.2 installer is reused exactly.

ZIP: 8,073,285 bytes. SHA256: 41705abb8c02ca9f1f2f397618c5ef4b52af0892beb8aedebfbb5af8eff74097.

## Upload from Windows PowerShell

```powershell
$releaseDir = 'C:\Code\portfolio\.local\release-assets\temple\v0.2.2'
scp "$releaseDir\Temple-0.2.2-win-x64-installer.zip" "$releaseDir\Temple-0.2.2-win-x64-installer.zip.sha256" "$releaseDir\install-temple-release-0.2.2.sh" root@217.160.228.106:/root/
ssh root@217.160.228.106
```

## On the VPS

```bash
bash /root/install-temple-release-0.2.2.sh /root --verify-only
bash /root/install-temple-release-0.2.2.sh /root
```

The helper verifies pinned ZIP and sidecar hashes and installs only into /srv/firulet-map/releases/temple/v0.2.2/. It refuses differing existing files. Earlier releases and Brasa are preserved. The helper does not configure Nginx or activate the website.

## After upload confirmation

The assistant must download and verify the complete public ZIP and sidecar using the current alias:
https://www.arielgrillo.es/downloads/firulet-map/temple/v0.2.2/Temple-0.2.2-win-x64-installer.zip

Only after that check, apply the prepared website from .local/release-assets/temple/v0.2.2/website: new temple/ tree, portfolio index and Deploy/portfolio_fe.config. Compare current frontend with baseline 2fce5d655f06da304b8002565c95d1b9278cf7fc first; merge the small Temple card/routes if it changed, rather than overwriting newer work. Commit/push through the existing deployment workflow, then verify /temple/, redirects, canonical download full hash/sidecar/range and missing-file404. No new transfer Actions or hosting provider.

The English product page uses the actual 1400x910 editor screenshot, CLEAN/GLUE explanations, detector/link/mix controls, Delta, Level Match, resizing, installation guide and development-candidate status. It does not claim completed broad listening qualification. The website is staged, not publicly published. Local artifact checks and file hashes are recorded in TEMPLE-0.2.2-LOCAL-VERIFICATION.json.

## Upload confirmed and public ZIP verified — 2026-11-25

The user confirmed the manual VPS upload and helper execution. Full HTTPS ZIP, exact installer hash, ZIP CRC and sidecar passed. Prepared website hashes and unchanged frontend baseline were verified before applying the new Temple page, portfolio card and Nginx routes. Deployment verification follows after the authorized main push.
