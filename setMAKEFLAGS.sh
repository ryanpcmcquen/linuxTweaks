#!/bin/sh
## add this in /etc/profile to make it permanent  ;^)

## awesome way
#if [ "$( nproc )" != 1 ]; then
#  export MAKEFLAGS="-j$( expr $( nproc ) / 2 )"
#fi


if [ -z "$( cat /etc/profile | grep 'MAKEFLAGS' )" ]; then
  echo >> /etc/profile
  echo 'if [ "$( nproc )" != 1 ]; then' >> /etc/profile
  echo '  export MAKEFLAGS="-j$( expr $( nproc ) / 2 )"' >> /etc/profile
  echo 'fi' >> /etc/profile
  echo >> /etc/profile
fi


## semi-awesome way
#if [ "$( grep -c ^processor /proc/cpuinfo )" != 1 ]; then
  #export MAKEFLAGS="-j$( expr $( grep -c ^processor /proc/cpuinfo ) / 2 )"
#fi

## in case you need to check your work
#echo $MAKEFLAGS

