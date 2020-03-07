#!/bin/bash

NR_MON=$(xrandr | grep -w connected | wc -l)
PRIMARY_MON="eDP-1-1"
PRIMARY_MON_MODE="1920x1080"

if [ ${NR_MON} -gt 1 ]; then
    SECOND_MON=$(xrandr | grep -w connected | grep -v ${PRIMARY_MON} | awk '{ print $1 }')
    SECOND_MON_MODE="1920x1080"
    echo "More than one Monitor connected (${PRIMARY_MON} | ${SECOND_MON})"
    xrandr --output ${PRIMARY_MON} --mode ${PRIMARY_MON_MODE} --scale 1x1 \
      --output ${SECOND_MON} --mode ${SECOND_MON_MODE} --scale 1x1 \
      --above ${PRIMARY_MON}
    xrandr --output ${PRIMARY_MON} --primary
else
  echo "One Monitor connected (${PRIMARY_MON})"
    xrandr --output ${PRIMARY_MON} --mode ${PRIMARY_MON_MODE} --scale 1x1 \ 
      --brightness 0.7
    xrandr --output ${PRIMARY_MON} --primary
fi

exit 0
