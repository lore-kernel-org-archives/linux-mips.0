Date: Wed, 29 Oct 2003 18:11:03 +0100 (CET)
From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Subject: Re: LK201 keyboard
In-Reply-To: <20031023083736.GL20846@lug-owl.de>
Message-ID: <Pine.LNX.4.32.0310291804500.20758-100000@jurand.ds.pg.gda.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <macro@ds2.pg.gda.pl>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-mips@linux-mips.org
Message-ID: <20031029171103.tJildU13YdzrhfczzpISqAjf8cbYbF4BtPkcbxKr2Cw@z>

On Thu, 23 Oct 2003, Jan-Benedict Glaw wrote:

> > > Erm, is this even correct if this keyboard isn't used "natively" by X11,
> > > but through the Input API?
> >
> >  For the console (or the cooked mode) we already set up the device
> > correctly.
>
> That doesn't exactly answer my question, but I think I'll figure it out
> at some time:) At least, if I get XFree through the compiler at some
> time (on a VAX).

 I've just misunderstood the question -- sorry.  For XFree86 the current
state is the "native" support doesn't work as of 3.3.6 (that's what I
have) because of broken mappings both in the kernel and in XFree86 and
that version doesn't support the input API AFAIK.  I'm told the "native"
support doesn't work for newer versions of XFree86, either, and I haven't
seen any reports about the input API.

-- 
+  Maciej W. Rozycki, Technical University of Gdansk, Poland   +
+--------------------------------------------------------------+
+        e-mail: macro@ds2.pg.gda.pl, PGP key available        +
