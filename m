Message-ID: <01b801c25ea7$ce074ed0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20020917160425.O17321@mvista.com>
Subject: Re: [jsun@mvista.com: Re: [RFC] FPU context switch]
Date: Wed, 18 Sep 2002 02:10:17 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Jun Sun <jsun@mvista.com>
Message-ID: <20020918001017.MLvUBfFNu5Sa38IHmCq6ADwZYJcnTHq1rqafl_oK4MM@z>

> ----- Forwarded message from Jun Sun <jsun@mvista.com> -----
Sep 17, 2002 at 03:58:54PM -0700, Greg Lindahl wrote:
> > 
> > The only good test is Linux with and without lazy saves. Throwing in a
> > new OS complicates matters. It sounds like Jun already has working
> > code for (1) and (3), so he can do a good test.
> >
> 
> I actually have 2) and 3).  1) is easy to do, though.  
> 
> Anyone can recommand some test programs to try?
> 
> A while back, I tried lmbench which is not very telling.
> I think the reason is that most of the tests are not using
> FPU at all.

"Not very telling?"  Sounds to me as if it confirms the
hypothesis that the benefits of these optimizations are
maginal.  ;-)
 
> However I might try it again anyway.  It might tell the
> difference between 1) and 2)&3) easily.

If I wanted to see the effect at its strongest, I'd whip
up an FP-intensive, low-I/O program along the lines
of the old fashioned Whetstone benchmark that runs
for at least a few seconds, then time a script that 
forks off N of them in parallel with M instances of
a program that does no FP.  You can then play with 
M and N to see where a hack becomes advantageous.  
If all runnable programs are using the FPU, there's 
clearly no benefit from the optimization.

Are you able to test this stuff on a proper SMP
system, by the way?  The efficiency of the code 
that manipulates interprocessor control variables 
can reasonably be expected to drop off a bit
in a system with MP cache invalidations blasting
left and right. 

            Regards,

            Kevin K.
