#!/bin/bash

ps axo pid= | while read pid; do
  path="/proc/$pid"
  test -d "$path"

  if [[ $? -eq 1 ]]; then
    continue
  fi

  awk '/^P?Pid/ {printf "%s:", $2}' <"$path/status"
  awk '/^avg_atom/ {print $3}' <"$path/sched"
done | sort -ns --key=2 --field-separator=":" | awk -F ':' '{printf "ProcessID=%s : Parent_ProcessID=%s : Average_Sleeping_Time=%s\n", $1, $2, $3}' >task5.out
