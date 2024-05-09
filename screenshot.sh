#!/bin/bash
#
date=$(date +'%Y-%m-%d_%H-%M-%S')
screenshot_location=~/Pictures/Screenshots/"${date}"

gnome-screenshot -c -a --border-effect=shadow --file=$screenshot_location.png

if timeout 20 bash -c "until [ -f '${screenshot_location}.png' ]; do sleep 0.1; done"; then xclip -selection clipboard -t image/png -i $screenshot_location.png; else echo "not exists"; fi
