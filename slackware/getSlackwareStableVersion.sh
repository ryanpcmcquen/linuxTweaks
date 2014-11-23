#!/bin/sh

## versions!

cd

## get stable version number

wget slackware.com -O slackware-home-page.html -P ~/

cat slackware-home-page.html | grep "is released!" | head -1 | sed 's/Slackware//g' | sed 's/is released!//g' | sed 's/ //g' > ~/SlackwareStableVersion

rm slackware-home-page.html


export SLACKSTAVER=${SLACKSTAVER="$( tr -d '\n\r' < ~/SlackwareStableVersion )"}

export DASHSLACKSTAVER=${DASHSLACKSTAVER=-"$( tr -d '\n\r' < ~/SlackwareStableVersion )"}



