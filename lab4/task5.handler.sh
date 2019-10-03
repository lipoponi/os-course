#!/bin/bash

mode="+"
memo="1"

touch task5.in

(tail -n 0 -f task5.in) |
while true; do
  read line

  case "$line" in
    QUIT)
      echo "Everything's alright. QUIT"
      killall tail
      exit
      ;;
    \+) mode="+" ;;
    \*) mode="*" ;;
    *)
      if [[ ! "$line" =~ ^[0-9]+$ ]]; then
        echo "Error unknown input"
        killall tail
        exit
      fi

      if [[ "$mode" == "+" ]]; then
        memo=$((memo + line))
      else
        memo=$((memo * line))
      fi
      ;;
  esac

  echo "mode: $mode | memo: $memo"
done >task5.out
