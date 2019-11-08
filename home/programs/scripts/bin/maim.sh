#!/usr/bin/env bash

path="$HOME/screen.png"
maim "$@" | tee $path | xclip -selection clipboard -t image/png
notify-send "Screenshot saved and copied" "Path: $path"
