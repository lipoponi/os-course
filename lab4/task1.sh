#!/bin/bash

url="www.net_nikogo.ru"
date=$(date)

touch ~/report

mkdir ~/test >/dev/null 2>&1 && {
  echo 'catalog test was created successfully' >>~/report
  cd ~/test
  touch "$date"
}

ping -c 1 "$url" >/dev/null 2>&1 ||
echo "$url is not reachable" >>~/report
