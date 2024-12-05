#!/usr/bin/sh
hypridle -w timeout 300 'hyprlock -f -c 000000' \
            timeout 600 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            timeout 900 'systemctl suspend' \
            before-sleep 'hyprlock -f -c 000000' &
