Return-Path: <SRS0=ffv7=EM=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C919C2D0A3
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 10:54:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03FBD208B3
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 10:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgKFKx5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 6 Nov 2020 05:53:57 -0500
Received: from elvis.franken.de ([193.175.24.41]:41179 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbgKFKx4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Nov 2020 05:53:56 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kazNR-0000vt-03; Fri, 06 Nov 2020 11:53:53 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 09430C4DDA; Fri,  6 Nov 2020 11:50:01 +0100 (CET)
Date:   Fri, 6 Nov 2020 11:50:00 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: Vr41xx: add missing iounmap() on error in
 vr41xx_pciu_init()
Message-ID: <20201106105000.GE9806@alpha.franken.de>
References: <20201028091548.136303-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028091548.136303-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 28, 2020 at 05:15:48PM +0800, Qinglang Miao wrote:
> add missing iounmap() of pciu_base on error when failed to init
> io_map_base.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  arch/mips/pci/pci-vr41xx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
