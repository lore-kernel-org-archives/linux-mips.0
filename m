Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xfuql-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Mount ext2 filesystem.
Date: Wed, 10 Dec 1997 22:43:26 +0000 (GMT)
In-Reply-To: <199712101335.WAA09888@meteor.nsg.sgi.com> from "Takeshi Hakamada" at Dec 10, 97 10:35:39 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Takeshi Hakamada <hakamada@meteor.nsg.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971210224326._HSZBEVHIOke2hMmxnYehm8-qU59a0Cdp33Re56fKKw@z>

> However, when I try to invoke rpm which is made by Alan(libc/ld workaround
> version), I get efs read error as follows:
> 
> efs: read error in indirect extents
> attempt to access beyond end of device
> 08:01 rw=0, want=1207011792, limit=1965937

The efs driver is still very limited and cant handle many file layouts.

> Anyway, why root-be-0.00.cpio.gz doesn't contain rpm binary?
> I think rpm binary should be in root-be-0.00.cpio.gz.

Personally I'd like to see a lot less in a final root-be-0.00. Really it
needs some minimal disk handling tools and rpm. The root-be is a good
start for an NFS root right now.

I used the installer stuff I did to get rpm on the disk by doing

on Linux x86

rpm2cpio rpm-2.3.11.mips.rpm >rpm.cpio

ftping it to Irix and using the install cpio option. Ive been poking at
better installing and talked to a few people about Arc firmware after Ralf
prodded me. Given the horror stories told I think the better option is
to finish producing a tool that takes a compressed ramdisk image (the initrd
image) that is used by setups like the redhat installer and merges it with
the kernel image so the existing bootup stuff can load it

The X86 has memory space problems (install in 8Mb), on the indy blowing
4Mbytes on the install ramdisk is almost an irrelevance.

Alan
