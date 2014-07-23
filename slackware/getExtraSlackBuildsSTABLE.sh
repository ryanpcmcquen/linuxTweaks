#!/bin/sh

## downloads the extra directory, containing additional packages
## and SlackBuilds not in the main Slackware tree

if [ "$( uname -m )" = "x86_64" ]; then
  wget -r -np -N -R "*.html*","*.sha*","*.meta4","*.mirrorlist" http://mirrors.slackware.com/slackware/slackware64-14.1/extra/ -P ~/
else
  wget -r -np -N -R "*.html*","*.sha*","*.meta4","*.mirrorlist" http://mirrors.slackware.com/slackware/slackware/extra/ -P ~/
fi

