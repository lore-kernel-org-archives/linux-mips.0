Message-ID: <00e001c26ba2$c7e6c960$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3D9D484B.4C149BD8@mips.com> <200210041153.MAA12052@mudchute.algor.co.uk>
Subject: Re: Promblem with PREF (prefetching) in memcpy
Date: Fri, 4 Oct 2002 14:37:16 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Dominic Sweetman <dom@algor.co.uk>, Carsten Langgaard <carstenl@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20021004123716.cf5l3G0unLs-d8nDzjnzKy-HlmbDt5r6Efw6PC381YQ@z>

From: "Dominic Sweetman" <dom@algor.co.uk>
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

In case Carsten's reply wasn't clear enough, there is a loophole
in the spec:  kseg0.  There is no TLB access to cause a TLB
exception (which would suppress the operation and be nullifed),
If the prefetch address is correctly aligned, so that there is no
address exception.  In typical use, kseg0 is cacheable, which
means that the second paragraph you quote does not apply.
A prefetch to a well-formed, cacheable kseg0 address which 
has no primary storage behind it (e.g. 0x04000000 on a system
with 64M of physical memory) should, according to the spec,
cause a cache fill to be initiated for the line at that address,
which will result in a bus error, if not a flat-out system hang.

            Regards,

            Kevin K.
