Message-ID: <004a01c30002$b3b19480$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20030410220906.B519@linux-mips.org><200304102028.h3AKSf211575@uhler-linux.mips.com><20030410225212.A3294@linux-mips.org> <16022.24992.314581.716649@gladsmuir.mips.com>
Subject: Re: way selection bit for multi-way cache
Date: Fri, 11 Apr 2003 10:15:06 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Dominic Sweetman <dom@mips.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: Mike Uhler <uhler@mips.com>, Jun Sun <jsun@mvista.com>, linux-mips@linux-mips.org
Message-ID: <20030411081506.LSjd2gaAtvBcWyhgDuPK3BAHJxpsHsg7ScxcbzgVJUs@z>

> Mike wrote:
> 
> > > I'm not sure what you mean by TLB translations required for hit
> > > cacheops.  If you mean the Index Writeback or Index Invalidate
> > > functions, note that you can (and should) use a kseg0 address to
> > > do this.
> 
> Mike was proposing a kseg0 address translating to the right physical
> address, and used with a hit-type cacheop.  I believe Ralf (and Linux)
> are just assuming that's no good because it doesn't work if you have
> cacheable memory above 512Mbytes physical address.

More importantly, it doesn't work in the case of virtually tagged caches,
such as those in the SB-1 and MIPS 20K.

> I wonder whether anything really bad would happen if you temporarily
> changed the (machine) ASID to that of the address space you wanted to
> invalidate?

I looked at that when we were investigating the aforementioned
issues with virtually-tagged I-caches.  It looked to me as if exceptions
can occur during the invalidation, and that processing those exceptions
can cause signals to be raised to the current process in a manner that 
assumes that the TLB and ASID are coherent and in sync with 
the scheduler.  It may be that just changing the ASID temporarily
would work - most of the time.  It may even be that, with a bit
of lashing down of state, disabling of interrupts, setting of flags
to be read by traps.c/signal.c, etc, etc, it could be made bulletproof.
But I don't think that the simple, obvious hack is safe.

            Kevin K.
