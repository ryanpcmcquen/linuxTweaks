#!/bin/sh

if [ -z "$(grep zimek_darkblue ~/.lumina/fluxbox-init)" ]; then
  sed -i.bak "s@/usr/share/fluxbox/styles/.*@/usr/share/fluxbox/styles/zimek_darkblue@g" ~/.lumina/fluxbox-init
fi

