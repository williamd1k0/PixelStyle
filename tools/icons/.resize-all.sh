#!/usr/bin/sh
[ ! -d "resized" ] && mkdir resized
find *.png -exec magick {} -scale 1200% resized/{} \;
