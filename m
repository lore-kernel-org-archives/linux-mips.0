Message-ID: <006501bf7803$59855ad0$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Indy crashes
Date: Tue, 15 Feb 2000 23:23:49 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000215222349.LS9vPK0GEsc1Me2M7t89jLvVLz1PfC4NGOJlZIW96AY@z>

>> The problem may be in the assumption made even in the
>> most recent 2.3.x code that a hit-writeback-invalidate cache
>> operation on the secondary cache automagically affects the
>> primary.  That's the way it is on the R4000/4400, but that's
>
>In that case it doesn't affect the NEC DDB Vrc-5074, since there's no L2.


If it isn't the cache, and it tracks the CPU type, the next thing
I suspect is a pipe hazard.   The R5000 manual states that there
should be "at least two integer instructions between" any
instruction modifying the PageMask, EntryHi, or EntryLo[01]
registers and the subsequent tlbw[ir] or tlbp.  That's different
from the R4000.  In the current Linux arch/mips/head.S file, 
this interval does not seem to be respected by any of the TLB 
miss handlers.  Indeed, the default except_vec0_r4000 handler,
which I believe is what is used if an R5000 is detected, has 
the sequence

        mtc0    k1, CP0_ENTRYLO1                # load it
        b       1f
         tlbwr                                  # write random tlb entry
1:
        nop
        eret

wherin the purpose of the branch is obscure (I imagine
it fixed a bug seen somewhere on some CPU but it
makes me rather queasy)  but wherein in any case we 
do not seem to be assured 2 issues between the mtc0 
and the tlbwr.  It should be OK for an R4000, but not for 
an R5000.

So someone with the ability to reproduce the R5000
problem should really try sticking a nop between the
mtc0 and the branch (sigh) to see if that stabilizes 
the system.

            Regards,

            Kevin K.
__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68

    
