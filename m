Message-ID: <007001c06670$7345d2e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A379CBC.ED1D9F@mips.com> <20001214215933.C28871@bacchus.dhis.org> <3A39CC1F.8FE7B2FE@mips.com>
Subject: Re: 64 bit build fails
Date: Fri, 15 Dec 2000 09:24:22 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Carsten Langgaard <carstenl@mips.com>, Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20001215082422.LBwzUAPcM8NsOUB57-b8TKcOipgylFBFgATlZkVcCJM@z>

> > Looks like an attempt to build a 64-bit Indy kernel.  Various people
working
> > on the Origin support have completly broken the support for anything
else in
> > their battle tank-style approach ...
>
> Ok, that explains why a lot of things are broken.
> So who will be responsible for fixing all the broken pieces ?

In the absence of the SGI people being directed to do a
clean job, I suppose the problem falls to those who have
an interest in a clean and portable 64-bit MIPS kernel.
That would include MIPS, of course.  But what about the
rest of you - could we see a show of virtual hands?  I
know that TI has both 4K and 5K licenses, and may
want to be able to exploit the 64-bit capability of the 5K
under Linux.  And the guys doing the Vr41xx ports may
also be interested.  Anyone else?  Those of you with
R4K-based DECstations, perhaps?  Software shops
looking to support high-end embedded MIPS in set-tops?

Another aspect of this is that, in the newer MIPS
designs that conform to the MIPS64 architecture spec,
it is finally possible to cleanly seperate the use of
64-bit data types from the use of 64-bit virtual addresses.
The processors in the SGI platforms do not have this
capability, and it would be a lot to ask of the people
doing 64-bit Linux for Origin etc. to treat the addressing
and data aspects orthogonally.  I haven't checked the
code, but I would imagine that we will have to go in
and redo things from that perspective as well.

            Regards,

            Kevin K.
