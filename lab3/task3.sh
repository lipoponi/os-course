#!/bin/bash

ps axo pid=,cmd= | awk '$2 ~ /^\/sbin\// {print $1}' > task3.out
echo "Output stored in ./task3.out"
