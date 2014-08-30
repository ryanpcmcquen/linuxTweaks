#!/bin/sh
## run as root

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/switchToGenericKernel.sh | sh

/usr/share/mkinitrd/mkinitrd_command_generator.sh | sh

if [ ! -z "$(ls ~/liloGenericEntry.sh)" ]; then
  cp ~/liloGenericEntry.sh ~/liloGenericEntry.sh.bak
fi

### works, but inefficient
##ls --color=never /boot/vmlinuz-generic-* | tail -1 > ~/liloGenericEntry.sh
##echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l $(cat liloGenericEntry.sh)" > ~/liloGenericEntry.sh

echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l $(ls --color=never /boot/vmlinuz-generic-* | tail -1)" > ~/liloGenericEntry.sh

sh ~/liloGenericEntry.sh >> /etc/lilo.conf

lilo -v

rm ~/liloGenericEntry.sh
