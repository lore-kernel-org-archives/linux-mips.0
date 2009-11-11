Received: from fg-out-1718.google.com ([72.14.220.154]:23109 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org
	with ESMTP id S1492533AbZKKLyY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 11 Nov 2009 12:54:24 +0100
From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 2/2] au1000-eth: convert to platform_driver model
Date: Wed, 11 Nov 2009 12:54:15 +0100
References: <200911100113.38685.florian@openwrt.org> <f861ec6f0911100120j12d86b0cs3ef9c2816019eaf9@mail.gmail.com>
In-Reply-To: <f861ec6f0911100120j12d86b0cs3ef9c2816019eaf9@mail.gmail.com>
MIME-Version: 1.0
Reply-To: Florian Fainelli <florian@openwrt.org>
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Message-ID: <200911111254.16500.florian@openwrt.org>
Return-Path: <f.fainelli@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips <linux-mips@linux-mips.org>, netdev@vger.kernel.org, David Miller <davem@davemloft.net>
Message-ID: <20091111115415.e_-l5OxZl7NdWf5albgFCHhv5sIfik0nmzV_mZNuJZw@z>

Hi Manuel,

On Tuesday 10 November 2009 10:20:25 Manuel Lauss wrote:
> Hi Florian,
> 
> On Tue, Nov 10, 2009 at 1:13 AM, Florian Fainelli <florian@openwrt.org> 
wrote:
> > This patch converts the au1000-eth driver to become a full
> > platform-driver as it ought to be. We now pass PHY-speficic
> > configurations through platform_data but for compatibility
> > the driver still assumes the default settings (search for PHY1 on
> > MAC0) when no platform_data is passed. Tested on my MTX-1 board.
[snip]
> >
> > -                       phydev = tmp_phydev;
> > -                       break; /* found it */
> > +               if (aup->phy1_search_mac0) {
> > +                       /* try harder to find a PHY */
> > +                       if (!phydev && (aup->mac_id == 1)) {
> > +                               /* no PHY found, maybe we have a dual
> > PHY? */ +                               printk (KERN_INFO DRV_NAME ": no
> > PHY found on MAC1, " +                                       "let's see
> > if it's attached to MAC0...\n"); +
> > +                               /* find the first (lowest address)
> > non-attached PHY on +                                * the MAC0 MII bus
> > */
> > +                               for (phy_addr = 0; phy_addr <
> > PHY_MAX_ADDR; phy_addr++) { +                                       if
> > (aup->mac_id == 1)
> > +                                               break;
> 
> aup->mac_id needs to be 1 for this loop to be executed in the first
> place, and here
> you immediately bail out if it is.
