Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199703072138.WAA16621@kernel.panic.julia.de>
Subject: Re: Linux/SGI
Date: Fri, 7 Mar 1997 22:38:35 +0100 (MET)
In-Reply-To: <199703071951.NAA10311@athena.nuclecu.unam.mx> from "Miguel de Icaza" at Mar 7, 97 01:51:32 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Miguel de Icaza <miguel@nuclecu.unam.mx>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970307213835.4lOE8ARjuS24Uerhz_q87z5JxrWmb8olbCt1Sz6LJDI@z>

Hello,

>    This is kind of a test message to see if we are (Ralf and I) are on
> the SGI Linux mailing list.
>  
>    Ralf and I have joined the Linux/SGI project (he will mail his very
> own presentation later).  The idea basically is that we will be
> getting a machine each one to finish the Linux on SGI port.

   Thanks for the introduction Miguel; I'd like to use the chance to drop
some words about what I'm doing right now on Linux and what the status
of this is.

   As you know David left SGI again in the late August.  At that time he
had not only completed a good part of the SGI specific stuff but also
made a lot of improofments to the generic MIPS parts of the kernel.  At
that time his kernel was based on Linus' 2.0.14.

  At the same time I was working mostly independend of him; luckily.  My target
machines were at that time the good old Magnum 4000 and it's OEM variant
M700-10 from Olivetti, the Magnum based Acer PICA machine and SNI's RM200.
When Ariel mailed me about working on Linux/SGI my kernel for these
machines was based on Linux 2.1.21.

  It's obvious that our kernels have diverged a good bit from each other
and right now I'm working on merging both kernel sources into one single
tree again.

  The second most important part of the system is libc.  On MIPS we use
the GNU which has the enormous advantage of being far more portable and
cleaner code than the Linux Libc on which most Linux/i386 systems are
based.  Disadvantage is that GNU libc was much buggier than Linux Libc.
This has changed a lot and so libc presents itself already quite near
to a release (*) libc but there is still some work to do.

  Similar for the other core parts of the system on which David worked but
right now I'm still busy merging the kernel sources; the next step will
be libc.

  Ralf

*) famous last words
