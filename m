Received: from mail-qe0-f41.google.com ([209.85.128.41]:47435 "EHLO
        mail-qe0-f41.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6818702Ab3IVVTdJrAai (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 22 Sep 2013 23:19:33 +0200
MIME-Version: 1.0
In-Reply-To: <1379510692-32435-2-git-send-email-treding@nvidia.com>
References: <1379510692-32435-1-git-send-email-treding@nvidia.com>
        <1379510692-32435-2-git-send-email-treding@nvidia.com>
Date: Sun, 22 Sep 2013 16:19:27 -0500
Message-ID: <CAL_JsqLE8aj511oF-gK7Gu5QfmHsQO3+oJ0KFkv0wmuo7i6eiw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] of/irq: Rework of_irq_count()
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <robherring2@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, sparclinux@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20130922211927.8VKMGzblvfwAmIaRQbCLsJDu-STBHzlWox9XFiiMV_0@z>

On Wed, Sep 18, 2013 at 8:24 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> The of_irq_to_resource() helper that is used to implement of_irq_count()
> tries to resolve interrupts and in fact creates a mapping for resolved
> interrupts. That's pretty heavy lifting for something that claims to
> just return the number of interrupts requested by a given device node.
>
> Instead, use the more lightweight of_irq_map_one(), which, despite the
> name, doesn't create an actual mapping. Perhaps a better name would be
> of_irq_translate_one().
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Rob Herring <rob.herring@calxeda.com>

> ---
>  drivers/of/irq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 1752988..5f44388 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -368,9 +368,10 @@ EXPORT_SYMBOL_GPL(of_irq_to_resource);
>   */
>  int of_irq_count(struct device_node *dev)
>  {
> +       struct of_irq irq;
>         int nr = 0;
>
> -       while (of_irq_to_resource(dev, nr, NULL))
> +       while (of_irq_map_one(dev, nr, &irq) == 0)
>                 nr++;
>
>         return nr;
> --
> 1.8.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
