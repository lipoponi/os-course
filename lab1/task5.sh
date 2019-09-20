#!/bin/bash

menu=$'1. nano\n2. vim\n3. links\n4. quit\n'

while [[ true ]]
do
  read -p "$menu" input
  case $input in
    "1")
      nano
      ;;
    "2")
      vim
      ;;
    "3")
      links
      ;;
    "4")
      break
      ;;
  esac
done
