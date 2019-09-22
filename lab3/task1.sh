#!/bin/bash

echo -n "Count:"
ps axo user= | grep -c ^user
ps axo user=,pid=,cmd= | awk '/^user/ {print $2 ":" $3}' >task1.out
echo "List stored in ./task1.out"
