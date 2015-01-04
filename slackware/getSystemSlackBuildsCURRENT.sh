#!/bin/sh

## downloads the source directory
## useful for updating stock packages

if [ "$(uname -m)" = "x86_64" ]; then
  rsync -avz rsync://slackware.cs.utah.edu/slackware/slackware64-current/source/ ~/source/
else
  rsync -avz rsync://slackware.cs.utah.edu/slackware/slackware-current/source/ ~/source/
fi
