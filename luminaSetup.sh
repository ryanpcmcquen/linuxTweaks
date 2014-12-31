#!/bin/sh

if [ -z "$( cat ~/.lumina/fluxbox-init | grep zimek_darkblue )" ]; then
  sed -i "s@/usr/share/fluxbox/styles/.*@/usr/share/fluxbox/styles/zimek_darkblue@g" ~/.lumina/fluxbox-init
fi

