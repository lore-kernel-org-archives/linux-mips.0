Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xr5TY-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: RedHat 5.0 RPMs for SGI...
Date: Sat, 10 Jan 1998 18:17:40 +0000 (GMT)
In-Reply-To: <Pine.LNX.3.95.980109143918.55A-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jan 9, 98 02:54:03 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980110181740.Io2JNYyODDGCiFF86dMHxMQRLdvY9qZrW4jC972Cujg@z>

> I'm in the middle of churning out the RH 5.0 RPMs, and I'll upload them
> into a seperate directory on linus than the others. The only difference
> with these and many of the RPM's already on linus is that they're built
> against the latest glibc, and they're from the RH 5.0 install, not 4.9.1.

Ok. I'll work with you on that from Monday. Ive got the fixes for several
RH5 SRPMS to build with mips.  Glibc 2.0.6 should fix the argv[0] bug
and the -lbsd problems too so much more should build

> Could someone in Europe kindly create a PGP RPM?  I have one here, but I
> cannot distribute it because of ridiculous laws.

No problem. I can build pgp etc again. I'll build ssh and anything else
looking fun off replay and upload the stuff back

Alan
