#!/bin/sh

##  curl https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/kdeSetup.sh | sh

kwriteconfig --file kdeglobals --group "KDE-Global GUI Settings" --key "GraphicEffectsLevel" 0

#kwriteconfig --file startupconfig --group "ksplashrc KSplash Theme Default" --key "ksplashrc_ksplash_theme" Minimalistic

kwriteconfig --file ksplashrc --group "KSplash" --key "Theme" Minimalistic


kwriteconfig --file kwinrc --group "Windows" --key "FocusPolicy" FocusFollowsMouse
kwriteconfig --file kwinrc --group "Windows" --key "AutoRaise" true
kwriteconfig --file kwinrc --group "Windows" --key "AutoRaiseInterval" 500
kwriteconfig --file kwinrc --group "Windows" --key "DelayFocusInterval" 500


kwriteconfig --file kwinrc --group "Plugins" --key "kwin4_effect_wobblywindowsEnabled" true
kwriteconfig --file kwinrc --group "Plugins" --key "kwin4_effect_cubeEnabled" true


kwriteconfig --file kwinrc --group "Compositing" --key "UnredirectFullscreen" true

kwriteconfig --file ksmserverrc --group "General" --key "confirmLogout" false
kwriteconfig --file ksmserverrc --group "General" --key "shutdownType" 1
kwriteconfig --file ksmserverrc --group "General" --key "loginMode" default


#kwriteconfig --file ksmserverrc --group "General" --key "UnredirectFullscreen" true

