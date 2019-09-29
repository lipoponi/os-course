#!/bin/bash

echo "*/5 * * * 0 $PWD/task1.sh" >>/etc/crontab
