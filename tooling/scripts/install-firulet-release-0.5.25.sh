#!/usr/bin/env bash
# Manual VPS operation only. Never invoked by CI; --verify-only performs no writes.
set -euo pipefail
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo 'Usage: sudo bash install-firulet-release-0.5.25.sh /path/to/release-dir [--verify-only]' >&2; exit 2
fi
verify_only=false
if [ "$#" -eq 2 ]; then
  [ "$2" = '--verify-only' ] || { echo 'Unknown option' >&2; exit 2; }
  verify_only=true
fi
source_dir=$(realpath -- "$1")
target='/srv/firulet-map/releases/v0.5.25'
names=('FiruletMap-0.5.25-win-x64.zip' 'FiruletMap-0.5.25-win-x64-installer.zip')
hashes=('c386bf5445f2e41879c0655a606e5baaba4bb14865e4b83235cd3ba2f822fb82' '56a6e956eaf1cfc930464aec3396ea8f84ff5a19f9d1b486c30139e46670fed6')
for i in "${!names[@]}"; do
  name=${names[$i]}; expected=${hashes[$i]}
  actual=$(sha256sum -- "$source_dir/$name" | cut -d ' ' -f 1)
  [ "$actual" = "$expected" ] || { echo "Checksum mismatch: $name" >&2; exit 1; }
done
if "$verify_only"; then echo 'Both ZIP checksums match; no files written.'; exit 0; fi
for i in "${!names[@]}"; do
  if [ -e "$target/${names[$i]}" ]; then
    existing=$(sha256sum -- "$target/${names[$i]}" | cut -d ' ' -f 1)
    [ "$existing" = "${hashes[$i]}" ] || { echo 'Different archive exists; refusing overwrite.' >&2; exit 1; }
  fi
done
install -d -m 755 -- "$target"
for i in "${!names[@]}"; do
  name=${names[$i]}; expected=${hashes[$i]}
  if [ ! -e "$target/$name" ]; then
    temporary=$(mktemp "$target/.upload.XXXXXX")
    trap 'rm -f -- "$temporary"' EXIT
    install -m 644 -- "$source_dir/$name" "$temporary"
    copied=$(sha256sum -- "$temporary" | cut -d ' ' -f 1)
    [ "$copied" = "$expected" ] || { echo 'Copy verification failed.' >&2; exit 1; }
    mv -- "$temporary" "$target/$name"
    trap - EXIT
  fi
  printf '%s  %s\n' "$expected" "$name" > "$target/$name.sha256"
  chmod 644 "$target/$name.sha256"
done
echo 'Both ZIPs ready. Website deployment and public verification are separate.'
