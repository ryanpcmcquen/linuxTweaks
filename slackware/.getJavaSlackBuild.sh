#!/bin/sh

## download Pat's awesome java SlackBuild

if [ "$(uname -m)" = "x86_64" ]; then
  rsync -avz rsync://slackware.cs.utah.edu/slackware/slackware64-current/extra/java/ ~/java/
else
  rsync -avz rsync://slackware.cs.utah.edu/slackware/slackware-current/extra/java/ ~/java/
fi

