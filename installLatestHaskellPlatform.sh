#!/bin/sh

## curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/installLatestHaskellPlatform.sh | bash

HASKELLDOWNLOAD="$(curl https://www.haskell.org/platform/#linux-generic | grep 'haskell.org/platform/download' | grep 'haskell-platform' | grep 'posix' | cut -d '"' -f2 | sed 's@//@https://@' | tr -d '\n\r')"
HASKELLVERSION="$(echo $HASKELLDOWNLOAD | cut -d'-' -f3 | tr -d '\n\r')"

mkdir -p ~/HASKELL_TEMP/

wget -N $HASKELLDOWNLOAD -P ~/HASKELL_TEMP/

tar xf ~/HASKELL_TEMP/haskell-platform-*.tar.* -C ~/HASKELL_TEMP/

cd ~/HASKELL_TEMP/
./install-haskell-platform.sh

## Fix the missing libtinfo
if [ -d /usr/lib64 ]; then
  ln -sf /usr/lib64/libncurses.so.5 $(find /usr/local/haskell/ -type d -name rts | head -1)/libtinfo.so.5
else
  ln -sf /usr/lib/libncurses.so.5 $(find /usr/local/haskell/ -type d -name rts | head -1)/libtinfo.so.5
fi
