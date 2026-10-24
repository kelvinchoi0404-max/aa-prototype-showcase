#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")"
set -- kelvin-site-*.zip
if [ "$#" -ne 7 ] || [ ! -f "$1" ]; then
  echo "Expected all seven kelvin-site ZIP archives" >&2
  exit 1
fi

for archive do
  unzip -q -o "$archive"
done

test -f kelvin/index.html
test -f kelvin/assets/photography/catalog.json
test -f kelvin/assets/portfolio/knout-latest/screens.json
echo "Kelvin Choi static portfolio is ready in kelvin/"
