#!/bin/bash

while read line; do
  if [[ "$line" == "TERM" ]]; then
    kill -SIGTERM $(cat .pid)
  fi
done
