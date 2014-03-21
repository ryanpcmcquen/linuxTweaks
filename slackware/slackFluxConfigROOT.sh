#!/bin/sh

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/slackFluxConfigROOT.sh | bash

## adjust slackpkg blacklist
sed -i 's/^aaa_elflibs/#aaa_elflibs/g' /etc/slackpkg/blacklist
sed -i 's/^#[0-9]+_SBo/[0-9]+_SBo/g' /etc/slackpkg/blacklist

## choose 64-current mirrorbrain mirror
sed -i 's_^# http://mirrors.slackware.com/slackware/slackware64-current/_http://mirrors.slackware.com/slackware/slackware64-current/_g' /etc/slackpkg/mirrors

curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/bashGitVimROOT.sh | bash

wget -N http://sbopkg.googlecode.com/files/sbopkg-0.37.0-noarch-1_cng.tgz -P ~/
wget -N http://sourceforge.net/projects/slackpkgplus/files/slackpkg%2B-1.3.0-noarch-2mt.txz -P ~/

installpkg ~/*.t?z
