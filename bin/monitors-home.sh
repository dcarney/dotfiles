#!/bin/bash
#
# Sets up monitors at home

# turn off laptop screen
xrandr --output LVDS-1 --off

# turn on external monitor
xrandr --output DP-1 --mode 1920x1080
