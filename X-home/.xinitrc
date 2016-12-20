# text size
gsettings set org.gnome.desktop.interface scaling-factor 2

# Set primary display
# --scale 0.8x0.8 --dpi 120
xrandr --output DP-0 --primary

# HDMI-0
xrandr --output HDMI-0 --rotate right --left-of DP-0

# Desktop background color
xsetroot -solid '#101010'

# Disable beeps
xset -b

# DPMS monitor setting (standby->30 minutes, suspend->2 hours)
xset dpms 1800 7200

# Notification daemon
dunst &

# Clipboard manager
parcellite &

# i3
exec i3
