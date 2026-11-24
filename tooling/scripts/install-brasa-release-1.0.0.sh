#!/usr/bin/env bash
# Manual user operation only. Uses existing download storage; never run by CI.
set -euo pipefail
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo 'Usage: bash install-brasa-release-1.0.0.sh /uploaded-directory [--verify-only]' >&2
  exit 2
fi
verify_only=false
if [ "$#" -eq 2 ]; then
  [ "$2" = '--verify-only' ] || { echo 'Unknown option' >&2; exit 2; }
  verify_only=true
fi
source_dir=$(realpath -- "$1")
target='/srv/firulet-map/releases/brasa/v1.0.0'
names=('Brasa-1.0.0-win-x64-installer.zip' 'Brasa-1.0.0-win-x64-installer.zip.sha256')
hashes=('327ed1cf0674a07b4e1ae27593579564ae5ad972f19b0898610d63767da00b87' 'ef1842092311268614c5a98b61d6f2eafccd44f4d841e53466febaf9f9e291b5')
for i in "${!names[@]}"; do
  actual=$(sha256sum -- "$source_dir/${names[$i]}" | cut -d ' ' -f 1)
  [ "$actual" = "${hashes[$i]}" ] || { echo "Checksum mismatch: ${names[$i]}" >&2; exit 1; }
done
if "$verify_only"; then echo 'Archive and sidecar verified; no files written.'; exit 0; fi
for i in "${!names[@]}"; do
  path="$target/${names[$i]}"
  if [ -e "$path" ]; then
    [ -f "$path" ] && [ ! -L "$path" ] || { echo 'Unexpected target type; refusing overwrite.' >&2; exit 1; }
    existing=$(sha256sum -- "$path" | cut -d ' ' -f 1)
    [ "$existing" = "${hashes[$i]}" ] || { echo 'Different release file exists; refusing overwrite.' >&2; exit 1; }
  fi
done
install -d -m 755 -- "$target"
for i in "${!names[@]}"; do
  if [ ! -e "$target/${names[$i]}" ]; then
    temporary=$(mktemp "$target/.brasa-upload.XXXXXX")
    trap 'rm -f -- "$temporary"' EXIT
    install -m 644 -- "$source_dir/${names[$i]}" "$temporary"
    copied=$(sha256sum -- "$temporary" | cut -d ' ' -f 1)
    [ "$copied" = "${hashes[$i]}" ] || { echo 'Copy verification failed.' >&2; exit 1; }
    mv -n -- "$temporary" "$target/${names[$i]}"
    [ ! -e "$temporary" ] || { echo 'Concurrent target appeared; refusing overwrite.' >&2; exit 1; }
    trap - EXIT
  fi
done
echo 'Brasa files ready through the existing downloads alias. Public verification and website activation are separate.'
