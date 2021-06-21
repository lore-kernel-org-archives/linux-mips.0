Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4D7C49EA2
	for <linux-mips@archiver.kernel.org>; Mon, 21 Jun 2021 09:54:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 093B060FF4
	for <linux-mips@archiver.kernel.org>; Mon, 21 Jun 2021 09:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhFUJ40 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 21 Jun 2021 05:56:26 -0400
Received: from elvis.franken.de ([193.175.24.41]:40939 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFUJ4Z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Jun 2021 05:56:25 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lvGd7-000490-00; Mon, 21 Jun 2021 11:54:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B8F82C0698; Mon, 21 Jun 2021 11:44:43 +0200 (CEST)
Date:   Mon, 21 Jun 2021 11:44:43 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: OCTEON: octeon-usb: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20210621094443.GA4425@alpha.franken.de>
References: <20210605075537.2046896-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210605075537.2046896-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 05, 2021 at 03:55:37PM +0800, Yang Yingliang wrote:
> Remove unneeded error handling on the result of a call
> to platform_get_resource() when the value is passed to
> devm_ioremap_resource().
> 
> And use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  arch/mips/cavium-octeon/octeon-usb.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
