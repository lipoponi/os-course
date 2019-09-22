#!/bin/bash

echo -n "Count: "
ps_output="$(ps axu)"
echo "$ps_output" | grep -c ^user
echo "$ps_output" | awk '/^user/ {printf "%s:%s\n", $2, $11}' > user.txt
echo "List stored at ./user.txt"
