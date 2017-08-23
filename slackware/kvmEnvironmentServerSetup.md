Thanks to willysr.

Install lilo di VM Guest ('di' is indonesian for 'at').

Run the 'simple' lilo install in the installer, which will set up a lilo.conf for you,
but it will fail, don't worry ... we'll fix it post-install.

Finish the installation.

    chroot /mnt

Create the initrd for the generic kernel:

    /usr/share/mkinitrd/mkinitrd_command_generator.sh | sh

Edit /etc/lilo.conf:

```
lba32 # Allow booting past 1024th cylinder with a recent BIOS
compact
boot = /dev/vda
disk = /dev/vda
bios = 0x80
max-partitions = 7
```

```
image = /boot/vmlinuz
    initrd = /boot/initrd.gz
    root = /dev/vda1
    label = Linux
    read-only
```

```
exit
lilo -C /mnt/etc/lilo.conf

reboot
```
