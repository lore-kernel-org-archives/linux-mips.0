Message-ID: <001e01c0e8d6$7b73b5c0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20010523145257.A13013@nevyn.them.org> <Pine.GSO.3.96.1010524134521.6990F-100000@delta.ds2.pg.gda.pl> <20010525172746.B6578@bacchus.dhis.org> <20010525134909.A26065@nevyn.them.org> <20010529171748.A7362@nevyn.them.org>
Subject: Re: [PATCH] incorrect asm constraints for ll/sc constructs
Date: Wed, 30 May 2001 09:02:15 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Daniel Jacobowitz <dan@debian.org>, Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010530070215.D-u-11-21tpGPp4CHUtNPJfryYVnONCO8uutC5jv_Qw@z>

> > > > > The ll/sc constructs in the kernel use ".set noat" to inhibit use
of $at,
> > > > > and proceed to use it themselves.  This is fine, except for one
problem: the
> > > > > constraints on memory operands are "o" and "=o", which means
offsettable
> > > > > memory references.  If I'm not mistaken, the assembler will
(always?)
> > > > > turn these into uses of $at if the offset is not 0 - at least, it
certainly
> > > > > seems to do that here (gcc 2.95.3, binutils 2.10.91.0.2).  Just
being honest
> > > > > with the compiler and asking for a real memory reference does the
trick.
> > > >
> > > >  Both "m" and "o" seem to be incorrect here as both are the same for
MIPS;
> > > > "R" seems to be appropriate, OTOH.  Still gcc 2.95.3 doesn't handle
"R"
> > > > fine for all cases, but it works most of the time and emits a
warning
> > > > otherwise.  I can't comment on 3.0.
>
> Back to quibbling - that's just not true.  For one thing, from the info
> documentation:
>     `R'
>           Memory reference that can be loaded with one instruction (`m'
>           is preferable for `asm' statements)
>
> For another, using the patch I posted below, I get inconsistent
> constraint errors.  I'm not entirely sure why.  Is there any reason not
> to use the "m" version?  I can't see any case in which it would not
> behave correctly.

There seems to be a bug in many older gcc's, where if you use
"m" or "o", and the effective address requires more than 16 bits
of offset relative to an available base register, store address
calculations override the "noat" setting.  Load address calculations
are at least smart enough to use the load destination as the
temporary register.  Of the compilers that I was able to test,
"R" constraint worked only on the most recent gcc version.
And with that compiler, "m" also generated correct code.
The "m" constraint also worked on earlier gcc's,  but
violated the noat constraint on stores.  The compilers where
"m" violated noat were also those where the "R" constraint
was rejected as being inconsistent.  None of the compilers tested
generated correct code for "R" but incorrect code for "m".

So it could be argued that "m" constraints will in fact
function with a broader range of compilers, albeit with
the quirk that a "noat" override warning may be produced
in the case of older gcc's.

            Kevin K.
