Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199705021211.OAA13307@informatik.uni-koblenz.de>
Subject: Re: linux-2.1.36
Date: Fri, 2 May 1997 14:11:06 +0200 (MET DST)
In-Reply-To: <199705021121.HAA22284@neon.ingenia.ca> from "Mike Shaver" at May 2, 97 07:21:17 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com, davem@caip.rutgers.edu
Message-ID: <19970502121106.jiGP4YafyGEPjTtYvGVAbCSXE_Cr4ICBa9JY6nvc-uM@z>

Hi,

> Looks like sgiserial.c needs to be updated to use the new IRQ stuff,
> etc. (can't find keypress_wait, still using queue_task_irq_off).

Mea culpa.  I leave that part to you.

> I'm going to wish I was paying more attention on linux-kernel when
> people were going over this stuff, I just know it. =)
> 
> Also, wd33c93.c fails to compile.  Probably some simple stuff (I'm
> getting parse errors), but I won't be able to do much with it until
> the afternoon.

I messed the wd driver stuff up.  I didn't fix the rejects when applying
Linus' patch 2.1.36.  I fixed that in the meantime and will try to find
time to make a pre-patch-2.1.37 before I leave Germany.

David did completly reformat the WD driver to make it readable.  Downside
is that it's difficult to see what he really has changed.  Someone
should probably do that.

David, what are the differences between your version of the WD driver
and the stock WD driver?

  Ralf
