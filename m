Subject: Re: [RESUME] fpu emulator
References: <20010208122030.A5408@paradigm.rfc822.org>
	<005d01c091c4$69940620$0deca8c0@Ulysses>
From: Andreas Jaeger <aj@suse.de>
Date: 08 Feb 2001 13:06:29 +0100
In-Reply-To: <005d01c091c4$69940620$0deca8c0@Ulysses> ("Kevin D. Kissell"'s message of "Thu, 8 Feb 2001 12:43:30 +0100")
Message-ID: <hor919tm4a.fsf@gee.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Florian Lohoff <flo@rfc822.org>, linux-mips@oss.sgi.com
Message-ID: <20010208120629.Gsi2RIg5AsX2tpzwspxVvC9Ie8Nna7lxKTVKzbjdhOg@z>

"Kevin D. Kissell" <kevink@mips.com> writes:

> > Hi,
> > just to get it right - As i thought the FPU emulator is not really
> > optional - It is even required for fpu-enabled devices which means
> > we should clean the code in that way that if the user decides to 
> > compile in the fpu emulator into the kernel we do an autodetection 
> > upfront and change some of the entry/exit/lazy_fpu stuff.
> > If the user decides not to compile in the FPU Emulator he is on his
> > own and we ignore the whole FPU stuff and simply send SIGILL/SIGFPE
> > to the processes causing all fpu binarys to fail on non-fpu enabled
> > kernels.
> 
> Not quite.  Unless we create a variant of glibc that neither
> initializes the FP control register on program startup, nor

glibc doesn't initialize it for shared programs.

> saves/restores the FP registers in setjmp/longjmp, the

Any ideas how this can be done?

> model of "simply sending SIGILL/SIGFPE" will result
> in *all* processes being terminated with extreme prejudice,
> starting with init!


Andreas
-- 
 Andreas Jaeger
  SuSE Labs aj@suse.de
   private aj@arthur.inka.de
    http://www.suse.de/~aj
