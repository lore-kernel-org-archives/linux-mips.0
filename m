Received: from netrider.rowland.org ([192.131.102.5]:46806 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1493062Ab0AaCLs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 31 Jan 2010 03:11:48 +0100
Date: Sat, 30 Jan 2010 21:11:45 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 2/2] USB: add Broadcom 63xx integrated EHCI controller
 support.
In-Reply-To: <1264874071-28851-3-git-send-email-mbizon@freebox.fr>
Message-ID: <Pine.LNX.4.44L0.1001302110520.14199-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Maxime Bizon <mbizon@freebox.fr>
Cc: David Brownell <dbrownell@users.sourceforge.net>, linux-usb@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20100131021145.5rs8YKSQmurlhuhbUpVZdOm-Gx4jBU6C4-PFGncDecI@z>

On Sat, 30 Jan 2010, Maxime Bizon wrote:

> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> ---
>  drivers/usb/host/ehci-bcm63xx.c |  154 +++++++++++++++++++++++++++++++++++++++
>  drivers/usb/host/ehci-hcd.c     |    5 +
>  2 files changed, 159 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/usb/host/ehci-bcm63xx.c
> 
> diff --git a/drivers/usb/host/ehci-bcm63xx.c b/drivers/usb/host/ehci-bcm63xx.c
> new file mode 100644
> index 0000000..50638f7
> --- /dev/null
> +++ b/drivers/usb/host/ehci-bcm63xx.c

> +static const struct hc_driver ehci_bcm63xx_hc_driver = {
> +	.description =		hcd_name,
> +	.product_desc =		"BCM63XX integrated EHCI controller",
> +	.hcd_priv_size =	sizeof(struct ehci_hcd),
> +
> +	.irq =			ehci_irq,
> +	.flags =		HCD_MEMORY | HCD_USB2,
> +
> +	.reset =		ehci_bcm63xx_setup,
> +	.start =		ehci_run,
> +	.stop =			ehci_stop,
> +	.shutdown =		ehci_shutdown,
> +
> +	.urb_enqueue =		ehci_urb_enqueue,
> +	.urb_dequeue =		ehci_urb_dequeue,
> +	.endpoint_disable =	ehci_endpoint_disable,
> +
> +	.get_frame_number =	ehci_get_frame,
> +
> +	.hub_status_data =	ehci_hub_status_data,
> +	.hub_control =		ehci_hub_control,
> +	.bus_suspend =		ehci_bus_suspend,
> +	.bus_resume =		ehci_bus_resume,
> +	.relinquish_port =	ehci_relinquish_port,
> +	.port_handed_over =	ehci_port_handed_over,
> +};

You'll run into trouble if you don't include the standard 
endpoint_reset method pointer.

Alan Stern
