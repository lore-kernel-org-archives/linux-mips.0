Message-ID: <01c701c126a3$7c5bcbc0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <018201c12680$8f13e680$0deca8c0@Ulysses> <20010816115349.A12153@nevyn.them.org> <3B7C1BB9.7011790E@mvista.com> <01b001c12693$b4920140$0deca8c0@Ulysses> <3B7C3C75.4AB05B13@mvista.com>
Subject: Re: FP emulator patch
Date: Fri, 17 Aug 2001 00:33:31 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: Daniel Jacobowitz <dan@debian.org>, "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20010816223331.9pppw349H36pT2Ns5GUU2OtXW430n8lvPEjnPYDe0mI@z>

> > We've had a lot of messages crossing here, but please
> > explain yourself here why clearing used_math helps in
> > this case.  If, as has been proposed, the current
> > thread does not own the FPU, and thus CU1 is not
> > enabled, the FPU switch mechanism should kick in
> > during the signal handler regardless. The signal
> > handler will inherit the thread's FPU state from
> > the thread context, and will muck with it, but
> > if, as has been noted, the sigcontext has
> > been loaded from the thread context before
> > the handler is dispatched, and is restored after
> > the handler executes, we're fine.  The only thing
> > I can see that clearing used_math would achieve
> > would be to guarantee the signal handler a virgin
> > FPU context.
>
> Yes, that is somewhat the purpose.  Essentially we want to see, at the
> beginning of a signal handler execution, the process appears to have not
used
> FPU at all.
>
> This requirement might be a must, because whether clearing
current->used_math
> bit determine which patch we will take in the do_cpu(), when signal
handler
> uses FPU for the first time.  See the code below.
>
>         if (current->used_math) {               /* Using the FPU again.
*/
>                 lazy_fpu_switch(last_task_used_math);
>         } else {                                /* First time FPU user.
*/
>                 init_fpu();
>                 current->used_math = 1;
>         }
>         last_task_used_math = current;
>
> Clearly the second path is logically the correct one.

Not really.  See below.

> BTW, do I see another bug here in do_cpu()?  It seems that before we call
> init_fpu(), we should check last_task_used_math.  If it is not NULL, we
should
> save the FP state to the last_task_used_math.  Hmm, strange ...

Strange indeed.  And note that if the code were correct, your
surmise about the init_fpu() path being "logically the correct"
one would no longer be true - we'd be saving the FPU state of
the current process for no good reason.

The more I look at the FPU management code, the more I marvel
that it even gives an appearance of working...

            Regards,

            Kevin K.
