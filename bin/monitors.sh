#!/bin/bash

NR_MON=$(xrandr | grep -w connected | wc -l)
PRIMARY_MON="eDP-1-1"
PRIMARY_MON_MODE="1920x1080"

xrandr --output DP-0 --off
xrandr --output DP-1 --off
xrandr --output HDMI-0 --off

if [ ${NR_MON} -gt 1 ]; then
    SECOND_MON=$(xrandr | grep -w connected | grep -v ${PRIMARY_MON} | awk '{ print $1 }')
    #SECOND_MON_MODE="1920x1080"
    SECOND_MON_MODE="2560x1440"
    SECOND_MON_POS="--left-of"
    echo "More than one Monitor connected (${PRIMARY_MON} | ${SECOND_MON})"
    xrandr --output ${PRIMARY_MON} --mode ${PRIMARY_MON_MODE} --scale 1x1 --output ${SECOND_MON} --mode ${SECOND_MON_MODE} --scale 1x1 ${SECOND_MON_POS} ${PRIMARY_MON}
    xrandr --output ${PRIMARY_MON} --primary
else
  echo "One Monitor connected (${PRIMARY_MON})"
#    xrandr --output ${PRIMARY_MON} --mode ${PRIMARY_MON_MODE} --scale 1x1 --brightness 0.7
    xrandr --output ${PRIMARY_MON} --mode ${PRIMARY_MON_MODE} --scale 1x1
    xrandr --output ${PRIMARY_MON} --primary
fi

exit 0
