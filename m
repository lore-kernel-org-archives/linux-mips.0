Received: from mail-yi0-f49.google.com ([209.85.218.49]:59810 "EHLO
        mail-yi0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491038Ab1BXJzt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 Feb 2011 10:55:49 +0100
Subject: Re: [PATCH v5] EHCI bus glue for on-chip PMC MSP USB controller
From: Anoop P A <anoop.pa@gmail.com>
In-Reply-To: <20110223170205.GE19898@bicker>
References: <4D5ABB65.3090101@parrot.com>
         <1298388933-13707-1-git-send-email-anoop.pa@gmail.com>
         <20110222200427.GB1966@bicker> <1298467343.9950.119.camel@paanoop1-desktop>
         <20110223170205.GE19898@bicker>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 24 Feb 2011 15:49:15 +0530
Message-ID: <1298542755.9950.277.camel@paanoop1-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <anoop.pa@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Dan Carpenter <error27@gmail.com>
Cc: "gregkh @ suse . de" <gregkh@suse.de>, "dbrownell @ users . sourceforge . net" <dbrownell@users.sourceforge.net>, "stern @ rowland . harvard . edu" <stern@rowland.harvard.edu>, "pkondeti @ codeaurora . org" <pkondeti@codeaurora.org>, "jacob . jun . pan @ intel . com" <jacob.jun.pan@intel.com>, "linux-usb @ vger . kernel . org" <linux-usb@vger.kernel.org>, "alek . du @ intel . com" <alek.du@intel.com>, "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>, "gadiyar @ ti . com" <gadiyar@ti.com>, "ralf @ linux-mips . org" <ralf@linux-mips.org>, "linux-mips @ linux-mips . org" <linux-mips@linux-mips.org>, Greg KH <greg@kroah.com>
Message-ID: <20110224101915.hexks7l6QMmJ4NYjgml7WpF7kWuRxx1-kKVDNO7k8ck@z>

On Wed, 2011-02-23 at 20:02 +0300, Dan Carpenter wrote:
> > > It doesn't compile so I can't test this, but I think that this will
> > > cause a sparse warning.  "base" should have an __iomem tag.  Please
> > > run sparse on this driver.
> > Looks like mips platform build has been broken on linux-next ( unable to
> > configure) . However I have tested code with linux-queue tree ( mips)
> > and didn't see any such warnings
> 
> Sparse is an external tool.  You have to install it and build with
> make C=1 drivers/usb/file.o
Ok. I found there was some issue in arch/mips/Makefile CHECKFLAGS
> 
> > > > +	temp = HCS_N_CC(ehci->hcs_params) * HCS_N_PCC(ehci->hcs_params);
> > > > +	temp &= 0x0f;
> > > 
> > > companion HCs * ports per CC & 0xf?
> > > 
> > > What's the &= 0x0f for?  It's left out of the printk.
> > Code got carried forward from ehci-pci.c . Is that says ehci-pci.c is
> > uptodate? .  
> 
> My guess is that ehci-pci.c is buggy.  Anyway this is just a work around
> to handle buggy hardware.  Since the code here just prints some debug
> output and doesn't do the work arounds we might as well remove the whole
> thing?  It seems unlikely that your mips hardware will have the same
> bug.
Ok I will remove the code block

> 
> > > > +static int ehci_msp_suspend(struct device *dev)
> > > > +{
> > > > +	struct usb_hcd *hcd = dev_get_drvdata(dev);
> > > > +	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
> > > > +	unsigned long flags;
> > > > +	int rc;
> > > > +
> > > > +	return 0;
> > > > +	rc = 0;
> > > > +
> > > > +	if (time_before(jiffies, ehci->next_statechange))
> > > > +		usleep(10000);
> > > 
> > > Is there still a usleep() function?  Either way, can you send us
> > > something that compiles on linux-next?
> > Again code got carried from ehci-pci.c .(changed msleep to usleep as
> > checkpatch complained about it). I am unable to compile mips targets in
> > linux-next tree . However this patch is tested with both linux-stable
> > and linux-queue tree of l-m-o
> 
> checkpatch.pl complains because msleep() is not accurate for tiny
> amounts of time.  There is no usleep() function because trying to be
> that accurate is a lot of work and causes a lot of interrupts.  There
> is a usleep_range() function instead which lets the scheduler group
> wakeups together.  This is documented in
> Documentation/timers/timers-howto.txt
> 
> Also this is dead code.  No one will complain, if you just delete it.
You mean entire ehci_msp_suspend() ??

> 
> regards,
> dan carpenter
