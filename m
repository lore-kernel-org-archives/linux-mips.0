Message-ID: <01cd01c045c7$9f49db80$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A0067C5.BA9E3174@mvista.com> <20001102040657.A17786@bacchus.dhis.org> <007d01c04585$25262e40$0deca8c0@Ulysses> <3A02FC13.338F4CF6@mvista.com>
Subject: Re: "Setting flush to zero for ..." - what is the warning?
Date: Fri, 3 Nov 2000 19:55:13 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Jun Sun <jsun@mvista.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20001103185513.ABze5T3NPNqPYrAHtszhwnrpGZHHfURKsYIvGBt8Mic@z>

> "Kevin D. Kissell" wrote:
> >
> > > On Wed, Nov 01, 2000 at 10:58:13AM -0800, Jun Sun wrote:
> > >
> > > > I ran some stress tests and start to get this warning.  It appears
to be
> > > > generated in do_fpe() routine.  See below.  I wonder why this is
> > > > happening.  Can someone explain what is going on?  Thanks.
> > >
> > > It tells you the over-the-thumb-fp-mode has been activated ;-)
> >
> > More seriously, there was (is, in 2.4 I guess) a hack by which,
> > in a desperate attempt to avoid having to do the FP emulation
> > in software, the kernel changed the FPU denorm handling mode
> > and replayed the instruction, in hopes that the problem would
> > go away (which it would for a subset of the unimplemented
> > operation cases). This is not legal IEEE behaviour, as it turns out,
> > but not many people cared.
> >
>
> I am reading between the lines.  Do you mean
>
> 1) even though the CPU (R5432 in this case) has a FPU, some instructions
> (or under certain conditions) are NOT supported by the hardware?

That is correct.  See (3) below.

> 2) So in those cases, software should do the job, but the existing 2.4
> is not doing it right?

That is sort-of correct.  The mini-emulator in the existing distribution
will handle a subset of the common cases correctly.  The flush-to-zero
trick avoids another subset, though not stricktly speaking correctly.

> 3) Can we summarize exactly what instructions (under what conditions)
> are considered not supported by hardware?  Or is it too complicated to
> summarieze in short?  Or should it be documented in CPU manual (which
> may vary for different CPUs)

Architecturally, a MIPS FPU is always allowed to deliver an
Unimplemented Operation instruction if the combination of
instruction and operand values goes beyond what it can deal
with.  In theory, that means that it would be legal to simply not
implement certain difficult instructions altogether (I have no
examples of this) or to implement single-precision but not
double-precision operands (this, I believe, has been done).
But even in full-blown implementations like the R4000/4400
or R5000 or R5432, there are often corner cases that the
designers considered too expensive to handle in hardware.
In general, these fall into two categories: conversion operations
on extreme values that exceed the size of the shifter in the
FPU, and operations on denormalized values - according
to the IEEE standard, 2.0 denorm + 2.0 denorm = 4.0 denorm,
but it's a rare RISC FPU that will really perform that computation.
Setting flush-denormals-to-zero can thus avoid these exceptions,
but won't provide the values stipulated by the IEEE spec, either.

> > > Somebody at MIPS is working on merging the necessary fp support
software
> > > into the kernel, so this problem should be solved soon.
> >
> > Once we had bolted the Algorithmics FPU emulator into the kernel,
> > the hack was no longer necessary.   To say that "somebody at MIPS
> > is working on merging the necessary fp support software into the
> > kernel" is perhaps a bit misleading.  The FPU emulator itself is in
> > the oss.sgi.com repository, in the 2_2 branch, but I did not merge
> > in the hacks to the kernel exception, context, signal, etc. handling.
> > And there are several bug fixes that have been made since then.
> > All the additional code is available on the ftp.mips.com server, and
> > has been merged by others into 2.3/2.4, most notably by the VrLinux
> > guys.
> >
>
> If I understand correctly, FPU emulator is for the case where FPU is
> completely absent.  Does it do the job we are talking about here?

We integrated the Algorithmics FPU emulator because there
are embedded MIPS chips out there (the MIPS 4Kc/m/p and 5K,
the NEC Vr41xx, the Toshiba Tx49) that have no FPUs and really
need the full emulation.  But while it may seem like overkill, having the
full emulator does cover the unimplemented corner cases very
nicely.  With a couple of fixes elsewhere (the kernel branch emulation
had/has a signed/unsigned bug), we finally have MIPS/Linux platforms
that pass the "paranoia" IEEE FP compliance test 100%, with and
without FPUs.

            Regards,

            Kevin K.
