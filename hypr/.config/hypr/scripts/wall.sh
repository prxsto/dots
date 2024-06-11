#!/bin/bash

# Variables
DIR='/home/prxsto/wallpapers/'
BG=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \) | shuf -n 1)

# Set the wallpaper
swww img $BG --transition-duration 1.2 --transition-step 255 --transition-type wipe --transition-pos 0,0 &&

# make the temp wallpaper to use with hyprlock
cp $BG /home/prxsto/wallpapers/wal.png &&

# Notification
notify-send -i $BG "New Wallpaper"
