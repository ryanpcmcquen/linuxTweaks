#!/bin/sh

## downloads the extra directory, containing additional packages
## and SlackBuilds not in the main Slackware tree

if [ "$( uname -m )" = "x86_64" ]; then
  wget -r -np -N -R "*.html*","*.sha*","*.meta4","*.mirrorlist" http://mirrors.slackware.com/slackware/slackware64-current/extra/ -P ~/
  mv ~/mirrors.slackware.com/slackware/slackware64-current/* ~/
else
  wget -r -np -N -R "*.html*","*.sha*","*.meta4","*.mirrorlist" http://mirrors.slackware.com/slackware/slackware-current/extra/ -P ~/
  mv ~/mirrors.slackware.com/slackware/slackware-current/* ~/
fi

rm -rf ~/mirrors.slackware.com/

