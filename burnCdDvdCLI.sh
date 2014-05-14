http://www.linuxquestions.org/questions/linuxquestions-org-member-success-stories-23/howto-burn-iso-image-on-cd-using-the-command-line-tool-cdrecord-643827/

http://www.cyberciti.biz/faq/linux-find-out-the-name-of-dvd-cd-rom-writer-blu-ray-device/

dmesg | grep 'cdrom|dvd'

cdrecord -v -eject -speed=8 dev=/dev/sr0 /path/to/ISO

