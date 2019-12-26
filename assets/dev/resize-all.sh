#!/bin/sh
cd ../
[ ! -d ".resized" ] && mkdir .resized
cd icons/
find *.png -exec magick {} -scale 1200% ../.resized/{} \;
