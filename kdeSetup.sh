#!/bin/sh

##  curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/kdeSetup.sh | sh


kwriteconfig --file kdeglobals --group "KDE-Global GUI Settings" --key "GraphicEffectsLevel" 0

kwriteconfig --file kdeglobals --group "General" --key "desktopFont" "Terminus,9,-1,5,50,0,0,0,0,0"
kwriteconfig --file kdeglobals --group "General" --key "fixed" "Terminus,9,-1,5,50,0,0,0,0,0"
kwriteconfig --file kdeglobals --group "General" --key "font" "Terminus,9,-1,5,50,0,0,0,0,0"
kwriteconfig --file kdeglobals --group "General" --key "menuFont" "Terminus,9,-1,5,50,0,0,0,0,0"
kwriteconfig --file kdeglobals --group "General" --key "smallestReadableFont" "Terminus,9,-1,5,50,0,0,0,0,0"
kwriteconfig --file kdeglobals --group "General" --key "taskbarFont" "Terminus,9,-1,5,50,0,0,0,0,0"
kwriteconfig --file kdeglobals --group "General" --key "toolBarFont" "Terminus,9,-1,5,50,0,0,0,0,0"
kwriteconfig --file kdeglobals --group "General" --key "activeFont" "Terminus,9,-1,5,50,0,0,0,0,0"

kwriteconfig --file kdeglobals --group "WM" --key "activeFont" "Terminus,9,-1,5,50,0,0,0,0,0"

kwriteconfig --file plasma-desktop-appletsrc --group "General" --key "fontTime" "Terminus,9,-1,5,50,0,0,0,0,0"

## minimalist splash
kwriteconfig --file startupconfig --group "ksplashrc KSplash Theme Default" --key "ksplashrc_ksplash_theme" Minimalistic

## note that the theme depends on the engine setting,
## it will not function otherwise
kwriteconfig --file ksplashrc --group "KSplash" --key "Engine" KSplashQML
kwriteconfig --file ksplashrc --group "KSplash" --key "Theme" Minimalistic


kwriteconfig --file kwinrc --group "Windows" --key "FocusPolicy" FocusFollowsMouse
kwriteconfig --file kwinrc --group "Windows" --key "AutoRaise" true
kwriteconfig --file kwinrc --group "Windows" --key "AutoRaiseInterval" 500
kwriteconfig --file kwinrc --group "Windows" --key "DelayFocusInterval" 500
kwriteconfig --file kwinrc --group "Windows" --key "FocusStealingPreventionLevel" 2


kwriteconfig --file kwinrc --group "Plugins" --key "kwin4_effect_wobblywindowsEnabled" true
kwriteconfig --file kwinrc --group "Plugins" --key "kwin4_effect_cubeEnabled" true
kwriteconfig --file kwinrc --group "Plugins" --key "kwin4_effect_cubeslideEnabled" true


kwriteconfig --file kwinrc --group "Compositing" --key "UnredirectFullscreen" true
kwriteconfig --file kwinrc --group "Compositing" --key "AnimationSpeed" 1


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

## turns on example shortcuts, including: konsole = ctrl + alt + t
sed -i.bak 's/Enabled=false/Enabled=true/g' ~/.kde/share/config/khotkeysrc

## make folder view the default
sed -i.bak 's/plugin=desktop/plugin=folderview/g' ~/.kde/share/config/plasma-desktop-appletsrc

kwriteconfig --file powermanagementprofilesrc --group "AC" --group "DimDisplay" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "Battery" --group "DimDisplay" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "LowBattery" --group "DimDisplay" --key "idleTime" 600000

kwriteconfig --file powermanagementprofilesrc --group "AC" --group "DPMSControl" --key "idleTime" 600
kwriteconfig --file powermanagementprofilesrc --group "Battery" --group "DPMSControl" --key "idleTime" 600
kwriteconfig --file powermanagementprofilesrc --group "LowBattery" --group "DPMSControl" --key "idleTime" 600

kwriteconfig --file powermanagementprofilesrc --group "AC" --group "SuspendSession" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "Battery" --group "SuspendSession" --key "idleTime" 600000
kwriteconfig --file powermanagementprofilesrc --group "LowBattery" --group "SuspendSession" --key "idleTime" 600000

kwriteconfig --file powermanagementprofilesrc --group "AC" --group "BrightnessControl" --key "value" 100
kwriteconfig --file powermanagementprofilesrc --group "Battery" --group "BrightnessControl" --key "value" 100
kwriteconfig --file powermanagementprofilesrc --group "LowBattery" --group "BrightnessControl" --key "value" 80


if [ "$(env | grep XDG_CURRENT_DESKTOP=KDE)" ]; then
  qdbus org.kde.kded /kded unloadModule powerdevil
  qdbus org.kde.keyboard /modules/khotkeys reread_configuration
  qdbus org.kde.kded /kbuildsycoca recreate
  qdbus org.kde.kded /kded reconfigure
  qdbus org.kde.plasma-desktop /MainApplication reparseConfiguration
  qdbus org.kde.kwin /KWin reconfigure
  qdbus org.kde.kded /kded loadModule powerdevil
fi



