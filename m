From: Kanoj Sarcar <kanoj@google.engr.sgi.com>
Message-ID: <200101171315.FAA98450@google.engr.sgi.com>
Subject: Re: crash in __alloc_bootmem_core on SGI current cvs
Date: Wed, 17 Jan 2001 05:15:36 -0800 (PST)
In-Reply-To: <20010116172235.A1379@bacchus.dhis.org> from "Ralf Baechle" at Jan 16, 2001 05:22:35 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Florian Lohoff <flo@rfc822.org>, linux-mips@oss.sgi.com, Kanoj Sarcar <kanoj@engr.sgi.com>
Message-ID: <20010117131536.QlUQ3xR2D6tmn0CT2TDE4nugeBxVuZlOOCqwnpPRZ0A@z>

> 
> On Tue, Jan 16, 2001 at 05:39:40PM +0100, Maciej W. Rozycki wrote:
> 
> > > Wouldnt be this correct ? Realsize is size - holes.
> > > 
> > > Index: mm/page_alloc.c
> > > ===================================================================
> > > RCS file: /cvs/linux/mm/page_alloc.c,v
> > > retrieving revision 1.49
> > > diff -u -r1.49 page_alloc.c
> > > --- mm/page_alloc.c	2001/01/11 04:02:45	1.49
> > > +++ mm/page_alloc.c	2001/01/16 16:26:55
> > > @@ -824,7 +824,7 @@
> > >  		if (zholes_size)
> > >  			realsize -= zholes_size[j];
> > >  
> > > -		printk("zone(%lu): %lu pages.\n", j, size);
> > > +		printk("zone(%lu): %lu pages.\n", j, realsize);
> > >  		zone->size = size;
> > >  		zone->name = zone_names[j];
> > >  		zone->lock = SPIN_LOCK_UNLOCKED;
> > 
> >  It look reasonable but is it what was really intended?  You should ask
> > the author or linux-kernel, I suppose. 
> 
> Which probably is Kanoj who is subscribed to this list.
> 
>   Ralf
> 

realsize is fine, and that is what it is in Linus' tree. We want
to report actual number of pages, not number of pages including
the holes in memory.

Kanoj
