Message-ID: <00e301c263c7$3cc80b60$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1020924133932.29072A-100000@delta.ds2.pg.gda.pl>
Subject: Re: FCSR Management
Date: Tue, 24 Sep 2002 14:37:57 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: linux-mips@linux-mips.org
Message-ID: <20020924123757.s5LS2EEdJxhii6WQ8oP8IbKIdj25dGdAqizyrCKf6Ng@z>

> On Tue, 24 Sep 2002, Kevin D. Kissell wrote:
> 
> > dump core, so the user never executes again.  But *if*
> > the user has registered a handler for SIGFPE, and one
> > of the IEEE exceptions occurs, I don't see where the
> > associated Cause bit is being cleared, and I would think
> > that the consequence would be that the process would
> > get into an endless loop of trapping, posting the signal,
> > restoring the FCSR from the context with the bits set,
> > and trapping again, whether or not the PC is modified
> > to avoid re-executing the faulting instruction.
> 
>  Obviously user code is responsible to clear the bit it acted upon in the
> saved context. 

It may be obvious that someone *intended* that user code 
clear the bit.  But the FCSR value containing the trapping
condition seems to be saved as part of both the thread 
and the signal contexts, thus (a) it could be restored as 
part of the sigcontext load of the signal handler, causing 
a re-entrant trap, possibly ad infinitum, and (b) will be
restored in the thread state after the execution of the
signal in any case, since we don't allow signals to have
side-effects on the FP register state, including the FCSR.
So even if the signal handler executed far enough to clear
the relevant Cause bit, it looks to me as if it would simply
be re-set the next time the thread loaded the FPU context.

I haven't seen anyone complaining about threads hanging
when SIGFPE's are being caught, so things may be working
somehow - but we may be blundering through some number
of spurious traps for no good reason before we get there.

I'll be delighted if someone on the list could point out
how the probelem is being bypassed..

            Kevin K.
