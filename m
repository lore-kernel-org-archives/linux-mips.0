From: "Matthew Dharm" <mdharm@momenco.com>
Subject: RE: set_io_port_base()?
Date: Wed, 20 Feb 2002 18:48:50 -0800
Message-ID: <NEBBLJGMNKKEEMNLHGAIKEKFCFAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3C745B0B.84203D3F@mvista.com>
Sender: owner-linux-mips@oss.sgi.com
To: jsun@mvista.com, Ralf Baechle <ralf@oss.sgi.com>
Cc: Linux-MIPS <linux-mips@oss.sgi.com>
Message-ID: <20020221024850.mi29m52jjZGCkZ72YshwEYpqcF4wS90e_yPG3DThCNE@z>

But isn't that what all the complicated logic in ioremap() is for?  It
looks like it checks to see if it can directly address the I/O space
via kseg1 and if not, set up a translation for it...

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: jsun@mvista.com [mailto:jsun@mvista.com]
> Sent: Wednesday, February 20, 2002 6:27 PM
> To: Ralf Baechle
> Cc: Matthew Dharm; Linux-MIPS
> Subject: Re: set_io_port_base()?
>
>
> Ralf Baechle wrote:
> >
> > On Wed, Feb 20, 2002 at 06:05:21PM -0800, Matthew Dharm wrote:
> >
> > > If it works as I think it does, then is the code in
> > > linux/arch/mips/gt64120/momenco_ocelot/setup.c correct?
>  Specifically,
> > > it calls ioremap() and then calls set_io_port_base() with a very
> > > strange value -- it's the value from ioremap()
> >
> > > modified by the I/O physical address base...
> >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > I was reading too fast and missed that part.
> >
> > > That doesn't look right to me... or I just don't quite
> understand how
> > > this is supposed to work.
> >
> > That's definately looks fishy.
>
> This is actually right.  This way if you pass an virtual at
> (mips_io_port_base
> + delta), you will get a physical address (GT_PCI_IO_BASE +
> delta), the
> desired place.
>
> Most boards don't need this funky ioremap() and base addr
> substraction trick,
> but ocelot has the IO address placed beyond normal kseg1
> addressing range.
>
> Jun
>
