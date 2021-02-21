Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F3DC433E0
	for <linux-mips@archiver.kernel.org>; Sun, 21 Feb 2021 03:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E764164EF2
	for <linux-mips@archiver.kernel.org>; Sun, 21 Feb 2021 03:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhBUDHR (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 20 Feb 2021 22:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhBUDHN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 20 Feb 2021 22:07:13 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4661CC061574;
        Sat, 20 Feb 2021 19:06:32 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id CC4BD92009C; Sun, 21 Feb 2021 04:06:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id BCFAC92009B;
        Sun, 21 Feb 2021 04:06:30 +0100 (CET)
Date:   Sun, 21 Feb 2021 04:06:30 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Christoph Hellwig <hch@lst.de>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 1/6] MIPS/malta: simplify plat_setup_iocoherency
In-Reply-To: <20210210095641.23856-2-hch@lst.de>
Message-ID: <alpine.DEB.2.21.2102210403580.2021@angie.orcam.me.uk>
References: <20210210095641.23856-1-hch@lst.de> <20210210095641.23856-2-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 10 Feb 2021, Christoph Hellwig wrote:

> Given that plat_mem_setup runs before earlyparams are handled and malta
> selects CONFIG_DMA_MAYBE_COHERENT, coherentio can only be set to
> IO_COHERENCE_DEFAULT at this point.  So remove the checking for other
> options and merge plat_enable_iocoherency into plat_setup_iocoherency
> to simplify the code a bit.

Tested-by: Maciej W. Rozycki <macro@orcam.me.uk>

 FWIW,

  Maciej
