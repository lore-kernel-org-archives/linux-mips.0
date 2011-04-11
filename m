Received: from iolanthe.rowland.org ([192.131.102.54]:58017 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1491143Ab1DKSyE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 11 Apr 2011 20:54:04 +0200
Date: Mon, 11 Apr 2011 14:53:53 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 2/3] USB: ehci: add workaround for Synopsys HC bug
In-Reply-To: <1302465900-16814-2-git-send-email-juhosg@openwrt.org>
Message-ID: <Pine.LNX.4.44L0.1104111452040.1975-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <stern+4dbee946@rowland.harvard.edu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Gabor Juhos <juhosg@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org
Message-ID: <20110411185353.xsP1KRKrMYoKLtFpTQYagIxXi-7rQS_0CtIihPg5mrY@z>

On Sun, 10 Apr 2011, Gabor Juhos wrote:

> A Synopsys USB core used in various SoCs has a bug which might cause
> that the host controller not issuing ping.
> 
> When software uses the Doorbell mechanism to remove queue heads, the
> host controller still has references to the removed queue head even
> after indicating an Interrupt on Async Advance. This happens if the last
> executed queue head's Next Link queue head is removed.
> 
> Consequences of the defect:
> The Host controller fetches the removed queue head, using memory that
> would otherwise be deallocated.This results in incorrect transactions on
> both the USB and system memory. This may result in undefined behavior.

> --- a/drivers/usb/host/ehci-q.c
> +++ b/drivers/usb/host/ehci-q.c
> @@ -1183,6 +1183,9 @@ static void end_unlink_async (struct ehci_hcd *ehci)
>  		ehci->reclaim = NULL;
>  		start_unlink_async (ehci, next);
>  	}
> +
> +	if (ehci->has_synopsys_hc_bug)
> +		writel((u32)ehci->async->qh_dma, &ehci->regs->async_next);
>  }

This should be ehci_writel(ehci, ...).

Alan Stern
