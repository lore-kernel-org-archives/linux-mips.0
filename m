Message-ID: <04c801c160b0$1d62f660$3501010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20011026210746.A20395@dev1.ltc.com> <3BDDACD2.7121F905@mvista.com>
Subject: Re: PATCH: pci_auto bridge support
Date: Mon, 29 Oct 2001 14:30:06 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: linux-mips@oss.sgi.com, linux-mips-kernel@lists.sourceforge.net
Message-ID: <20011029193006.kyWNnGK0HW8v6y-zQ2fMUm1JXO3BtB3C8H-EZFLTufs@z>

I considered that, but since only this small chuck of run-once surrogate
bios autoconfig code needs to know, I figured better keep it separate.

Regards,
Brad

----- Original Message -----
From: "Jun Sun" <jsun@mvista.com>
To: "Bradley D. LaRonde" <brad@ltc.com>
Cc: <linux-mips@oss.sgi.com>; <linux-mips-kernel@lists.sourceforge.net>
Sent: Monday, October 29, 2001 2:24 PM
Subject: Re: PATCH: pci_auto bridge support


>
> Brad,
>
> Have you considered embedding "topbus" argument into hose structure?  That
> sounds like potentially better solution.
>
>
>
> "Bradley D. LaRonde" wrote:
> >
> > 2001-10-26  Bradley D. LaRonde <brad@ltc.com>
> >
> > * PCI bridge support.  See change log entry below.
> >
> > --- arch/mips/kernel/pci_auto.c 2001/08/18 06:21:53     1.1
> > +++ arch/mips/kernel/pci_auto.c 2001/10/27 01:01:21
> > @@ -4,6 +4,7 @@
> >   * Author: Matt Porter <mporter@mvista.com>
> >   *
> >   * Copyright 2000, 2001 MontaVista Software Inc.
> > + * Copyright 2001 Bradley D. LaRonde <brad@ltc.com>
> >   *
> >   * This program is free software; you can redistribute  it and/or
modify it
> >   * under  the terms of  the GNU General  Public License as published by
the
> > @@ -19,6 +20,15 @@
> >   * . change most int to u32.
> >   *
> >   * Further modified to include it as mips generic code,
ppopov@mvista.com.
> > + *
> > + * 2001-10-26  Bradley D. LaRonde <brad@ltc.com>
> > + * - Add a top_bus argument to the "early config" functions so that
> > + *   they can set a fake parent bus pointer to convince the underlying
> > + *   pci ops to use type 1 configuration for sub busses.
> > + * - Set bridge base and limit registers correctly.
> > + * - Align io and memory base properly before and after bridge setup.
> > + * - Don't fall through to pci_setup_bars for bridge.
> > + * - Reformat the debug output to look more like lspci's output.
> >   */
