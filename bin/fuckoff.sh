#!/bin/sh

for pid in `lsof -i tcp:$1|awk '{print $2}'|tail -n +2`
do
  kill -9 $pid
done
