Message-ID: <020001c126ad$bad05e20$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <01e801c126a6$ec2a3420$0deca8c0@Ulysses> <3B7C53BA.24B75620@mvista.com>
Subject: Re: FP emulator patch
Date: Fri, 17 Aug 2001 01:46:40 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>, Daniel Jacobowitz <dan@debian.org>
Message-ID: <20010816234640.WEzE6oAZ4lYsvoAOISVodMaicTmrcdsCj3ixJZ5E2F0@z>

> > > Strange indeed.  And note that if the code were correct, your
> > > surmise about the init_fpu() path being "logically the correct"
> > > one would no longer be true - we'd be saving the FPU state of
> > > the current process for no good reason.
> > 
> > And note further that, by forcing current->used_math to
> > zero, the old code was in fact driving the signal handler
> > needlessly into the broken code...
> > 
> 
> By not clearing current->used_math bit, you are in fact restoring an FPU
> context unnecessarily.

And by clearing it, you are destroying an FPU context unnecessarily.
I'll take the overhead, thanks! ;-)  Seriously, if that optimization
is really that important, let's find some other mechanism for communicating
to do_cpu() the fact that we're doing a signal.

            Regards,

            Kevin K.
