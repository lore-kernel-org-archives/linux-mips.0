Message-ID: <004e01c54c0c$4c9f3d30$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20050427.143622.77402407.nemoto@toshiba-tops.co.jp> <20050428134118.GC1276@linux-mips.org> <002d01c54bfa$5b913f80$0deca8c0@Ulysses> <20050428152123.GH1276@linux-mips.org>
Subject: Re: preempt safe fpu-emulator
Date: Thu, 28 Apr 2005 18:06:53 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mips@linux-mips.org
Message-ID: <20050428160653.4hbp9zA21rt1C9IXASMcjSUBbkpPcUk_RcVtOH3HAg4@z>

> On Thu, Apr 28, 2005 at 06:58:28AM -0700, Kevin D. Kissell wrote:
> 
> > When I first integrated the Algorithmics emulator with the Linux kernel
> > several years back, I tried doing something like this but ran into some
> > problem that I cannot recall exactly - there may have been some case
> > where the system expected threads to "inherit" FCSR changes.  I agree
> > that this is an obviously cleaner approach, but be careful.
> 
> The global variables definately won't fly anymore in preemptable and SMP
> kernels.  Or rather any attempt to get that to work would only make things
> worse, so they had to go.

The global variable thing was clearly not SMP safe - but then again, the
32-bit MIPS kernel we were working with wasn't SMP safe either, in
those days.  ;o)  But *if* - and it may not really (or no longer) be the case - 
there is an implicit assumption that some FCSR state is preserved on a
context switch, it would be more correct to map the ieee754_csr symbol
to a per-CPU variable than a per-thread variable.

            Regards,

            Kevin K.
