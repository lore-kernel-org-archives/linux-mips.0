Return-Path: <SRS0=U64L=6F=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE50C54FC9
	for <linux-mips@archiver.kernel.org>; Tue, 21 Apr 2020 18:31:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CB7C206F4
	for <linux-mips@archiver.kernel.org>; Tue, 21 Apr 2020 18:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgDUSb3 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 21 Apr 2020 14:31:29 -0400
Received: from elvis.franken.de ([193.175.24.41]:49506 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbgDUSb3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 14:31:29 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jQxg7-0003e1-00; Tue, 21 Apr 2020 20:31:27 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 28A08C024B; Tue, 21 Apr 2020 20:31:11 +0200 (CEST)
Date:   Tue, 21 Apr 2020 20:31:11 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     broonie@kernel.org, linux-mips@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: txx9: add back the hack for a too small
 resource_size_t
Message-ID: <20200421183111.GA20471@alpha.franken.de>
References: <20200421171136.288216-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421171136.288216-1-hch@lst.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 21, 2020 at 07:11:36PM +0200, Christoph Hellwig wrote:
> Looks like I misread the Kconfig magic and this driver can be compiled
> into 32-bit kernels.  Add back the hack to extent the range of the
> resource_size_t, and include the header with the txx9-specific ioremap
> magic for that.
> 
> Fixes: acfaaf52ebfd ("ASoC: txx9: don't work around too small resource_size_t")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  sound/soc/txx9/txx9aclc-ac97.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
