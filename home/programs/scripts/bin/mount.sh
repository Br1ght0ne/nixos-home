#!/usr/bin/env bash

if [ -x "$(command -v rofi)" ]; then
	launcher="rofi -dmenu"
else
	launcher="dmenu"
fi

bail() {
	[[ -n "$1" ]] || exit 1
}

prompt() {
	choice="$(echo "$1" | awk "/^.+\$/ { print \$1\" (\"\$$2\")\" }" | $launcher -p "$3" | awk '{ print $1 }')"
}

MOUNTPOINTS=(/mnt/usb /mnt/sd)
set -e

if [ "$1" = "mount" ]; then
	mountable="$(lsblk -lpno NAME,SIZE,TYPE,MOUNTPOINT | grep 'part *$')"
	prompt "$mountable" 2 "mount"
	bail "$choice"
	mountpoint="$(printf "%s\\n" "${MOUNTPOINTS[@]}" | $launcher -p "mountpoint")"
	bail "$mountpoint"
	sudo mount "$choice" "$mountpoint"
	notify-send "$choice mounted to $mountpoint."
elif [ "$1" = "umount" ]; then
	umountable="$(lsblk -lpno NAME,SIZE,TYPE,MOUNTPOINT | grep 'part *\/mnt.*$')"
	prompt "$umountable" 4 "umount"
	mountpoint=$(mount | awk "\$0 ~ \"$choice\" { print \$3 }")
	bail "$mountpoint"
	sudo umount "$choice"
	notify-send "$choice umounted from $mountpoint."
elif [ "$1" = "ask" ]; then
	arg="$(echo -e 'mount\numount' | $launcher -p "operation")"
	[[ -z "$arg" ]] || "$0" "$arg" &
else
	("$0" umount && exit 0) || ("$0" mount && exit 0) || exit 1
	# exit 2
fi
