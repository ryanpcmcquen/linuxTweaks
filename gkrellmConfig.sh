#!/bin/sh

sed -i 's/skip_taskbar 0/skip_taskbar 1/g' ~/.gkrellm2/user-config
sed -i 's/skip_pager 0/skip_pager 1/g' ~/.gkrellm2/user-config

sed -i 's/save_position 0/save_position 1/g' ~/.gkrellm2/user-config

sed -i 's/battery enable 0/battery enable 1/g' ~/.gkrellm2/user-config

sed -i 's/mail enable 1 0 0 0/mail enable 0 0 0 0/g' ~/.gkrellm2/user-config


