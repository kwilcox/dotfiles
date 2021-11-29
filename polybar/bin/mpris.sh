#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=""
sc="#1db954"
#uc="#5AC57F"
uc="#ffffff"
ac="#123622"
#ac="#74ffa5"
#ac="#3a7f53"
gc="#65737e"

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{B$sc}%{F$ac}%{u$uc +u}  $metadata "
elif [[ $player_status = "Paused" ]]; then
    #echo "%{F$gc}%{u$sc +u} ⏸ $metadata "
    echo "%{F$gc}%{u$sc +u} paused $metadata "
else
    echo "%{F$gc}$icon"
fi
