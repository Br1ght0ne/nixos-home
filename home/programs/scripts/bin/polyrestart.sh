#!/usr/bin/env bash

killall polybar

if [ -n $POLYRESTART_BSPWM ]; then
	polybar -r simple -c $HOME/.config/polybar/config.bspwm &
	polybar -r external -c $HOME/.config/polybar/config.bspwm &
else
	polybar -r simple &
	polybar -r external &
fi

disown
