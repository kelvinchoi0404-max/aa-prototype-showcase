#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")"
set -- kelvin-site-*.zip
if [ "$#" -ne 22 ] || [ ! -f "$1" ]; then
  echo "Expected all 22 kelvin-site ZIP archives" >&2
  exit 1
fi

# Replace generated output so cached files from older versions cannot survive.
rm -rf ./kelvin

for archive do
  unzip -q -o "$archive"
done

# Remove only retired MAOS images and superseded AI preview thumbnails.
rm -f -- \
  "./kelvin/assets/portfolio/maos-coordinator.png" \
  "./kelvin/assets/portfolio/maos-cover.png" \
  "./kelvin/assets/portfolio/maos-family.png" \
  "./kelvin/assets/ai-visuals/bamboo-interior-thumb.webp" \
  "./kelvin/assets/ai-visuals/blue-harbour-01-thumb.webp" \
  "./kelvin/assets/ai-visuals/blue-harbour-02-thumb.webp" \
  "./kelvin/assets/ai-visuals/coastal-wanderer-thumb.webp" \
  "./kelvin/assets/ai-visuals/courtyard-reading-thumb.webp" \
  "./kelvin/assets/ai-visuals/drifting-light-thumb.webp" \
  "./kelvin/assets/ai-visuals/red-sails-01-thumb.webp" \
  "./kelvin/assets/ai-visuals/red-sails-02-thumb.webp"

test -f kelvin/index.html
test -f kelvin/assets/photography/catalog.json
test -f kelvin/assets/portfolio/knout-latest/screens.json
echo "Kelvin Choi static portfolio is ready in kelvin/"
