Message-ID: <001101c0e464$72c130e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010524113444.6990B-100000@delta.ds2.pg.gda.pl>
Subject: Re: MIPS_ATOMIC_SET again (Re: newest kernel
Date: Thu, 24 May 2001 17:15:53 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Joe deBlaquiere <jadb@redhat.com>, linux-mips@oss.sgi.com
Message-ID: <20010524151553.G3oVV-h1n0Ebvo1BeODqgYpW3OjUaohCf2PXWago-rQ@z>

> > The problem is that, out in industry, not everyone wants to
> > build their entire userland from source, and nobody particularly 
> > wants to deal with  the product management problems of making, 
> > maintaining,  testing, and distributing all the permutations of BE/LE, 
> > FP/noFP, LLSC/noLLSC, etc, etc.
> 
>  First, we are talking about glibc and not the entire userland.

But since essentially the entire userland is linked with glibc,
I'm not sure how much that distinction matters, in practical
terms.

> I insist on having the performance-wise implementation in glibc.

Joe and I likewise insist on having a high-performance
implementation of glibc as the default.  The question is
whether it's to be one optimised for performance on R3000's
or on contemporary parts.  As has been stated by others,
of *course* one wants to be able to build it either way.
I'm simply saying that if one just does "./configure"
and "make" for glibc with a mips target, it should default
to use ll/sc, and that if one simply builds RPMs for binary
distribution of MIPS/Linux binaries, they should be linked
with a glibc that uses ll/sc.  And that therefore the MIPS/Linux
kernel for R3000's (and R4100's) should have ll/sc emulation 
support built in by default.

>  Second, do you expect everyone compiling the entire userland from
> sources?  I don't.  The normal approach is to take a distribution and
> build only these pieces which are not satisfying for one reason or
> another.  Just take an ISA I, ISA II or whatever version you need.

From where?  I'd love to find a decently complete (with compilers,
networking tools, X, etc.) mipsel distribution of any MIPS ISA level 
less that MIPS V to replace the antique crud that runs on my mipsel 
platform.

>  Fourth, maintaining differently optimized distributions is not that
> troublesome.

Please don't get me wrong here, because I tremendously
respect the work that you've been doing for MIPS/Linux,
but how many differently optimised distributions do you
presonally build, distribute, support, and maintain?

            Regards,

            Kevin K.
