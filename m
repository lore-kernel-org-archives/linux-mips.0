Message-ID: <01e801c126a6$ec2a3420$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: FP emulator patch
Date: Fri, 17 Aug 2001 00:58:01 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>, Daniel Jacobowitz <dan@debian.org>
Message-ID: <20010816225801.URN0mWlDU1JadBn4jvuQlsjXnvVZT2kIzxp-55BEluE@z>

> >
> >         if (current->used_math) {               /* Using the FPU again.
> */
> >                 lazy_fpu_switch(last_task_used_math);
> >         } else {                                /* First time FPU user.
> */
> >                 init_fpu();
> >                 current->used_math = 1;
> >         }
> >         last_task_used_math = current;
> >
> > Clearly the second path is logically the correct one.
>
> Not really.  See below.
>
> > BTW, do I see another bug here in do_cpu()?  It seems that before we
call
> > init_fpu(), we should check last_task_used_math.  If it is not NULL, we
> should
> > save the FP state to the last_task_used_math.  Hmm, strange ...
>
> Strange indeed.  And note that if the code were correct, your
> surmise about the init_fpu() path being "logically the correct"
> one would no longer be true - we'd be saving the FPU state of
> the current process for no good reason.

And note further that, by forcing current->used_math to
zero, the old code was in fact driving the signal handler
needlessly into the broken code...

            Kevin K.
