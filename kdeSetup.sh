#!/bin/sh

kwriteconfig --file kdeglobals --group "KDE-Global GUI Settings" --key "GraphicEffectsLevel" 0

kwriteconfig --file startupconfig --group "ksplashrc KSplash Theme Default" --key "ksplashrc_ksplash_theme" Minimalistic


kwriteconfig --file kwinrc --group "Windows" --key "FocusPolicy" FocusFollowsMouse

kwriteconfig --file kwinrc --group "Plugins" --key "kwin4_effect_wobblywindowsEnabled" true
kwriteconfig --file kwinrc --group "Plugins" --key "kwin4_effect_cubeEnabled" true


kwriteconfig --file kwinrc --group "Compositing" --key "UnredirectFullscreen" true


