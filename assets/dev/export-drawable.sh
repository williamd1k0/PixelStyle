#!/bin/sh
sh ./resize-all.sh
cd ../.resized
for icon in *.png; do
    ln -srf $icon ../../app/src/main/res/drawable-nodpi/$icon
done