Message-ID: <022301bf7730$92b87180$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Indy crashes
Date: Mon, 14 Feb 2000 22:15:02 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: geert@linux-m68k.org, Ralf Baechle <ralf@oss.sgi.com>
Cc: linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000214211502.AGVBSaAJDJq1Yr6aISBC8FHXzj-hSKg_G7bJg1HGHd4@z>

>On Thu, 3 Feb 2000, Ralf Baechle wrote:
>> Today I exchanged the R5000 CPU module in my Indy against a R4600 module
>> and found that on R4600SC the kernel runs reliable while it crashs pretty
>> soon after booting on a R5000SC module.  This is consistent with the
>> reports that I've looked at.
>
>That could explain the crashes I see on the DDB Vrc-5074 as well, which has a
>NEC VR5000.
>
>I'll try to fix the bootmem stuff ASAP and upgrade to 2.3.38.


The problem may be in the assumption made even in the
most recent 2.3.x code that a hit-writeback-invalidate cache
operation on the secondary cache automagically affects the
primary.  That's the way it is on the R4000/4400, but that's
not the way the R5000 is specified.  So rather than set
dma_cache_wback_inv to r4k_dma_cache_wback_inv_sc
or r4k_dma_cache_wback_inv_pc, depending on the
presence or absence of a primary cache,  in the MIPS 
Technologies I bound it to a function:

static void
r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
{
        r4k_dma_cache_wback_inv_pc(addr, size);
        if(sc_present) r4k_dma_cache_wback_inv_sc(addr, size);
}

However, I have not had the opportunity to test this code on
an R5000SC platform.   Looking at the R5000 spec, it is a
little ambiguous.  The special case of sc HWIs affecting
the primary isn't there, but then again sc HWIs aren't even
called out in the table of defined cache operations.  Indeed,
one *could* interpret the spec to mean that HWI on the 
*primary* flushes the secondary, the reverse of the R4000,
but it's by no means clear.   Thus I suggest hitting 'em both.

Does anybody on this list have an R527x manual?   How
is HWI of the primary/seconday caches defined there?

            Regards,

            Kevin K.
