#!/bin/sh
## run as root
# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/bumblebeeSetup.sh | sh


if [ ! $UID = 0 ]; then
cat << EOF
This script must be run as root.
EOF
exit 1
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
upgradepkg --install-new /tmp/libbsd-*_bbsb.txz
cd ../bumblebee/
./bumblebee.SlackBuild
upgradepkg --install-new /tmp/bumblebee-*_bbsb.txz
cd ../bbswitch/
./bbswitch.SlackBuild
upgradepkg --install-new /tmp/bbswitch-*_bbsb.txz
cd ../primus/
COMPAT32=yes ./primus.SlackBuild
upgradepkg --install-new /tmp/primus-*_bbsb.txz
cd ../nouveau-blacklist/
upgradepkg xf86-video-nouveau-blacklist-noarch-1.txz
echo xf86-video-nouveau >> /etc/slackpkg/blacklist
echo "[0-9]+_bbsb" >> /etc/slackpkg/blacklist
cd ../libvdpau/
./libvdpau.SlackBuild
upgradepkg --install-new /tmp/libvdpau-*_bbsb.txz
cd ../nvidia-kernel/
COMPAT32=yes ./nvidia-kernel.SlackBuild
upgradepkg --install-new /tmp/nvidia-kernel-*_bbsb.txz
cd ../nvidia-bumblebee/
COMPAT32=yes ./nvidia-bumblebee.SlackBuild
upgradepkg --install-new /tmp/nvidia-bumblebee-*_bbsb.txz
chmod +x /etc/rc.d/rc.bumblebeed
/etc/rc.d/rc.bumblebeed start

echo "if [ -x /etc/rc.d/rc.bumblebeed ]; then
  /etc/rc.d/rc.bumblebeed start
fi" >> /etc/rc.d/rc.local
echo "if [ -x /etc/rc.d/rc.bumblebeed ]; then
  /etc/rc.d/rc.bumblebeed stop
fi" >> /etc/rc.d/rc.local_shutdown

