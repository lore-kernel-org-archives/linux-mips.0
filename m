Message-ID: <010601c08780$d0b8a7a0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A6F8F66.6258801@mvista.com> <0101241833281Q.00834@plugh.sibyte.com> <3A6F9814.3E39027@mvista.com> <0101241917341S.00834@plugh.sibyte.com> <3A703E3C.360FB4FF@ridgerun.com> <3A706A22.6B760617@mvista.com>
Subject: Re: floating point on Nevada cpu
Date: Fri, 26 Jan 2001 11:14:38 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Pete Popov <ppopov@mvista.com>, Steve Johnson <stevej@ridgerun.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010126101438.X3D1YCkdgGKTYFpFeCaSi9lXgrfusokzqOEdLQo_7_M@z>

> >     We had a problem in user-space apps all showing 0 for floating-point
> > results because we hadn't set the ST0_FR bit to 0, and we had a
mis-match
> > between user libraries (MIPS3k-compatible) and the floating point
registers.
> > We noticed the problem when we couldn't run "ps" or "rm" correctly and
tracked
> > it down from some old postings by Ralf and friends.  Maybe this is your
> > problem, too?
> >
> >     I added this to our setup call:
> >
> >     set_cp0_status(ST0_FR, 0);
>
> Problem solved before I finished my first cup of coffee. Thanks!
>
> I bet this problem will show up here and there depending on how the boot
> code sets cp0.  Seems like adding the above line in a mips generic init
> routine would be a good thing.

I had essentially the same problem at MIPS a year or two ago,
and I could have *sworn* that my fix, which ORed ST0_FR into
the initial Status register value set in the startup assembly code,
had made it into the standard distributions.  It's at about line 530
of head.S, where a term is added to make the instruction

li t1,~(ST0_CU1|ST0_CU2|ST0_CU3|ST0_KX|ST0_SX|ST0_FR)

I spent days thinking it was a mipsel library problem,
because it only turned up when I tried exercising a
little-endian version of the same kernel that worked
sell big-endian on the Indy.  But of course it was all
due to the mipsel system having a boot-prom that
cleverly enabled all the FP registers for me...

            Kevin K.
