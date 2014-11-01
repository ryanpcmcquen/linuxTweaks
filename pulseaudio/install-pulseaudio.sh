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
  if [ -z "$( ls /var/log/packages/ | grep json-c- )" ]; then
    sbopkg -B -i json-c
  fi

  if [ -z "$( ls /var/log/packages/ | grep speex- )" ]; then
    sbopkg -B -i speex
  fi

  ## i hate pulseaudio, but sound doesn't work in some games without it
  if [ -z "$( ls /var/log/packages/ | grep pulseaudio- )" ]; then
    sbopkg -B -i pulseaudio
  fi

  if [ -z "$( ls /var/log/packages/ | grep alsa-plugins- )" ]; then
    sbopkg -B -i alsa-plugins
  fi
#fi
