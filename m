From: "Matthew Dharm" <mdharm@momenco.com>
Subject: RE: [RFC] FPU context switch
Date: Tue, 17 Sep 2002 14:58:00 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIOEAHCJAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <15751.41516.224075.295052@gladsmuir.algor.co.uk>
Return-Path: <mdharm@momenco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Dominic Sweetman <dom@algor.co.uk>, Jun Sun <jsun@mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20020917215800.9cq1RvQclqbw9WVY8HUAbpcWMMyP-9ZQSHphNgGcsbs@z>

I've got some evidence.

We use both OpenBSD and Linux on our hardware.  Using apps that use
the FPU, we see a _significant_ performance difference.  The problem
appears to be that OpenBSD always save/restores, where Linux doesn't.

The difference is _very_ noticable.  On the order of 10-20% for
FPU-heavy applications.

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of
> Dominic Sweetman
> Sent: Tuesday, September 17, 2002 2:44 PM
> To: Jun Sun
> Cc: linux-mips@linux-mips.org
> Subject: Re: [RFC] FPU context switch
>
>
>
> Jun Sun (jsun@mvista.com) writes:
>
> > 1) always blindly save and restore during context switch
> (switch_to())
>
> Just a suggestion...
>
> > Not interesting.  Just list it here for completeness.
>
> Agreed, it's not interesting.
>
> But it would work, every time; while the current scheme has been a
> fertile source of interesting bugs.  How much useful optimisation
> might have been done with the effort required to fix them?
>
> Saving all the FPU registers on a 400MHz CPU takes about a
> tenth of a
> microsecond.  Does anyone reading this list have evidence
> that this is
> ever any kind of problem?
>
> Dominic Sweetman
> MIPS Technologies.
>
>
