Return-Path: <SRS0=JnEF=6O=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13815C4724C
	for <linux-mips@archiver.kernel.org>; Thu, 30 Apr 2020 15:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE5E820873
	for <linux-mips@archiver.kernel.org>; Thu, 30 Apr 2020 15:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgD3PLh (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 30 Apr 2020 11:11:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:33618 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726453AbgD3PLh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 11:11:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jUAqa-0005Uk-01; Thu, 30 Apr 2020 17:11:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3C5EBC0360; Thu, 30 Apr 2020 17:06:34 +0200 (CEST)
Date:   Thu, 30 Apr 2020 17:06:34 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V3 1/2] MIPS: perf: Add hardware perf events support for
 new Loongson-3
Message-ID: <20200430150634.GB17822@alpha.franken.de>
References: <1588239917-23054-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588239917-23054-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 05:45:16PM +0800, Huacai Chen wrote:
> New Loongson-3 means Loongson-3A R2 (Loongson-3A2000) and newer CPUs.
> Loongson-3 processors have three types of PMU types (so there are three
> event maps): Loongson-3A1000/Loonngson-3B1000/Loongson-3B1500 is Type-1,
> Loongson-3A2000/Loongson-3A3000 is Type-2, Loongson-3A4000+ is Type-3.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  .../asm/mach-loongson64/cpu-feature-overrides.h    |   1 +
>  arch/mips/kernel/perf_event_mipsxx.c               | 365 +++++++++++++++++++--

I've folded your second patch into this one and applied it to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
