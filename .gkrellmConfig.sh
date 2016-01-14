#!/bin/sh

# $ curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gkrellmConfig.sh | sh

#wget -N http://www.muhri.net/gkrellm/GKrellM-Skins.tar.gz -P ~/

sed -i.bak 's/enable_sysname 0/enable_sysname 1/g' ~/.gkrellm2/user-config

sed -i.bak 's/skip_taskbar 0/skip_taskbar 1/g' ~/.gkrellm2/user-config
sed -i.bak 's/skip_pager 0/skip_pager 1/g' ~/.gkrellm2/user-config

sed -i.bak 's/save_position 0/save_position 1/g' ~/.gkrellm2/user-config

sed -i.bak 's/battery enable 0/battery enable 1/g' ~/.gkrellm2/user-config

sed -i.bak 's/mail enable 1 0 0 0/mail enable 0 0 0 0/g' ~/.gkrellm2/user-config


