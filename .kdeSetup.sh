#!/bin/sh

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.kdeSetup.sh | sh

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.__KEY_REPEAT_SETTINGS__ -P ~/
. ~/.__KEY_REPEAT_SETTINGS__

# Determine kde version and configure based on that.
if [ "`which kwriteconfig5`" ]; then
    KWRITECONF=kwriteconfig5
    HOTKEYS="$HOME/.config/khotkeysrc"
    PLASMADESK="$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
    KDEVER=5
else
    KWRITECONF=kwriteconfig
    HOTKEYS="$HOME/.kde/share/config/khotkeysrc"
    PLASMADESK="$HOME/.kde/share/config/plasma-desktop-appletsrc"
    KDEVER=4
fi

# Kwallet is annoying, and also makes connecting
# to wireless networks take multiple attempts -- no thanks.
${KWRITECONF} --file kwalletrc --group Wallet --key "Enabled" false
${KWRITECONF} --file kwalletrc --group Wallet --key "First Use" false

# Set keyboard repeat/delay to be blazingly fast.
${KWRITECONF} --file kcminputrc --group "Keyboard" --key "RepeatDelay" ${KEY_REPEAT_DELAY}
${KWRITECONF} --file kcminputrc --group "Keyboard" --key "RepeatRate" ${KEY_REPEAT_RATE}

# Caps Lock as Ctrl! Try it, you'll like it.
${KWRITECONF} --file kxkbrc --group "Layout" --key "ResetOldOptions" true
${KWRITECONF} --file kxkbrc --group "Layout" --key "Options" "ctrl:nocaps"

# Make kde faster, effects are for people who have leisure time.
${KWRITECONF} --file kdeglobals --group "KDE-Global GUI Settings" --key "GraphicEffectsLevel" 0

# Just using more defaults in my old age.
#${KWRITECONF} --file kdeglobals --group "General" --key "desktopFont" "Terminus,9,-1,5,50,0,0,0,0,0"
#${KWRITECONF} --file kdeglobals --group "General" --key "fixed" "Terminus,9,-1,5,50,0,0,0,0,0"
#${KWRITECONF} --file kdeglobals --group "General" --key "font" "Terminus,9,-1,5,50,0,0,0,0,0"
#${KWRITECONF} --file kdeglobals --group "General" --key "menuFont" "Terminus,9,-1,5,50,0,0,0,0,0"
#${KWRITECONF} --file kdeglobals --group "General" --key "smallestReadableFont" "Terminus,9,-1,5,50,0,0,0,0,0"
#${KWRITECONF} --file kdeglobals --group "General" --key "taskbarFont" "Terminus,9,-1,5,50,0,0,0,0,0"
#${KWRITECONF} --file kdeglobals --group "General" --key "toolBarFont" "Terminus,9,-1,5,50,0,0,0,0,0"
#${KWRITECONF} --file kdeglobals --group "General" --key "activeFont" "Terminus,9,-1,5,50,0,0,0,0,0"
#${KWRITECONF} --file kdeglobals --group "WM" --key "activeFont" "Terminus,9,-1,5,50,0,0,0,0,0"
#${KWRITECONF} --file plasma-desktop-appletsrc --group "General" --key "fontTime" "Terminus,9,-1,5,50,0,0,0,0,0"

# Minimalist splash.
#${KWRITECONF} --file startupconfig --group "ksplashrc KSplash Theme Default" --key "ksplashrc_ksplash_theme" Minimalistic

# Note that the theme depends on the engine setting,
# it will not function otherwise.
#${KWRITECONF} --file ksplashrc --group "KSplash" --key "Engine" KSplashQML
#${KWRITECONF} --file ksplashrc --group "KSplash" --key "Theme" Minimalistic

# Mostly make kwin faster, but also add wobbly windows.
${KWRITECONF} --file kwinrc --group "Windows" --key "FocusPolicy" FocusFollowsMouse
${KWRITECONF} --file kwinrc --group "Windows" --key "AutoRaise" true
${KWRITECONF} --file kwinrc --group "Windows" --key "AutoRaiseInterval" 500
${KWRITECONF} --file kwinrc --group "Windows" --key "DelayFocusInterval" 500
${KWRITECONF} --file kwinrc --group "Windows" --key "FocusStealingPreventionLevel" 2
#${KWRITECONF} --file kwinrc --group "Plugins" --key "kwin4_effect_wobblywindowsEnabled" true
#${KWRITECONF} --file kwinrc --group "Plugins" --key "kwin4_effect_cubeEnabled" true
#${KWRITECONF} --file kwinrc --group "Plugins" --key "kwin4_effect_cubeslideEnabled" true
${KWRITECONF} --file kwinrc --group "Compositing" --key "UnredirectFullscreen" true
#${KWRITECONF} --file kwinrc --group "Compositing" --key "AnimationSpeed" 1
# Actually disable compositing, I know this renders wobbly windows useless.
${KWRITECONF} --file kwinrc --group "Compositing" --key "Enabled" true

