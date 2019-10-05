#!/bin/bash

dir=$(find ~/ -maxdepth 1 -type d -name Backup-* | sort -r | head -1)
if [[ ! -d "$dir" ]]; then
  exit
fi

mkdir ~/restore 2>/dev/null
find "$dir" -type f |
grep -E --invert-match "[0-9]{4}-[0-9]{2}-[0-9]{2}$" |
while read line; do
  filename="${line#$dir/}"
  innerdir=$(dirname "$filename")

  mkdir ~/"restore/$innerdir" 2>/dev/null
  cp "$line" ~/"restore/$filename"
done
