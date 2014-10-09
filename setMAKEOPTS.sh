#!/bin/sh
## add this in /etc/profile to make it permanent  ;^)

## awesome way
if [ "$( nproc )" != 1 ]; then
  export MAKEOPTS="-j$( expr $( nproc ) / 2 )"
fi


## semi-awesome way
#if [ "$( grep -c ^processor /proc/cpuinfo )" != 1 ]; then
  #export MAKEOPTS="-j$( expr $( grep -c ^processor /proc/cpuinfo ) / 2 )"
#fi

## in case you need to check your work
#echo $MAKEOPTS

