#!/bin/sh
## run as root

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/switchToGenericKernel.sh | sh

/usr/share/mkinitrd/mkinitrd_command_generator.sh | sh

if [ -e ~/liloGenericEntry.sh ]; then
  cp ~/liloGenericEntry.sh ~/liloGenericEntry.sh.bak
fi

echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l $(find /boot/ -name 'vmlinuz-generic-*' | tail -1)" > ~/liloGenericEntry.sh

sh ~/liloGenericEntry.sh >> /etc/lilo.conf

lilo -v

## clean up
rm -v ~/liloGenericEntry.sh

