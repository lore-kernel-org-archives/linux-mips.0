Message-ID: <003901c091bd$33686520$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010208110748.29177A-100000@delta.ds2.pg.gda.pl>
Subject: Re: NON FPU cpus - way to go
Date: Thu, 8 Feb 2001 11:52:01 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Jun Sun <jsun@mvista.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Florian Lohoff <flo@rfc822.org>, linux-mips@oss.sgi.com, ralf@oss.sgi.com
Message-ID: <20010208105201.ZAUARD8BeVVeBqLgBw2ggOE3i8n-h09LSsCRy1wmK0U@z>

> On Wed, 7 Feb 2001, Jun Sun wrote:
>
> > I favor the libc approach as it is faster.
>
>  No difference in speed, actually.  In both cases you switch to the kernel
> mode when an FPU-related exception happens and then back to the user mode,
> either after or before invoking the handler.  The libc approach has the
> advantage of running unprivileged.

Do you have some numbers to support this?  A proper library
implementation does *not* trap to the kernel on each FPU
instruction, and as such is considerably faster (and considerably
larger - a factor for embedded apps!) than a kernel emulation.
The Algorithmics emulator does have the virtue of being smart
enough to check if there is a sequence of consecutive FP
instructions, and to emulate the whole sequence without
returning to user mode, but such "runs" are not all that
common in real code - there are almost always loads,
stores, and address computations interspersed, because
the compiler is "clever" about hiding FP latencies!

> > Unfortunately I don't think glibc for MIPS can be configured with
> > --without-fp.  I modified a patch to get glibc 2.0.6 working for no-fp
config,
> > but it is not a clean one.  Is anybody working on that for the latest
glibc
> > 2.2?
>
>  You never want to configure glibc with the --without-fp option.

That's certainly what we had to do for OpenBSD without FP
emulation!  What is the alternative?

> > Ironically for MIPS you MUST have the FPU emulater when the CPU actually
has a
> > FPU. :-)
>
>  The same for Alpha.  You don't need a full emulator anyway -- most of it
> can be left out for FPU-equipped systems.

That may be true for Alpha, but not for MIPS.  The only
instructions that can *never* generate an unimplented
operation trap on a denormalized operand are the
loads, stores, and moves.  That's why we didn't bother
breaking up the Algorithmics emulator into with-FPU
and without-FPU modules - there was surprisingly little
that could really be left out.

            Regards,

            Kevin K.
