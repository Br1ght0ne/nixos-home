#!/usr/bin/env bash
tmpfile=$(mktemp -t transferXXX)
curl -s --upload-file $1 https://transfer.sh/$(basename $1) >>$tmpfile
cat $tmpfile | tee >(xclip -selection clipboard)
rm -f $tmpfile
