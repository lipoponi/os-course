#!/bin/bash

ps axu | awk '$11 ~ /^\/sbin\// {print $2}' > sbin.txt
echo "Output stored in ./sbin.txt"
