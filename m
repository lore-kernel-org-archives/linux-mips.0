Message-ID: <073a01c4dec7$184527a0$0d00340a@matts>
From: "Matthew Starzewski" <mstarzewski@xes-inc.com>
References: <062301c4de41$5bf43cb0$0d00340a@matts> <41B96281.2050806@enix.org>
Subject: Re: Using more than 256 MB of memory on SB1250 in 32-bit mode, revisited
Date: Fri, 10 Dec 2004 08:46:52 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <mstarzewski@xes-inc.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thomas Petazzoni <thomas.petazzoni@enix.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20041210144652.-UNEmozKXf8IfSADi3ZZ3-8iNM7505cD515YU6XxpbY@z>


> I'm really unsure of what I'll say, but I've seen people on this list
> talking about CONFIG_DISCONTIGMEM, an option for the kernel, which is :
>
> "Say Y to upport efficient handling of discontiguous physical memory,
>  for architectures which are either NUMA (Non-Uniform Memory Access)
>   or have huge holes in the physical address space for other reasons.
>  See <file:Documentation/vm/numa> for more."

I've tried using DISCONTIGMEM on the MIPS32 build, but it yields the
following build error.  Maybe someone familiar w/ the SGI IP27 (Origin 200
and
2000) code could tell us whether simply turning on DISCONTIGMEM is
a good idea.

include/linux/mmzone.h:364:2: #error NODES_SHIFT > MAX_NODES_SHIFT

Also, even if it compiled with DISCONTIGMEM, a look at
sgi-ip27/ip27-memory.c
shows no sign of HIGHMEM support, what I was depending on to use the upper
256MB of memory as per my original email.  Now this may be OK; depending on
how
flexible the DISCONTIGMEM option is, perhaps I could map a wired TLB or
KSEG3
to the 2nd 256MB.

Thoughts?

Matt


----- Original Message -----
From: "Thomas Petazzoni" <thomas.petazzoni@enix.org>
To: "Matthew Starzewski" <mstarzewski@xes-inc.com>
Cc: <linux-mips@linux-mips.org>; <Steve.Finney@SpirentCom.COM>
Sent: Friday, December 10, 2004 2:46 AM
Subject: Re: Using more than 256 MB of memory on SB1250 in 32-bit mode,
revisited
