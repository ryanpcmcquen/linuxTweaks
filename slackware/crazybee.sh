#!/bin/sh
## run as root
# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/crazybee.sh | sh


if [ ! $UID = 0 ]; then
  cat << EOF
This script must be run as root.
EOF
  exit 1
fi

if [ ! -z "$(ls /var/log/packages/ | grep compat32 )" ]; then
  export COMPAT32=yes
fi

cd
git clone https://github.com/WhiteWolf1776/Bumblebee-SlackBuilds.git

cd Bumblebee-SlackBuilds/
./download.sh
groupadd bumblebee
usermod -G bumblebee -a ry
usermod -G bumblebee -a root
cd libbsd/
./libbsd.SlackBuild
ls --color=never /tmp/libbsd-*_bbsb.txz | tail -1 | xargs -i upgradepkg --install-new {}
cd ../bumblebee/
./bumblebee.SlackBuild
ls --color=never /tmp/bumblebee-*_bbsb.txz | tail -1 | xargs -i upgradepkg --install-new {}
cd ../bbswitch/
./bbswitch.SlackBuild
ls --color=never /tmp/bbswitch-*_bbsb.txz | tail -1 | xargs -i upgradepkg --install-new {}
cd ../primus/
#COMPAT32=yes ./primus.SlackBuild
./primus.SlackBuild
ls --color=never /tmp/primus-*_bbsb.txz | tail -1 | xargs -i upgradepkg --install-new {}
cd ../nouveau-blacklist/
upgradepkg xf86-video-nouveau-blacklist-noarch-1.txz
if [ -z "$( cat /etc/slackpkg/blacklist | grep xf86-video-nouveau )" ]; then
  echo xf86-video-nouveau >> /etc/slackpkg/blacklist
fi
if [ -z "$( cat /etc/slackpkg/blacklist | grep bbsb )" ]; then
  echo "[0-9]+_bbsb" >> /etc/slackpkg/blacklist
fi
cd ../libvdpau/
./libvdpau.SlackBuild
ls --color=never /tmp/libvdpau-*_bbsb.txz | tail -1 | xargs -i upgradepkg --install-new {}
cd ../nvidia-kernel/
#COMPAT32=yes ./nvidia-kernel.SlackBuild
./nvidia-kernel.SlackBuild
ls --color=never /tmp/nvidia-kernel-*_bbsb.txz | tail -1 | xargs -i upgradepkg --install-new {}
cd ../nvidia-bumblebee/
#COMPAT32=yes ./nvidia-bumblebee.SlackBuild
./nvidia-bumblebee.SlackBuild
ls --color=never /tmp/nvidia-bumblebee-*_bbsb.txz | tail -1 | xargs -i upgradepkg --install-new {}
chmod +x /etc/rc.d/rc.bumblebeed
/etc/rc.d/rc.bumblebeed start

if [ -z "$( cat /etc/rc.d/rc.local | grep bumblebeed )" ]; then
echo "if [ -x /etc/rc.d/rc.bumblebeed ]; then
  /etc/rc.d/rc.bumblebeed start
fi" >> /etc/rc.d/rc.local
fi

if [ -z "$( cat /etc/rc.d/rc.local_shutdown | grep bumblebeed )" ]; then
echo "if [ -x /etc/rc.d/rc.bumblebeed ]; then
  /etc/rc.d/rc.bumblebeed stop
fi" >> /etc/rc.d/rc.local_shutdown
fi

echo "Please reboot to enjoy your new driver."


