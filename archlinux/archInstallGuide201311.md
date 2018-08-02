##### upstream: https://wiki.archlinux.org/index.php/User:Ryanpcmcquen/Quick_install_command_set_for_Arch_Linux_%28goes_to_startx%29

## Quick install command set for Arch Linux by Ryan P. C. McQuen

KNOW YOUR SYSTEM! This works on my 64-bit & 32-bit system.

-2013.11.01 (or later) arch iso, the torrent is best

Start with wired internet (or not!). If not, do this:

    wifi-menu

-johndoe is a placeholder, as is /dev/sda1, /dev/sda2

-run gdisk to create your partition table (e.g. gdisk /dev/sda)

    mkswap /dev/sda1
    swapon /dev/sda1
    mkfs.ext4 /dev/sda2

    vi /etc/pacman.d/mirrorlist ### if you want to move the mirrors around

    mount /dev/sda2 /mnt
    pacstrap /mnt base base-devel abs git wget
    ### git has a hard dependency of curl
    genfstab -p /mnt >> /mnt/etc/fstab
    arch-chroot /mnt

    vi /etc/locale.gen
    ### uncomment your locale (the utf-8 one)
    locale-gen
    locale > /etc/locale.conf
    ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
    ### or whatever your time zone is
    hwclock --systohc --utc
    ## vi /etc/hostname, if you wish

    vi /etc/pacman.conf
    ## (include multilib for 64-bit)
    pacman -Syy

    pacman -S dhcpcd wpa_supplicant wpa_actiond iw ifplugd dialog wireless_tools

    passwd
    useradd -m -g users -G \
    audio,disk,floppy,games,locate,lp,network,optical,power,scanner,storage,sys,uucp,video,wheel \
    -s /bin/bash johndoe
    passwd johndoe

    visudo
    ### uncomment:
    %wheel ALL=(ALL) ALL

    pacman -S syslinux gptfdisk ### or your preferred boot loader
    syslinux-install_update -i -a -m
    syslinux-install_update -u

    ### make sure root partition is set to boot
    vi /boot/syslinux/syslinux.cfg

    exit
    umount /mnt
    reboot


    sudo wifi-menu

    sudo pacman -Syyu alsa-utils alsa-firmware
    sudo pacman -S xorg xorg-xinit xorg-server-utils mesa xorg-twm xorg-xclock xterm
    sudo pacman -S ttf-ubuntu-font-family ttf-droid ttf-liberation
    ## intel-ucode
    ## lib32-ati-dri, lib32-intel-dri or lib32-nouveau-dri (for 64 bit)
    ## libtxc_dxtn, libjpeg-turbo, lib32-libtxc_dxtn, lib32-libjpeg-turbo

    ### then a de:
    ## for dwm: sudo pacman -S dwm dmenu scrot mc chromium firefox midori vlc
    ## for xmonad: sudo pacman -S xmonad-contrib dmenu scrot mc chromium firefox midori vlc
    ## or for e17: sudo pacman -S enlightenment17 connman chromium firefox midori vlc
    ## later get econnman & terminology through AUR

    vi ~/.xinitrc
    ### and add:
    ### exec dwm
    ### exec xmonad
    ### or exec enlightenment_start

    sudo systemctl enable netctl

    startx
