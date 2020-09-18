Return-Path: <SRS0=xoWx=C3=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47353C43466
	for <linux-mips@archiver.kernel.org>; Fri, 18 Sep 2020 13:57:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F7B623788
	for <linux-mips@archiver.kernel.org>; Fri, 18 Sep 2020 13:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgIRN5e (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 18 Sep 2020 09:57:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:44585 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgIRN5d (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 09:57:33 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kJGtH-0002UB-00; Fri, 18 Sep 2020 15:57:31 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D465FC0FDF; Fri, 18 Sep 2020 15:56:20 +0200 (CEST)
Date:   Fri, 18 Sep 2020 15:56:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qilong Zhang <zhangqilong3@huawei.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: pci: use
 devm_platform_ioremap_resource_byname
Message-ID: <20200918135620.GF19202@alpha.franken.de>
References: <20200917074622.42298-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917074622.42298-1-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 17, 2020 at 03:46:22PM +0800, Qilong Zhang wrote:
> From: Zhang Qilong <zhangqilong3@huawei.com>
> 
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  arch/mips/pci/pci-ar2315.c | 5 ++---
>  arch/mips/pci/pci-ar71xx.c | 4 ++--
>  arch/mips/pci/pci-ar724x.c | 9 +++------
>  3 files changed, 7 insertions(+), 11 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
