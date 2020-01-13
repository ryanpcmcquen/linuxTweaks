#!/bin/sh
# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.restoreFluxbox.sh | sh


# if [ "`find /var/log/packages/ -name tinyterm-*`" ]; then
#   ## tinyterm
#   sed -i.bak 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec tinyterm\
#   /g' ~/.fluxbox/keys
# else
#   ## uxterm
#   sed -i.bak 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec uxterm -rv -geometry 130x30\
#   /g' ~/.fluxbox/keys
# fi

## add additional audio keys, verify with xev
sed -i.bak 's@^176 :Exec amixer sset.*@123 :Exec pamixer -i 5\
176 :Exec pamixer -i 5@g' ~/.fluxbox/keys
sed -i.bak 's@^174 :Exec amixer sset.*@122 :Exec pamixer -d 5\
174 :Exec pamixer -d 5@g' ~/.fluxbox/keys
sed -i.bak 's@^160 :Exec amixer sset.*@121 :Exec pamixer -t\
160 :Exec pamixer -t@g' ~/.fluxbox/keys

## fix brightness keys
if [ -z "$(grep '232 :Exec' ~/.fluxbox/keys)" ]; then
  echo >> ~/.fluxbox/keys
  echo "232 :Exec xbacklight -dec 10" >> ~/.fluxbox/keys
  echo "233 :Exec xbacklight -inc 10" >> ~/.fluxbox/keys
fi

if [ -z "$(grep 'Print :Exec' ~/.fluxbox/keys)" ]; then
  echo 'Print :Exec import screenshot_$(date +%F__%H-%M-%S-%3N).png' >> ~/.fluxbox/keys
fi

sed -i.bak 's@^# idesk &@\
if [ -x /etc/rc.d/rc.networkmanager ]; then \
  nm-applet \&\
fi \
if [ -e /usr/bin/compton ]; then \
  compton \&\
fi \
gkrellm \&\
fbsetbg -l\
@g' ~/.fluxbox/startup

## grey is the new pink, uncomment to set bg
#fbsetbg -b -solid grey

## idempotent, finally!
if [ -z "$(grep workspaceNames ~/.fluxbox/init)" ]; then
  echo "session.screen0.workspaceNames: 1,2,3,4," >> ~/.fluxbox/init
  echo "session.screen0.toolbar.widthPercent: 50" >> ~/.fluxbox/init
  echo "session.screen0.workspacewarping: false" >> ~/.fluxbox/init
  echo "session.screen0.focusModel:	MouseFocus" >> ~/.fluxbox/init
  echo "session.autoRaiseDelay: 500" >> ~/.fluxbox/init
else
  sed -i.bak "s@session.screen0.workspaceNames:.*@session.screen0.workspaceNames: 1,2,3,4,@g" ~/.fluxbox/init
  sed -i.bak "s@session.screen0.toolbar.widthPercent:.*@session.screen0.toolbar.widthPercent: 50@g" ~/.fluxbox/init
  sed -i.bak "s@session.screen0.workspacewarping:.*@session.screen0.workspacewarping: false@g" ~/.fluxbox/init
  sed -i.bak "s@session.screen0.focusModel:.*@session.screen0.focusModel:	MouseFocus@g" ~/.fluxbox/init
  sed -i.bak "s@session.autoRaiseDelay:.*@session.autoRaiseDelay: 500@g" ~/.fluxbox/init
fi

if [ -d "/usr/share/fluxbox/styles/Stealthy" ]; then
  sed -i.bak "s@session.styleFile:.*@session.styleFile: /usr/share/fluxbox/styles/Stealthy@g" ~/.fluxbox/init
else
  mkdir -pv ~/.fluxbox/styles/
  wget -N https://github.com/ryanpcmcquen/themes/raw/master/67966-Stealthy-1.1.tgz -P ~/
  tar xvf ~/67966-Stealthy-1.1.tgz -C ~/.fluxbox/styles/
  rm -v ~/67966-Stealthy-1.1.tgz
  sed -i.bak "s@session.styleFile:.*@session.styleFile: /home/ry/.fluxbox/styles/Stealthy@g" ~/.fluxbox/init
fi

## make the cursor beautiful, maybe icons too
mkdir -pv ~/.icons/
if [ ! -e ~/.icons/default ]; then
  if [ -d "/usr/share/icons/Oxygen_Zion/" ]; then
    ln -sfv /usr/share/icons/Oxygen_Zion/ ~/.icons/default
  else
    ln -sfv /usr/share/icons/nuvola/ ~/.icons/default
  fi
fi

