#!/bin/sh
if [ ! -e /etc/asound.conf ]; then
  ## sets the analog card to your default output,
  ## helpful with some systems, innocuous otherwise
  egrep '^defaults.*card.*[0-9]$' /usr/share/alsa/alsa.conf > /etc/asound.conf.default
  ALSACARDNUMBER=`aplay -l | grep Analog | head -1 | cut -d: -f1 | sed 's/card //g'`
  sed "s/[0-9]/${ALSACARDNUMBER}/g" /etc/asound.conf.default > /etc/asound.conf
fi
