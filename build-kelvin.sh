#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")"
set -- kelvin-site-*.zip
if [ "$#" -ne 8 ] || [ ! -f "$1" ]; then
  echo "Expected all 8 kelvin-site ZIP archives" >&2
  exit 1
fi

# Replace generated output so cached files from older versions cannot survive.
rm -rf ./kelvin

for archive do
  unzip -q -o "$archive"
done

test -f kelvin/index.html
test -f kelvin/assets/photography/catalog.json
test -f kelvin/assets/portfolio/knout-latest/screens.json
echo "Kelvin Choi static portfolio is ready in kelvin/"
