Received: from mail-pz0-f49.google.com ([209.85.210.49]:48581 "EHLO
        mail-pz0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903699Ab2CaAe2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 31 Mar 2012 02:34:28 +0200
Received: by dadq36 with SMTP id q36so82758dad.36
        for <linux-mips@linux-mips.org>; Fri, 30 Mar 2012 17:34:21 -0700 (PDT)
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v7 2/4] MIPS: Octeon: Setup irq_domains for interrupts.
In-Reply-To: <4F73BDAF.7020206@cavium.com>
References: <1332790281-9648-1-git-send-email-ddaney.cavm@gmail.com> <1332790281-9648-3-git-send-email-ddaney.cavm@gmail.com> <4F711E69.1080302@gmail.com> <4F7205F3.3000108@cavium.com> <20120328222246.8AFA83E0CFE@localhost> <4F73BDAF.7020206@cavium.com>
Date: Fri, 30 Mar 2012 15:54:30 -0600
Message-ID: <20120330215430.47FAA3E04D5@localhost>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: David Daney <david.daney@cavium.com>
Cc: Rob Herring <robherring2@gmail.com>, David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20120330215430.0xK2FPDv3dh8fUviBmu28LZuXhWkel6i55C4Qp7Madw@z>

On Wed, 28 Mar 2012 18:41:03 -0700, David Daney <david.daney@cavium.com> wrote:
> On 03/28/2012 03:22 PM, Grant Likely wrote:
> > On Tue, 27 Mar 2012 11:24:51 -0700, David Daney<david.daney@cavium.com>  wrote:
> >> On 03/26/2012 06:56 PM, Rob Herring wrote:
> >>> On 03/26/2012 02:31 PM, David Daney wrote:
> >>>> From: David Daney<david.daney@cavium.com>
> >> [...]
> >>>> +static int octeon_irq_ciu_map(struct irq_domain *d,
> >>>> +			      unsigned int virq, irq_hw_number_t hw)
> >>>> +{
> >>>> +	unsigned int line = hw>>   6;
> >>>> +	unsigned int bit = hw&   63;
> >>>> +
> >>>> +	if (virq>= 256)
> >>>> +		return -EINVAL;
> >>>
> >>> Drop this. You should not care what the virq numbers are.
> >>
> >>
> >> I care that they don't overflow the width of octeon_irq_ciu_to_irq (a u8).
> >>
> >> So really I want to say:
> >>
> >>      if (virq>= (1<<  sizeof (octeon_irq_ciu_to_irq[0][0]))) {
> >>          WARN(...);
> >>          return -EINVAL;
> >>      }
> >>
> >>
> >> I need a map external to any one irq_domain.  The irq handling code
> >> handles sources that come from two separate irq_domains, as well as irqs
> >> that are not part of any domain.
> >
> > You can get past this limitation by using the struct irq_data .hwirq and
> > .domain members for the irq ==>  hwirq translation, and for hwirq ==>
> > irq the code should already have the context to know which user it is.
> >
> > For the irqs that are not covered by an irq_domain, the driver is free
> > to set the .hwirq value directly.  Ultimately however, it will
> > probably be best to add an irq domain for those users also.
> >
> > ...
> >
> > Howver, I don't understand where the risk is in overflowing
> > octeon_irq_ciu_to_irq[][].  From what I can see, the virq value isn't
> > used at all to calculate the array dereference.  line and bit are
> > calculated from the hwirq value.  What am I missing?
> >
> 
> We do the opposite.  We extract the hwirq value from the interrupt 
> controller and then look up virq in the table.  If the range of virq 
> overflows the width of u8, we would end up calling do_IRQ() with a bad 
> value.  Also this dispatch code is not aware of the various irq_domains 
> and non irq_domain irqs, it is a single function that handles them all 
> calling do_IRQ() with whatever it looks up in the table.
> 
> We could use a wider type for this lookup array, but that would increase 
> the cache footprint of the irq dispatcher...

Ah, I missed that octeon_irq_ciu_to_irq was a u8.  You're using Linux
though; your cache footprint is already trashed.  :-) Please just use
unsigned int for all irq storage since that is the type used by all
core interrupt handling code.  Anything else smells like premature
optimization.  :-)

Besides, now that we have it you should plan to switch to the common
mechanism of irq_domain for hwirq->irq reverse mapping anyway.  It
doesn't make any sense for each platform to reinvent it's own reverse
mapping scheme.

g.
