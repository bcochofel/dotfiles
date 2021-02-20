#!/bin/bash

NR_MON=$(xrandr | grep -w connected | wc -l)
FIRST_MON="eDP-1"
FIRST_MON_MODE="1920x1080"

xrandr --output eDP-1-2 --off
xrandr --output eDP-1-3 --off
xrandr --output eDP-1-4 --off
xrandr --output HDMI-1-1 --off

if [ ${NR_MON} -gt 1 ]; then
    #SECOND_MON=$(xrandr | grep -w connected | grep -v ${FIRST_MON} | awk '{ print $1 }')
    #SECOND_MON=$(xrandr | grep -w connected | grep -v primary | awk '{ print $1 }')
    SECOND_MON="eDP-1-4"
    #SECOND_MON_MODE="1920x1080"
    SECOND_MON_MODE="2560x1440"
    SECOND_MON_POS="--left-of"
    echo "More than one Monitor connected (${FIRST_MON} | ${SECOND_MON})"
    xrandr --output ${FIRST_MON} --mode ${FIRST_MON_MODE} --scale 1x1 --output ${SECOND_MON} --mode ${SECOND_MON_MODE} --scale 1x1 ${SECOND_MON_POS} ${FIRST_MON}
    xrandr --output ${SECOND_MON} --primary
else
  echo "One Monitor connected (${FIRST_MON})"
#    xrandr --output ${FIRST_MON} --mode ${FIRST_MON_MODE} --scale 1x1 --brightness 0.7
    xrandr --output ${FIRST_MON} --mode ${FIRST_MON_MODE} --scale 1x1
    xrandr --output ${FIRST_MON} --primary
fi

feh --bg-max '/home/bcochofel/Pictures/background.jpg' 

exit 0
