Message-ID: <00bf01bfaad1$fc42b460$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Should send SIGFPE to .*
Date: Thu, 20 Apr 2000 16:08:58 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000420140858.fohPXo2NdGgdUCLOmOxciKore_CsN9ZyIa4DjIJ4jiI@z>

>Hi,
>i just rediscovered the kernel messages in the kern.log ...
>
>Apr 19 20:12:41 repeat kernel: Setting flush to zero for top.
>Apr 19 20:12:41 repeat kernel: Unimplemented exception for insn 46001124 at
0x00403588 in top.
>Apr 19 20:12:41 repeat kernel: Should send SIGFPE to top
>
>This is something i not really understand - After "Setting flush to zero" the
>instruction is "retried" and enters the exception again and say
>"Unimplemented exception" which means - The CPU doesnt support it
>and then "Simulates" this instruction in "simfp(insn)" - Until
>now nothing bad has happened and these two kernel messages
>should be encapsulated by a "#if DEBUG_FP_EXCEPTION" or something.
>
>Now i get an "Should send SIGFPE to top" which i dont understand - Shouldnt
>SIGFPE signal Floating Point errors (like div by zero) - As the code
>gets simulated in simfp this function should be responsible for
>sending the signal if something goes wrong ?

Note that I didn't actually *write* the code in question, but having
rewritten it fairly recently, I think I understand what's going on.

The main thing to keep in mind here is that the "mini" form of the
FPU emulator (the one in softfp.S) is an incomplete emulation of
IEEE FP.  Forcing flush-to-zero for denormalized results isn't really
kosher, since that's supposed to be under the control of the application,
but it avoids having to compute denormalized results in softfp.S, so
the trap handler, as an expedient, changes the application's rounding
mode in hopes that the problem was in fact a denormal result.  If
that "works", the application will get an incorrect answer, but one
can hope that no one will notice  ;-).

If, having tried that trick, the trap handler gets invoked again,
things are more serious, and the limited emulator is invoked.

>arch/mips/kernel/traps.c
>
>    354                 printk(KERN_DEBUG "Unimplemented exception for insn
%08x at 0x%08lx in %s.\n",
>    355                        insn, regs->cp0_epc, current->comm);
>    356                 simfp(insn);
>    357         }
>    358
>    359         if (compute_return_epc(regs))
>    360                 goto out;
>    361         //force_sig(SIGFPE, current);
>    362         printk(KERN_DEBUG "Should send SIGFPE to %s\n", current->comm);
>    363
>    364 out:
>    365         unlock_kernel();
>
>
>Might it be that compute_return_epc in branch.c does not support
>the mentioned instructions (FP instructions ?) and though can not
>calculate the correct epc ?


I never did figure out why that code is in there.  Perhaps it dates
from a previous version of compute_return_epc().   The current
version does try to emulate the branch-on-floating-condition
instructions, and can only fail if the EPC is misaligned or if
there is an error fetching the instruction from user space
(which should have been caught earlier in the FP trap handler
if it was actually a problem), and as such the force_sig() should
use the value returned by compute_return_epc() as the signal
number, and not SIGFPE, and the signal should really be
sent to the process, not just noted as a signal wannabe.
I was going to make another cleanup pass over traps.c this
week, so it looks like you've found me another nit to excise.
(Although we've got the full-blown Algorithmics emulator
in our source base - coming soon to a repository near you -
we kept the old stuff around for people wanting to build for
a minimal footprint).

            Thanks,

            Kevin K.
__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68
