#!/bin/sh
# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/restoreFluxbox.sh | sh


if [ -e /var/log/packages/tinyterm-* ]; then
  ## tinyterm
  sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec tinyterm\
  /g' ~/.fluxbox/keys
else
  ## uxterm
  sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec uxterm -rv -geometry 130x30\
  /g' ~/.fluxbox/keys
fi


## fix audio key settings, verify with xev
sed -i 's/^176 :Exec amixer sset Master,0 1+/123 :Exec amixer sset Master,0 1+\
/g' ~/.fluxbox/keys
sed -i 's/^174 :Exec amixer sset Master,0 1-/122 :Exec amixer sset Master,0 1-\
/g' ~/.fluxbox/keys
sed -i 's/^160 :Exec amixer sset Master,0 toggle/121 :Exec amixer sset Master,0 toggle\
/g' ~/.fluxbox/keys

## fix brightness keys
if [ -z "$(cat ~/.fluxbox/keys | grep 'xbacklight -dec')" ]; then
  echo >> ~/.fluxbox/keys
  echo "232 :Exec xbacklight -dec 10" >> ~/.fluxbox/keys
  echo "233 :Exec xbacklight -inc 10" >> ~/.fluxbox/keys
fi

sed -i 's@^# idesk &@\
if [ -x /etc/rc.d/rc.networkmanager ]; then \
  nm-applet \&\
fi \
if [ -x /etc/rc.d/rc.wicd ]; then \
  wicd-client -t \&\
fi \
if [ -e /usr/bin/compton ]; then \
  compton \&\
fi \
gkrellm \&\
if [ -e /usr/bin/CopyAgent ]; then \
  CopyAgent \&\
fi \
fbsetbg -l\
@g' ~/.fluxbox/startup

## paint it black
fbsetbg -b -solid black

## idempotent, finally!
if [ -z "$(cat ~/.fluxbox/init | grep workspaceNames)" ]; then
  echo "session.screen0.workspaceNames: 1,2,3,4," >> ~/.fluxbox/init
  echo "session.screen0.toolbar.widthPercent: 50" >> ~/.fluxbox/init
  echo "session.screen0.workspacewarping: false" >> ~/.fluxbox/init
  echo "session.screen0.focusModel:	MouseFocus" >> ~/.fluxbox/init
  echo "session.autoRaiseDelay: 500" >> ~/.fluxbox/init
else
  sed -i "s@session.screen0.workspaceNames:.*@session.screen0.workspaceNames: 1,2,3,4,@g" ~/.fluxbox/init
  sed -i "s@session.screen0.toolbar.widthPercent:.*@session.screen0.toolbar.widthPercent: 50@g" ~/.fluxbox/init
  sed -i "s@session.screen0.workspacewarping:.*@session.screen0.workspacewarping: false@g" ~/.fluxbox/init
  sed -i "s@session.screen0.focusModel:.*@session.screen0.focusModel:	MouseFocus@g" ~/.fluxbox/init
  sed -i "s@session.autoRaiseDelay:.*@session.autoRaiseDelay: 500@g" ~/.fluxbox/init
fi

if [ -d "/usr/share/fluxbox/styles/Greenish Fluxbox" ]; then
  sed -i "s@session.styleFile:.*@session.styleFile: /usr/share/fluxbox/styles/Greenish Fluxbox@g" ~/.fluxbox/init
else
  mkdir -pv ~/.fluxbox/styles/
  wget -N https://github.com/ryanpcmcquen/themes/raw/master/Greenish%20Fluxbox.zip -P ~/
  unzip -o ~/Greenish\ Fluxbox.zip -d ~/.fluxbox/styles/
  rm -v ~/Greenish\ Fluxbox.zip
  sed -i "s@session.styleFile:.*@session.styleFile: /home/ry/.fluxbox/styles/Greenish Fluxbox@g" ~/.fluxbox/init
fi

## make the cursor beautiful, maybe icons too
mkdir -pv ~/.icons/
if [ ! -e ~/.icons/default ]; then
  if [ -d "/usr/share/icons/Oxygen_White/" ]; then
    ln -sfv /usr/share/icons/Oxygen_White/ ~/.icons/default
  else
    ln -sfv /usr/share/icons/nuvola/ ~/.icons/default
  fi
fi

