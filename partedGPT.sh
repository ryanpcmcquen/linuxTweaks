#!/bin/sh
parted -s -a optimal /dev/sda mklabel gpt -- mkpart primary ext4 1 -1
