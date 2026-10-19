#!/usr/bin/env bash
# Manual VPS operation only. Never invoked by CI; --verify-only performs no writes.
set -euo pipefail
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo 'Usage: sudo bash install-firulet-release-0.2.0.sh /path/to/release-dir [--verify-only]' >&2; exit 2
fi
verify_only=false
if [ "$#" -eq 2 ]; then
  [ "$2" = '--verify-only' ] || { echo 'Unknown option' >&2; exit 2; }
  verify_only=true
fi
source_dir=$(realpath -- "$1")
target='/srv/firulet-map/releases/v0.2.0'
names=('FiruletMap-0.2.0-win-x64.zip' 'FiruletMap-0.2.0-win-x64-installer.zip')
hashes=('0b499e07650222afa35955043fd1a1c1b07cb544a157c8c7ec2c3468c9ffe330' '05d61f23ba7678a0d72dda7618fa76a82a1c415aa57a80b6620010dd5886870c')
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
