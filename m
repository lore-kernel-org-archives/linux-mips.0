Message-ID: <01e501c0879f$e56623c0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A6F8F66.6258801@mvista.com> <0101241833281Q.00834@plugh.sibyte.com> <3A6F9814.3E39027@mvista.com> <0101241917341S.00834@plugh.sibyte.com> <3A703E3C.360FB4FF@ridgerun.com> <3A706A22.6B760617@mvista.com> <010601c08780$d0b8a7a0$0deca8c0@Ulysses> <3A717518.B1CAFEDC@ridgerun.com>
Subject: Re: floating point on Nevada cpu
Date: Fri, 26 Jan 2001 14:57:08 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Steve Johnson <stevej@ridgerun.com>
Cc: Pete Popov <ppopov@mvista.com>, linux-mips@oss.sgi.com
Message-ID: <20010126135708.eMoP-P0xpKGeyDz2r7TDUJ3kD-gC5vfY_J-NJCEvOlg@z>

> "Kevin D. Kissell" wrote:
>
> > I had essentially the same problem at MIPS a year or two ago,
> > and I could have *sworn* that my fix, which ORed ST0_FR into
> > the initial Status register value set in the startup assembly code,
> > had made it into the standard distributions.  It's at about line 530
> > of head.S, where a term is added to make the instruction
> >
> > li t1,~(ST0_CU1|ST0_CU2|ST0_CU3|ST0_KX|ST0_SX|ST0_FR)
> >
> > I spent days thinking it was a mipsel library problem,
> > because it only turned up when I tried exercising a
> > little-endian version of the same kernel that worked
> > sell big-endian on the Indy.  But of course it was all
> > due to the mipsel system having a boot-prom that
> > cleverly enabled all the FP registers for me...
> >
> >             Kevin K.
>
> Kevin,
>
>     Your/Flo's/Ralf's thread in the MIPS Linux archives from last January
was
> what clued me into the ST0_FR setting in the first place.  Ralf gave
arguments
> why he wouldn't take your change at that time, which is why that line
isn't in
> the 2.4.x kernel.

Yeah, and I still think they are piss-poor arguments.  ;-)

I still do not see much virtue in saying that one has a binary
kernel that supports either FR=0 or FR=1, *provided*
that the entire userland from init inward is built with the same
"polarity" *and* that the boot monitor is  guaranteed to have
set FR the right way before launching the kernel.  FR=0 (o32)
and FR=1 (n32, n64) binaries should be distinguishable at
exec() time, and the FR bit set appropriately at
that time.  Making assumptions  about what the bootloader
or bootprom has done is just plain foolish, IMHO.

            Kevin K.
