#!/bin/sh
## run as root

# Ryan P. C. McQuen | Everett, WA

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/crazybee.sh | sh

STABLE=${STABLE:-no}
REINSTALL=${REINSTALL:-no}
UPDATE=${UPDATE:-yes}

if [ ! $UID = 0 ]; then
  cat << EOF
This script must be run as root.
EOF
  exit 1
fi

if [ -e ~/Bumblebee-SlackBuilds/crazybee.sh ]; then
  echo "Reinstall!"
  export REINSTALL=${REINSTALL:-yes}
elif [ -d ~/Bumblebee-SlackBuilds/ ]; then
  cat << EOF
You already have the bumblebee directory,
please rename to avoid changes you may have made.
EOF
  exit 1
fi

if [ "$(uname -m)" = "x86_64" ] && [ -e /lib/libc.so.6 ]; then
  export COMPAT32=yes;
fi

install_latest_pkg() {
  PACKAGE=$1
  if [ -d "$PACKAGE/" ]; then
    cd $PACKAGE/
  else
    cd ../$PACKAGE/
  fi
  sh $PACKAGE.SlackBuild
  ls -t --color=never /tmp/$PACKAGE-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}
}

install_latest_pkg_compat() {
  PACKAGE=$1
  if [ -d "$PACKAGE/" ]; then
    cd $PACKAGE/
  else
    cd ../$PACKAGE/
  fi
  if [ "$COMPAT32" = yes ]; then
    COMPAT32=yes sh $PACKAGE.SlackBuild
  else
    sh $PACKAGE.SlackBuild
  fi
  ls -t --color=never /tmp/$PACKAGE-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}
}

if [ "$UPDATE" = "yes" -a "$REINSTALL" = "no" ]; then
  cd
  git clone https://github.com/WhiteWolf1776/Bumblebee-SlackBuilds.git
  cd Bumblebee-SlackBuilds/
fi

if [ "$UPDATE" = "yes" -a "$STABLE" = "yes" ]; then
  git checkout 14.1
fi

## in case there are updates ;-)
if [ "$UPDATE" = "yes" -a "$REINSTALL" = "yes" ]; then
  git pull
fi

## let's get some tarballs!
sh download.sh

groupadd bumblebee
## add all non-root users (except ftp) to bumblebee group
getent passwd | grep "/home" | cut -d: -f1 | sed '/ftp/d' | xargs -i usermod -G bumblebee -a {}

install_latest_pkg libbsd

install_latest_pkg bumblebee

install_latest_pkg bbswitch

install_latest_pkg_compat primus
install_latest_pkg_compat primus_vk

cd ../nouveau-blacklist/
removepkg xf86-video-nouveau-blacklist-noarch-1.txz
ls -t --color=never xf86-video-nouveau-blacklist-*noarch-[0-9]*.txz | \
    head -1 | xargs -i upgradepkg --install-new --reinstall {}
if [ -z "$(grep xf86-video-nouveau /etc/slackpkg/blacklist)" ]; then
  echo xf86-video-nouveau >> /etc/slackpkg/blacklist
fi
if [ -z "$(grep _bbsb /etc/slackpkg/blacklist)" ]; then
  echo "[0-9]+_bbsb" >> /etc/slackpkg/blacklist
fi

if [ "$STABLE" = "yes" ]; then
  install_latest_pkg libvdpau
fi

install_latest_pkg nvidia-kernel

install_latest_pkg_compat nvidia-bumblebee

chmod +x /etc/rc.d/rc.bumblebeed
/etc/rc.d/rc.bumblebeed start

if [ -z "$(grep bumblebeed /etc/rc.d/rc.local)" ]; then
echo "if [ -x /etc/rc.d/rc.bumblebeed ]; then
  /etc/rc.d/rc.bumblebeed start
fi" >> /etc/rc.d/rc.local
fi

if [ -z "$(grep bumblebeed /etc/rc.d/rc.local_shutdown)" ]; then
echo "if [ -x /etc/rc.d/rc.bumblebeed ]; then
  /etc/rc.d/rc.bumblebeed stop
fi" >> /etc/rc.d/rc.local_shutdown
fi

## these have to be executable to work  :-)
chmod 755 /etc/rc.d/rc.local
chmod 755 /etc/rc.d/rc.local_shutdown

if [ "$UPDATE" = "yes" ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/crazybee.sh -P ~/Bumblebee-SlackBuilds
fi

echo
echo "+===========================================+"
echo "+  Please reboot to enjoy your new driver.  +"
echo "+===========================================+"
echo

