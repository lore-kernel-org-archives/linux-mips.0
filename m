From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200210051512.g95FCmI11618@copfs01.mips.com>
Subject: Re: Promblem with PREF (prefetching) in memcpy
Date: Sat, 5 Oct 2002 17:12:47 +0200 (MEST)
In-Reply-To: <20021005014345.B15883@linux-mips.org> from "Ralf Baechle" at Oct 05, 2002 01:43:45 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-Path: <hartvige@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "Kevin D. Kissell" <kevink@mips.com>, Dominic Sweetman <dom@algor.co.uk>, Carsten Langgaard <carstenl@mips.com>, linux-mips@linux-mips.org
Message-ID: <20021005151247.Zor3Tm_F0rjV_ONPDleQGUFa3lm_yuhvnYMRR5kX2pc@z>

I still say we should fix memcpy() (and everything else using prefetches)
never to prefetch anything it hasn't been asked to touch.

Apart from the performance loss of the current practice which Alan pointed
out, I think there is another very good reason to fix it: SW coherency.

Unless we want to do writeback/invalidate both before & after ownership
of buffers are given/taken from DMA IO devices, we need to get rid of 
the prefetches to unwanted areas. 

So that's two good arguments for fixing memcpy() as I see it. I haven't
really heard any arguments against it?

Whether the last page of physical memory needs to be thrown away or not seems
like a separate issue. Is this also done in x86 world? What are the issues
you're thinking about Ralf? Are there devices which will read/write beyond 
what they have been asked to?

/Hartvig


Ralf Baechle writes:
> 
> On Fri, Oct 04, 2002 at 02:36:39PM +0200, Kevin D. Kissell wrote:
> 
> > In case Carsten's reply wasn't clear enough, there is a loophole
> > in the spec:  kseg0.  There is no TLB access to cause a TLB
> > exception (which would suppress the operation and be nullifed),
> > If the prefetch address is correctly aligned, so that there is no
> > address exception.  In typical use, kseg0 is cacheable, which
> > means that the second paragraph you quote does not apply.
> > A prefetch to a well-formed, cacheable kseg0 address which 
> > has no primary storage behind it (e.g. 0x04000000 on a system
> > with 64M of physical memory) should, according to the spec,
> > cause a cache fill to be initiated for the line at that address,
> > which will result in a bus error, if not a flat-out system hang.
> 
> Traditionally the kernel leaves the last page of memory unused but this
> has been lost in the many changes to the memory initialization code.
> It's still a good idea with all the broken I/O chips and PCI bridges out
> there - and can avoid a hard to track bug.
> 
> That only leaves stuff usermode device drivers that are using cachable
> mappings in the dangerzone.  That should be a rare case, if at all.
> 
>   Ralf
> 
> 


-- 
 _    _   _____  ____     Hartvig Ekner        Mailto:hartvige@mips.com
 |\  /| | |____)(____                          Direct: +45 4486 5503
 | \/ | | |     _____)    MIPS Denmark         Switch: +45 4486 5555
T E C H N O L O G I E S   http://www.mips.com  Fax...: +45 4486 5556
