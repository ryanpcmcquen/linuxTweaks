#!/bin/sh

## downloads the source directory
## useful for updating stock packages

if [ "$( uname -m )" = "x86_64" ]; then
  wget -r -np -N -R "*.html*","*.sha*","*.meta4","*.mirrorlist" http://mirrors.slackware.com/slackware/slackware64-current/source/ -P ~/
  mv ~/mirrors.slackware.com/slackware/slackware64-current/* ~/
else
  wget -r -np -N -R "*.html*","*.sha*","*.meta4","*.mirrorlist" http://mirrors.slackware.com/slackware/slackware-current/source/ -P ~/
  mv ~/mirrors.slackware.com/slackware/slackware-current/* ~/
fi

rm -rf ~/mirrors.slackware.com/
