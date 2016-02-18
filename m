Received: from iolanthe.rowland.org ([192.131.102.54]:38368 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S27009767AbcBRQMpSMWyW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Feb 2016 17:12:45 +0100
Date: Thu, 18 Feb 2016 11:12:43 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [RFC v5 07/15] usb: ehci: add vbus-gpio parameter
In-Reply-To: <1455005641-7079-8-git-send-email-antonynpavlov@gmail.com>
Message-ID: <Pine.LNX.4.44L0.1602181111350.1280-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <stern+56d0b52a@rowland.harvard.edu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: linux-mips@linux-mips.org, Marek Vasut <marex@denx.de>, Wills Wang <wills.wang@live.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Alban Bedel <albeu@free.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20160218161243.yVUiXZIiNVwsBVqHSWahkZ42l-IEGdfaOZJy_3VUyIg@z>

On Tue, 9 Feb 2016, Antony Pavlov wrote:

> This patch retrieves and configures the vbus control gpio via
> the device tree.
> 
> This patch is based on a ehci-s5p.c commit fd81d59c90d38661
> ("USB: ehci-s5p: Add vbus setup function to the s5p ehci glue layer").
> 
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/usb/host/ehci-platform.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index bd7082f2..0d95ced 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -28,6 +28,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_gpio.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> @@ -142,6 +143,25 @@ static struct usb_ehci_pdata ehci_platform_defaults = {
>  	.power_off =		ehci_platform_power_off,
>  };
>  
> +static void setup_vbus_gpio(struct device *dev)
> +{
> +	int err;
> +	int gpio;
> +
> +	if (!dev->of_node)
> +		return;
> +
> +	gpio = of_get_named_gpio(dev->of_node, "vbus-gpio", 0);
> +	if (!gpio_is_valid(gpio))
> +		return;
> +
> +	err = devm_gpio_request_one(dev, gpio,
> +				GPIOF_OUT_INIT_HIGH | GPIOF_EXPORT_DIR_FIXED,
> +				"ehci_vbus_gpio");
> +	if (err)
> +		dev_err(dev, "can't request ehci vbus gpio %d", gpio);

I don't understand this.  If you get an error here, what's the point of 
allowing the probe to continue?  Shouldn't you return an error code so 
the probe will fail?

Alan Stern

> +}
> +
>  static int ehci_platform_probe(struct platform_device *dev)
>  {
>  	struct usb_hcd *hcd;
> @@ -174,6 +194,8 @@ static int ehci_platform_probe(struct platform_device *dev)
>  		return irq;
>  	}
>  
> +	setup_vbus_gpio(&dev->dev);
> +
>  	hcd = usb_create_hcd(&ehci_platform_hc_driver, &dev->dev,
>  			     dev_name(&dev->dev));
>  	if (!hcd)
> 
