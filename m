Subject: Re: errno assignment in _syscall macros and glibc
Date: Sun, 25 Jun 2000 22:25:48 +0100 (BST)
In-Reply-To: <20000625232138.A3802@bacchus.dhis.org> from "Ralf Baechle" at Jun 25, 2000 11:21:39 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E136JuZ-0003C0-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Andreas Jaeger <aj@suse.de>, Mike Klar <mfklar@ponymail.com>, linux-mips@oss.sgi.com, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000625212548.uNcp-vKN7OVjyC9SY41XfmevQegKWRpjX5yDdyKWnOs@z>

> Sure; these days glibc is more or less synonym with libc and I was using
> it in that sense.
> 
> What small, portable libcs do we have available anyway?  Some mipers will
> want one.

I've been playing with the Linux8086 libc which is tiny but not portable when
Prumpf pointed out that Cygnus newlib is designed for precisely this job. Its
about 250K MIPS32 (my PDA has mips32/mips64 but not mips16 - duh!!)

Alan
