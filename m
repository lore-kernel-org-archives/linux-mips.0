Message-ID: <007301c1129d$cdf908e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20010722123526.K16278@rembrandt.csv.ica.uni-stuttgart.de>
Subject: Re: mips64 linker bug?
Date: Sun, 22 Jul 2001 13:02:21 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com, Thiemo Seufer <ica2_ts@csv.ica.uni-stuttgart.de>
Message-ID: <20010722110221.X250-9y6_IR1LNjzeeLX2ZEmdaPrwXLWJvnvDc2m7mI@z>

> > > > Thanks...What should I do now? Change my code to mips32 or are there
some
> > > > patches to binutils that I can use, to get it working?
> > >
> > > Depends on what you want to do?
> >
> > I'm working on a very small, single address space, microkernel and I
have
> > the MIPS Malta with a 5Kc CPU to develop it on. The 5Kc is compatible
> > with mips32 but I must admit, I really like to have my kernel
> > running 64bit :).
>
> An Kernel with 64bit addresses is less compact and likely to run slower.
> OTOH, a 64bit Kernel has certainly some hack value. :-)

Note that the 5Kc is one of the new generation of MIPS64 parts
that can enable 64-bit integer and floating point instructions without
requiring that 64-bit addressing also be enabled in the kernel.
Making Linux kernel support for this capability available is
one of the things that we're working on.  But it's not there yet.

            Kevin K.
