Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199710231825.UAA26628@informatik.uni-koblenz.de>
Subject: Re: Magnum 4000 caches
Date: Thu, 23 Oct 1997 20:23:38 +0200 (MEST)
In-Reply-To: <199710231808.LAA11992@fir.engr.sgi.com> from "William J. Earl" at Oct 23, 97 11:08:31 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19971023182338.6KjC3_c6ARfyMzM6wuX4QX2rzff3l-9_nI87zQC3IKQ@z>

>      Yes, I think you should leave the linesize alone, at least on
> the MCT version 2.  You could try alternate linesize values on the MCT
> version 3.  The cache control code should use the linesize values from
> $config.  By the way, I have found that it is generally faster on the R4000 (and
> especially on later processors) to compute such values from $config each
> time than to load them from variables in memory.  The amortized cost
> of the extra cache misses can easily outweigh the extra instructions needed
> to recompute the value (since the latter are really very few, if you
> code the sequence cleverly in assembly language).  Similarly, if you need
> to test for processor type, it is usually faster to fetch and decode
> $prid than to use a variable in memory.

Indeed, Linux could need a little polish in that respect ...

>        The R6000 is a real challenge.  It is substantially different
> from the R3000 and R4000.  In particular, it uses part of the cache
> as a sort of second level TLB.  ES/IX is the CDC version of MP RISC/os.
> (MIPS worked on MP RISC/os, but never shipped it to customers; CDC took
> it over as a product.)  The I/O is fairly straightforward, being mostly
> VME devices, but it does include I/O address mapping hardware which must
> be configured.

Is the information in newer releases of Kane's MIPS bible sufficient to
do the R6000 part of the job?  I guess the company (BIT ???) that made the
R6000 is no longer around, so it would make sense if Roman'd ask them
for a manual ...

  Ralf
