Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199706201012.MAA14703@informatik.uni-koblenz.de>
Subject: Re: Getting X on Linux/SGI
Date: Fri, 20 Jun 1997 12:12:15 +0200 (MET DST)
In-Reply-To: <199706200917.FAA07966@jenolan.caipgeneral> from "David S. Miller" at Jun 20, 97 05:17:42 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "David S. Miller" <davem@jenolan.rutgers.edu>
Cc: fisher@sgi.com, lm@neteng.engr.sgi.com, sca@refugee.engr.sgi.com, carlson@heaven.newport.sgi.com, linux@cthulhu.engr.sgi.com, fisher@hollywood.engr.sgi.com
Message-ID: <19970620101215.y-b5U7vYwNC5u0tDngVRKWBbyaawCMfAqwrBBYhFlbE@z>

> So you see, the real issue is that people don't know they want it...
> 
> Oh btw, Eddie will in fact be working on some MIPS based embedded
> boards in the near future, and I can tell you he sure as hell isn't
> gonna be putting QNX or any other "embedded OS" in those things.

Three people/companies have already started basing embedded systems
based on the MIPS/Linux [1] at times when I personally wouldn't have
trusted the entire MIPS port five minutes without peeking at it.

Toshiba is currently porting Linux to a new R-family type processor
for verification of the processor.  Hey, it does run Linux even before
there is Silicon at all!

Dave is right:

> So you see, the real issue is that people don't know they want it...

You see, we have not yet really taken off with the MIPS port and we
already have some impact on the market.

Another interesting embedded project will be done by Alan Cox.  He
intends to port Linux to the R4650, a CPU without a TLB but just a
pair of base/bounds registers.  Not an ELKS port but an almost full
port of Linux just without certain features like mmap-ing.

  Ralf

[1] Not going to be M/Linux ;-)
