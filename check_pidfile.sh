#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: "
  echo "  $0 pidfile"
  exit 3
fi

if [ ! -e "$1" ]; then
  echo "CRITICAL: pidfile $1 doesn't exist"
  exit 2
fi

PID=`cat $1`

if [ ! -e "/proc/$PID/exe" ]; then
  echo "CRITICAL: process with PID $PID doesn't exist"
  exit 2;
fi

CMDLINE=`cat /proc/$PID/cmdline`

echo "OK: $CMDLINE" 
exit 0

