Received: from iolanthe.rowland.org ([192.131.102.54]:41893 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S6833254Ab3A1UPa4J012 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 28 Jan 2013 21:15:30 +0100
Date: Mon, 28 Jan 2013 15:15:29 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 08/13] MIPS: BCM63XX: introduce BCM63XX_EHCI configuration
 symbol
In-Reply-To: <5106D80C.7050508@openwrt.org>
Message-ID: <Pine.LNX.4.44L0.1301281512190.1997-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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
To: Florian Fainelli <florian@openwrt.org>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, linux-mips@linux-mips.org, ralf@linux-mips.org, jogo@openwrt.org, mbizon@freebox.fr, blogic@openwrt.org
Message-ID: <20130128201529.f-j_STfjVtCtmQdwHhLPXXuIhNoVe-9t0vvJb2AarDQ@z>

On Mon, 28 Jan 2013, Florian Fainelli wrote:

> >> --- a/drivers/usb/host/Kconfig
> >> +++ b/drivers/usb/host/Kconfig
> >> @@ -115,14 +115,15 @@ config USB_EHCI_BIG_ENDIAN_MMIO
> >>       depends on USB_EHCI_HCD && (PPC_CELLEB || PPC_PS3 || 440EPX || \
> >>                       ARCH_IXP4XX || XPS_USB_HCD_XILINX || \
> >>                       PPC_MPC512x || CPU_CAVIUM_OCTEON || \
> >> -                    PMC_MSP || SPARC_LEON || MIPS_SEAD3)
> >> +                    PMC_MSP || SPARC_LEON || MIPS_SEAD3 || \
> >> +                    BCM63XX)
> >>       default y
> >
> > This is a complete mess.
> >
> > Can we get rid of the 'default y' and all those things after the '&&',
> > and select USB_EHCI_BIG_ENDIAN_MMIO in the board Kconfig files?
> 
> Yes, pretty much like what exists for OHCI, scales much better.
> 
> >
> > I am as guilty as anyone here (see || CPU_CAVIUM_OCTEON above).  But
> > this doesn't seem sustainable.  We should be trying to keep the
> > configuration information for all this in one spot.
> >
> > Now you have it spread across two files.  One to enable it, and the
> > other to select it.  But do you really need to select it if it defaults
> > to 'y'
> 
> I do agree with you, but I don't want this patchset to be blocked by the 
> removal of the depends on (FOO && BAR && ...), but I can send a 
> preliminary patch for this and get it merged with Greg's tree first.

If you decide to do this, consider the discussion starting here:

	http://marc.info/?l=linux-usb&m=135886919810940&w=2

As far as I know, there is no good reason for keeping the 
USB_ARCH_HAS_EHCI symbol at all.  And the glue drivers can select 
USB_EHCI_HCD instead of depending on it.

Alan Stern
