Message-ID: <021201c4685f$2925ee30$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <KevinK@mips.com>
References: <BAY2-F27mxl2RtYP35u0000d191@hotmail.com> <020201c46859$fa6b98b0$0deca8c0@Ulysses>
Subject: Re: Strange, strange occurence
Date: Tue, 13 Jul 2004 00:25:37 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <KevinK@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Kevin D. Kissell" <KevinK@mips.com>, S C <theansweriz42@hotmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20040712222537.bt21tE1Gj7v95TcNMkBGYc4JZ2BCukbF1fYlLlvbM_o@z>

> Your intuition is correct, and the code in r4k_tlb_init() does look scary.
> But at least in the linux-mips CVS tree, flush_icache_range() tests to see
> if "cpu_has_ic_fills_f_dc" (CPU has Icache fills from Dcache, I presume)
> is set, and if it isn't, it pushes the specified range out of the Dcache before
> flushing the Icache.  I would speculate that either your c-r4k.c is out of
> sync with yout tlb-r4k.c, or you erroneously have cpu_has_ic_fills_f_dc
> set.

Hmm.  On closer examination, there *is* a bug in the current r4k_flush_icache_range(),
in that it computes its cache flush loop for the I-cache based on the D-cache line size.
Those line sizes are *usually* the same.  By any chance are they different for the
TX49 family?  If the icache line is longer than the dcache line, there should be no
functional problem, just some wasted cycles.  But if the dcache line were, say, 
twice the length of the Icache line, only half of the icache lines would be invalidated...

            Regards,

            Kevin K.
