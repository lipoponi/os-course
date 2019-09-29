#!/bin/bash

at now + 1 minute -f ./task1.sh >/dev/null 2>&1

(tail -n 0 -f ~/report) |
while true; do
  read line
  echo "$line"
done
