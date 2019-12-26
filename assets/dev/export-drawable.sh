#!/bin/sh
sh ./resize-all.sh
cd ../.resized
find *.png -exec cp {} ../../app/src/main/res/drawable-nodpi/{} \;
