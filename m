Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@cobaltmicro.com>
Message-ID: <199710110058.RAA14665@dull.cobaltmicro.com>
Subject: Re: make zImage, and initrd...
Date: Fri, 10 Oct 1997 17:58:48 -0700 (PDT)
In-Reply-To: <Pine.LNX.3.95.971010192929.364D-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Oct 10, 97 07:41:19 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971011005848.egxI_08k6ngAP2szU4sMr1joLR09dgj7JHPKb2I_QzQ@z>

> I'm working on adding the ramdisk and initrd features to the kernel.  It
> compiles, which is pretty good for my first kernel patch.
> 
> But, I have no way to actually test it.  The kernel needs to find the
> offset of the ramdisk in the first 11 bits of one of the boot headers, so
> the kernel needs to be less than 2047k.

Dunno what you're trying to do, but it sounds extremly weired ...

> This wouldn't normally be a problem, but doing a 'make zImage' tells me
> that:
> ./mkboot zImage.tmp zImage
> Input file isn't a little endian ELF file
> make[1]: *** [zImage] Error 1
> 
> What would be required to make mkboot handle zImage, or bzImage?

Don't do it.  mkboot is used for the boxes that use Milo for booting to
convert the ELF executable into an a.out file that Milo accepts.  Milo
again is necessary because the ARC firmware is so incredibly buggy and I
don't want to have more ARC stuff in the kernel than absolutly necessary.

What I suggest instead is to load the ramdisk file using the ARCS
Open, Read, Write, Close and Seek functions from any ARC supported media.
That includes tapes, CDROM, EFS, XFS and even tftp.  Take the information
what file to read from the ARC command line.

> In the meantime, I will try to strip down a kernel to below 2047k.  My
> current one is 2347.

Why limiting the kernel size?  640kb are enough for everybody?

> Any other ideas?

Yes, time to leave for Sushi with Miguel :-)

  Ralf
