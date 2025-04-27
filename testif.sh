#!/bin/bash

echo $# 

if [ -z "$1" ] 
then
  echo "Enter a valid Filename!" 
  exit
else
  echo "/$1 provided"
fi

echo "it got here"
