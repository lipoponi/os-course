#!/bin/bash

restore()
{
  name=$(basename "$2")
  dir=$(dirname "$2")

  if [[ ! -d "$dir" ]]; then
    dir=~
  fi

  ln ~/.trash/"$1" "$dir/$name"
  rm -f ~/.trash/"$1"

  echo "Restored file path is: $dir"
  exit
}

touch ~/.trash.log
while read -u 10 line; do
  id=$(echo "$line" | awk '{print $1}')
  fullname="${line#[0-9]* }"
  name=$(basename "$fullname")

  if [[ ! -f ~/.trash/"$id" ]]; then
    continue
  fi

  if [[ "$name" == "$1" ]]; then
    read -p "$fullname (y/N): " x
    if [ "$x" == 'y' ] || [ "$x" == 'Y' ]; then
      restore "$id" "$fullname"
    fi
  fi
done 10<~/.trash.log

echo "No files restored"
