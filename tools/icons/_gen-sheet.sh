#!/usr/bin/sh
X=6
SPRITES=$(find *.png | wc -l)
ceiling() {
  awk -vnumber="$SPRITES" -vdiv="$X" '
  function ceiling(x){return x%1 ? int(x)+1 : x}
  BEGIN{ print ceiling(number/div) }'
}
Y=$(ceiling)
echo ${X}x${Y}
magick montage *.png -tile ${X}x${Y} -geometry 16x16+0+0 -background none study/icons.png
magick study/icons.png -scale 1200% study/icons-xxl.png
