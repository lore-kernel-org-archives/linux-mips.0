From: Dominic Sweetman <dom@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <16170.7179.635988.268987@doms-laptop.algor.co.uk>
Date: Fri, 1 Aug 2003 08:51:39 +0100
Subject: RE: RM7k cache_flush_sigtramp
In-Reply-To: <9DFF23E1E33391449FDC324526D1F259017DF087@SJC1EXM02>
References: <9DFF23E1E33391449FDC324526D1F259017DF087@SJC1EXM02>
Return-Path: <dom@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Adam Kiepul <Adam_Kiepul@pmc-sierra.com>
Cc: 'Ralf Baechle' <ralf@linux-mips.org>, Fuxin Zhang <fxzhang@ict.ac.cn>, linux-mips@linux-mips.org
Message-ID: <20030801075139.tV1dcE9Grcn20lXn96rLGsAxjxBXFE1Eh87ai77W5_4@z>


> If this is just to ensure the I Cache coherency for modified code
> then the following should be sufficient:
> 
> cache Hit_Writeback_D, offset(base_register)
> cache Hit_Invalidate_I, offset(base_register)
> 
> The ordering does matter however since the Hit_Invalidate_I makes
> sure the write buffer is flushed.

I'm probably jumping into the middle of something, sorry... 

The MIPS32/MIPS64 release 2 architecture includes a useful instruction
SYNCI which does the whole job (repeat on each affected cache line)
and is legal in user mode; this will take a while to spread but I'd
recommend it as a model worth following.

So I hope that kernels will provide one function for "I've just
written instructions and now I want to execute them", and not export
the separate writeback-D/invalidate-I interface.

--
Dominic Sweetman
MIPS Technologies
dom@mips.com
