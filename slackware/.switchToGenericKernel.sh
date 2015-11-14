#!/bin/sh
## run as root

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/.switchToGenericKernel.sh | sh

/usr/share/mkinitrd/mkinitrd_command_generator.sh | sh

if [ -e /etc/lilo.conf ]; then
  ## clear out cruft
  if [ -e ~/liloGenericEntry.sh ]; then
    rm -v ~/liloGenericEntry.sh
  fi
  ## this is the magic
  echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l $(find /boot/ -name 'vmlinuz-generic-*' | sort | tail -1)" > ~/liloGenericEntry.sh
  ## check for duplicate entries
  if [ -z "`grep $(cat ~/liloGenericEntry.sh | cut -d- -f4) /etc/lilo.conf`" ]; then
    sh ~/liloGenericEntry.sh >> /etc/lilo.conf
  fi
  ## now we can run lilo
  lilo -v
  ## clean up
  rm -v ~/liloGenericEntry.sh
else
  echo "You aren't using lilo, update your bootloader."
fi

