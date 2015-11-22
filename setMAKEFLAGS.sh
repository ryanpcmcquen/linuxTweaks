#!/bin/sh
## add this in /etc/profile to make it permanent  ;^)


## make compiling faster  ;-)
if [ -z "$(grep 'MAKEFLAGS' /etc/profile)" ]; then
  echo >> /etc/profile
  echo 'if [ "$(nproc)" -gt 2 ]; then' >> /etc/profile
  ## cores--
  echo '  export MAKEFLAGS=" -j$(expr $(nproc) - 1) "' >> /etc/profile
  ## half the cores
  #echo '  export MAKEFLAGS=" -j$(expr $(nproc) / 2) "' >> /etc/profile
  echo 'else' >> /etc/profile
  echo '  export MAKEFLAGS=" -j1 "' >> /etc/profile
  echo 'fi' >> /etc/profile
  echo >> /etc/profile
fi

## otherwise all our new stuff won't load until we log in again  ;^)
. /etc/profile

if [ "$(nproc)" -gt 2 ]; then
  export MAKEFLAGS=" -j$(expr $(nproc) - 1) "
else
  export MAKEFLAGS=" -j1 "
fi


