#!/bin/bash

ps axo pid=,cmd= | awk '$2 ~ /^\/sbin\// {print $1}' > sbin.txt
echo "Output stored in ./sbin.txt"
