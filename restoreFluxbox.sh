#!/bin/sh

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/restoreFluxbox.sh | sh


## lxterminal
#sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec lxterminal --geometry=140x40\
#/g' ~/.fluxbox/keys

## roxterm
#sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec roxterm --geometry=140x40\
#/g' ~/.fluxbox/keys

## terminator
#sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec terminator -m\
#/g' ~/.fluxbox/keys


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
if [ "$( tail -1 ~/.fluxbox/keys )" = "Control Mod4 F12 :TakeToWorkspace 12" ]; then
  echo
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
compton \&\
gkrellm \&\
CopyAgent \&\
fbsetbg -l\
@g' ~/.fluxbox/startup


## this directory may not exist,
## doesn't hurt either way with -p
mkdir -pv ~/.fluxbox/styles/


## crunchy orange
#wget -N http://box-look.org/CONTENT/content-files/136162-Crunchy-themes.tar.gz -P ~/
#mkdir -pv ~/crunchy-theme/
#tar xvf ~/136162-Crunchy-themes.tar.gz -C ~/crunchy-theme/
#mv -v ~/crunchy-theme/fluxbox/styles/* ~/.fluxbox/styles/
#rm -rfv ~/crunchy-theme/
#rm -v ~/136162-Crunchy-themes.tar.gz

## delorean
#wget -N http://fc06.deviantart.net/fs71/f/2014/179/a/c/fluxbox_delorean_3_6_g_by_son_link-d7ob75i.zip -P ~/
#unzip ~/fluxbox_delorean_3_6_g_by_son_link-d7ob75i.zip -d ~/.fluxbox/styles/
#rm -v ~/fluxbox_delorean_3_6_g_by_son_link-d7ob75i.zip

## dustflux
#wget -N http://box-look.org/CONTENT/content-files/164693-DustFlux-Mod.tar.gz -P ~/
#tar xvf ~/164693-DustFlux-Mod.tar.gz -C ~/.fluxbox/styles/
#rm -v ~/164693-DustFlux-Mod.tar.gz

## dyne
#wget -N http://box-look.org/CONTENT/content-files/61999-Dyne-fluxbox.tar.gz -P ~/
#tar xvf ~/61999-Dyne-fluxbox.tar.gz -C ~/.fluxbox/styles/
#rm -v ~/61999-Dyne-fluxbox.tar.gz

## elberg
#wget -N http://box-look.org/CONTENT/content-files/164846-Elberg.tar.gz -P ~/
#tar xvf ~/164846-Elberg.tar.gz -C ~/.fluxbox/styles/
#rm -v ~/164846-Elberg.tar.gz

## elfin2
#wget -N http://files.customize.org/download/files/53359/Elfin2-fluxbox.tar.gz -P ~/
#tar xvf ~/Elfin2-fluxbox.tar.gz -C ~/.fluxbox/styles/
#rm -v ~/Elfin2-fluxbox.tar.gz

## gsm
#wget -N http://files.customize.org/download/files/49241/GSM.tar.gz -P ~/
#tar xvf ~/GSM.tar.gz -C ~/.fluxbox/styles/
#rm -v ~/GSM.tar.gz

## minimal black
wget -N http://files.customize.org/download/files/89763/18044/minimal_black.tar.gz -P ~/
tar xfv ~/minimal_black.tar.gz -C ~/.fluxbox/styles/
rm -v ~/minimal_black.tar.gz

## ubuntu
#wget -N http://files.customize.org/download/files/85983/16545/ubuntu.tar.gz -P ~/
#tar xvf ~/ubuntu.tar.gz -C ~/.fluxbox/styles/
#rm -v ~/ubuntu.tar.gz


## paint it black
fbsetbg -b -solid black


## idempotent, finally!
if [ "$( tail -1 ~/.fluxbox/init )" == "session.configVersion:	13" ]; then
  echo "session.screen0.workspaceNames: 1,2,3,4," >> ~/.fluxbox/init
  echo "session.screen0.toolbar.widthPercent: 50" >> ~/.fluxbox/init
  echo "session.screen0.workspacewarping: false" >> ~/.fluxbox/init
  echo "session.screen0.focusModel:	MouseFocus" >> ~/.fluxbox/init
  echo "session.autoRaiseDelay: 500" >> ~/.fluxbox/init

  ## crunchy orange
  #echo "session.styleFile: /home/ry/.fluxbox/styles/02-Crunchy-orange" >> ~/.fluxbox/init

  ## dustflux
  #echo "session.styleFile: /home/ry/.fluxbox/styles/DustFlux-Mod" >> ~/.fluxbox/init

  ## dyne
  #echo "session.styleFile: /home/ry/.fluxbox/styles/Dyne" >> ~/.fluxbox/init

  ## elberg
  #echo "session.styleFile: /home/ry/.fluxbox/styles/Elberg" >> ~/.fluxbox/init

  ## elfin2
  #echo "session.styleFile: /home/ry/.fluxbox/styles/Elfin2" >> ~/.fluxbox/init

  ## gsm
  #echo "session.styleFile: /home/ry/.fluxbox/styles/GSM" >> ~/.fluxbox/init

  ## minimal black
  echo "session.styleFile: /home/ry/.fluxbox/styles/vic" >> ~/.fluxbox/init

  ## ubuntu
  #echo "session.styleFile: /home/ry/.fluxbox/styles/ubuntu" >> ~/.fluxbox/init

fi


## make the cursor beautiful, maybe icons too
mkdir -pv ~/.icons/
ln -sfv /usr/share/icons/Adwaita/ ~/.icons/default


### makin' noise
#sed -i 's/^session.screen0.workspaceNames: Workspace 1,Workspace 2,Workspace 3,Workspace 4,/session.screen0.workspaceNames: 1,2,3,4,/g' ~/.fluxbox/init

#sed -i 's_\
#session.menuFile: ~/.fluxbox/menu\
#session.keyFile: ~/.fluxbox/keys\
#_session.menuFile: ~/.fluxbox/menu\
#session.keyFile: ~/.fluxbox/keys\
#session.screen0.workspaceNames: 1,2,3,4,\

