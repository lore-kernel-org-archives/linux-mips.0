Message-ID: <003201c228ee$1377c8e0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1020711132652.7876D-100000@delta.ds2.pg.gda.pl>
Subject: Re: Sigcontext->sc_pc Passed to User
Date: Thu, 11 Jul 2002 17:16:14 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020711151614.6F9cjmUV9-6rsjhswHiVj_9VAV1nfwrpaccBVMQwRas@z>

From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>

[snip]

>  I believe the resumption should happen with EPC unmodified.  A handler
> may set EPC differently if it wants (possibly with longjmp() or by
> interpreting code at EPC and modifying EPC appropriately).  For the three
> signal handling possibilities, I'd do that as follows (assuming SIGBUS,
> SIGSEGV, etc. lethal signals): 
> 
> - SIG_IGN: return to EPC with no action.  A program will loop
>   indefinitely, but if that's what a user wants...

I don't think that this is the right thing to do, philosophically.
Hanging in an infinite loop and making no forward progress
is not, to me "ignoring" an event. The old X/Open specs I've 
got say that SIGFPE, SIGILL, and SIGSEGV behavior is 
undefined if bound to SIG_IGN (curiously, they don't call 
out SIGBUS), but I think that in practical terms we need to 
provide whatever behavior people expect from Linux on
x86 and PPC.  What happens on those platforms?  A
quick look at the x86 kernel code makes me think that
they do, indeed, do the "wrong" thing and beat their
heads against the ignored event for all eternity, but I'm
insufficiently an expert in x86 trap semantics to know
for certain whether that's the case.  If it is, right or 
wrong, that's what we ought to do.

> - SIG_DFL: kill.
> 
> - HANDLER: call a handler with the signal context unmodified and let the
>   user code decide what to do.

Independently of what we do for the SIG_IGN cases,
this is important, and the user code cannot decide what
to do if it cannot know what instruction caused the fault.
Fixups on SIGFPE must be able to find the FP instruction,
which is not currently possible if it was in a branch delay
slot.  Similarly, user-mode emulation of "memory" via
signal handlers cannot work unless the loads and stores
can be identified.  But, having "done the deed", return
from the signal handler should resume at the instruction
*following* the one generating the fault, and not replay
the same instruction.  We *could* punt that to the signal
handler, but making every signal package carry its own
copy of compute_return_epc() to handle the branch
delay slot cases strikes me as being unfriendly to the
user and is arguably slightly less reliable.  I guess I'd like things 
to be rigged so that the sigcontext structure contains the address 
of the faulting instruction as the sc_pc, but where the return 
from signal goes to the address calculated by 
compute_return_epc().  But again, what do people expect 
in the "mainstream" world of x86 Linux?

            Regards,

            Kevin K.
