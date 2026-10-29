#!/usr/bin/env bash
# Explicitly authorized experimental download publication; no website activation.
set -euo pipefail
mode="${1:-install}"
[[ "$mode" == install || "$mode" == --verify-only ]] || { echo 'Use --verify-only or no argument' >&2; exit 2; }
target='/srv/firulet-map/releases/i7-s6-preview-20261029'
base='https://github.com/ArielGrilloPortfolio/portfolio/releases/download/firulet-map-i7-s6-preview-20261029'
names=('FiruletMap-0.7.0-alpha.17-win-x64.zip' 'FiruletMap-0.7.0-alpha.17-win-x64-setup.exe' 'FiruletMap-0.7.0-alpha.18-osx-arm64.zip')
hashes=('e91ababc6ebd2f7d5c90b89418319c3435e2ccbe3c1d96d51bb3220cf32a64dd' 'aa6efb5ffd229c450706906fbe7a0551d1675d30246c8013fcfdf134d8e7ae1b' '619023ae7c09deb64f8e47f0b99682c0c31acc57b7c177f85e23458b797dc66a')
if [[ "$mode" == --verify-only ]]; then
  for i in "${!names[@]}"; do
    [[ "$(sha256sum -- "$target/${names[$i]}" | cut -d ' ' -f 1)" == "${hashes[$i]}" ]] || exit 1
  done
  echo 'All three immutable preview hashes match; no files written.'
  exit 0
fi
install -d -m 755 -- /srv/firulet-map/releases
staging=$(mktemp -d /srv/firulet-map/releases/.preview-20261029.XXXXXXXX)
case "$staging" in /srv/firulet-map/releases/.preview-20261029.*) ;; *) echo 'Unsafe staging path' >&2; exit 1 ;; esac
cleanup() {
  for name in "${names[@]}"; do rm -f -- "$staging/$name"; done
  rmdir -- "$staging"
}
trap cleanup EXIT
# Download and verify everything before changing publicly served files.
for i in "${!names[@]}"; do
  name=${names[$i]}
  curl --fail --location --retry 3 --connect-timeout 20 --max-time 1200 --output "$staging/$name" "$base/$name"
  [[ "$(sha256sum -- "$staging/$name" | cut -d ' ' -f 1)" == "${hashes[$i]}" ]] || { echo "Checksum mismatch: $name" >&2; exit 1; }
  if [[ -e "$target/$name" ]]; then
    [[ "$(sha256sum -- "$target/$name" | cut -d ' ' -f 1)" == "${hashes[$i]}" ]] || { echo 'Different public artifact exists; refusing overwrite.' >&2; exit 1; }
  fi
done
install -d -m 755 -- "$target"
for i in "${!names[@]}"; do
  name=${names[$i]}
  if [[ ! -e "$target/$name" ]]; then
    chmod 644 -- "$staging/$name"
    mv -- "$staging/$name" "$target/$name"
  fi
  printf '%s  %s\n' "${hashes[$i]}" "$name" > "$target/$name.sha256"
  chmod 644 -- "$target/$name.sha256"
done
echo 'Three preview downloads ready; Windowsalpha17 accepted, Macalpha18 experimental.'