# Give less notifications.
${KWRITECONF} --file ksmserverrc --group "General" --key "confirmLogout" false
${KWRITECONF} --file ksmserverrc --group "General" --key "shutdownType" 1
${KWRITECONF} --file ksmserverrc --group "General" --key "loginMode" default

# Make the kate editor a little nicer for me:
${KWRITECONF} --file katerc --group "TipOfDay" --key "RunOnStart" false
${KWRITECONF} --file katerc --group "General" --key "Show Full Path in Title" true
${KWRITECONF} --file katerc --group "Kate Document Defaults" --key "Encoding" UTF-8
${KWRITECONF} --file katerc --group "Kate Document Defaults" --key "ReplaceTabsDyn" true
${KWRITECONF} --file katerc --group "Kate Document Defaults" --key "Tab Handling" 4
${KWRITECONF} --file katerc --group "Kate Document Defaults" --key "Tab Width" 4
${KWRITECONF} --file katerc --group "Kate Document Defaults" --key "Indentation Width" 4
${KWRITECONF} --file katerc --group "Kate Document Defaults" --key "Word Wrap" false
${KWRITECONF} --file katerc --group "Kate Document Defaults" --key "Newline At EOF" true
${KWRITECONF} --file katerc --group "Kate Part Defaults" --key "Fallback Encoding" UTF-8

# Turns on example shortcuts, including: Konsole = Ctrl + Alt + T
#sed -i.bak 's/Enabled=false/Enabled=true/g' $HOTKEYS
# Make folder view the default.
#sed -i.bak 's/plugin=desktop/plugin=folderview/g' $PLASMADESK

# Make the power settings a little more sane.
#${KWRITECONF} --file powermanagementprofilesrc --group "AC" --group "DimDisplay" --key "idleTime" 600000
#${KWRITECONF} --file powermanagementprofilesrc --group "Battery" --group "DimDisplay" --key "idleTime" 600000
#${KWRITECONF} --file powermanagementprofilesrc --group "LowBattery" --group "DimDisplay" --key "idleTime" 600000
#${KWRITECONF} --file powermanagementprofilesrc --group "AC" --group "DPMSControl" --key "idleTime" 600
#${KWRITECONF} --file powermanagementprofilesrc --group "Battery" --group "DPMSControl" --key "idleTime" 600
#${KWRITECONF} --file powermanagementprofilesrc --group "LowBattery" --group "DPMSControl" --key "idleTime" 600
# I do not like forcing session suspension, let the user decide this.
#${KWRITECONF} --file powermanagementprofilesrc --group "AC" --group "SuspendSession" --key "idleTime" 600000
#${KWRITECONF} --file powermanagementprofilesrc --group "Battery" --group "SuspendSession" --key "idleTime" 600000
#${KWRITECONF} --file powermanagementprofilesrc --group "LowBattery" --group "SuspendSession" --key "idleTime" 600000
#${KWRITECONF} --file powermanagementprofilesrc --group "AC" --group "BrightnessControl" --key "value" 100
#${KWRITECONF} --file powermanagementprofilesrc --group "Battery" --group "BrightnessControl" --key "value" 100
#${KWRITECONF} --file powermanagementprofilesrc --group "LowBattery" --group "BrightnessControl" --key "value" 80

# Disable compositing, as it breaks some things ... and I am not fancy.
#if [ "`qdbus org.kde.kwin /KWin org.kde.KWin.compositingActive`" = true ]; then
#    qdbus org.kde.kwin /KWin org.kde.KWin.toggleCompositing
#fi

# Restart services so that new settings take effect.
if [ "$(env | grep XDG_CURRENT_DESKTOP=KDE)" ]; then
    qdbus org.kde.kded /kded unloadModule powerdevil
    qdbus org.kde.keyboard /modules/khotkeys reread_configuration
    qdbus org.kde.kded /kbuildsycoca recreate
    qdbus org.kde.kded /kded reconfigure
    qdbus org.kde.plasma-desktop /MainApplication reparseConfiguration
    qdbus org.kde.kwin /KWin reconfigure
    qdbus org.kde.kded /kded loadModule powerdevil
fi

echo
echo "This scipt detected that you are using KDE $KDEVER."
echo "If this is not correct, please file an issue at: "
echo "https://github.com/ryanpcmcquen/linuxTweaks"
echo
