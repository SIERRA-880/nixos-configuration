#!/bin/bash

# If idle for 15s, power down the output
swayidle -w \
  timeout 5 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' &

# Lock screen immediately
swaylock -c 000000

# Kill the last instance of swayidle so the timer doesn't keep running in background
pkill --newest swayidle
