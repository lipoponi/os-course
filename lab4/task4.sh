#!/bin/bash

job()
{
  while true; do
    a="1432"
    b="234234"

    result=$((a * b))
  done &
}

job
first="$!"
job
second="$!"

echo "$first $second"

renice -n 7 -p "$first"
