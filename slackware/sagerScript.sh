#!/bin/sh
## run as root

if [ ! $UID = 0 ]; then
  cat << EOF
This script must be run as root.
EOF
  exit 1
fi

## now part of config-o-matic
#sed -i 's/^append=" vt.default_utf8=[0-9]"/append=" vt.default_utf8=1 acpi_osi=linux acpi_backlight=vendor"/g' /etc/lilo.conf

## multilib
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/bumblebeeMultilibSetup.sh | sh

