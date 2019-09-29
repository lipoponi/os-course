#!/bin/bash

grep -E '^\[\s*[0-9.]*\]\s*\(WW\)' /var/log/Xorg.0.log |
sed -e 's/(WW)/Warning:/' > full.log

grep -E '^\[\s*[0-9.]*\]\s*\(II\)' /var/log/Xorg.0.log |
sed -e 's/(II)/Information:/' >>full.log

less full.log
