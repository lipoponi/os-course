#!/bin/bash

rcnt=$(wc -l /var/log/*.log 2>/dev/null | tail -1 | awk '{print $1}')
icnt=$(wc -l /var/log/**/*.log 2>/dev/null | tail -1 | awk '{print $1}')

echo $(($rcnt + $icnt))
