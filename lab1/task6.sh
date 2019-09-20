#!/bin/bash

if [[ $PWD == $HOME ]]
then
  pwd
  exit 0
else
  echo Error
  exit 1
fi
