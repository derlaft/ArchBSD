Welcome to the ArchBSD project, currently work is still under process and there is still
quite a bit of work to be done. However I am approaching to release a test ISO soon after
months of work.


ABOUT:

The ArchBSD project focuses on using ArchLinux package manager on the FreeBSD distribution,
to provide optimised, up to date package for FreeBSD users. This project has also chose to
use Gentoo's OpenRC init system as opposed to the default init system used by FreeBSD. Which
personally I think provide a benfit of speeds and features otherwise not present in the current
RC scripts.

TODO:

I have a few things I would like to complete in the next few days ready to release a test ISO for 
the first of January, these include:

1: Finish porting ArchLinux install scripts to work on FreeBSD: E.G Pacstrap, genfstab

2: Finish making packages and PKGBUILDS for some useful packages to use in testing: Xorg, lxdm, firefox,
	chromium, flash, nvidia drivers.

3: Write an ISO script to automatically make the ArchBSD iso that is capable of loading /etc and /var into
	memory so they are capable of being read / write.

INSTALL:

Here is a quick (Unfinished guide) to install ArchBSD once the ISO is complete:

	PARTITION DISKS:
	
	fdisk -u /dev/device
	
	bsdlabel -w /dev/device

	newfs -U /dev/device
	
	makeswap /dev/device

Once the disks have been partition, you will need to mount them for pacstrap to do it's work:

	mount /dev/device /mountpoint

Once the devices are partitioned and mounted it is now time to install the ArchBSD base:

	SETTING UP ArchBSD:

	pacstrap /mountpoint base 

	genfstap -d -p /mnt /mnt/etc/fstab

	fdisk -B -b /mnt/boot/boot0 /dev/adX	

	arch-chroot /mnt

Work to be done in the ArchBSD chroot:

	SETTING UP DATE AND TIME:

	date 201212210012 (Format is yyyymmddHHMM)

	ln -S /usr/share/zoneinfo/Europe/London /etc/localtime

	Add the root partition to /boot/loader.conf:

	echo 'vfs.root.mountfrom="ufs:ad0s1d"' >> /boot/loader.conf

	rc-update add net.fxp0 default

	nano /etc/conf.d/hostname

		HOSTNAME="Bahamut"

	nano /etc/conf.d/syscons

		KEYMAP="spanish.iso.acc"

	passwd

	adduser

	disklabel -B adXsY
	
