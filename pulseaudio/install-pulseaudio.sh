#!/bin/sh

#if [ "$NEARFREE" != true ]; then
#  read -p "Do you need PULSEAUDIO? [y/N]: " response
#  case $response in
#    [yY][eE][sS]|[yY])
#      export PULSECRAPIO=true;
#      echo You are installing PULSEAUDIO.;
#      ;;
#    *)
#      echo You are not installing PULSEAUDIO.;
#      ;;
#  esac
#fi

#if [ "$NEARFREE" != true ] && [ "$PULSECRAPIO" = true ]; then
  if [ ! -e /var/log/packages/json-c-* ]; then
    sbopkg -B -i json-c
  fi

  if [ ! -e /var/log/packages/speex-* ]; then
    sbopkg -B -i speex
  fi

  ## i hate pulseaudio, and it breaks sound in everything
  if [ ! -e /var/log/packages/pulseaudio-* ]; then
    sbopkg -B -i pulseaudio
  fi

  if [ ! -e /var/log/packages/alsa-plugins-* ]; then
    sbopkg -B -i alsa-plugins
  fi
#fi
