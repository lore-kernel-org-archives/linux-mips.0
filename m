Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:63644 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133865AbWFBTJS
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 2 Jun 2006 21:09:18 +0200
Message-ID: <01b401c68678$98199a10$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <e8180c7f0606021139w6d26e03eice708d5076cccf64@mail.gmail.com>
Subject: Re: replacing synthesized tlb handlers with older ones
Date: Fri, 2 Jun 2006 21:13:11 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Prasad Boddupalli <bprasad@cs.arizona.edu>, linux-mips@linux-mips.org
Message-ID: <20060602191311.UiRs3PT90gbL-1-vDqj_eOrRBdbaY-YlVc-jSjmZwrc@z>

The TLB refill handler behavior for 1 CPU is fundamentally
different than for SMP.  In the uniprocessor case, the page
table origin is implicit, whereas in SMP it needs to be indexed
by some per-CPU value, typically maintained in the Context
register.  Pre-synthesed kernels set up up so that the Context
value would be shifted left 23 bits, then right by 2 bits, to generate
an offset.  The newer system eliminates the right shift by ensuring
that the CPU index is stored in a pre-scaled form, and that bits
23 and 24 are zero.  So you can't just drop the old code into
the newer kernel, unless you also change the setup of Context.
A single CPU would work, because 0 == 0, otherwise...
Try nuking those right shifts.

            Regards,

            Kevin K.
 
----- Original Message ----- 
From: "Prasad Boddupalli" <bprasad@cs.arizona.edu>
To: <linux-mips@linux-mips.org>
Sent: Friday, June 02, 2006 8:39 PM
Subject: replacing synthesized tlb handlers with older ones


> Hi,
> 
> To embed some additional functionality in the tlb refill handler, I
> replaced the synthesized refill handlers in 2.6.16 linux with those
> from 2.6.6 (for example tlb-r4k.S under arch/mips/mm-32). Everything
> seem ok when I bring up one CPU, but causes unrecoverable exceptions
> in the kernel when I bring up multiple CPUs. I explored if that could
> be because of unflushed icaches on other CPUs. but that doesn't seem
> to be the case.
> 
> Have anyone run into similar problem ?
> 
> thank you,
> Prasad.
> 
> 
