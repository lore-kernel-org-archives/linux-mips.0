Date: Fri, 15 Feb 2002 11:56:59 GMT
Message-ID: <200202151156.LAA17485@mudchute.algor.co.uk>
From: Dominic Sweetman <dom@algor.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Re: [patch] linux 2.4.17: The second mb() rework (final)
In-Reply-To: <006e01c1b606$27b1b060$0deca8c0@Ulysses>
References: <Pine.GSO.3.96.1020212123901.17858B-100000@delta.ds2.pg.gda.pl>
	<010601c1b3bd$1da618e0$0deca8c0@Ulysses>
	<20020213.102805.74755945.nemoto@toshiba-tops.co.jp>
	<20020215.123124.70226832.nemoto@toshiba-tops.co.jp>
	<006e01c1b606$27b1b060$0deca8c0@Ulysses>
Sender: owner-linux-mips@oss.sgi.com
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>, macro@ds2.pg.gda.pl, mdharm@momenco.com, ralf@uni-koblenz.de, linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20020215115659.Bl87RrtCl6vSkE1Ki2BDmNm6gI5u1NGMTT5izlnzc90@z>


Kevin D. Kissell (kevink@mips.com) writes:

> > Note that SYNC on TX39/H and TX39/H2 does not flush a write buffer.
> > Some operation (for example, bc0f loop) are required to flush a write
> > buffer.
> 
> That is, I would say, a bug in the TX39 implementation of SYNC.

That's only a problem if the CPU permitted reads to overtake buffered
writes.  [Early R3000 write buffers did that (with an address check to
avoid the disaster of allowing a read to overtake a write to the same
location).]

But my recollection is that the TX39 does all memory operations in
order: so SYNC has very little to do, but it isn't a bug.

Dominic Sweetman
Algorithmics
