#!/bin/sh

# curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/slackware/config-o-matic/slackFluxConfigROOT.sh | bash

if [ ! $UID = 0 ]; then
  cat << EOF

This script must be run as root.

EOF
  exit 1
fi


## configure lilo
sed -i 's/^#compact/lba32\
compact/g' /etc/lilo.conf

sed -i 's/^timeout = 50/timeout = 5/g' /etc/lilo.conf
sed -i 's/^timeout = 1200/timeout = 5/g' /etc/lilo.conf

lilo

## change to utf-8 encoding
sed -i 's/^export LANG=en_US/#export LANG=en_US/g' /etc/profile.d/lang.sh
sed -i 's/^#export LANG=en_US.UTF-8/export LANG=en_US.UTF-8/g' /etc/profile.d/lang.sh


## adjust slackpkg blacklist
sed -i 's/^aaa_elflibs/#aaa_elflibs/g' /etc/slackpkg/blacklist

sed -i 's/#\[0-9]+_SBo/\
\[0-9]+_SBo\
sbopkg/g' /etc/slackpkg/blacklist


## choose 32 or 64-current mirrorbrain mirror
sed -i 's_^# http://mirrors.slackware.com/slackware/slackware64-current/_http://mirrors.slackware.com/slackware/slackware64-current/_g' /etc/slackpkg/mirrors
sed -i 's_^# http://mirrors.slackware.com/slackware/slackware-current/_http://mirrors.slackware.com/slackware/slackware-current/_g' /etc/slackpkg/mirrors

curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/bashGitVimROOT.sh | bash

wget -N http://sbopkg.googlecode.com/files/sbopkg-0.37.0-noarch-1_cng.tgz -P ~/
wget -N http://sourceforge.net/projects/slackpkgplus/files/slackpkg%2B-1.3.0-noarch-2mt.txz -P ~/

installpkg ~/*.t?z

#mv /etc/slackpkg/slackpkgplus.conf /etc/slackpkg/slackpkgplus.conf.old
#wget -N https://raw.github.com/ryanpcmcquen/linuxTweaks/master/slackware/slackpkgplus.conf -P /etc/slackpkg/

sed -i 's/^#PKGS_PRIORITY=( myrepo:.* )/\
PKGS_PRIORITY=( alienbob-current:.* restricted-current:.* )/g' /etc/slackpkg/slackpkgplus.conf

sed -i 's_^#MIRRORPLUS['zerouno']=http://www.z01.eu/repo-slack/slackware64-current/_\
#MIRRORPLUS['zerouno']=http://www.z01.eu/repo-slack/slackware64-current/\
MIRRORPLUS['alienbob-current']=http://taper.alienbase.nl/mirrors/people/alien/sbrepos/current/x86_64/\
MIRRORPLUS['restricted-current']=http://taper.alienbase.nl/mirrors/people/alien/restricted_sbrepos/current/x86_64/_g'


