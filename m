Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199709110428.GAA12438@informatik.uni-koblenz.de>
Subject: Re: R5000 caches
Date: Thu, 11 Sep 1997 06:28:17 +0200 (MET DST)
In-Reply-To: <199709110409.AAA14641@jenolan.rutgers.edu> from "David S. Miller" at Sep 11, 97 00:09:23 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "David S. Miller" <davem@jenolan.rutgers.edu>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970911042817.UMPZEaekQR4k3IQ-2ZI67uqYJ5-XGdl0cWq5Egws8yE@z>

> In SGI boxes, if my memory serves, the R5k's were the chips which
> needed the special:
> 
> 	cli();
> 	jump_into_64_bit_mode();
> 	{peek,poke}_magic_physaddr();
> 	leave_64_bit_mode();
> 	sti();
> 
> sequence, both to enable/disable the cache and to perform flush
> operations.  Although this could have been for the R4600.  I do

Afaik it's for both CPUs.

> remember that IRIX had special code to work the R5k caches, but this
> might have been for the L2 cache operations only, not L1.
> 
> All of this was very SGI specific and was mostly for the L2 cache
> operations.  I think the R5k had a special "flush command" which would
> just pull a pin going to the cache and invalidate all the lines in one
> cycle (earle told me this, he may be able to elaborate).

It's the L2 enable bit for the "true", means CPU controlled L2 cache
of the R5000.  The fact that we're dealing with two different types
of L2 caches for the R5000 complicates things slightly.  By design
the R5000 supports an external cache.  What SGI did was more or less
just ignoring that feature and using the R5000 as a R4600 replacement.
That's why they're using an external cache which is controlled by
the chipset.

> The R5k, by design at least in the SGI boxes, lacks a L2 cache, it was
> added externally on the SGI motherboard's, and thus all the funcy
> methods to access/enable/disable/flush it...  Again, I could be
> confusing r4600 and r5k here, so who knows.

Well, your memory serves right.  However my problem are especially
the primary caches (I've got not box with a "true" R5000 L2 cache), so
that doesn't solve my problem.  As far as I can tell your R4600 code seems
to work for the R5000 Indy with the "fake" cache.  I suspect that the
problem handling the L1 caches was causing the disk corruption I observed
on my Indy while on this Nevada box I'm using here SCSI works as realiable
as it is supposed to be.

Anyway, there is still enough fun to have.  I'm planning a little
lmbenchmania followed by a cycle-massacre and I'm just hacking
microsecond timers for that ...

  Ralf
