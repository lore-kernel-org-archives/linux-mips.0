Message-ID: <011e01c02f22$10017b60$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <39CF9DFC.F30B302B@mvista.com> <200009252116.WAA01137@gladsmuir.algor.co.uk> <39CFC567.DD66BC56@mvista.com> <000d01c02782$32d31560$0deca8c0@Ulysses> <39D0E51C.79A0BE50@mvista.com> <20001005141354.E30075@bacchus.dhis.org> <39DD26CC.3805FFE8@mvista.com> <00d101c02f04$3a6d7340$0deca8c0@Ulysses> <39DD55E9.AFCACB0E@mvista.com> <011801c02f19$1283f6a0$0deca8c0@Ulysses> <39DD68DE.E9B26A3D@mvista.com>
Subject: Re: load_unaligned() and "uld" instruction
Date: Fri, 6 Oct 2000 01:14:40 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Jun Sun <jsun@mvista.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20001005231440.Hf6Q8w2K_G6emk16b-_MJb0cc5Npda4nogviRs-wNNU@z>

> > > Why will it crash 32-bit CPUs?  On my R5432 CPU, the lwl/lwr sequence
> > > executes just fine.
> > >
> > > Or do you mean it will crash SOME 32-bit CPUs?  Do those 32-bit CPUs
> > > support lwl or lwr?  If they don't, they should generate a reserved
> > > instruction exception.  If they do, I don't see any problem.
> > 
> > Please re-read my previous message.  I wasn't talking about the
> > MIPS I lwl/lwr sequence for loading an unaligned 32-bit word, I was
> > talking about the MIPS III ldl/ldr sequence for loading an unaligned
> > 64-bit doubleword.
> > 
> >             Kevin K.
> 
> Ahh, my bad.  
> 
> Although the usb does use get_unaligned(u64) (ldl/ldr), it actually does
> not run into it - at least in my test so far.  That probably explains
> why my fix runs on the R5432 CPU so far.

The 5432 may have a 32-bit external bus, but it's still (as far
as I know) a 64-bit part internally, so as long as you're executing
in kernel mode, the ldl/ldr's should work as designed.

            Kevin K.
