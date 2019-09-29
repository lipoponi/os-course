#!/bin/bash

grep -rohaP '^#!.*\K/bin/.*' /bin |
sort | uniq -c | sort -bnrk 1 | head -1 | awk '{print $2}'
