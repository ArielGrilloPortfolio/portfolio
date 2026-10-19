#!/usr/bin/env bash
# Run manually on the web server AFTER transferring the approved ZIP. Not CI.
set -euo pipefail
if [ "$#" -ne 1 ]; then
  echo 'Usage: sudo bash install-firulet-download.sh /path/to/FiruletMap-0.1.0-win-x64.zip' >&2
  exit 2
fi
source_zip=$(realpath -- "$1")
name='FiruletMap-0.1.0-win-x64.zip'
expected='46bc1890aa8e590362952a9a67aeacb76cb66fe5e1cda29d24fcadd89f77ced5'
target='/srv/firulet-map/releases/v0.1.0'
actual=$(sha256sum -- "$source_zip" | cut -d ' ' -f 1)
if [ "$actual" != "$expected" ]; then
  echo 'Checksum mismatch: refusing to publish this archive.' >&2
  exit 1
fi
install -d -m 755 -- "$target"
if [ -e "$target/$name" ]; then
  existing=$(sha256sum -- "$target/$name" | cut -d ' ' -f 1)
  if [ "$existing" != "$expected" ]; then
    echo 'A different archive already exists; refusing to overwrite.' >&2
    exit 1
  fi
else
  temporary=$(mktemp "$target/.upload.XXXXXX")
  trap 'rm -f -- "$temporary"' EXIT
  install -m 644 -- "$source_zip" "$temporary"
  copied=$(sha256sum -- "$temporary" | cut -d ' ' -f 1)
  [ "$copied" = "$expected" ] || { echo 'Copy verification failed.' >&2; exit 1; }
  mv -- "$temporary" "$target/$name"
  trap - EXIT
fi
printf '%s  %s\n' "$expected" "$name" > "$target/$name.sha256"
chmod 644 "$target/$name.sha256"
echo 'ZIP and checksum ready. Nginx/site deployment is a separate operation.'
