#!/bin/sh

##  curl https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/kdeSetup.sh | sh

#if [ ! -z "$( env | grep XDG_CURRENT_DESKTOP=KDE )" ]; then
#  sudo qdbus org.kde.* /kded reconfigure
#fi


kwriteconfig --file kdeglobals --group "KDE-Global GUI Settings" --key "GraphicEffectsLevel" 0

kwriteconfig --file startupconfig --group "ksplashrc KSplash Theme Default" --key "ksplashrc_ksplash_theme" Minimalistic

kwriteconfig --file ksplashrc --group "KSplash" --key "Theme" Minimalistic


kwriteconfig --file kwinrc --group "Windows" --key "FocusPolicy" FocusFollowsMouse
kwriteconfig --file kwinrc --group "Windows" --key "AutoRaise" true
kwriteconfig --file kwinrc --group "Windows" --key "AutoRaiseInterval" 500
kwriteconfig --file kwinrc --group "Windows" --key "DelayFocusInterval" 500
kwriteconfig --file kwinrc --group "Windows" --key "FocusStealingPreventionLevel" 2


kwriteconfig --file kwinrc --group "Plugins" --key "kwin4_effect_wobblywindowsEnabled" true
kwriteconfig --file kwinrc --group "Plugins" --key "kwin4_effect_cubeEnabled" true


kwriteconfig --file kwinrc --group "Compositing" --key "UnredirectFullscreen" true
kwriteconfig --file kwinrc --group "Compositing" --key "AnimationSpeed" 0


kwriteconfig --file ksmserverrc --group "General" --key "confirmLogout" false
kwriteconfig --file ksmserverrc --group "General" --key "shutdownType" 1
kwriteconfig --file ksmserverrc --group "General" --key "loginMode" default


kwriteconfig --file katerc --group "TipOfDay" --key "RunOnStart" false

kwriteconfig --file katerc --group "General" --key "Show Full Path in Title" true

kwriteconfig --file katerc --group "Kate Document Defaults" --key "Encoding" UTF-8
kwriteconfig --file katerc --group "Kate Document Defaults" --key "ReplaceTabsDyn" true
kwriteconfig --file katerc --group "Kate Document Defaults" --key "Tab Handling" 2
kwriteconfig --file katerc --group "Kate Document Defaults" --key "Tab Width" 2
kwriteconfig --file katerc --group "Kate Document Defaults" --key "Word Wrap" true
kwriteconfig --file katerc --group "Kate Document Defaults" --key "Indentation Width" 2
kwriteconfig --file katerc --group "Kate Document Defaults" --key "Newline At EOF" true

kwriteconfig --file katerc --group "Kate Part Defaults" --key "Fallback Encoding" UTF-8

## turns on global shortcut for konsole, ctrl + alt + t
kwriteconfig --file khotkeysrc --group "Data_2" --key "Enabled" true
kwriteconfig --file khotkeysrc --group "Data_2_3" --key "Enabled" true
kwriteconfig --file khotkeysrc --group "Data_4" --key "Enabled" true
kwriteconfig --file khotkeysrc --group "Data_4_3" --key "Enabled" true

kwriteconfig --file powermanagementprofilesrc --group "AC" --group "DimDisplay" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "Battery" --group "DimDisplay" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "LowBattery" --group "DimDisplay" --key "idleTime" 600000

kwriteconfig --file powermanagementprofilesrc --group "AC" --group "DPMSControl" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "Battery" --group "DPMSControl" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "LowBattery" --group "DPMSControl" --key "idleTime" 600000

kwriteconfig --file powermanagementprofilesrc --group "AC" --group "SuspendSession" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "Battery" --group "SuspendSession" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "LowBattery" --group "SuspendSession" --key "idleTime" 600000

kwriteconfig --file powermanagementprofilesrc --group "AC" --group "BrightnessControl" --key "value" 100
kwriteconfig --file powermanagementprofilesrc --group "Battery" --group "BrightnessControl" --key "value" 100
kwriteconfig --file powermanagementprofilesrc --group "LowBattery" --group "BrightnessControl" --key "value" 80


if [ ! -z "$( env | grep XDG_CURRENT_DESKTOP=KDE )" ]; then
  qdbus org.kde.keyboard /modules/khotkeys reread_configuration
  kwin --replace &
  sleep 4
fi



