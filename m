Message-ID: <00ec01c0e3b5$00ab83c0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010523152429.5196A-100000@delta.ds2.pg.gda.pl> <3B0BF7F8.3050306@redhat.com>
Subject: Re: MIPS_ATOMIC_SET again (Re: newest kernel
Date: Wed, 23 May 2001 20:20:00 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Joe deBlaquiere <jadb@redhat.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010523182000.YHlxh4yUPAhCQ8_1WV5UAi3YDsmUGK-3IOAmfCG-Q14@z>

> There's no way to solve the endianness issues, but using emulation to
> handle missing instructions (be they floating point or ll/sc, or
> what-have-you) solves the minor differences in the instruction set from
> the library/application standpoint. If all MIPS processors used the same
> instruction set then we wouldn't have the problem at all. Of course
> there are very good reasons (and probably some silly ones too...) why
> ISAs are tailored.
>
> The kernel is already going to have to adjust some anyway, so keeping the
> differences in the kernel doesn't increase the testing burden. Throwing
> the problem over to glibc (and the toolchain) does increase the number
> of active configurations.

And for the sake of beating a dead horse that perhaps only
I can see, there is a philosophical choice that must sometimes
be made whether to achieve binary portability by compiling to
the lowest-common denominator, or by emulating the missing
operations in the OS.  The former is more efficient for downrev
parts, the latter is more efficient for contemporary parts.  Those
of us who work on recent and future designs will always tend
to favor the latter - what's the point of using MIPS32/MIPS64
and beyond CPUs if gnu/Linux binaries are going to treat them
like R3000s?

            Kevin K.
