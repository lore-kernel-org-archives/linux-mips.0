Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDB1C47098
	for <linux-mips@archiver.kernel.org>; Tue,  1 Jun 2021 09:51:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34D6761057
	for <linux-mips@archiver.kernel.org>; Tue,  1 Jun 2021 09:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhFAJxj (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 1 Jun 2021 05:53:39 -0400
Received: from elvis.franken.de ([193.175.24.41]:59998 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230282AbhFAJxh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 05:53:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lo13y-0001KW-04; Tue, 01 Jun 2021 11:51:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 53F9AC1B8C; Tue,  1 Jun 2021 11:49:23 +0200 (CEST)
Date:   Tue, 1 Jun 2021 11:49:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net
Subject: Re: [PATCH 0/8] Misc Ingenic patches
Message-ID: <20210601094923.GE6961@alpha.franken.de>
References: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530171802.23649-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 30, 2021 at 06:17:54PM +0100, Paul Cercueil wrote:
> Hi Thomas,
> 
> Here is a set of misc patches that don't really have any relation
> between themselves. I just thought you'd prefer one patchset than eight
> individual patches :)

either way is good as long it has a common topic.

> 
> Paul Cercueil (8):
>   MIPS: mm: XBurst CPU requires sync after DMA
>   MIPS: boot: Support specifying UART port on Ingenic SoCs
>   MIPS: cpu-probe: Fix FPU detection on Ingenic JZ4760(B)
>   MIPS: Kconfig: ingenic: Ensure MACH_INGENIC_GENERIC selects all SoCs
>   MIPS: ingenic: Select CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
>   MIPS: ingenic: jz4780: Fix I2C nodes to match DT doc
>   MIPS: ingenic: gcw0: Set codec to cap-less mode for FM radio
>   MIPS: ingenic: rs90: Add dedicated VRAM memory region
> 
>  arch/mips/Kconfig                      |  3 +++
>  arch/mips/Kconfig.debug                |  8 ++++++++
>  arch/mips/boot/compressed/uart-16550.c |  4 ++--
>  arch/mips/boot/dts/ingenic/gcw0.dts    |  5 ++---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 10 +++++-----
>  arch/mips/boot/dts/ingenic/rs90.dts    | 14 ++++++++++++++
>  arch/mips/ingenic/Kconfig              |  2 ++
>  arch/mips/kernel/cpu-probe.c           |  5 +++++
>  arch/mips/mm/dma-noncoherent.c         |  1 +
>  9 files changed, 42 insertions(+), 10 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
