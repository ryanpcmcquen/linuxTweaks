#!/bin/sh
## run as root

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/switchToGenericKernel.sh | sh

#GETKERNELNAME="ls --color=never /boot/vmlinuz-generic-* | tail -1"

/usr/share/mkinitrd/mkinitrd_command_generator.sh | sh

#echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l \ " >> ~/switchKernel.sh
#echo -n "$GETKERNELNAME" >> ~/kernel-desc


ls --color=never /boot/vmlinuz-generic-* | tail -1 > ~/switchKernel.sh
echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l $(cat switchKernel.sh)" > ~/switchKernel.sh

#echo "/usr/share/mkinitrd/mkinitrd_command_generator.sh -l " && $(cat switchKernel.sh) > ~/switchKernel.sh
#echo '/usr/share/mkinitrd/mkinitrd_command_generator.sh -l '$'\n'"$(cat switchKernel.sh" > ~/switchKernel.sh


sh ~/switchKernel.sh >> /etc/lilo.conf

lilo -v

rm ~/switchKernel.sh
