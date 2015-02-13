#!/bin/sh
## run as root

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/switchToGenericKernel.sh | sh

/usr/share/mkinitrd/mkinitrd_command_generator.sh | sh

if [ -e ~/liloGenericEntry.sh ]; then
  rm -v ~/liloGenericEntry.sh
fi

echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l $(find /boot/ -name 'vmlinuz-generic-*' | tail -1)" > ~/liloGenericEntry.sh

## check for duplicate entries
if [ -z "grep '$(cat ~/liloGenericEntry.sh | cut -d- -f4)' /etc/lilo.conf" ]; then
  sh ~/liloGenericEntry.sh >> /etc/lilo.conf
fi

lilo -v

## clean up
rm -v ~/liloGenericEntry.sh

