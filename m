Message-ID: <002d01c54bfa$5b913f80$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <KevinK@mips.com>
References: <20050427.143622.77402407.nemoto@toshiba-tops.co.jp> <20050428134118.GC1276@linux-mips.org>
Subject: Re: preempt safe fpu-emulator
Date: Thu, 28 Apr 2005 06:58:28 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <KevinK@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: linux-mips@linux-mips.org
Message-ID: <20050428135828.bJhMfFhcLm5TEFHp42eelSRA6830ezK-rSS2OpXamTA@z>

When I first integrated the Algorithmics emulator with the Linux kernel
several years back, I tried doing something like this but ran into some
problem that I cannot recall exactly - there may have been some case
where the system expected threads to "inherit" FCSR changes.  I agree
that this is an obviously cleaner approach, but be careful.

            Regards,

            Kevin K.

----- Original Message ----- 
From: "Ralf Baechle" <ralf@linux-mips.org>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Cc: <linux-mips@linux-mips.org>
Sent: Thursday, April 28, 2005 6:41 AM
Subject: Re: preempt safe fpu-emulator


> On Wed, Apr 27, 2005 at 02:36:22PM +0900, Atsushi Nemoto wrote:
> 
> > Hi.  Here is a patch to make the fpu-emulator preempt-safe.  It would
> > be SMP-safe also.
> > 
> > The 'ieee754_csr' global variable is removed.  Now the 'ieee754_csr'
> > is an alias of current->thread.fpu.soft.fcr31.  While the fpu-emulator
> > uses different mapping for RM bits (FPU_CSR_Rm vs. IEEE754_Rm), RM
> > bits are converted before (and after) calling of cop1Emulate().  If we
> > adjusted IEEE754_Rm to match with FPU_CSR_Rm, we can remove ieee_rm[]
> > and mips_rm[].  Should we do it?
> > 
> > With this patch, whole fpu-emulator can be run without disabling
> > preempt.  I will post a patch to fix preemption issue soon.
> 
> I applied both your patches with some slight cleanup for the endianess
> stuff in arch/mips/math-emu/ieee754.h and non-Linux stuff.
> 
>   Ralf
> 
> 
