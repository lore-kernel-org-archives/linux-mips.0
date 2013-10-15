Received: from mail-wg0-f54.google.com ([74.125.82.54]:32852 "EHLO
        mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6827335Ab3JOWmysOYO9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Oct 2013 00:42:54 +0200
Received: by mail-wg0-f54.google.com with SMTP id c11so3617237wgh.21
        for <linux-mips@linux-mips.org>; Tue, 15 Oct 2013 15:42:48 -0700 (PDT)
From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2 01/10] of/irq: Rework of_irq_count()
In-Reply-To: <CAL_JsqLE8aj511oF-gK7Gu5QfmHsQO3+oJ0KFkv0wmuo7i6eiw@mail.gmail.com>
References: <1379510692-32435-1-git-send-email-treding@nvidia.com> <1379510692-32435-2-git-send-email-treding@nvidia.com> <CAL_JsqLE8aj511oF-gK7Gu5QfmHsQO3+oJ0KFkv0wmuo7i6eiw@mail.gmail.com>
Date: Tue, 15 Oct 2013 23:42:44 +0100
Message-ID: <20131015224245.0B071C40099@trevor.secretlab.ca>
Return-Path: <glikely@secretlab.ca>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robherring2@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, sparclinux@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20131015224244.NbYgXbu6a7ZgHxG7-SYyune4mV6AnsqnaRvdB_4rF1M@z>

On Sun, 22 Sep 2013 16:19:27 -0500, Rob Herring <robherring2@gmail.com> wrote:
> On Wed, Sep 18, 2013 at 8:24 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > The of_irq_to_resource() helper that is used to implement of_irq_count()
> > tries to resolve interrupts and in fact creates a mapping for resolved
> > interrupts. That's pretty heavy lifting for something that claims to
> > just return the number of interrupts requested by a given device node.
> >
> > Instead, use the more lightweight of_irq_map_one(), which, despite the
> > name, doesn't create an actual mapping. Perhaps a better name would be
> > of_irq_translate_one().
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> Acked-by: Rob Herring <rob.herring@calxeda.com>

Applied (and fixed to match the of_irq_map_one --> of_irq_parse_one
rename that I'm going to merge in v3.13).

g.

> 
> > ---
> >  drivers/of/irq.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index 1752988..5f44388 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -368,9 +368,10 @@ EXPORT_SYMBOL_GPL(of_irq_to_resource);
> >   */
> >  int of_irq_count(struct device_node *dev)
> >  {
> > +       struct of_irq irq;
> >         int nr = 0;
> >
> > -       while (of_irq_to_resource(dev, nr, NULL))
> > +       while (of_irq_map_one(dev, nr, &irq) == 0)
> >                 nr++;
> >
> >         return nr;
> > --
> > 1.8.4
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
