#!/bin/bash

set -e

#This script toggles my monitor settings. I used external monitor for
#projectors, TV, or extra monitor. This automatically connect and disconnect 
#monitor.

intern=eDP1
extern=HDMI-1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi

