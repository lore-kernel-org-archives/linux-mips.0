From: "Michael Uhler" <uhler@mips.com>
Subject: RE: [RFC] synchronized CPU count registers on SMP machines
Date: Wed, 4 Jun 2003 15:51:49 -0700
Message-ID: <002701c32aeb$e4743cd0$08c0a8c0@MIPS.COM>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20030604153930.H19122@mvista.com>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Jun Sun' <jsun@mvista.com>, linux-mips@linux-mips.org
Message-ID: <20030604225149.tjvoak-wXmLVnIxAZbuhW4BKI2JCymy15dKCgsdKb18@z>

See interspersed comments.

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Jun Sun
> Sent: Wednesday, June 04, 2003 3:40 PM
> To: linux-mips@linux-mips.org
> Cc: jsun@mvista.com
> Subject: [RFC] synchronized CPU count registers on SMP machines
> 
> 
> 
> There are many benefits of having perfectly synchronized CPU 
> count registers on SMP machines.
> 
> I wonder if this is something which have been done before,
> and if this is feasible.

I remember doing something like this about 20 years ago on a much
different operating system in which the goal was to move the count
registers apart by a predictable amount such that a clock interrupt
didn't occur on all the CPUs at once.  But even in that case, we weren't
looking for precise matching.
> 
> Apparently, this scheme won't work if any of the following 
> conditions are true:
> 
> 1) clocks on different CPUs don't have the same frequency
> 2) clocks on different CPUs drift to each other

Depending on the precise system configuration (including whether the
CPUs are on different SOCs, different boards, where the PLLs are, and
what the ultimate clock source is), I'd guess that drift is pretty
likely on almost all systems unless the clocks are intentionally driven
by some sort of synchronize source.

> 2) some fancy power saving feature such as frequency scaling
> 
> But I think for a foreseeable future most MIPS SMP machines 
> don't have the above issues (true?).  And it is probably 
> worthwile to synchronize count registers for them.
> 
> I think some pseudo code like the below could get the 
> job done:
> 
> CPU 0:
> 	send interrupt to all other CPUs and ask them to sync count
> 	wait for all other CPUs to gather at rendevous point
> 	flip a flag
> 	set count to 0
> 
> other CPUs:
> 	trapped by IPI
> 	reach the rendevous point (busy spin locking)
> 	wait for the flip of the flag
> 	set count to 0

The biggest problem here is latency on the spinlocks and observation of
the flag state changing.  Depending on the memory architecture, the
point at which each CPU will see the change could be very different
(consider a NUMA mesh architecture in which the data movement can take
different paths).  As such, you could see on order of memory latency
different in the clocks.

You could run a counter adjustment periodically, or try to calibrate the
adjustment to make this closer, but I'm not sure that you can get
perfect synchronization.

> 
> I wonder after the above code how synchronized are the count 
> regsiters. Are they perfectly synchronized or still differ by 
> a few counts?
> 
> Any comments?
> 
> Jun
> 
> 
