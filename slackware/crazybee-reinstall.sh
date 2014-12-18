#!/bin/sh
## run as root
# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/crazybee-reinstall.sh | sh


if [ ! $UID = 0 ]; then
  cat << EOF
This script must be run as root.
EOF
  exit 1
fi

if [ "$( uname -m )" = "x86_64" ] && [ -e /lib/libc.so.6 ]; then
  export COMPAT32=yes;
fi

cd

cd Bumblebee-SlackBuilds/

git pull

./download.sh

groupadd bumblebee
cat /etc/passwd | grep "/home" | cut -d: -f1 | xargs -i usermod -G bumblebee -a {}

cd libbsd/
./libbsd.SlackBuild
ls -t --color=never /tmp/libbsd-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}

cd ../bumblebee/
./bumblebee.SlackBuild
ls -t --color=never /tmp/bumblebee-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}

cd ../bbswitch/
./bbswitch.SlackBuild
ls -t --color=never /tmp/bbswitch-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}

cd ../primus/
if [ "$COMPAT32" = yes ]; then
  COMPAT32=yes ./primus.SlackBuild
else
  ./primus.SlackBuild
fi
ls -t --color=never /tmp/primus-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}

cd ../nouveau-blacklist/
upgradepkg --reinstall xf86-video-nouveau-blacklist-noarch-1.txz
if [ -z "$( cat /etc/slackpkg/blacklist | grep xf86-video-nouveau )" ]; then
  echo xf86-video-nouveau >> /etc/slackpkg/blacklist
fi
if [ -z "$( cat /etc/slackpkg/blacklist | grep _bbsb )" ]; then
  echo "[0-9]+_bbsb" >> /etc/slackpkg/blacklist
fi

cd ../libvdpau/
./libvdpau.SlackBuild
ls -t --color=never /tmp/libvdpau-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}

cd ../nvidia-kernel/
if [ "$COMPAT32" = yes ]; then
  COMPAT32=yes ./nvidia-kernel.SlackBuild
else
  ./nvidia-kernel.SlackBuild
fi
ls -t --color=never /tmp/nvidia-kernel-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}

cd ../nvidia-bumblebee/
if [ "$COMPAT32" = yes ]; then
  COMPAT32=yes ./nvidia-bumblebee.SlackBuild
else
  ./nvidia-bumblebee.SlackBuild
fi
ls -t --color=never /tmp/nvidia-bumblebee-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}

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


