From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200210041233.g94CXrQ29071@copfs01.mips.com>
Subject: Re: Promblem with PREF (prefetching) in memcpy
Date: Fri, 4 Oct 2002 14:33:53 +0200 (MEST)
In-Reply-To: <200210041153.MAA12052@mudchute.algor.co.uk> from "Dominic Sweetman" at Oct 04, 2002 12:53:22 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-Path: <hartvige@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Dominic Sweetman <dom@algor.co.uk>
Cc: Carsten Langgaard <carstenl@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20021004123353.Ut0Pk3cGfbXRepXo6Gkr7LtX2-qDPWW9GZYjzzj79qQ@z>

Hi Dom,

this problem occurs in kernel space (kseg0), not user space. In user space
there is no problem due to the TLB "protection" of PREFs going outside the
process working set, but that doesn't help in kernel mode.

/Hartvig

Dominic Sweetman writes:
> 
> 
> Carsten Langgaard (carstenl@mips.com) writes:
> 
> > I think we have a problem with the PREF instructions spread out in the
> > memcpy function.
> 
> Not really.  The MIPS32 manual (for example):
> 
>  "PREF does not cause addressing-related exceptions. If it does happen
>   to raise an exception condition, the exception condition is
>   ignored. If an addressing-related exception condition is raised and
>   ignored, no data movement occurs."
>   
>   PREF never generates a memory operation for a location with an
>   uncached memory access type."
> 
> For a Linux user program, at least, memory pages are "memory-like":
> reads are guaranteed to be side-effect free, so any outlying
> prefetches are harmless.  It's hard to see any circumstance where an
> accessible cacheable location would lead to bad side-effects on read.
> 
> -- 
> Dominic Sweetman, 
> MIPS Technologies (UK) - formerly Algorithmics
> The Fruit Farm, Ely Road, Chittering, CAMBS CB5 9PH, ENGLAND
> phone: +44 1223 706200 / fax: +44 1223 706250 / direct: +44 1223 706205
> http://www.algor.co.uk
