Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C04C433E0
	for <linux-mips@archiver.kernel.org>; Tue, 26 Jan 2021 15:12:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F27D9230FE
	for <linux-mips@archiver.kernel.org>; Tue, 26 Jan 2021 15:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404348AbhAZPMW (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 26 Jan 2021 10:12:22 -0500
Received: from elvis.franken.de ([193.175.24.41]:57201 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405774AbhAZPF1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Jan 2021 10:05:27 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l4PtW-0002OG-00; Tue, 26 Jan 2021 16:04:38 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C869BC09FE; Tue, 26 Jan 2021 15:37:05 +0100 (CET)
Date:   Tue, 26 Jan 2021 15:37:05 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>, siyanteng01@gmail.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: mm: remove function __uncached_access()
Message-ID: <20210126143705.GA14767@alpha.franken.de>
References: <20210124073755.1287129-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124073755.1287129-1-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jan 24, 2021 at 03:37:55PM +0800, Yanteng Si wrote:
> MIPS uses this logic because loongson2e override the
> definition of unchached. However, now the logic of
> loongson2e has been removed, so MIPS is no longer needed.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/loongson2ef/common/mem.c | 11 -----------

it might help to split this patch into two patches. Put the
loogonson2ef stuff into the first patch with the explaination, that
we no longer need the MESA workaround (which shouldn't be there in
the first place, IMHO)

>  arch/mips/mm/cache.c               |  8 --------
>  drivers/char/mem.c                 |  7 -------

and the rest into a second patch, with a comment that MIPS can now use
the default uncached_access like other archs.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
