#!/bin/sh

DESKTOP_NUMBER=`wmctrl -d | awk '/\*/ { print $1 }'`
WINDOW_LIST=`wmctrl -l | awk '{ if ($2 == '"$DESKTOP_NUMBER"') { $1=$2=$3=""; print $0; }}' | sed -E 's%^\s+%%g'`
echo $"$WINDOW_LIST"
