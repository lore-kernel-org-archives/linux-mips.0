Message-ID: <01bf01c0921b$6de26620$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A830135.B1304041@mvista.com>
Subject: Re: config option vs. run-time detection (the debate continues ...)
Date: Thu, 8 Feb 2001 23:06:33 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Jun Sun <jsun@mvista.com>, linux-mips@oss.sgi.com
Message-ID: <20010208220633.8forkBq9dkj2Q8RLm218M1lprToAfkDDNHKPYB0di3w@z>

> I love this topic!

Well, I'm glad *you're* having fun!  ;-)

> Instead of replying to 10 different emails, I decide to sort out my best
> understanding of this topic and list them here, including some of MY
responses
> to some of the issues.
>
> Definition:
> ------------
>
> 1. Config option approach :
>
> In the kernel config menu, one picks one or more CPUs.  One also specifies
> whether the CPU(s) have a FPU.
>
> All FPU related code in kernel is configured in or out based on the CONFIG
> setting.

As has been noted in other messages in this exchange, whether one
has an FPU or not isn't really the determining factor in including FP
support code in the kernel.  The bulk of it is the emulator, and the
emulator needs to be there if you want to execute binaries built
to include MIPS FP instructions, whether in full emulation or using
the FPU (for the denormal cases, etc.).

So your CONFIG option would really be to say, regardless of
the CPU, whether your kernel can handle an FPU-ful userland,
or is stripped down to support only 100% integer binaries.

> 2. run-time detection approach:
>
> CPU probing code probes CPU and sets has_fpu field in the mips_cpu
structure.
>
> All FPU related code is on a conditional branch based on has_fpu value.

Again, the FPU-related code has to be there any time you're
going to run FP binaries.  The MIPS_CPU_FPU bit simply
tells the kernel how/when to use it.

...

> My Conclusion
> --------------
>
> Clearly, it is a trade-off decision based how much one values the minuses
and
> pluses of both approaches.
>
> While I do agree the minus for run-time detection are not serious ones, I
> think the minus for config option is even less serious.  Having the same
> kernel image runs on multiple CPUs is very nice.  I just doubt about the
> usefulness of requiring the same kernel image to run on CPUs both with a
FPU
> and without a FPU.

If you're building kernels for a workstation, that may be
true.  If you're building kernels for a testbed where you're
swapping CPU modules, it's actually rather nice to have
a single kernel that boots on any of them.  I personally
find myself in this situation.  Or to provide a less lab-oriented
example, NEC has the R43xx family which have FPUs,
and Toshiba markets some R49xx parts that are pin-compatible
but cheaper - because they have no FPU.   If I were building
a Linux-based system around either one, memory permitting,
I would want to  have a kernel that could cope with either of
them, to simplify the product management problem if I ever
ended up wanting to cut over from one to the other.

            Kevin K.
