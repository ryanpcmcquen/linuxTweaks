#!/bin/sh

## download Pat's awesome java SlackBuild

if [ "$( uname -m )" = "x86_64" ]; then
  wget -r -np -N -R "*.html*","*.sha*","*.meta4","*.mirrorlist" http://mirrors.slackware.com/slackware/slackware64-current/extra/java/ -P ~/
  mv ~/mirrors.slackware.com/slackware/slackware64-current/extra/* ~/
else
  wget -r -np -N -R "*.html*","*.sha*","*.meta4","*.mirrorlist" http://mirrors.slackware.com/slackware/slackware-current/extra/java/ -P ~/
  mv ~/mirrors.slackware.com/slackware/slackware-current/extra/* ~/
fi

rm -rf ~/mirrors.slackware.com/

