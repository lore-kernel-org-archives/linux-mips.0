Message-ID: <020201c46859$fa6b98b0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <KevinK@mips.com>
References: <BAY2-F27mxl2RtYP35u0000d191@hotmail.com>
Subject: Re: Strange, strange occurence
Date: Mon, 12 Jul 2004 23:48:31 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <KevinK@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: S C <theansweriz42@hotmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20040712214831.6udwDnCEOb3bF9SxxnGf4_GXDwgLcE6pR13vDtQ_L4U@z>

> And thinking about it a little more, I might as well clarfy my understanding 
> while we're on the topic.
> 
> Here's a code snippet from r4k_tlb_init() in arch/mips/mm/c-r4k.c
> 
> memcpy((void *)KSEG0, &except_vec0_r4000, 0x80);
> flush_icache_range(KSEG0, KSEG0 + 0x80);
> 
> So my understanding is that the TLB exception handler is being copied to the 
> right memory location, and just in case some other TLB exception handler 
> (YAMON's presumably) is residing in I-cache, to flush ( hit invalidate) it. 
> Is this correct?
> 
> Shouldn't there be code to writeback_invalidate the exception handler from 
> the data cache ? Presumably the memcpy causes the TLB handler to lodge 
> itself in the D cache till it is moved to RAM (either explicitly or when 
> some other lines replace the cache lines where the handler is), right?
> 
> Thanks in advance for helping me understand the issue here.

Your intuition is correct, and the code in r4k_tlb_init() does look scary.
But at least in the linux-mips CVS tree, flush_icache_range() tests to see
if "cpu_has_ic_fills_f_dc" (CPU has Icache fills from Dcache, I presume)
is set, and if it isn't, it pushes the specified range out of the Dcache before
flushing the Icache.  I would speculate that either your c-r4k.c is out of
sync with yout tlb-r4k.c, or you erroneously have cpu_has_ic_fills_f_dc
set.

            Regards,

            Kevin K.
