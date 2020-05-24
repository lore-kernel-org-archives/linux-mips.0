Return-Path: <SRS0=ICo7=7G=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F11C433DF
	for <linux-mips@archiver.kernel.org>; Sun, 24 May 2020 08:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 385192075F
	for <linux-mips@archiver.kernel.org>; Sun, 24 May 2020 08:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728125AbgEXIf4 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 24 May 2020 04:35:56 -0400
Received: from elvis.franken.de ([193.175.24.41]:36802 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbgEXIf4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 May 2020 04:35:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jcm6r-0004rA-02; Sun, 24 May 2020 10:35:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3641CC01D2; Sun, 24 May 2020 09:38:14 +0200 (CEST)
Date:   Sun, 24 May 2020 09:38:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        WANG Xuerui <git@xen0n.name>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH V2] MIPS: Tidy up CP0.Config6 bits definition
Message-ID: <20200524073814.GC4161@alpha.franken.de>
References: <1590220305-29176-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590220305-29176-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 23, 2020 at 03:51:45PM +0800, Huacai Chen wrote:
> CP0.Config6 is a Vendor-defined register whose bits definitions are
> different from one to another. Recently, Xuerui's Loongson-3 patch and
> Serge's P5600 patch make the definitions inconsistency and unclear.
> 
> To make life easy, this patch tidy the definition up:
> 1, Add a _MTI_ infix for proAptiv/P5600 feature bits;
> 2, Add a _LOONGSON_ infix for Loongson-3 feature bits;
> 3, Add bit6/bit7 definition for Loongson-3 which will be used later.
> 
> All existing users of these macros are updated.
> 
> Cc: WANG Xuerui <git@xen0n.name>
> Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/mipsregs.h | 37 ++++++++++++++++++++++++-------------
>  arch/mips/kernel/cpu-probe.c     | 12 ++++++------
>  arch/mips/mm/c-r4k.c             |  4 ++--
>  3 files changed, 32 insertions(+), 21 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
