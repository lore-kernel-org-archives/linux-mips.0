Received: from mail-lf0-f42.google.com ([209.85.215.42]:34289 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012967AbcBRRlJNxi6y convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 18 Feb 2016 18:41:09 +0100
Received: by mail-lf0-f42.google.com with SMTP id j78so37688169lfb.1
        for <linux-mips@linux-mips.org>; Thu, 18 Feb 2016 09:41:09 -0800 (PST)
Date: Thu, 18 Feb 2016 21:06:52 +0300
From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [RFC v5 07/15] usb: ehci: add vbus-gpio parameter
Message-ID: <20160218210652.68ae464eed8ddbffd33e7a02@gmail.com>
In-Reply-To: <Pine.LNX.4.44L0.1602181111350.1280-100000@iolanthe.rowland.org>
References: <1455005641-7079-8-git-send-email-antonynpavlov@gmail.com>
        <Pine.LNX.4.44L0.1602181111350.1280-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <antonynpavlov@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alan Stern <stern@rowland.harvard.edu>, Marek Vasut <marex@denx.de>
Cc: linux-mips@linux-mips.org, Wills Wang <wills.wang@live.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Alban Bedel <albeu@free.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20160218180652.5uBD7BXZPqGt8RnpAHnfVO9zdqFKceRTBVK4F08F96k@z>

On Thu, 18 Feb 2016 11:12:43 -0500 (EST)
Alan Stern <stern@rowland.harvard.edu> wrote:

> On Tue, 9 Feb 2016, Antony Pavlov wrote:
> 
> > This patch retrieves and configures the vbus control gpio via
> > the device tree.
> > 
> > This patch is based on a ehci-s5p.c commit fd81d59c90d38661
> > ("USB: ehci-s5p: Add vbus setup function to the s5p ehci glue layer").
> > 
> > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  drivers/usb/host/ehci-platform.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> > index bd7082f2..0d95ced 100644
> > --- a/drivers/usb/host/ehci-platform.c
> > +++ b/drivers/usb/host/ehci-platform.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_gpio.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset.h>
> > @@ -142,6 +143,25 @@ static struct usb_ehci_pdata ehci_platform_defaults = {
> >  	.power_off =		ehci_platform_power_off,
> >  };
> >  
> > +static void setup_vbus_gpio(struct device *dev)
> > +{
> > +	int err;
> > +	int gpio;
> > +
> > +	if (!dev->of_node)
> > +		return;
> > +
> > +	gpio = of_get_named_gpio(dev->of_node, "vbus-gpio", 0);
> > +	if (!gpio_is_valid(gpio))
> > +		return;
> > +
> > +	err = devm_gpio_request_one(dev, gpio,
> > +				GPIOF_OUT_INIT_HIGH | GPIOF_EXPORT_DIR_FIXED,
> > +				"ehci_vbus_gpio");
> > +	if (err)
> > +		dev_err(dev, "can't request ehci vbus gpio %d", gpio);
>
>
> I don't understand this.  If you get an error here, what's the point of 
> allowing the probe to continue?  Shouldn't you return an error code so 
> the probe will fail?

Please ignore the 'usb: ehci: add vbus-gpio parameter' patch!

In the new AR9331 patchseries I use chipidea USB driver (thanks to Marek for the suggestion)
in the AR9331 dtsi-file:

        usb: usb@1b000100 {
                compatible = "chipidea,usb2";
                reg = <0x1b000000 0x200>;

                interrupt-parent = <&cpuintc>;
                interrupts = <3>;
                resets = <&rst 5>;

                phy-names = "usb-phy";
                phys = <&usb_phy>;

                status = "disabled";
        };


so I use regulator in the TL-MR3020 board dts file:

        reg_usb_vbus: reg_usb_vbus {
                compatible = "regulator-fixed";
                regulator-name = "usb_vbus";
                regulator-min-microvolt = <5000000>;
                regulator-max-microvolt = <5000000>;
                gpio = <&gpio 8 GPIO_ACTIVE_HIGH>;
                enable-active-high;
        };

&usb {
        dr_mode = "host";
        vbus-supply = <&reg_usb_vbus>;
        status = "okay";
};

As a result there is no need in adding vbus-gpio parameter to ehci anymore!

> > +}
> > +
> >  static int ehci_platform_probe(struct platform_device *dev)
> >  {
> >  	struct usb_hcd *hcd;
> > @@ -174,6 +194,8 @@ static int ehci_platform_probe(struct platform_device *dev)
> >  		return irq;
> >  	}
> >  
> > +	setup_vbus_gpio(&dev->dev);
> > +
> >  	hcd = usb_create_hcd(&ehci_platform_hc_driver, &dev->dev,
> >  			     dev_name(&dev->dev));
> >  	if (!hcd)
> > 
> 


-- 
-- 
Best regards,
  Antony Pavlov
