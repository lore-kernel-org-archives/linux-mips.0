Subject: Re: EXT2 fs error
Date: Tue, 30 Nov 1999 19:52:04 +0000 (GMT)
In-Reply-To: <Pine.LNX.4.10.9911291959150.2898-100000@moose.roadkill.com> from "Marc Esipovich" at Nov 29, 99 08:03:06 pm
Content-Type: text
Message-ID: <E11stJm-0007Bd-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Marc Esipovich <marc@mucom.co.il>
Cc: e1097757@ceng.metu.edu.tr, linux@cthulhu.engr.sgi.com
Message-ID: <19991130195204.Nafh5JdTmOLoQ5q7fQOkL9MPVzM_tPLXSU3yuJwO9WM@z>

> Hardware problem, probably your disk, it's called a bad-sector ;)

If there is a scsi error before the ext2fs error then yes probably so
You are looking for a "media error" probably.

> > 	SCSI bus is being reset for 0 channel 0.
> > 	scsi0 reset. sending SDTR
> 
> SCSI reset is due to repeated attempts to read a block, or I might be
> wrong and it it's due to a malfunction of the controller on your HD.

You can get it off some working sane hardware if you try and ask for stupid
block numbers. It is worth doing a full fsck on the drive before assuming
hardware. Also check the cabling seems sound and is well attached and that
parity is enabled on the controller if the bios sets it.
