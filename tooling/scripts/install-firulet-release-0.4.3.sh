#!/usr/bin/env bash
# Manual VPS operation only. Never invoked by CI; --verify-only performs no writes.
set -euo pipefail
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo 'Usage: sudo bash install-firulet-release-0.4.3.sh /path/to/release-dir [--verify-only]' >&2; exit 2
fi
verify_only=false
if [ "$#" -eq 2 ]; then
  [ "$2" = '--verify-only' ] || { echo 'Unknown option' >&2; exit 2; }
  verify_only=true
fi
source_dir=$(realpath -- "$1")
target='/srv/firulet-map/releases/v0.4.3'
names=('FiruletMap-0.4.3-win-x64.zip' 'FiruletMap-0.4.3-win-x64-installer.zip')
hashes=('38eba26ba6da2387862bda1c2f8dd427132d4dc5a8e9777b20684f619e314659' '5c43951e35b55519893113b88669d2bb1d955deb1a48d185da28b3c01886a75c')
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
