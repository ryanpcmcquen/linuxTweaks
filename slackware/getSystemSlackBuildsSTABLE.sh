#!/bin/sh

## downloads the source directory
## useful for updating stock packages


wget -r -np -N -R "*.html*","*.sha*","*.meta4","*.mirrorlist" http://mirrors.slackware.com/slackware/slackware_source/ -P ~/
mv ~/mirrors.slackware.com/slackware/* ~/

rm -rf ~/mirrors.slackware.com/
