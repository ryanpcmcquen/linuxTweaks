#!/bin/sh
## add this in /etc/profile to make it permanent  ;^)

if [ "$( grep -c ^processor /proc/cpuinfo )" != 1 ]; then
  export MAKEOPTS="-j$( expr $( grep -c ^processor /proc/cpuinfo ) / 2 )"
fi
