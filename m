Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199709120157.DAA16937@informatik.uni-koblenz.de>
Subject: Re: R5000 caches
Date: Fri, 12 Sep 1997 03:57:20 +0200 (MET DST)
In-Reply-To: <199709120134.SAA10912@fir.engr.sgi.com> from "William J. Earl" at Sep 11, 97 06:34:54 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: ralf@mailhost.uni-koblenz.de, davem@jenolan.rutgers.edu, linux@cthulhu.engr.sgi.com
Message-ID: <19970912015720.K6wqEbCZ-NVhPhZAzbErTmaesPLtUsHDiHW8TpoTFv0@z>

>       By the way, in case you are not familiar with the problem, watch
> out for the R4600 errata in regard to index invalidate.  Basically,
> you need to disable interrupts while using the index invalidate
> and index writeback invalidate instructions on R4600 Rev. 1.7, so that
> invalidating a given line in one set is atomic with invalidating
> the corresponding line in the second set.  You can turn on interrupts
> periodically, but it is important to do both sets for a given index
> at the same time, without the possibility of an interrupt or exception.
> The errata can result in the same line winding up in both sets,
> leading to stale data.  The bug is not present in the R4600 Rev. 2.0
> or the R5000.

There is a more elegant solution for this bug.  Just leave the interrupts
as they are and invalidate set b before set a.  Anyway, Linux currently
still handles this erratum by disabling interrupts.

  Ralf
