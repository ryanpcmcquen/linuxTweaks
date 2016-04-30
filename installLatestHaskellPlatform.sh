#!/bin/sh

## curl https://gist.githubusercontent.com/ryanpcmcquen/0521f7dbcf1afdb40429540d3982ed43/raw/installLatestHaskellPlatform.sh | bash

HASKELLDOWNLOAD="$(curl https://www.haskell.org/platform/#linux-generic | grep 'haskell.org/platform/download' | grep 'haskell-platform' | grep 'posix' | cut -d '"' -f2 | sed 's@//@https://@' | tr -d '\n\r')"
HASKELLVERSION="$(echo $HASKELLDOWNLOAD | cut -d'-' -f3 | tr -d '\n\r')"

mkdir -p ~/HASKELL_TEMP/

wget -N $HASKELLDOWNLOAD -P ~/HASKELL_TEMP/

tar xf ~/HASKELL_TEMP/haskell-platform-*.tar.* -C ~/HASKELL_TEMP/

cd ~/HASKELL_TEMP/
./install-haskell-platform.sh
