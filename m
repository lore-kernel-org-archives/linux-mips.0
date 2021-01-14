Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF308C433E0
	for <linux-mips@archiver.kernel.org>; Thu, 14 Jan 2021 16:23:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1EF523B40
	for <linux-mips@archiver.kernel.org>; Thu, 14 Jan 2021 16:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbhANQXP (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 14 Jan 2021 11:23:15 -0500
Received: from elvis.franken.de ([193.175.24.41]:51434 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbhANQXP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 Jan 2021 11:23:15 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l05OK-0001bI-01; Thu, 14 Jan 2021 17:22:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EC71BC0325; Thu, 14 Jan 2021 17:22:23 +0100 (CET)
Date:   Thu, 14 Jan 2021 17:22:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/6 v6] mips: Add N64 machine type
Message-ID: <20210114162223.GB14146@alpha.franken.de>
References: <20210113171123.7c819ee9cb9f07f0a4e80e5a@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113171123.7c819ee9cb9f07f0a4e80e5a@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 13, 2021 at 05:11:23PM +0200, Lauri Kasanen wrote:
> Add support for the Nintendo 64.
> 
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>  arch/mips/Kbuild.platforms               |   1 +
>  arch/mips/Kconfig                        |  12 +++
>  arch/mips/include/asm/mach-n64/irq.h     |   9 ++
>  arch/mips/include/asm/mach-n64/kmalloc.h |   8 ++
>  arch/mips/n64/Makefile                   |   6 ++
>  arch/mips/n64/Platform                   |   7 ++
>  arch/mips/n64/init.c                     | 164 +++++++++++++++++++++++++++++++
>  arch/mips/n64/irq.c                      |  16 +++
>  8 files changed, 223 insertions(+)
>  create mode 100644 arch/mips/include/asm/mach-n64/irq.h
>  create mode 100644 arch/mips/include/asm/mach-n64/kmalloc.h
>  create mode 100644 arch/mips/n64/Makefile
>  create mode 100644 arch/mips/n64/Platform
>  create mode 100644 arch/mips/n64/init.c
>  create mode 100644 arch/mips/n64/irq.c

this looks good from my side already. If you want to save a few bytes/cylces
creating arch/mips/include/asm/mach-n64/cpu-feature-overrides.h gives
some opportunities.

I'll wait a few days, and if there is no update for patch 1 and 2, I'm
going to apply it to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
