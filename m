Received: from mail-wy0-f177.google.com ([74.125.82.177]:45252 "EHLO
        mail-wy0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1490981Ab1BXL2y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 Feb 2011 12:28:54 +0100
Date: Thu, 24 Feb 2011 14:28:19 +0300
From: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5] EHCI bus glue for on-chip PMC MSP USB controller
Message-ID: <20110224110138.GA28665@bicker>
References: <4D5ABB65.3090101@parrot.com>
 <1298388933-13707-1-git-send-email-anoop.pa@gmail.com>
 <20110222200427.GB1966@bicker>
 <1298467343.9950.119.camel@paanoop1-desktop>
 <20110223170205.GE19898@bicker>
 <1298542755.9950.277.camel@paanoop1-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1298542755.9950.277.camel@paanoop1-desktop>
Return-Path: <error27@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Anoop P A <anoop.pa@gmail.com>
Cc: "gregkh @ suse . de" <gregkh@suse.de>, "dbrownell @ users . sourceforge . net" <dbrownell@users.sourceforge.net>, "stern @ rowland . harvard . edu" <stern@rowland.harvard.edu>, "pkondeti @ codeaurora . org" <pkondeti@codeaurora.org>, "jacob . jun . pan @ intel . com" <jacob.jun.pan@intel.com>, "linux-usb @ vger . kernel . org" <linux-usb@vger.kernel.org>, "alek . du @ intel . com" <alek.du@intel.com>, "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>, "gadiyar @ ti . com" <gadiyar@ti.com>, "ralf @ linux-mips . org" <ralf@linux-mips.org>, "linux-mips @ linux-mips . org" <linux-mips@linux-mips.org>, Greg KH <greg@kroah.com>
Message-ID: <20110224112819.PYghLSJt1iaxHEMOckUJuS8oHI9KRw0V9zYdWKsGQxQ@z>

On Thu, Feb 24, 2011 at 03:49:15PM +0530, Anoop P A wrote:
> > Also this is dead code.  No one will complain, if you just delete it.
> You mean entire ehci_msp_suspend() ??
> 

Sure why not?  It's not really ready to submit.  People can't complain
about it if you don't submit it.

(Understand that I'm from the peanut gallery.  I'm not in anyway a 
maintainer of this code and my suggestions carry very little weight).

regards,
dan carpenter
