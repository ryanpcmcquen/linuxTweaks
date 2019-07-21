#!/bin/sh
#
# Script to automate linux-libre compilation.
# Ryan P. C. McQuen | Everett, WA | ryanpcmcquen@member.fsf.org
#
################################
### TO INSTALL/USE (MAKE SURE YOU ARE ROOT!):
### wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/kernelLibreLatestMe.sh -P /usr/src/
### cd /usr/src/
### sh kernelLibreLatestMe.sh
################################
#
# Place this script in /usr/src, chmod +x it to make it executable
#
# Initial script by Robby Workman <http://rlworkman.net/>
# Slightly modified by Willy Sudiarto Raharjo <willysr@gmail.com>
#
##
## Even further m0dz by Ryan P. C. McQuen,
## With lots of help from Thorn Inurcide.
##
if [ ! $UID = 0 ]; then
  cat << EOF
This script must be run as root.
EOF
  exit 1
fi

if [ -z "$1" ]; then
  ## Grab kernel page to get version numbers:
  wget https://linux-libre.fsfla.org/pub/linux-libre/releases/ -O ~/linux-libre-release-page.html

  grep 'gnu' ~/linux-libre-release-page.html | tail -1 | sed 's/.*href="//g' | sed 's/-gnu.*//g' \
    > ~/latestLibreKernelVersion

  ## Set VERSION:
  export VERSION=${VERSION="$(tr -d '\n\r' < ~/latestLibreKernelVersion)"}

  ## Clean up.
  rm -v ~/linux-libre-release-page.html
else
  export VERSION=${VERSION=$1}
fi

echo
echo "-_-****************-_-"
echo "*** KERNEL TIME!!! ***"
echo "-_-****************-_-"
echo

echo
echo "You are building Linux $VERSION."
echo
read -p "Do you want 'menuconfig'?\
  [y/N]: " response
case $response in
  [yY][eE][sS]|[yY])
    export CONFIGOPTION=menuconfig;
    echo "You'll get the menu.";
    ;;
  *)
    export CONFIGOPTION=olddefconfig;
    echo "Just build it already!";
    ;;
esac
echo
echo

## Get to the right place:
CWD='/usr/src'
cd $CWD

## Grab the kernel.
wget -N \
  https://linux-libre.fsfla.org/pub/linux-libre/releases/${VERSION}-gnu/linux-libre-${VERSION}-gnu.tar.xz \
  -P /usr/src/

## Check if wget failed:
if [ $? -ne 0 ]; then
  echo "Version number is bunk, try again."
  echo
  exit 1
fi

## Un tar dat thing:
tar xvf $CWD/linux-libre-${VERSION}-gnu.tar.xz -C /usr/src/

# Switch to the kernel source directory:
cd $CWD/linux-$VERSION

make mrproper

## Set this to the running config, override if needed:
KERNELCONFIG=${KERNELCONFIG:-/proc/config.gz}

## Get the config, do the 'or cat' in case someone feeds a non-gzipped config.
zcat ${KERNELCONFIG} > /usr/src/linux-$VERSION/.config || cat ${KERNELCONFIG} > /usr/src/linux-$VERSION/.config

# Make the kernel image, Compile, and Install The Modules.
make $CONFIGOPTION && make bzImage && make modules && make modules_install

# Copy new files into /boot:
cp $CWD/linux-$VERSION/.config /boot/config-$VERSION
cp $CWD/linux-$VERSION/System.map /boot/System.map-$VERSION
cp $CWD/linux-$VERSION/arch/x86/boot/bzImage /boot/vmlinuz-$VERSION

## I don't like removing a working kernel,
## this script already adds the new one as a 
## separate lilo entry, and does so by version name.
##
##cd /boot
##rm -f vmlinuz System.map config
##
##ln -s vmlinuz-$VERSION vmlinuz
##ln -s System.map-$VERSION System.map
##ln -s config-$VERSION config

HUGE=${HUGE:-y}

if [ "$HUGE" = n ]; then
  ## This is a m0d of my generic kernel script:
  /usr/share/mkinitrd/mkinitrd_command_generator.sh -r /boot/vmlinuz-$VERSION | sh
  
  ## Check for lilo, otherwise running this stuff is a waste.
  if [ -e /etc/lilo.conf ]; then
    if [ -e ~/liloGenericEntry.sh ]; then
      rm -v ~/liloGenericEntry.sh
    fi
    
    echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-$VERSION" > ~/liloGenericEntry.sh
    
    ## Check for duplicate entries.
    if [ -z "`grep vmlinuz-$VERSION /etc/lilo.conf`" ]; then
      sh ~/liloGenericEntry.sh >> /etc/lilo.conf
    fi
    
    lilo -v
    
    ## Clean up:
    rm -v ~/liloGenericEntry.sh
  fi
elif [ "$HUGE" = y ]; then
  if [ -e /etc/lilo.conf ]; then
    if [ -z "`grep vmlinuz-$VERSION /etc/lilo.conf`" ]; then
      export ROOTMOUNT=$(lsblk -l | grep -E '/$' | cut -d' ' -f1)

      echo >> /etc/lilo.conf
      echo "## kernelMe config start" >> /etc/lilo.conf
      echo "image = /boot/vmlinuz-$VERSION" >> /etc/lilo.conf
      echo "  root = /dev/$ROOTMOUNT" >> /etc/lilo.conf
      echo "  label = $VERSION" >> /etc/lilo.conf
      echo "  read-only" >> /etc/lilo.conf
      echo "## kernelMe config end" >> /etc/lilo.conf
      echo >> /etc/lilo.conf

      lilo -v
    fi
  fi
fi

if [ ! -e /etc/lilo.conf ]; then
  echo "You aren't using LILO, update your bootloader."
fi

## More clean up.
rm -v ~/latestLibreKernelVersion

echo
echo "If you have LILO your new kernel is ready (as a new entry), so you can happily reboot."
echo
echo "If you don't have LILO, you'll need to bring your bootloader up to speed!"
echo
echo "ENJOY!"

## Good luck!
