#!/bin/bash
#
# Sets up monitors at home

# turn off laptop screen
xrandr --output LVDS-0 --off

# turn on external monitor
xrandr --output DP-3 --auto
