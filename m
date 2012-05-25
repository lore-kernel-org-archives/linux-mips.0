Received: from mail-pz0-f49.google.com ([209.85.210.49]:62226 "EHLO
        mail-pz0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903640Ab2EZNMU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 26 May 2012 15:12:20 +0200
Received: by dadm1 with SMTP id m1so2579720dad.36
        for <linux-mips@linux-mips.org>; Sat, 26 May 2012 06:12:13 -0700 (PDT)
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V5 16/17] SPI: MIPS: lantiq: add FALCON spi driver
In-Reply-To: <1337521579-1597-1-git-send-email-blogic@openwrt.org>
References: <1337521579-1597-1-git-send-email-blogic@openwrt.org>
Date: Fri, 25 May 2012 17:38:45 -0600
Message-ID: <20120525233845.BD93C3E0BD2@localhost>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: John Crispin <blogic@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, spi-devel-general@lists.sourceforge.net, Thomas Langer <thomas.langer@lantiq.com>
Message-ID: <20120525233845.m1kwx3ZHfvhOY-YqiAzcQYFgCmrfN3Q5ESbeRM_DtHo@z>

On Sun, 20 May 2012 15:46:19 +0200, John Crispin <blogic@openwrt.org> wrote:
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
> This patch is part of a series moving the mips/lantiq target to OF and clkdev
> support. The patch, once Acked, should go upstream via Ralf's MIPS tree.
> 
> Changes in V5
> * drop duplicate busnum assignment
> 
> Changes in V4
> * drop busnum property
> 
> Changes in V3
> * rephrase spi->SPI
> * fix rate detection
> * adds support for transfer_one & co
> * adds of support
> 
> Changes in V2
> * remove several superflous calls to dev_dbg
> * make use of module_platform_driver
> * remove falcon_spi_cleanup as it was an empty function
> * return real error codes instead of -1
> * fixes operator spacing errors
> * split arch and driver specific patches
> * squash some lines to make use of the full 80 available chars
> * Kconfig is now alphabetic again
> * replace BUG() with WARN_ON()
> ---
>  drivers/spi/Kconfig      |    9 +
>  drivers/spi/Makefile     |    1 +
>  drivers/spi/spi-falcon.c |  469 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 479 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/spi/spi-falcon.c
> 
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 00c0240..62b2b5e 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -144,6 +144,15 @@ config SPI_EP93XX
>  	  This enables using the Cirrus EP93xx SPI controller in master
>  	  mode.
>  
> +config SPI_FALCON
> +	tristate "Falcon SPI controller support"
> +	depends on SOC_FALCON
> +	help
> +	  The external bus unit (EBU) found on the FALC-ON SoC has SPI
> +	  emulation that is designed for serial flash access. This driver
> +	  has only been tested with m25p80 type chips. The hardware has no
> +	  support for other types of SPI peripherals.

What exactly does this mean?  How does it not support any other type
of SPI peripheral?  SPI is a really simple protocol, so what is it
about this hardware that prevents it being used with other SPI
hardware?

I see a big state machine that appears to interpret the messages and
pretend to be an SPI slave instead of telling linux about the real
device.  /me wonders if it should this instead be a block device
driver?

> +static int falcon_sflash_prepare_xfer(struct spi_master *master)
> +{
> +	return 0;
> +}
> +
> +static int falcon_sflash_unprepare_xfer(struct spi_master *master)
> +{
> +	return 0;
> +}

Don't use empty hooks.  Just leave them uninitialized.  The core will
do the right thing.
