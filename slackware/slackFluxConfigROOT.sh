#!/bin/sh

## adjust slackpkg blacklist
sed -i 's/^aaa_elflibs/#aaa_elflibs/g' /etc/slackpkg/blacklist
sed -i 's/^#[0-9]+_SBo/[0-9]+_SBo/g' /etc/slackpkg/blacklist

## choose 64-current mirrorbrain mirror
sed -i 's_^# http://mirrors.slackware.com/slackware/slackware64-current/_http://mirrors.slackware.com/slackware/slackware64-current/_g' /etc/slackpkg/mirrors

