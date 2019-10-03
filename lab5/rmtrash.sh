#!/bin/bash

touch ~/.trash.log
id=$(wc -l ~/.trash.log | awk '{print $1}')

if [[ ! -d ~/.trash ]]; then
  mkdir ~/.trash
fi

if [[ -f ./"$1" ]]; then
  ln ./"$1" ~/.trash/"$id"
  rm -f ./"$1"

  echo "$id $PWD/$1" >>~/.trash.log
fi

