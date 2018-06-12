#!/bin/bash

# Work 8910 Desktop
xrandr --output DP-4 --rotate normal
xrandr --output DP-0 --rotate right
xrandr --output DP-2 --rotate left
xrandr --output DP-4 --primary
xrandr --output DP-0 --left-of DP-4
xrandr --output DP-2 --right-of DP-4

# Home 8930 (octo)
xrandr --output DP-0 --primary
