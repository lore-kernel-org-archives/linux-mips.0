Message-ID: <04f501c420f4$5563f620$8d01010a@prefect>
From: "Bradley D. LaRonde" <brad@laronde.org>
References: <Pine.GSO.4.10.10404122244110.8735-100000@helios.et.put.poznan.pl> <20040412231309.GA702@linux-mips.org> <03f301c420e7$d8de2d70$8d01010a@prefect> <048e01c420f1$ad4ae3b0$8d01010a@prefect> <1081818125.19719.14.camel@dzur.sfbay.redhat.com> <04d501c420f3$6c836a30$8d01010a@prefect> <20040413010732.GA7560@nevyn.them.org>
Subject: Re: [PATCH] gcc 3.4 drops "accum" clobber, replace with "hi" intime.c
Date: Mon, 12 Apr 2004 21:12:04 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@laronde.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Daniel Jacobowitz <dan@debian.org>
Cc: linux-mips@linux-mips.org, Eric Christopher <echristo@redhat.com>
Message-ID: <20040413011204.7phb5Mbbv8mH9CpDU8A9xuYtZko7y0W7a1zPAN6moAc@z>

----- Original Message ----- 
From: "Daniel Jacobowitz" <dan@debian.org>
To: "Bradley D. LaRonde" <brad@laronde.org>
Cc: <linux-mips@linux-mips.org>; "Eric Christopher" <echristo@redhat.com>
Sent: Monday, April 12, 2004 9:07 PM
Subject: Re: [PATCH] gcc 3.4 drops "accum" clobber, replace with "hi"
intime.c


> On Mon, Apr 12, 2004 at 09:05:34PM -0400, Bradley D. LaRonde wrote:
> > ----- Original Message ----- 
> > From: "Eric Christopher" <echristo@redhat.com>
> > To: "Bradley D. LaRonde" <brad@laronde.org>
> > Cc: <linux-mips@linux-mips.org>
> > Sent: Monday, April 12, 2004 9:02 PM
> > Subject: Re: [PATCH] gcc 3.4 drops "accum" clobber, replace with "hi"
> > intime.c
> >
> >
> > > On Mon, 2004-04-12 at 17:53, Bradley D. LaRonde wrote:
> > > > Uh oh, with this patch:
> > > >
> > > > ...
> > > > time.c: In function `fixed_rate_gettimeoffset':
> > > > time.c:242: error: can't find a register in class `HI_REG' while
> > reloading
> > > > `asm'
> > > > ...
> > >
> > > > >
> > > > >         /*
> > > > >          * Due to possible jiffies inconsistencies, we need to
check
> > > > > @@ -339,7 +339,7 @@
> > > > >                                 : "r" (timerhi), "m" (timerlo),
> > > > >                                   "r" (tmp), "r"
(USECS_PER_JIFFY),
> > > > >                                   "r" (USECS_PER_JIFFY_FRAC)
> > > > > -                               : "hi", "lo", "accum");
> > > > > +                               : "hi", "lo", "hi");
> > > > >                         cached_quotient = quotient;
> > >
> > >
> > > Maybe this hunk where you use "hi" twice for the same asm statement?
> >
> > Yeah, that's messed up, but it fails here too:
> >
> > @@ -242,7 +242,7 @@
> >         __asm__("multu  %1,%2"
> >                 : "=h" (res)
> >                 : "r" (count), "r" (sll32_usecs_per_cycle)
> > -               : "lo", "accum");
> > +               : "lo", "hi");
>
> Because the asm is outputting something in HI - see the =h?

Oh... yeah, I guess gcc knows that the output is clobbered.  :-P

So just remove the accum clobbers?

Regards,
Brad
