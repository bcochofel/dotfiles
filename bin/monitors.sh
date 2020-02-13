#!/bin/bash

MON=$(xrandr | grep -w connected | wc -l)

if [ $MON -gt 1 ]; then
    echo "More than one Monitor connected"
    xrandr --output eDP-1-1 --scale 1x1
    sleep 1
#    xrandr | grep 'DP-2 connected' && xrandr --output eDP-1 --auto --output DP-2 --auto --above eDP-1 || xrandr --output DP-2 --off
    xrandr | grep 'DP-2 connected' && xrandr --output eDP-1-1 --scale 1x1 --output DP-2 --scale 1x1 --above eDP-1-1 || xrandr --output DP-2 --off
    xrandr --output eDP-1-1 --primary
else
    echo "One Monitor connected"
    xrandr --output eDP-1-1 --scale 1x1 --brightness 0.7
    xrandr --output eDP-1-1 --primary
fi

exit 0
