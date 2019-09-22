#!/bin/bash

echo -n "Count:"
ps axo user= | grep -c ^user
ps axo user=,pid=,cmd= | awk '/^user/ {print $2 ":" $3}' > user.txt
echo "List stored in ./user.txt"
