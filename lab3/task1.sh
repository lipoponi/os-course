#!/bin/bash

echo -n "Count: "
ps au | grep -c ^user
ps au | awk '/^user/ {printf "%s:%s\n", $2, $11}' > user.txt
echo "List stored at ./user.txt"
