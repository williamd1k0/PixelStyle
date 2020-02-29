#!/bin/sh
sh ./resize-all.sh
cd ../.resized
for icon in *.png; do
    ln -srf $icon ../../app/src/main/res/drawable-nodpi/$icon
done

# Fallback for unavailable upstream icons
for i in $(find ../../app/src/main/res/drawable-nodpi/); do
    if [ ! -L $i ]; then
        ln -srf template.png $i
    fi
done