#!/bin/bash

ps axu --sort=start_time | tail -1 | awk '{print $2}'
