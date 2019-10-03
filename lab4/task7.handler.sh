#!/bin/bash

echo $$ > .pid

memo=1
mode=''

add()
{
  mode='+'
}
mul()
{
  mode='*'
}
term()
{
  mode='term'
}

trap 'add' USR1
trap 'mul' USR2
trap 'term' SIGTERM

while true; do
  case "$mode" in
    '+')
      memo=$(("$memo" + 2))
      ;;
    '*')
      memo=$(("$memo" * 2))
      ;;
    'term')
      echo 'Stopped by SIGTERM'
      exit
      ;;
  esac

  echo "$memo"
  sleep 1
done
