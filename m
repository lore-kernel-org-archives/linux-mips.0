Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000D8C2D0E4
	for <linux-mips@archiver.kernel.org>; Tue, 17 Nov 2020 12:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99EE2207D3
	for <linux-mips@archiver.kernel.org>; Tue, 17 Nov 2020 12:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgKQMZ3 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 17 Nov 2020 07:25:29 -0500
Received: from elvis.franken.de ([193.175.24.41]:38160 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgKQMZ2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Nov 2020 07:25:28 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kf034-0002XL-00; Tue, 17 Nov 2020 13:25:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3735EC0219; Tue, 17 Nov 2020 13:00:59 +0100 (CET)
Date:   Tue, 17 Nov 2020 13:00:59 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: Fix memleak in alchemy_clk_setup_cpu
Message-ID: <20201117120059.GA10905@alpha.franken.de>
References: <20201113131856.2100236-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113131856.2100236-1-zhangqilong3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 13, 2020 at 09:18:56PM +0800, Zhang Qilong wrote:
> If the clk_register fails, we should free h before
> function returns to prevent memleak.
> 
> Fixes: 474402291a0ad ("MIPS: Alchemy: clock framework integration of onchip clocks")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  arch/mips/alchemy/common/clock.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
