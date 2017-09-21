Received: from mailapp01.imgtec.com ([195.59.15.196]:54602 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992540AbdIUVHSpq8vK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Sep 2017 23:07:18 +0200
Date: Thu, 21 Sep 2017 22:07:00 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v2] MIPS: Add basic R5900 support
In-Reply-To: <20170920140715.GA9255@localhost.localdomain>
Message-ID: <alpine.DEB.2.00.1709201604400.16752@tp.orcam.me.uk>
References: <20170911151737.GA2265@localhost.localdomain> <alpine.DEB.2.00.1709141423180.16752@tp.orcam.me.uk> <20170916133423.GB32582@localhost.localdomain> <alpine.DEB.2.00.1709171001160.16752@tp.orcam.me.uk> <20170920140715.GA9255@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Fredrik Noring <noring@nocrew.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20170921210700.3bds2aOOzfzyyWHOt6OY9QKWuINsBe3yqX59-wo2MXY@z>

Hi Fredrik,

> >  Can you add a diagnostic consistency check to the context restoration 
> > code, i.e. all the macros called from RESTORE_ALL (in <asm/stackframe.h>), 
> > such as a `break 12' (BRK_BUG) instruction if a register value is not 
> > correctly sign-extended?
> 
> Hmm... I think some details need to be sorted out for this. The LW
> instruction used to restore registers sign-extends to register length by
> definition (p. A-70 in the TX79 manual), so I assume that isn't what we
> are going to check unless we suspect a grave hardware error with LW? (Do
> we need to check the register values immediately prior to LW?)

 The operation is only defined for bits 63:0 AFAICS.  IIUC bits 127:64 
remain unchanged (which is why I think that at the initial stage of R5900 
support they have to be explicitly set to a fixed value on a context 
switch, to prevent leaking information), but I have no means to verify it.

 In the interim to fix the value of bits 127:64 while keeping disruption 
to existing code at the minimum you could AFAICT use a sequence like:

	pcpyld	$1, $0, $1
	pcpyld	$2, $0, $2
#	...
	pcpyld	$31, $0, $31

in RESTORE_SOME, preferably via an auxiliary macro.  Once we have switched 
to saving/restoring full 128-bit registers, possibly with SQ/LQ, we can 
remove this temporary measure.

> Another possibility would be to check that saved registers in SAVE_ALL
> will be restored properly. That is, immediately after SW check that LW
> (to a temporary register such as k1) will restore to the same value by
> 64-bit comparison and trap if unequal (TNE). I thought that made sense.
> Something like for example
> 
> 	sw	$17, PT_R17(sp)
> 	lw	k1, PT_R17(sp)
> 	tne	k1, $17, 12
> 
> as a replacement for
> 
> 	LONG_S	$17, PT_R17(sp)
> 
> in SAVE_STATIC?

 This would verify whether the original contents of $17 were a properly 
sign-extended 32-bit value.  Although for predictable operation I would 
advise to use:

	sll	k1, $17, 0
	sw	k1, PT_R17(sp)
	lw	k1, PT_R17(sp)
	tne	k1, $17, 12

or simply:

	sll	k1, $17, 0
	tne	k1, $17, 12
	sw	$17, PT_R17(sp)

Previously you wrote that the problem is with resetting the upper 96 bits 
(how did you notice that BTW?) rather than bits 63:32 only, so you need a 
different check.  Also I see no reason why LW would set bits 63:32 to 
anything different from what was there before SW as long as the original 
value was 32-bit (hence the second check sequence proposed).

> A question is whether registers are clobbered within the kernel itself
> (via interrupts or some such) or for user programs.

 Well, you do need to verify your patches for such a possibility, right.  
I would advise double-checking exception handling indeed, including 
run-time generated exception handler code in particular.

 Unless there is an unhandled CPU erratum the userland does not clobber 
itself as o32 binaries are only supposed to have instructions that operate 
on 32-bit data.

  Maciej
