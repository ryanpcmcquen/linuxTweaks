#!/bin/sh
##
## runs the appropriate mass conversion and blacklists all the subsequent goodies
##
## curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/.mass_compat32ConvertAndInstall_CURRENT.sh | sh

## create a directory so we don't pollute the home folder
mkdir -pv ~/compat32/
cd ~/compat32/

massconvert32.sh -u http://slackware.cs.utah.edu/pub/slackware/slackware-current/slackware/

if [ -z "$(grep compat32 /etc/slackpkg/blacklist)" ]; then
  echo "[0-9]+compat32" >> /etc/slackpkg/blacklist
fi

## now install everything!
upgradepkg --reinstall --install-new ~/compat32/*/*

## update script
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/.mass_compat32ConvertAndInstall_CURRENT.sh -P ~/compat32/

