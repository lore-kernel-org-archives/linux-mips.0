Message-ID: <00ba01c46823$3729b200$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <KevinK@mips.com>
References: <BAY2-F21njXXBARdkfw0003b0c8@hotmail.com> <20040710100412.GA23624@linux-mips.org>
Subject: Re: Strange, strange occurence
Date: Mon, 12 Jul 2004 17:16:31 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <KevinK@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, S C <theansweriz42@hotmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20040712151631.Q2meLexL6p2sWWmTlvuyv42XzbIX58cGsnsUhrZgce4@z>

[snip]
> > The crash is occuring inside the function r4k_flush_icache_range().
> > 
> > I tried 'flush -i' and 'flush -d' on YAMON after the download but before 
> > the 'go', but that didn't help. I also tried completely disabling caches 
> > and loading/running uncached, but it gave the same error.
> > 
> > Now, the final twist! Using an ICE, I set a breakpoint at the 
> > r4k_flush_icache_range function. Then I loaded the kernel as usual, ran it 
> > with the ICE, stepped through a few instructions inside the 
> > r4k_flush_icache_range function and then did a 'cont'. The kernel now 
> > booted fine!
> 
> As already pointed out by the other poster Niels Sterrenburg using a
> debugger unavoidably changes the state of the system to be debugged.
> 
> For at least some of the TX49xx processors there is a problem under certain
> circumstances if a flush of an I-cache line flushes that cache instruction
> itself.  Make sure you're not getting hit by that one.

It's not just the TX49xx series.  While many MIPS-compatible processors 
do handle the special case of flushing the active CACHE instruction itself, 
not all of them do, and the MIPS32 spec calls it out as having an "UNPREDICTABLE"
result.

A truly safe and general I-cache flush routine should itself run uncached,
but a cursory glance at the linux-mips.org sources makes me think
that we do not take that precaution by default - the flush_icache_range
pointer looks to be set to the address of r4k_flush_icache_range()
function, rather than its (uncacheable) alias in kseg1.  Is this something
that's fixed in a linker script, or are we just living dangerously?

            Regards,

            Kevin K.
