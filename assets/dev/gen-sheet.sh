#!/usr/bin/sh
cd ../icons/
X=6
SPRITES=$(find *.png | wc -l)
ceiling() {
  awk -vnumber="$SPRITES" -vdiv="$X" '
  function ceiling(x){return x%1 ? int(x)+1 : x}
  BEGIN{ print ceiling(number/div) }'
}
Y=$(ceiling)
echo ${X}x${Y}
magick montage *.png -tile ${X}x${Y} -geometry 16x16+0+0 -background none ../dev/all.png
magick ../dev/all.png -scale 1200% ../dev/all-xxl.png
