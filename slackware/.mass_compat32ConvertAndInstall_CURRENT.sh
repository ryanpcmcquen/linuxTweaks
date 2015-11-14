#!/bin/sh
##
## runs the appropriate mass conversion and blacklists all the subsequent goodies
##
## curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/.mass_compat32ConvertAndInstall_CURRENT.sh | sh

massconvert32.sh -u http://slackware.cs.utah.edu/pub/slackware/slackware-current/slackware/

if [ -z "$(cat /etc/slackpkg/blacklist | grep _compat32)" ]; then
  echo "[0-9]+compat32" >> /etc/slackpkg/blacklist
fi
