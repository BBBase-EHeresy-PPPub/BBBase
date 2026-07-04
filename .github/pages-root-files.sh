#!/usr/bin/env sh
set -eu

pages_root="gh-pages"
default_version="bb2025"

mkdir -p "$pages_root"

for pattern in CNAME google*.html yandex*.html; do
  for source_file in ./$pattern; do
    if [ -f "$source_file" ]; then
      cp "$source_file" "$pages_root"/
    fi
  done
done

for root_file in overrides/robots.txt overrides/sitemap.xml "$pages_root/$default_version/404.html"; do
  if [ -f "$root_file" ]; then
    cp "$root_file" "$pages_root"/
  fi
done

if [ -f "$pages_root"/404.html ]; then
  sed -i \
    -e "s#href=\"/assets/#href=\"/$default_version/assets/#g" \
    -e "s#src=\"/assets/#src=\"/$default_version/assets/#g" \
    -e "s#href=\"/stylesheets/#href=\"/$default_version/stylesheets/#g" \
    -e "s#src=\"/stylesheets/#src=\"/$default_version/stylesheets/#g" \
    -e "s#href=\"/\.\"#href=\"/$default_version/\"#g" \
    -e "s#new URL(\"/\",location)#new URL(\"/$default_version/\",location)#g" \
    "$pages_root"/404.html

  for page_root in core_rules spike_journal teams starplayers; do
    sed -i "s#href=\"/$page_root/#href=\"/$default_version/$page_root/#g" "$pages_root"/404.html
  done
fi
