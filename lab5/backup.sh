#!/bin/bash

has_backup()
{
  now=$(date +%s)

  for day in {0..6}; do
    timestamp=$(( "$now" - "$day" * 1440 * 60 ))
    current="Backup-"$(date --date="@$timestamp" +%F)

    if [[ -d ~/"$current" ]]; then
      return 0
    fi
  done

  current="Backup-"$(date --date="@$now" +%F)
  return 1
}

touch ~/backup-report
if has_backup; then
  echo "Active backup folder '$current' was modified $(date +%F)"
else
  mkdir ~/"$current"
  echo "No active backup folder found. '$current' was created $(date +%F)"
fi >>~/backup-report

find ~/source -type f | {
  tmp=""

  while read line; do
    filename="${line#$HOME/source/}"
    copypath="$HOME/$current/$filename"

    if [[ -e "$copypath" ]]; then
      sz1=$(wc -c <"$line")
      sz2=$(wc -c <"$copypath")

      if [[ "$sz1" -ne "$sz2" ]]; then
        mv "$copypath" "$copypath.$(date +%F)"
        cp "$line" "$copypath"
        tmp="$tmp : $filename $filename.$(date +%F)\n"
      fi
    else
      mkdir "$(dirname $copypath)" 2>/dev/null
      cp "$line" "$copypath"
      echo " + $filename"
    fi
  done

  echo -e "$tmp"
}>>~/backup-report
