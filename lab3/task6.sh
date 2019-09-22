#!/bin/bash

while read line; do
  parsed=$(echo "$line" | sed -r 's/[^0-9=]*=([^:]*)/\1/g')
  ppid=$(echo "$parsed" | awk '{printf $2}')
  avg=$(echo "$parsed" | awk '{printf $3}')

  if [ "$ppid" == "$last_ppid" ] || [ "$last_ppid" == "" ]; then
    count=$((count + 1))
    sum=$(echo - | awk "{printf $sum + $avg}")
  else
    echo "Average_Sleeping_Children_of_ParentID=$last_ppid is $M"

    count="1"
    sum="$avg"
  fi

  last_ppid="$ppid"
  M=$(echo - | awk "{printf $sum / $count}")

  echo "$line"
done >task6.out
echo "Average_Sleeping_Children_of_ParentID=$last_ppid is $M" >>task6.out
