Message-ID: <00d001c0e792$d48b14e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010528173758.15200K-100000@delta.ds2.pg.gda.pl>
Subject: Re: MIPS_ATOMIC_SET again (Re: newest kernel
Date: Mon, 28 May 2001 18:25:28 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010528162528.XcCrRvnXl9G89S7yu8XQPxPm3DUjWwGO9vWP8a9q1q4@z>

> > Export the existance of ll/sc via /proc/cpuinfo or whatever.
>
>  That's a valid approach and also nothing new to glibc -- see Alpha and
> in()/out() support.  But do we want an extra overhead due to an indirect
> call?  Especially as _test_and_set() gets usually inlined?

Use a global variable testable by the inline code?

> > I dont think this is true necessarly - There are still people building
> > embedded x86 systems based on 386 cores. Look at the vr41xx systems -
They
> > do also lack the ll/sc afaik. This is nowadays the most commonly
> > used embedded/pda cpu.
>
>  Are vr41xx plain ISA I or crippled ISA II+ CPUs?

Actually, they are crippled MIPS III+ 64-bit CPUs
(with added stuff like16x16 bit MAC instructions!).

            Kevin K.
