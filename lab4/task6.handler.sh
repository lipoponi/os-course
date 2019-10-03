#!/bin/bash

echo $$ > .pid

term()
{
  TERMINATED=1
}

trap 'term' SIGTERM
while true; do
  n=$(( "$n" + 1))

  if [[ "$TERMINATED" == "1" ]]; then
    echo "Stopped by SIGTERM"
    exit
  fi

  echo "$n"
  sleep 1
done
