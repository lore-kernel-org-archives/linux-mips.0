Received: from mx1.netlogicmicro.com ([12.203.210.36]:1362 "EHLO
        orion5.netlogicmicro.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S1491881Ab1JCKjj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 3 Oct 2011 12:39:39 +0200
Date: Mon, 3 Oct 2011 16:09:36 +0530
From: Jayachandran C. <jayachandranc@netlogicmicro.com>
Subject: Re: [RFC] mark Netlogic XLR chip as SMT capable
Message-ID: <20111003103935.GA6016@jayachandranc.netlogicmicro.com>
References: <CAJd=RBAc8Zv1JZfrAx2Ajj7fdJv=oA+eYHVBLfcFNOoZNyG7fg@mail.gmail.com>
 <20111002083044.GA23668@jayachandranc.netlogicmicro.com>
 <CAJd=RBBt0xNgUrz9XnU0TcHo443t3j323zYg8jMPYRjXsV=EHw@mail.gmail.com>
 <20111003103204.GC6038@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20111003103204.GC6038@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Hillf Danton <dhillf@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20111003103936.h86j1t3dI_a0rrYkHfKkA6a_jo-Pd5-qlPp8y9wjfVA@z>

On Mon, Oct 03, 2011 at 11:32:04AM +0100, Ralf Baechle wrote:
> On Mon, Oct 03, 2011 at 01:46:46PM +0800, Hillf Danton wrote:
> 
> > +	unsigned int cpu, core_id;
> > +
> > +	cpu = smp_processor_id();
> > +	core_id = (cpu >> 2) & 0x7;
> > +	cpu_data[cpu].core = core_id;
> 
> This is going to break in setups where Linux is not being booted on
> what the hardware considers CPU core 0.  Which is not uncommon in embedded
> setups.  You may want to probe the hardware for the core ID rather than
> relying on smp_processor_id() here.

Yes, the function hard_smp_processor_id() from netlogic/mips-extns.h has to
be used here.

This also conflicts with the recent patch-set for XLP support, but I don't
know the status of that yet.

JC.
