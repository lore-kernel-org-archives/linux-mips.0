Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@cobaltmicro.com>
Message-ID: <199710072328.QAA17826@dull.cobaltmicro.com>
Subject: Re: More Linux/SGI status
Date: Tue, 7 Oct 1997 16:28:07 -0700 (PDT)
In-Reply-To: <199710072241.RAA01259@athena.nuclecu.unam.mx> from "Miguel de Icaza" at Oct 7, 97 05:41:38 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Miguel de Icaza <miguel@nuclecu.unam.mx>
Cc: linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr
Message-ID: <19971007232807.tudnsE6eaFVgWZgowTmBFvsqBhTFbUYKVczwDZJlqBs@z>

Hi,

>    Ralf's fixes to the dynamic linker fixed the Xt applications.  Now,
> only the PAM remains to be fixed.

The PAM problem is also a dynamic linker problem.  It's (I hope) one the
last major showstopper class bugs that prevent just building a
Linux/MIPS distribution from 95% unchanged source packages - and
fullfilling all the promises to those loading hardware to me ...

Btw, I stopped the mega load test (Running many compilers and tools in
parallel) I posted recently after some more hours because the machine ran
out of swap, some processes died therefore and load < 100 isn't that
interesting ...

System call latencies were pretty lousy bad for MIPS kernel because
we were using a syscall handler written in C.  I rewrote the entire
thing in assembler and now we're as fast as a MMX Pentium accounting
for the different clock rates.  Pretty nice, because we actually have
to save/restore many more registers and deal with a more complex
system call convention.  Seven nops left to eleminate ...

>    So, where do we stand now?  So, the only bits missing now are:
> 
> 	1. me finishing the support for the X server.  just a hack
> 	   here and there.
> 
> 	1.b. Getting the other important bits of the RRM code in the
> 	   kernel. 
> 
> 	2. me fixing the mouse.
> 
> 	3. Would it be possible to negotiate with SGI management 
> 	   the posibility of shipping the IRIX runtime libraries and
> 	   the X server as found on IRIX with a Linux disrtibution?

Bad point in time, it has been pointed out to me that SGI's stock
was doing pretty bad ;-)

> 	4. A nice, easy-to use install program.  Taking the existing
> 	   Red Hat/Mustand install program and port it should be
> 	   pretty easy. 

  Ralf
