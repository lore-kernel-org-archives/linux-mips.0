Message-ID: <02ea01c4218f$9ea240d0$8d01010a@prefect>
From: "Bradley D. LaRonde" <brad@laronde.org>
References: <028001c4218c$6d792350$8d01010a@prefect> <20040413193158.GO27939@rembrandt.csv.ica.uni-stuttgart.de>
Subject: Re: [PATCH] catch "new" gcc 3.4.0 sections
Date: Tue, 13 Apr 2004 15:43:39 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@laronde.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Thiemo Seufer <ica2_ts@csv.ica.uni-stuttgart.de>
Message-ID: <20040413194339.VOzMfyACLZKHmoWBt-ni532np9vnpml6Sffkx5QtYmE@z>

----- Original Message ----- 
From: "Thiemo Seufer" <ica2_ts@csv.ica.uni-stuttgart.de>
To: <linux-mips@linux-mips.org>
Sent: Tuesday, April 13, 2004 3:31 PM
Subject: Re: [PATCH] catch "new" gcc 3.4.0 sections


> Bradley D. LaRonde wrote:
> > Building with gcc 3.4.0 emits a couple new sections, .rodata.cst4 and
> > .rodata.str1.4, which the current ld.script doesn't contemplate.  Here
is a
> > patch to catch them (and maybe some other latent ones).
> >
> > Anyone know why or when these sections are emitted?
>
> I'd guess to keep differently aligned strings in separate sections,
> as a preliminary for improved string merging.
>
> > Regards,
> > Brad
> >
> >
> > diff -u -r1.1.1.1 ld.script.in
> > --- arch/mips/ld.script.in      10 Nov 2003 21:06:52 -0000      1.1.1.1
> > +++ arch/mips/ld.script.in      13 Apr 2004 19:18:25 -0000
> > @@ -11,6 +11,11 @@
> >      *(.text)
> >      *(.rodata)
> >      *(.rodata1)
> > +    *(.rodata.str1.1);
> > +    *(.rodata.str1.4);
> > +    *(.rodata.str1.32);
> > +    *(.rodata.cst4);
> > +    *(.rodata.cst8);
>
> Why not just *(.rodata*); ?

I dunno.  There is already a tradition with .rodata and .rodata1 being
listed separately.  Maybe to spy on future gcc behavior?


Regards,
Brad
