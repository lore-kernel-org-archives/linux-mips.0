Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199706160017.CAA23535@informatik.uni-koblenz.de>
Subject: Re: A pointed question about endianness...
Date: Mon, 16 Jun 1997 02:17:02 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970615184212.1448A-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jun 15, 97 06:54:36 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com, ralf@Julia.DE, shaver@engsoc.carleton.ca
Message-ID: <19970616001702.U7WVVOsK2pPVZEAPQDeVbMYWgAY98KwMP0ZUPtdxqFs@z>

> As we speak, Ralf has produced a batch of MIPS LSB binaries that would be
> glorious to be able to run.  The kernel that Mike Shaver and I have is
> MSB, as are our kernel, cross-compiler and rudamentary binaries.  I
> believe this is because we're branching off of Dave M's work.
> 
> But, can we please agree on one endianness?  I don't care which it is, so
> long as we all agree. Mike and I are quite willing to give up MSB.
> 
> My proposal is to use Ralf's LSB binaries as a launchpad[1], and produce
> only LSB binaries until we get bi-endianness going. 

Well, the point in a bi-endian kernel is that it will give us the possibility
of running binaries with the opposite byteorder of the kernel.  We don't
have that feature available right now, so we're bound to whatever byteorder
the kernel is running.  Which again is fixed on many machines.  This
means that for now we'll have to build both little endian and big endian
binaries; on SGI we'll only be able to execute big endian binaries.

I think your missunderstood that bi-endianess gives us the possibility to
execute binaries of both endianess concurrently on the same kernel.  It
does that but it also give us at all the possibility to run binaries of
the other byteorder.  So your proposal is currently technically not possible.

Btw, question to the SGI gurus - is the kernel byteorder of SGI machines
be reconfigurable?

> Also, Ralf, could you put up a binary of your kernel and a tar ball of
> your root fs?

Ok, I'll put it on http://www.uni-koblenz.de/~linux/vmlinux-2.1.42-pre3.gz.
Not on kernel.panic because I've run out of disk space.  Feel free to
put it on your ftp server.  My root fs is definately to big for upload over
a 14.4k line, so stay tuned.

> [1] Which are mirrored on ftp://ftp.engsoc.carleton.ca/pub/mips if you're
> having problems getting them from .de.  That is, until whatever.sgi.com is
> setup.

Hmm...  Ariel, Larry or whoever knows about that - what is the current
state of linux.sgi.com?

  Ralf
