Message-ID: <007d01c04585$25262e40$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A0067C5.BA9E3174@mvista.com> <20001102040657.A17786@bacchus.dhis.org>
Subject: Re: "Setting flush to zero for ..." - what is the warning?
Date: Fri, 3 Nov 2000 11:58:56 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>, Jun Sun <jsun@mvista.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20001103105856.d0RazeD1HPoAfDNL4EBhrqBhBaHiP7HQzI6q706CqVw@z>

> On Wed, Nov 01, 2000 at 10:58:13AM -0800, Jun Sun wrote:
>
> > I ran some stress tests and start to get this warning.  It appears to be
> > generated in do_fpe() routine.  See below.  I wonder why this is
> > happening.  Can someone explain what is going on?  Thanks.
>
> It tells you the over-the-thumb-fp-mode has been activated ;-)

More seriously, there was (is, in 2.4 I guess) a hack by which,
in a desperate attempt to avoid having to do the FP emulation
in software, the kernel changed the FPU denorm handling mode
and replayed the instruction, in hopes that the problem would
go away (which it would for a subset of the unimplemented
operation cases). This is not legal IEEE behaviour, as it turns out,
but not many people cared.

> Somebody at MIPS is working on merging the necessary fp support software
> into the kernel, so this problem should be solved soon.

Once we had bolted the Algorithmics FPU emulator into the kernel,
the hack was no longer necessary.   To say that "somebody at MIPS
is working on merging the necessary fp support software into the
kernel" is perhaps a bit misleading.  The FPU emulator itself is in
the oss.sgi.com repository, in the 2_2 branch, but I did not merge
in the hacks to the kernel exception, context, signal, etc. handling.
And there are several bug fixes that have been made since then.
All the additional code is available on the ftp.mips.com server, and
has been merged by others into 2.3/2.4, most notably by the VrLinux
guys.

We've got 2.4-test running in the lab, but it is a long way
from being as robust under torture as our 2.2 kernel, and
we have not decided whether it is "ripe" enough to merge
in the FPU emulation support ourselves.

            Regards,

            Kevin K.
