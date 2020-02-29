#!/bin/sh
cd ../
[ ! -d ".resized" ] && mkdir .resized
cd icons/
for icon in *.png; do
    magick $icon -scale 1200% ../.resized/$icon
done
