#!/usr/bin/env bash
# Manual user operation only. Uses existing download storage; never run by CI.
set -euo pipefail
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo 'Usage: bash install-temple-release-0.2.2.sh /uploaded-directory [--verify-only]' >&2
  exit 2
fi
verify_only=false
if [ "$#" -eq 2 ]; then
  [ "$2" = '--verify-only' ] || { echo 'Unknown option' >&2; exit 2; }
  verify_only=true
fi
source_dir=$(realpath -- "$1")
target='/srv/firulet-map/releases/temple/v0.2.2'
names=('Temple-0.2.2-win-x64-installer.zip' 'Temple-0.2.2-win-x64-installer.zip.sha256')
hashes=('41705abb8c02ca9f1f2f397618c5ef4b52af0892beb8aedebfbb5af8eff74097' 'e7a960f07771cafaa16a004139e02c9842b2cee9baae30c1130d54a878d77bb5')
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
    temporary=$(mktemp "$target/.temple-upload.XXXXXX")
    trap 'rm -f -- "$temporary"' EXIT
    install -m 644 -- "$source_dir/${names[$i]}" "$temporary"
    copied=$(sha256sum -- "$temporary" | cut -d ' ' -f 1)
    [ "$copied" = "${hashes[$i]}" ] || { echo 'Copy verification failed.' >&2; exit 1; }
    mv -n -- "$temporary" "$target/${names[$i]}"
    [ ! -e "$temporary" ] || { echo 'Concurrent target appeared; refusing overwrite.' >&2; exit 1; }
    trap - EXIT
  fi
done
echo 'Temple files ready through the existing downloads alias. Public verification and website activation are separate.'
