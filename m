Message-ID: <011501c0e3e3$007c4780$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010523212941.16787A-100000@delta.ds2.pg.gda.pl>
Subject: Re: MIPS_ATOMIC_SET again (Re: newest kernel
Date: Thu, 24 May 2001 01:49:17 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Joe deBlaquiere <jadb@redhat.com>, linux-mips@oss.sgi.com
Message-ID: <20010523234917.l4aWX6NVtPoS4501y9reL5sZPIjCQOnzTpWCU-YKeKY@z>

> > parts, the latter is more efficient for contemporary parts.  Those
> > of us who work on recent and future designs will always tend
> > to favor the latter - what's the point of using MIPS32/MIPS64
> > and beyond CPUs if gnu/Linux binaries are going to treat them
> > like R3000s?
> 
>  If you work on new processors only, then there is no problem.  You
> configure your tools to build binaries for systems you use and you'll
> never see R3k compatibility code.
> 
>  Please do yourself a favor and look at the relevant part of glibc.  If
> you build glibc (and any other other program that makes use of
> _test_and_set()) for ISA II+, the code gets actually inlined with ll/sc
> used as expected.
> 
>  So the problem is?

The problem is that, out in industry, not everyone wants to
build their entire userland from source, and nobody particularly 
wants to deal with  the product management problems of making, 
maintaining,  testing, and distributing all the permutations of BE/LE, 
FP/noFP, LLSC/noLLSC, etc, etc.

            Kevin K.
