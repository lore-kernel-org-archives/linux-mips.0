Message-ID: <000901c0e8d4$4525f480$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010528172454.15200I-100000@delta.ds2.pg.gda.pl> <3B142367.791F28AF@mvista.com>
Subject: Re: Surprise! (Re: MIPS_ATOMIC_SET again (Re: newest kernel
Date: Wed, 30 May 2001 08:46:25 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010530064625.3faMbILHMBuMyjGAd-imo7nfcpY9lQ1mir4jrERcRx8@z>

> > > So apparently MIPS_ATOMIC_SET was invented for Linux only, probably
just to
> > > implement _test_and_set().  (It would be interesting to see how IRIX
implement
> > > _test_and_set() on MIPS I machines.  However, the machine I have
access uses
> > > ll/sc instructions).
> >
> >  Does IRIX actually run on anything below ISA II?
> >
>
> I assume nobody answering the above questions means nobody
> really care.  So we can safely move ahead without worrying about
> them. :-)

I was waiting for someone to give a more authoritative
answer, but IIRC from my days at SGI, IRIX did of course
run on the R3000-based products, but support for them
was dropped in IRIX 6.x.  I couldn't give you the version
number of the last IRIX version that did support the R3K,
though.

And as others have observed, it was in any case
not IRIX, but MIPS' own RiscOS that drove the ABI.

            Keivn K.
