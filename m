Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF7EC433DB
	for <linux-mips@archiver.kernel.org>; Wed, 20 Jan 2021 07:30:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FC1723131
	for <linux-mips@archiver.kernel.org>; Wed, 20 Jan 2021 07:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbhATHad (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 20 Jan 2021 02:30:33 -0500
Received: from elvis.franken.de ([193.175.24.41]:38033 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728329AbhATHaP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Jan 2021 02:30:15 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l27vo-0005ye-01; Wed, 20 Jan 2021 08:29:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9E1B5C0A90; Tue, 19 Jan 2021 23:07:18 +0100 (CET)
Date:   Tue, 19 Jan 2021 23:07:18 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: IRQ: Add prototype for function init_IRQ
Message-ID: <20210119220718.GB16804@alpha.franken.de>
References: <20210118132009.2642893-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118132009.2642893-1-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 18, 2021 at 09:20:09PM +0800, Yanteng Si wrote:
> This commit adds a prototype to fix error at W=1:
> 
> arch/mips/kernel/irq.c:52:13: error: no previous prototype for
> 'init_IRQ' [-Werror=missing-prototypes]
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/include/asm/irq.h | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
