Message-ID: <005901c0e77c$dae9f2e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010528131446.15200C-100000@delta.ds2.pg.gda.pl>
Subject: Re: [PATCH] incorrect asm constraints for ll/sc constructs
Date: Mon, 28 May 2001 15:48:09 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Daniel Jacobowitz <dan@debian.org>, linux-mips@oss.sgi.com
Message-ID: <20010528134809.AU7apetUAg2cm-xr4hv-sXn7lI7f9F6gkQkNjn-HYzE@z>

> > says that "Q" through "U" are reserved for use with EXTRA_CONSTRAINT
> > in machine-dependent definitions of arbitrary operand types.  When
> > and where does it get bound for MIPS gcc, and what is it supposed
> > to mean?  If I compile this kind of fragment using a "m" constraint,
> > it seems to do the right thing, at least on my archaic native compiler.
>
>  Is it gcc generating right code or gas expanding a macro?  Try `gcc -S'
> -- for me "m" generates "lw $0,262144($2)", which is unacceptable when
> ".set noat" is in effect (and perfectly fine otherwise).

I'd been disassembling the resulting .o files, as I didn't care whether
it's the compiler or the assembler that ultimately makes things right.
Repeating your experiment using -S gives the following results:

egcs-2.90.29 (native) and
egcs-2.91.66 (x86 cross) : Optimiser produces "impossible" load
                                              offset you describe if "m"  or
"o" constraint,
                                              compiler barfs if "R"
constraint.

gcc 2.96-mips3264-000710 from Algorithmics (x86 cross):
                                              Compiler generates "correct"
code
                                              (Address is calculated with an
explicit
                                               add prior to the asm
expansion) for
                                               any of the three constraints.

However, if one compiles all the way to object code and looks
at what the assembler is actually doing with those "impossible"
offsets under gcc 2.90 and 2.91, technically, it's not violating ".noat"
in the "m" and "o" constraint  cases.   It is *not* using the "at" register.
It is, however, cleverly using the load destination  register as a temporary
to calculate  the correct address.  As there are no memory operations,
these instructions should have no effect  on the correct execution
of the ll/sc sequence  (though they will  increase the statistical
probability
of a context  switch between ll and sc).

            Regards,

            Kevin K.
