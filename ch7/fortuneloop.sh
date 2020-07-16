#!/bin/bash
trap "exit" SIGINT
INTERVAL=$1
MAX_TRY=$2
echo Configured to generate new fortune every $INTERVAL seconds for $MAX_TRY times
mkdir -p /var/htdocs
VAR=0
while :
do
  echo $(date) Writing fortune to /var/htdocs/index.html ... $VAR tries
  /usr/games/fortune > /var/htdocs/index.html
  sleep $INTERVAL
  VAR=$((VAR+1))
  if [ $VAR == $MAX_TRY ]
  then
    break
  fi
done