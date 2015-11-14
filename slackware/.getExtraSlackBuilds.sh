#!/bin/sh

## downloads the extra directory, containing additional packages
## and SlackBuilds not in the main Slackware tree

if [ "$(uname -m)" = "x86_64" ]; then
  rsync -avz rsync://slackware.cs.utah.edu/slackware/slackware64-current/extra/ ~/extra/
else
  rsync -avz rsync://slackware.cs.utah.edu/slackware/slackware-current/extra/ ~/extra/
fi

