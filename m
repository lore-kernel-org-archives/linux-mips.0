Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xW9Dg-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: SGI / Linux
Date: Fri, 14 Nov 1997 00:02:44 +0000 (GMT)
In-Reply-To: <Pine.LNX.3.95.971113173913.4779I-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Nov 13, 97 05:41:40 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: alan@lxorguk.ukuu.org.uk, ariel@cthulhu.engr.sgi.com, paulp@netco.com, linux@cthulhu.engr.sgi.com
Message-ID: <19971114000244.vXrPn77x1KA8x41TqGl1Qe6xkNZEh4pBbNmTdUUIHw8@z>

> Uh, how would this fit in with RPM?  Would it be possible to run the Irix
> version of RPM to pre-load the packages on an ext2 disk?

The cpio code Im using is actually from Erik's RPM 2.4.8. Conceptually
there is no problem installing RPM's with it. However there are good reasons
why not to - notably the libe2fs code doesnt not have the fragmentation
evasion stuff the real ext2 does.

No I see the install as a variant of that program so something like


fdisk /dev/whatever
mke2fs /dev/dsk/whatever
mklinuxswap /dev/dsk/swapdisk
installer
load some basic cpio's

boot linux - add the rpms.

Alan
