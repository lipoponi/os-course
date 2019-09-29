#!/bin/bash

man bash |
sed 's/[[:punct:] ]\+/\n/g' |
sed '/^.\{,3\}$/d' |
sort | uniq -c | sort -bnrk 1 |
head -3 | awk '{print $2}'
