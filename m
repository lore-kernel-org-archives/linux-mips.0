Message-ID: <073a01bfe29c$00995e90$0a00000a@decoy>
From: "Jay Carlson" <nop@nop.com>
References: <E136JuZ-0003C0-00@the-village.bc.nu>
Subject: Re: errno assignment in _syscall macros and glibc
Date: Fri, 30 Jun 2000 10:03:41 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Andreas Jaeger <aj@suse.de>, Mike Klar <mfklar@ponymail.com>, linux-mips@oss.sgi.com, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000630140341.AwfheOFbKwTmx-vvkaXZTyYJAJLBFhL1kvHKHB6tydY@z>

> > Sure; these days glibc is more or less synonym with libc and I was using
> > it in that sense.
> >
> > What small, portable libcs do we have available anyway?  Some mipers
will
> > want one.
>
> I've been playing with the Linux8086 libc which is tiny but not portable
when
> Prumpf pointed out that Cygnus newlib is designed for precisely this job.
Its
> about 250K MIPS32 (my PDA has mips32/mips64 but not mips16 - duh!!)

Does newlib work under Linux?  I thought it was missing (for example) the
syscalls, and generally needed work to be ported to Linux.  I'm interested
in helping with this, if people are already doing it.

*BSD libc has been suggested by a few people.

BTW, MIPS32 is not a synonym for 32-bit MIPS architecture.  :-( This appears
to be the fault of marketing people.  Quoting
http://www.mips.com/products/s2p5.html :

---
The MIPS32T architecture is a superset of the previous MIPS IT and MIPS IIT
Instruction Set Architectures (ISA) and incorporates powerful new
instructions specifically for embedded applications, as well as proven
memory management and privileged mode control mechanisms previously found
only in 64-bit R4000® and R5000® MIPS® processors.
---

It's got conditional move, multiply/add, count leading ones/zeroes, and some
other stuff.  I don't know of any shipping PDAs using MIPS32 chips.

Jay
