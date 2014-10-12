#!/bin/sh
## add this in /etc/profile to make it permanent  ;^)


if [ -z "$( cat /etc/profile | grep 'MAKEFLAGS' )" ]; then
  echo >> /etc/profile
  echo 'if (( $( nproc ) > 2 )); then' >> /etc/profile
  ## cores--
  echo '  export MAKEFLAGS="-j$( expr $( nproc ) - 1 )"' >> /etc/profile
  ## half the cores
  #echo '  export MAKEFLAGS="-j$( expr $( nproc ) / 2 )"' >> /etc/profile
  echo 'else' >> /etc/profile
  echo '  export MAKEFLAGS="-j1"' >> /etc/profile
  echo 'fi' >> /etc/profile
  echo >> /etc/profile
fi


## awesome way
#if (( $( nproc ) > 2 )); then
#  export MAKEFLAGS="-j$( expr $( nproc ) - 1 )"
#else
#  export MAKEFLAGS="-j1"
#fi
#echo $MAKEFLAGS


## semi-awesome way
#if (( $( grep -c ^processor /proc/cpuinfo ) > 2 )); then
#  export MAKEFLAGS="-j$( expr $( grep -c ^processor /proc/cpuinfo ) - 1 )"
#else
#  export MAKEFLAGS="-j1"
#fi

## in case you need to check your work
#echo $MAKEFLAGS

