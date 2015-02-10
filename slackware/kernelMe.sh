#!/bin/sh
#
# Script to automate kernel compilation
# Ryan P.C. McQuen | Everett, WA | ryan.q@linux.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version, with the following exception:
# the text of the GPL license may be omitted.
#
# This program is distributed in the hope that it will be useful, but
# without any warranty; without even the implied warranty of
# merchantability or fitness for a particular purpose. Compiling,
# interpreting, executing or merely reading the text of the program
# may result in lapses of consciousness and/or very being, up to and
# including the end of all existence and the Universe as we know it.
# See the GNU General Public License for more details.
#
# You may have received a copy of the GNU General Public License
# along with this program (most likely, a file named COPYING). If
# not, see <http://www.gnu.org/licenses/>.
#
# Place this script in /usr/src, chmod +x it to make it executable
#
# Initial script by Robby Workman <http://rlworkman.net/>
# Slightly modified by Willy Sudiarto Raharjo <willysr@gmail.com>
#
##
## even further m0dz by Ryan P.C. McQuen  ;-)
## with lots of help from Thorn Inurcide
##
if [ ! $UID = 0 ]; then
  cat << EOF
This script must be run as root.
EOF
  exit 1
fi

wget https://www.kernel.org/ -O ~/linux-kernel-home-page.html 

cat ~/linux-kernel-home-page.html | grep "mainline" | grep -A1 ".xz" | head -1 | cut -d/ -f6 \
  | cut -d'"' -f1 | sed 's/patch//' | sed 's/-//' | sed 's/.xz//' \
    > ~/mainlineKernelVersion

cat ~/linux-kernel-home-page.html | grep "stable" | head -3 | tail -1 | cut -d'"' -f2 | cut -d/ -f13 | sed 's/v//' \
  > ~/stableKernelVersion

cat ~/linux-kernel-home-page.html | grep "stable" | head -5 | tail -1 | cut -d'"' -f2 | cut -d/ -f13 | sed 's/v//' \
  > ~/longtermKernelVersion

export MAINLINEKERNEL=${MAINLINEKERNEL="$(tr -d '\n\r' < ~/mainlineKernelVersion)"} 
export STABLEKERNEL=${STABLEKERNEL="$(tr -d '\n\r' < ~/stableKernelVersion)"} 
export LONGTERMKERNEL=${LONGTERMKERNEL="$(tr -d '\n\r' < ~/longtermKernelVersion)"} 

rm -v ~/linux-kernel-home-page.html

echo
echo "-_-****************-_-"
echo "*** KERNEL TIME!!! ***"
echo "-_-****************-_-"
echo
read -p "Which kernel do you want (mainline, stable or longterm)?\
  [m/s/l]: " response
case $response in
  [mM])
    export VERSION=$MAINLINEKERNEL;
    echo "Let's mainline this bizness!";
    ;;
  [sS])
    export VERSION=$STABLEKERNEL;
    echo "Oh so stable, and oh so sweet.";
    ;;
  [lL])
    export VERSION=$LONGTERMKERNEL;
    echo "In for the long haul.";
  *)
    echo "You must choose."
    exit 1
esac
echo
echo
read -p "Do you want 'menuconfig'?\
  [y/N]: " response
case $response in
  [yY][eE][sS]|[yY])
    export CONFIGOPTION=menuconfig;
    echo "You'll get the menu.";
  *)
    export CONFIGOPTION=olddefconfig;
    echo "Just build it already!";
echo
echo

wget -N https://www.kernel.org/pub/linux/kernel/v3.x/linux-$VERSION.tar.xz

CWD='/usr/src' # /usr/src directory
cd $CWD

## un tar dat thing
tar xvf $CWD/linux-$VERSION.tar.xz -C /usr/src/

#
# Remove /usr/src/linux symlink
rm -f /usr/src/linux
#

# Switch to the kernel source directory
cd $CWD/linux-$VERSION
#
make mrproper
# Grab config from the running kernel
zcat /proc/config.gz > /usr/src/linux-$VERSION

# Make the kernel image, Compile, and Install The Modules
make $CONFIGOPTION && make bzImage && make modules && make modules_install

# copy new files into /boot, remove old symlinks, and make new symlinks
cp $CWD/linux-$VERSION/.config /boot/config-$VERSION
cp $CWD/linux-$VERSION/System.map /boot/System.map-$VERSION
cp $CWD/linux-$VERSION/arch/x86/boot/bzImage /boot/vmlinuz-$VERSION

cd /boot
rm -f vmlinuz System.map config

ln -s vmlinuz-$VERSION vmlinuz
ln -s System.map-$VERSION System.map
ln -s config-$VERSION config

## this is from my generic kernel script
/usr/share/mkinitrd/mkinitrd_command_generator.sh /boot/vmlinuz-$VERSION | sh
if [ -e ~/liloGenericEntry.sh ]; then
  cp ~/liloGenericEntry.sh ~/liloGenericEntry.sh.bak
fi

echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l $(find /boot/ -name 'vmlinuz-*' | tail -1)" > ~/liloGenericEntry.sh

## check for duplicate entries
if [ -z "grep '$(cat ~/liloGenericEntry.sh | cut -d- -f3)' /etc/lilo.conf" ]; then
  sh ~/liloGenericEntry.sh >> /etc/lilo.conf
fi

lilo -v

## clean up
rm -v ~/liloGenericEntry.sh

## clean up
rm -v ~/mainlineKernelVersion
rm -v ~/stableKernelVersion
rm -v ~/longtermKernelVersion

#
# The last `ln` line above placed a copy of your kernel config file in /boot
# (just in case)
#
# After you've verified that the kernel boots and works properly, you
# can safely delete the /boot-old directory created by this script
# (do rm -R /boot-old) --don't make a typo here, though! :-)
#
# Good luck!
