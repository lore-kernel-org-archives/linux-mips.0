Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199710110611.AAA24902@harmony.village.org>
Subject: Re: make zImage, and initrd... 
In-reply-to: Your message of "Fri, 10 Oct 1997 17:58:48 PDT."
		<199710110058.RAA14665@dull.cobaltmicro.com>
References: <199710110058.RAA14665@dull.cobaltmicro.com>  
Date: Sat, 11 Oct 1997 00:11:55 -0600
From: Warner Losh <imp@village.org>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@cobaltmicro.com>
Cc: Alex deVries <adevries@engsoc.carleton.ca>, linux@cthulhu.engr.sgi.com
Message-ID: <19971011061155.9ZjW9gcrk3Qgg5WWtEs9i8cBKWWoSIWFCqLN5x6tyJ4@z>

In message <199710110058.RAA14665@dull.cobaltmicro.com> Ralf Baechle writes:
: What I suggest instead is to load the ramdisk file using the ARCS
: Open, Read, Write, Close and Seek functions from any ARC supported media.
: That includes tapes, CDROM, EFS, XFS and even tftp.  Take the information
: what file to read from the ARC command line.

These can include ...  Not all ARC machines support all these types of
file systems...

Warner
