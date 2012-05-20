Received: from mail-pz0-f49.google.com ([209.85.210.49]:58043 "EHLO
        mail-pz0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903258Ab2ETFQ7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 20 May 2012 07:16:59 +0200
Received: by dadm1 with SMTP id m1so6272013dad.36
        for <linux-mips@linux-mips.org>; Sat, 19 May 2012 22:16:53 -0700 (PDT)
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V3 16/17] SPI: MIPS: lantiq: add FALCON spi driver
In-Reply-To: <1337025642-31194-1-git-send-email-blogic@openwrt.org>
References: <1337025642-31194-1-git-send-email-blogic@openwrt.org>
Date: Sat, 19 May 2012 23:16:51 -0600
Message-ID: <20120520051651.388013E03B8@localhost>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: John Crispin <blogic@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, spi-devel-general@lists.sourceforge.net, Thomas Langer <thomas.langer@lantiq.com>
Message-ID: <20120520051651._Kzd1X8ExuOgfztKToxHhaAdQvhUgbNIdH7rNWTFsVA@z>

On Mon, 14 May 2012 22:00:42 +0200, John Crispin <blogic@openwrt.org> wrote:
> From: Thomas Langer <thomas.langer@lantiq.com>
> 
> The external bus unit (EBU) found on the FALCON SoC has spi emulation that is
> designed for serial flash access. This driver has only been tested with m25p80
> type chips. The hardware has no support for other types of spi peripherals.
> 
> Signed-off-by: Thomas Langer <thomas.langer@lantiq.com>
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: spi-devel-general@lists.sourceforge.net
> ---
> This patch was previously Acked in V2 by Grant
> http://www.mail-archive.com/spi-devel-general@lists.sourceforge.net/msg07874.html

Which mostly stands except for (something I didn't notice before)....

> +static int __devinit falcon_sflash_probe(struct platform_device *pdev)
> +{
> +	struct falcon_sflash *priv;
> +	const __be32 *prop;
> +	struct spi_master *master;
> +	int ret, len;
> +
> +	if (ltq_boot_select() != BS_SPI) {
> +		dev_err(&pdev->dev, "invalid bootstrap options\n");
> +		return -ENODEV;
> +	}
> +
> +	master = spi_alloc_master(&pdev->dev, sizeof(*priv));
> +	if (!master)
> +		return -ENOMEM;
> +
> +	priv = spi_master_get_devdata(master);
> +	priv->master = master;
> +
> +	master->mode_bits = SPI_MODE_3;
> +	master->num_chipselect = 1;
> +	master->bus_num = -1;
> +	master->setup = falcon_sflash_setup;
> +	master->prepare_transfer_hardware = falcon_sflash_prepare_xfer;
> +	master->transfer_one_message = falcon_sflash_xfer_one;
> +	master->unprepare_transfer_hardware = falcon_sflash_unprepare_xfer;
> +	master->dev.of_node = pdev->dev.of_node;
> +
> +	prop = of_get_property(pdev->dev.of_node, "busnum", &len);
> +	if (prop && (len == sizeof(*prop)))
> +		master->bus_num = be32_to_cpup(prop);

Drop this bit.  spi bus numbers are dynamically assigned for DT usage.
Using a property to override the bus number should not be done.

Userspace can determine the bus number for a given device from sysfs.

If you still **really** need a bus to have a specific number, then the
correct way of handling it is to use a property in the /aliases node,
and there is some infrastructure in drivers/of/base.c.  Look for
of_alias_get_id().

g.
