Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Thu, 20 Jun 1996 11:12:17 -0700
From: wje@fir.esd.sgi.com (William J. Earl)
Message-ID: <199606201812.LAA24532@fir.esd.sgi.com>
Subject: Re: Kernel doesn't work on 200MHz Indy
In-Reply-To: <199606201102.XAA02623@soyuz.wellington.sgi.com>
References: <199606201102.XAA02623@soyuz.wellington.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alistair Lambie <alambie@wellington.sgi.com>
Cc: linux@neteng.engr.sgi.com
Message-ID: <19960620181217.WEeuYkuOJYl7zU5dz9OAsRffu9rTYl3py45old85U_s@z>

Alistair Lambie writes:
 > Just incase anyone is interested:
 > 
 > I was able to boot Davids kernel on my Indy when I only had a 100MHz R4600PC,
 > but know I've upgraded to a 200MHz R4400SC it dies!  Looks like something
 > to do with the memory controller...

      There is no way the kernel could work on an R4000 or R4400 without 
changes to the cache routines, as well as the addition of certain workarounds
for processor errata.  Stick to R4600 and R5000 processors for the time being.
I asked David to start with the R4600, because the workarounds for the errata
are far simpler, and because it and the R5000 are the volume processors for
Indy.  It will not be all that hard to add R4000 and R4400 support, but there
are several messy workarounds to implement, so it is more interesting to get
a complete system working on an R4600 or R5000.

...
 > PS - It only gives a BogoMIPS reading of 103.63, which is around what I got
 >      when it was a 100MHz chip.

      That is to be expected.  BogoMIPS is essentiall 2 times the number of
times one can execute a loop like this:

	la	a0,0x7FFFFFFF
1:	bltz	a0,1b
	addu	a0,-1

On an R3000, R4600, or R5000, the branch executes in two cycles (counting one
for the branch delay slot), so BogoMIPS equals the processor clock rate.
On an R4000 or R4400, the branch executes in four cycles (counting one for
the branch delay slot), so BogoMIPS equals one half the processor clock rate.
There appears to be a small error in the current logic for calibrating
the processor clock rate, which accounts for the BogoMIPS being 103.63 instead
of 100.00.
