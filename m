Message-ID: <200304102028.h3AKSf211575@uhler-linux.mips.com>
Reply-To: uhler@mips.com
Subject: Re: way selection bit for multi-way cache 
In-reply-to: Your message of "Thu, 10 Apr 2003 22:09:06 +0200."
             <20030410220906.B519@linux-mips.org>
Date: Thu, 10 Apr 2003 13:28:41 -0700
From: "Mike Uhler" <uhler@mips.com>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Mike Uhler <uhler@mips.com>, Jun Sun <jsun@mvista.com>, linux-mips@linux-mips.orguhler@mips.com
Message-ID: <20030410202841.4CNYcz31DPSeml3fU4Wl6Q5ykUgK7Ndr9N12HhjGGjs@z>


> On Thu, Apr 10, 2003 at 12:37:47PM -0700, Mike Uhler wrote:
> 
> > > The question came up between Jun and me when revising the way of handling
> > > multi-way caches.  There is the MIPS32 / MIPS64 way of selecting the
> > > cache way - but that scheme was originally already introduced by the
> > > R4600.  The second somewhat less common scheme is using the lowest bits
> > > of the address.  That was originally introduced with the R10000 but a
> > > few other processors such as the R5432 and the TX49 series are using it
> > > as well.  Unfortunately there has been way to much creativity (usually
> > > a positive property but ...) among designers so this posting is an
> > > attempt to achieve completeness.
> > 
> > Exactly why we made it a standard in MIPS32 and MIPS64.
> 
> Yep, of the existing variations that was certainly the nicest.  Only a
> single function had to be taught about multi-way caches and that only
> because it's a bit hard to flush caches for another process due to the
> TLB translation required for the hit cacheops.  Alternative schemes need
> more support by the code.

I'm not sure what you mean by TLB translations required for hit cacheops.
If you mean the Index Writeback or Index Invalidate functions, note that
you can (and should) use a kseg0 address to do this.  This bypasses
the TLB, while still giving you the index that you want.  We simply
OR the kseg0 base address into the index that we've calculated and
use that as the argument to the CACHE instruction.  There's actually
words to this effect in the MIPS32/MIPS64 spec, but it is, perhaps,
not clear enough.

/gmu
