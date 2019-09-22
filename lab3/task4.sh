#!/bin/bash

ps axo pid= | while read pid; do
  path="/proc/$pid/statm"

  if [[ ! -f "$path" ]]; then
    continue
  fi

  echo -n "$pid:"
  awk '{print $2-$3}' <"$path"
done | sort -nrk 2 --field-separator=: >task4.out
