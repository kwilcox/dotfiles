#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

# polybar left &
export MONITOR_CENTER=${MONITOR_CENTER:-DP-3}
#export MONITOR_RIGHT=HDMI-0
#polybar right &
polybar center &
