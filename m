Message-ID: <01c901bffcb0$922057a0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: PROPOSAL : multi-way cache support in Linux/MIPS
Date: Wed, 2 Aug 2000 20:36:17 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Dominic Sweetman <dom@algor.co.uk>, Jun Sun <jsun@mvista.com>
Cc: linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr, ralf@oss.sgi.com
Message-ID: <20000802183617.fd654oBDACf07VnDogASEoeqW72QDIZ3uleKccqI97E@z>

Dom Sweetman writes:
>So far as I know the Vr5432 is the only CPU to do anything so silly as
>using the lowest index bits to select the "way". 

Alas, the R10000 does the same silly thing, and while you
and I might not consider such a venerable processor interesting
for new embedded MIPS/Linux designs, our friends who
are trying to replace IRIX with Linux on their SGI boxes
are going to have to deal with them for a little while longer.

>The MS-selects-way organisation permits the cache to be initialised
>without the software ever needing to know how many ways it has (just
>crank the index up, but being careful about the tendency to recycle
>the same way when pre-filling cache data).

Which is why MIPS belatedly documented it as the "correct"
way to design a multiway cache...

>Cache maintenance should always use "hit" type instructions, and you
>don't need to know the cache organisation for those, even with the
>Vr5432.

The counterargument to *always* using "hit" ops is that they
generate TLB traffic and TLB refills, which some people
find annoying to allow for and in any case time consuming.


            Regards,

            Kevin K.
