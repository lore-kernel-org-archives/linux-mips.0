Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199709120122.DAA12959@informatik.uni-koblenz.de>
Subject: Re: R5000 caches
Date: Fri, 12 Sep 1997 03:22:15 +0200 (MET DST)
In-Reply-To: <199709120102.SAA10756@fir.engr.sgi.com> from "William J. Earl" at Sep 11, 97 06:02:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: ralf@mailhost.uni-koblenz.de, davem@jenolan.rutgers.edu, linux@cthulhu.engr.sgi.com
Message-ID: <19970912012215.kafZ0rgjuIgKvu13fbNE-e5Tz4PYtEpsw4fPlrBLfRk@z>

Hi,

>      For primary caches, the set is selected by the high order bit of
> the cache index (virtual address bit 13 on the R4600, virtual
> address bit 14 on the R5000).  (Note that the R10000 is different: it
> uses the low order address bit to select the set.)  

Indeed, but currently our only R10k problem is that we don't support
that thing at all ...

>        Yes, that is correct for hte Indy, but the O2 R5000SC does
> use the real R5000 secondary cache.  The L2 enable bit is set on O2
> R5000SC and is not set on the Indy.

>       If you were using the index bits incorrectly, that would cause
> disk corruption, and, as noted above, the set selection bit differs,
> due to the size of the cache.  Basically, if the size of the cache is
> X, then (X >> 1) is the set selection bit.  The R4600SC secondary
> cache code should apply equally to the Indy R5000SC, without change.

Ok, thanks for the information.  It's what I was expecting.  In that
case the version which I'm just about to check in is still not R5000
safe.  I'm going to fix that rsn.

Quickfix for R5000 hackers: change the #define for waybit in
arch/mips/mm/r4xx0.c from 0x2000 to (dcache_size >> 1).

  Ralf
