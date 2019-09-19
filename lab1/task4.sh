#!/bin/bash

read input
while [[ $(( input % 2 )) -ne '0' ]]
do
  count=$(( count + 1 ))
  read input
done

echo "Count of odd numbers is $count"
