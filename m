Message-ID: <002e01c0a553$b5c48e00$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <NDBBIDGAOKMNJNDAHDDMEEHOCOAA.mfklar@ponymail.com>
Subject: Re: FPU context clobbered by signals
Date: Mon, 5 Mar 2001 10:07:20 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Mike Klar <mfklar@ponymail.com>, linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20010305090720.y0FsfJBDTsG6B82VA_EHj6MrKuPeE53vxygSvaT7ih4@z>

> Currently setup_sigcontext() appears to behave as follows:
> If the current process owns the FPU context, sc_ownedfp is set to 1 in the
> sigcontext passed to the signal handler, and the floating point registers
> are saved in that sigcontext.  This makes sense.
> If the current process does not own the FPU context, but did at one point
> execute FPU operations (which all glibc apps will do for initialization),
> sc_ownedfp in the sigcontext is set to 0, and the floating point registers
> are still saved.  This is, at the very least, a security hole, since those
> registers belong to a different process at that point.

I'm speaking from first principles here, not from an analysis
of the code on non-MIPS architectures, but what *should*
happen on a signal to a process that is not the current/latest
user of the FPU is that the FPU sigcontext information should
be copied from the saved thread context state.

> And restore_sigcontext() appears to behave thusly:
> If sc_ownedfp is set in the sigcontext that is passed back from the signal
> handler, the FPU context is restored from the sigcontext, and FPU context
> ownership is given to the current process, without saving the old context.
> Either I'm misunderstanding this, or there is a possibility that this will
> simply forget about some other process' FPU context.

The behavior described sort-of makes sense, if one is willing
to take it on faith that the signal handler did not trash the
sigcontext information (which I personally consider unwise).
If the signal was sent to the current owner of the FPU, the
post-signal thread FPU  state needs to represent the pre-signal
state of the FPU, which was saved in the sigcontext structure.

> So what _is_ the desired behavior here?

The desired behavior (IMHO) is that signals are dispatched
with the FPU state corresponding to the last known FPU
state of the thread taking the signal.  If the only copy of that
state prior to signal dispatch resides in the FPU, that state
needs to be saved before signal dispatch and restored
after signal return.

Or, to put it another way, the semantics of signals with
respect to FP registers should be the same as the
semantics with respect to general purpose registers.
The only wrinkle is the lazy FPU context switch logic,
which creates two anomolous situations: one where
the current contents of the FPU does not belong to
the current thread (because the current thread has
not executed any FP instructions), and one where the
FP register state of a non-current thread is not yet saved
in the thread state of that thread (because no subsequent
thread has executed any FP instructions).

            Kevin K.
