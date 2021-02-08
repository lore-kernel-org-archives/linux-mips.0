Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FDBC433E0
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 16:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F60564E84
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 16:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhBHQLl (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 8 Feb 2021 11:11:41 -0500
Received: from verein.lst.de ([213.95.11.211]:42007 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233278AbhBHQLh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Feb 2021 11:11:37 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 0A05D67373; Mon,  8 Feb 2021 17:10:44 +0100 (CET)
Date:   Mon, 8 Feb 2021 17:10:43 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
Message-ID: <20210208161043.GA14083@lst.de>
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-6-hch@lst.de> <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 08, 2021 at 04:57:33PM +0100, Maciej W. Rozycki wrote:
> > diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
> > index e98cc977a735b2..f8c9663e7faa10 100644
> > --- a/arch/mips/mti-malta/malta-setup.c
> > +++ b/arch/mips/mti-malta/malta-setup.c
> > @@ -143,7 +143,7 @@ static void __init plat_setup_iocoherency(void)
> >  			pr_crit("IOCU OPERATION DISABLED BY SWITCH - DEFAULTING TO SW IO COHERENCY\n");
> >  	}
> >  
> > -	if (supported)
> > +	if (supported) {
> >  		if (dma_force_noncoherent) {
> >  			pr_info("Hardware DMA cache coherency disabled\n");
> >  			return;
> 
>  I think this has to go with 1/6; otherwise compilation breaks between 
> then and now AFAICT.

Indeed.

>  Do you need to have this verified anyhow?  I only have a non-coherent 5Kc 
> Malta though.

If you get a chance to test this logic, that would be great.
