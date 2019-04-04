Turn off swap:
```
sudo swapoff -a
```
Remove or comment out the `swap` partition entry from `/etc/fstab`.

Remove the swap partition:
```
sudo lvremove /dev/mapper/WHATEVER_IT_IS_CALLED--vg-swap
```
Resize the root partition:
```
sudo lvresize -l +100%FREE /dev/mapper/WHATEVER_IT_IS_CALLED--vg-root
sudo resize2fs -p /dev/mapper/WHATEVER_IT_IS_CALLED--vg-root
```

Reboot?
