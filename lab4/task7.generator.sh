#!/bin/bash

while read line; do
  case "$line" in
    '+')
      kill -USR1 $(cat .pid)
      ;;
    '*')
      kill -USR2 $(cat .pid)
      ;;
    'TERM')
      kill -SIGTERM $(cat .pid)
      ;;
  esac
done
