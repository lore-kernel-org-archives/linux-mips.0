From: "Matthew Dharm" <mdharm@momenco.com>
Subject: RE: [jsun@mvista.com: Re: /dev/rtc lookalike for NEW_TIME_C?]
Date: Fri, 6 Sep 2002 17:13:02 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIGENKCIAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <20020906111815.B1282@mvista.com>
Return-Path: <mdharm@momenco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>, linux-mips@linux-mips.org
Message-ID: <20020907001302.mehrrqXQugXBNQB1sr33TaQzFA7Bwmrl2IGsJM1aTHY@z>

In case anyone is interesed, I just tried this.  The patch still
applies, tho with some fuzz.  It appears to work as advertised, which
is to say that it does everything I'm interested in.

I _definately_ think this should go in on the 2.4 branch, as well as
the 2.5 branch.

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of Jun Sun
> Sent: Friday, September 06, 2002 11:18 AM
> To: linux-mips@linux-mips.org
> Cc: jsun@mvista.com
> Subject: [jsun@mvista.com: Re: /dev/rtc lookalike for NEW_TIME_C?]
>
>
>
> Try again ....
>
> ----- Forwarded message from Jun Sun <jsun@mvista.com> -----
>
> On Thu, Sep 05, 2002 at 08:26:14PM -0700, Matthew Dharm wrote:
> > Has anyone written a driver module provide something like
> /dev/rtc for
> > those platforms that use the CONFIG_NEW_TIME_C?
> >
>
> Yes.  I submitted this patch November last year.  There was
> some discussions,
> but no real opposition.  Ralf, can you apply this patch?  Tom Rini
> is supposedly to come up with a unified solution in 2.5+.  But until
> then this is such a useful thing for MIPS folks.
>
> http://linux.junsun.net/patches/oss.sgi.com/submitted.
>
> Jun
>
> ----- End forwarded message -----
>
