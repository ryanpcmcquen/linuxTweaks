#!/bin/sh
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/debian/.debian8setup.sh -P ~/; bash ~/.debian8setup.sh
## basically just gnome and git/vim stuff

curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gnome3Setup | bash

## retrieve git and vim settings
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gitVimNORMALorROOT.sh | sh
