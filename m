Message-ID: <019d01c25e99$d9786af0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <NEBBLJGMNKKEEMNLHGAIOEAHCJAA.mdharm@momenco.com>
Subject: Re: [RFC] FPU context switch
Date: Wed, 18 Sep 2002 00:30:23 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Matthew Dharm <mdharm@momenco.com>, Dominic Sweetman <dom@algor.co.uk>, Jun Sun <jsun@mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20020917223023.x9nuGso-6_u68zuPD_62k9-z9rbdON4uTBwn7se3e3M@z>

I'm extremely skeptical about this "evidence".  Saving/restoring
the context of the CPU is going to less than double the context 
switch overhead between processes.  For an overall application
to degrade by 20% due solely to that, it seems to me that it must 
therefore  be spending something more than 40% of its time doing 
context switches (20% for the FPU, 20+% for the GPRs, TLB, etc).
Poorly written multithreaded applications will do that sometimes,
but not a serious "FPU-heavy" application.  There's got to be another
factor at play between OpenBSD and Linux, e.g. the VM subsystem.

Lazy FPU context switch was one of those 1980's ideas that
seemed clever at the time but which was always a bit overrated.
We implemented it from scratch in SVR3 for the Fairchild
Clipper CPU, in such a way as we could turn it on and off,
and measured the context switch time with a logic analyser.
I don't recall the exact number, but in the end we had saved 
far less than 10% of the *context switch* time, which was barely 
measureable in terms of overall application performance.  It 
would be easy enough to do the same for MIPS/Linux and do 
an apples-to-apples comparison.  Indeed, I could have sworn
that someone had already done that the last time the topic
got thrashed around on this list.

            Regards,

            Kevin K.

----- Original Message ----- 
From: "Matthew Dharm" <mdharm@momenco.com>
To: "Dominic Sweetman" <dom@algor.co.uk>; "Jun Sun" <jsun@mvista.com>
Cc: <linux-mips@linux-mips.org>
Sent: Tuesday, September 17, 2002 11:58 PM
Subject: RE: [RFC] FPU context switch


> I've got some evidence.
> 
> We use both OpenBSD and Linux on our hardware.  Using apps that use
> the FPU, we see a _significant_ performance difference.  The problem
> appears to be that OpenBSD always save/restores, where Linux doesn't.
> 
> The difference is _very_ noticable.  On the order of 10-20% for
> FPU-heavy applications.
> 
> Matt
> 
> --
> Matthew D. Dharm                            Senior Software Designer
> Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
> (760) 431-8663 X-115                        Carlsbad, CA 92008-7310
> Momentum Works For You                      www.momenco.com
> 
> > -----Original Message-----
> > From: linux-mips-bounce@linux-mips.org
> > [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of
> > Dominic Sweetman
> > Sent: Tuesday, September 17, 2002 2:44 PM
> > To: Jun Sun
> > Cc: linux-mips@linux-mips.org
> > Subject: Re: [RFC] FPU context switch
> >
> >
> >
> > Jun Sun (jsun@mvista.com) writes:
> >
> > > 1) always blindly save and restore during context switch
> > (switch_to())
> >
> > Just a suggestion...
> >
> > > Not interesting.  Just list it here for completeness.
> >
> > Agreed, it's not interesting.
> >
> > But it would work, every time; while the current scheme has been a
> > fertile source of interesting bugs.  How much useful optimisation
> > might have been done with the effort required to fix them?
> >
> > Saving all the FPU registers on a 400MHz CPU takes about a
> > tenth of a
> > microsecond.  Does anyone reading this list have evidence
> > that this is
> > ever any kind of problem?
> >
> > Dominic Sweetman
> > MIPS Technologies.
> >
> >
> 
> 
> 
