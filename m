Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xgJdw-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Mount ext2 filesystem.
Date: Fri, 12 Dec 1997 01:11:51 +0000 (GMT)
In-Reply-To: <199712120030.JAA05477@meteor.nsg.sgi.com> from "Takeshi Hakamada" at Dec 12, 97 09:30:15 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Takeshi Hakamada <hakamada@meteor.nsg.sgi.com>
Cc: alan@lxorguk.ukuu.org.uk, linux@cthulhu.engr.sgi.com
Message-ID: <19971212011151.4pYfxgpOV-tJJDAfxE-iFB0BvbzdYLbgqnX0mApIMSw@z>

> Thank you. I've converted rpm to cpio and I could have installed rpm binary.
> But, I can't boot from local disk yet. If I can boot from local disk, I'd
> like to update faq on the www.linux.sgi.com. How do you think about it?

In irix, shutdown, restart hit the maintenance button to get to the arc
menu, hit command line and do I think its

boot /whatever/efs/vmlinux root=/dev/sdb1

(first partition disk 2 as root)
