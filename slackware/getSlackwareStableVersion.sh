#!/bin/sh
## versions!
cd
## get stable slackware version
wget www.slackware.com -O ~/slackware-home-page.html
cat ~/slackware-home-page.html | grep "is released!" | head -1 | sed 's/Slackware//g' | \
  sed 's/is released!//g' | sed 's/ //g' > ~/slackwareStableVersion
rm -v ~/slackware-home-page.html

export SLACKSTAVER=${SLACKSTAVER="$( tr -d '\n\r' < ~/slackwareStableVersion )"}
export DASHSLACKSTAVER=${DASHSLACKSTAVER=-"$( tr -d '\n\r' < ~/slackwareStableVersion )"}

