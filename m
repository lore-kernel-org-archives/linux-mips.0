Received: from mail-bl2on0092.outbound.protection.outlook.com ([65.55.169.92]:18655
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27011711AbbHGL4u0mKuo (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 7 Aug 2015 13:56:50 +0200
Date: Fri, 7 Aug 2015 13:56:22 +0200
From: Robert Richter <robert.richter@caviumnetworks.com>
Subject: Re: [PATCH 2/2] net, thunder, bgx: Add support for ACPI binding.
Message-ID: <20150807115622.GS4914@rric.localhost>
References: <1438907590-29649-1-git-send-email-ddaney.cavm@gmail.com>
 <1438907590-29649-3-git-send-email-ddaney.cavm@gmail.com>
 <55C467A0.4020601@linaro.org>
 <20150807104320.GQ1820@rric.localhost>
 <55C48DF9.70406@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55C48DF9.70406@linaro.org>
Return-Path: <Robert.Richter@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Tomasz Nowicki <tomasz.nowicki@linaro.org>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-mips@linux-mips.org, Sunil Goutham <sgoutham@cavium.com>, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20150807115622.5X620pZ1M0oiDcgKmzDijh_uGwFlNBCm4hIXpb0SJ4c@z>

On 07.08.15 12:52:41, Tomasz Nowicki wrote:
> On 07.08.2015 12:43, Robert Richter wrote:
> >On 07.08.15 10:09:04, Tomasz Nowicki wrote:
> >>On 07.08.2015 02:33, David Daney wrote:
> >
> >...
> >
> >>>+#else
> >>>+
> >>>+static int bgx_init_acpi_phy(struct bgx *bgx)
> >>>+{
> >>>+	return -ENODEV;
> >>>+}
> >>>+
> >>>+#endif /* CONFIG_ACPI */
> >>>+
> >>>  #if IS_ENABLED(CONFIG_OF_MDIO)
> >>>
> >>>  static int bgx_init_of_phy(struct bgx *bgx)
> >>>@@ -882,7 +1010,12 @@ static int bgx_init_of_phy(struct bgx *bgx)
> >>>
> >>>  static int bgx_init_phy(struct bgx *bgx)
> >>>  {
> >>>-	return bgx_init_of_phy(bgx);
> >>>+	int err = bgx_init_of_phy(bgx);
> >>>+
> >>>+	if (err != -ENODEV)
> >>>+		return err;
> >>>+
> >>>+	return bgx_init_acpi_phy(bgx);
> >>>  }
> >>>
> >>
> >>If kernel can work with DT and ACPI (both compiled in), it should take only
> >>one path instead of probing DT and ACPI sequentially. How about:
> >>
> >>@@ -902,10 +925,9 @@ static int bgx_probe(struct pci_dev *pdev, const struct
> >>pci_device_id *ent)
> >>  	bgx_vnic[bgx->bgx_id] = bgx;
> >>  	bgx_get_qlm_mode(bgx);
> >>
> >>-	snprintf(bgx_sel, 5, "bgx%d", bgx->bgx_id);
> >>-	np = of_find_node_by_name(NULL, bgx_sel);
> >>-	if (np)
> >>-		bgx_init_of(bgx, np);
> >>+	err = acpi_disabled ? bgx_init_of_phy(bgx) : bgx_init_acpi_phy(bgx);
> >>+	if (err)
> >>+		goto err_enable;
> >>
> >>  	bgx_init_hw(bgx);
> >
> >I would not pollute bgx_probe() with acpi and dt specifics, and instead
> >keep bgx_init_phy(). The typical design pattern for this is:
> >
> >static int bgx_init_phy(struct bgx *bgx)
> >{
> >#ifdef CONFIG_ACPI
> >         if (!acpi_disabled)
> >                 return bgx_init_acpi_phy(bgx);
> >#endif
> >         return bgx_init_of_phy(bgx);
> >}
> >
> >This adds acpi runtime detection (acpi=no), does not call dt code in
> >case of acpi, and saves the #else for bgx_init_acpi_phy().
> >
> 
> I am fine with keeping it in bgx_init_phy(), however we can drop there
> #ifdefs since both of bgx_init_{acpi,of}_phy calls have empty stub for !ACPI
> and !OF case. Like that:
> 
> static int bgx_init_phy(struct bgx *bgx)
> {
> 
>         if (!acpi_disabled)
>                 return bgx_init_acpi_phy(bgx);
> 	else
>         	return bgx_init_of_phy(bgx);
> }

As said, keeping it in #ifdefs makes the empty stub function for !acpi
obsolete, which makes the code smaller and better readable. This style
is common practice in the kernel. Apart from that, the 'else' should
be dropped as it is useless.

-Robert
