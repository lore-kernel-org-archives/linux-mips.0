Message-ID: <00c901c0e631$4bcebd80$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010525130531.17652A-100000@delta.ds2.pg.gda.pl> <011801c0e55f$e4d39820$0deca8c0@Ulysses> <20010525144937.A28370@nevyn.them.org>
Subject: Re: [PATCH] incorrect asm constraints for ll/sc constructs
Date: Sun, 27 May 2001 00:14:43 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Daniel Jacobowitz <dan@debian.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010526221443.g5KTuNHQNWoXmCEM1Jr2NDKG4D6YlB-wYhSuHT_UwQU@z>

> On Fri, May 25, 2001 at 11:15:48PM +0200, Kevin D. Kissell wrote:
> > >  The following program cannot be compiled with gcc 2.95.3, because the
> > > offset is out of range (I consider it a bug in gcc -- it should
allocate
> > > and load a temporary register itself and pass it appropriately as %0,
> >
> > I think gcc can be forgiven for not allocating a temporary,
> > given the ".set noat"...
>
> Except, of course, gcc doesn't even know the set noat is there.  It
> doesn't parse the interior of asm() statements.

Fair enough.  It was an offhand remark.  But seriously, what does
the "R" constraint mean here?  The only documentation I've got
(http://linux.fh-heilbronn.de/doku/GNU/docs/gcc/gcc_163.html#SEC163)
says that "Q" through "U" are reserved for use with EXTRA_CONSTRAINT
in machine-dependent definitions of arbitrary operand types.  When
and where does it get bound for MIPS gcc, and what is it supposed
to mean?  If I compile this kind of fragment using a "m" constraint,
it seems to do the right thing, at least on my archaic native compiler.

            Kevin K.
