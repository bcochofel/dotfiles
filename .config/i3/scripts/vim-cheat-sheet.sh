#!/bin/bash

# converts text file to image to use with feh
# depends on: imagemagick + feh

export TEXT_FILE="${HOME}/.config/i3/scripts/vim-cheat-sheet.txt"
export IMG="/tmp/cheat-sheet.png"

TEXT=`cat ${TEXT_FILE}`
convert -size 1024x768 -background black -fill green \
  -font Courier label:"${TEXT}" -trim -bordercolor black -border 50 +repage $IMG

if [ -f ${IMG} ]; then
  feh -x --no-menus --on-last-slide quit --title "cheat-sheet" $IMG
  rm -f $IMG
fi

