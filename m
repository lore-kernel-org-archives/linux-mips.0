Message-ID: <001901c3f9dc$3a46b6a0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Law10-F39hgbi1Kigvf000046ac@hotmail.com> <1077477186.3636.34.camel@dzur.sfbay.redhat.com> <001001c3f98e$2270dcc0$10eca8c0@grendel> <1077507447.3636.37.camel@dzur.sfbay.redhat.com>
Subject: Re: r3000 instruction set
Date: Mon, 23 Feb 2004 08:11:14 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Eric Christopher <echristo@redhat.com>
Cc: Mark and Janice Juszczec <juszczec@hotmail.com>, linux-mips@linux-mips.org
Message-ID: <20040223071114.Et_qSiv5rgZ0SFGXjPllL0mHo-q3xZ-I5aV1wQgsSbA@z>

> On Sun, 2004-02-22 at 13:52, Kevin D. Kissell wrote:
> > > Other than the responses you've already gotten, likely you'll need to
> > > compile with -march=r3900(or -mcpu=r3900 if it's an old toolchain) since
> > > the 3900 is missing a couple of r3000 instructions iirc.
> > 
> > The 3900 family should run MIPS I code compiled for the R3000.
> 
> IIRC there were some standard MIPS I instructions that were not on the
> tx39.

I think you may be confusing MIPS I and MIPS II.  I'm pretty darn certain
that the TX39 inplemented all of MIPS I, most of MIPS II, plus a MADD 
extension.  I'm not going to go instruction counting this morning, but the
TX39 spec declares up-front that it's a superset of the R3000A.
