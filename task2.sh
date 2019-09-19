#!/bin/bash

if [[ $1 -lt $2 ]]
then
  if [[ $2 -lt $3 ]]
  then result=$3
  else result=$2
  fi
else
  if [[ $1 -lt $3 ]]
  then result=$3
  else result=$1
  fi
fi

echo "maximal: $result"

