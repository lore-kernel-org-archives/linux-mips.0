Message-ID: <019601c25501$c5307250$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1020905181042.7444G-100000@delta.ds2.pg.gda.pl>
Subject: Re: 64-bit and N32 kernel interfaces
Date: Thu, 5 Sep 2002 19:29:12 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Daniel Jacobowitz <dan@debian.org>
Cc: Hartvig Ekner <hartvige@mips.com>, Tor Arntsen <tor@spacetec.no>, Carsten Langgaard <carstenl@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20020905172912.tWn0RJaG6qlwQPrNhDsZZGiPsCaL3MwNnB6PUh-i9RM@z>

From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
> On Thu, 5 Sep 2002, Daniel Jacobowitz wrote:
> 
> > N32 supports saving and restoring 64-bit registers, which O32 doesn't -
> > according to some comments in GCC, O32 is in fact incompatible with
> > using 64-bit operations.
> 
>  But that old software wouldn't benefit as it didn't perform 64-bit
> operations unless manually coded in software using narrower data types. 
> There is no 64-bit C data type for o32 and long long is quite a recent
> invention -- it didn't exist in the 80s or even early 90s.

Well, actually,. as I recall from those days, "long long" *did*
exist in the very late 1980's, though it wasn't part of any standard,
and there were variant names proposed for it.  Certainly it had 
been  invented by the time the first 64-bit MIPS chips came out 
in 1991/1992.  Maybe not in GCC, but in other complers of 
the period.  The concensus was that "long" should be the largest
element that could be loaded/stored/used in an integer register,
which meant 32-bits for most of us in those days, yet there was
a need to represent 64-bit integers for the clearest expression
of some algorithms.  MIPS was rather unique in having made 
a "binary compatible" transition from 32 to 64-bits.  Does anyone 
know what's being done with C integer binding on the AMD
"Hammer" architecture?  They're looking at the same problem,
10 years further on.

            Kevin K.
