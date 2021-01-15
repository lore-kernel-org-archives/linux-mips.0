Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3748C433E0
	for <linux-mips@archiver.kernel.org>; Fri, 15 Jan 2021 14:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BC0223359
	for <linux-mips@archiver.kernel.org>; Fri, 15 Jan 2021 14:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbhAOOru (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 15 Jan 2021 09:47:50 -0500
Received: from elvis.franken.de ([193.175.24.41]:53922 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728292AbhAOOru (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 09:47:50 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l0QNY-0006aU-03; Fri, 15 Jan 2021 15:47:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E782CC057E; Fri, 15 Jan 2021 15:42:22 +0100 (CET)
Date:   Fri, 15 Jan 2021 15:42:22 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Aurelien Jarno <aurelien@aurel32.net>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        YunQiang Su <syq@debian.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Support binutils configured with
 --enable-mips-fix-loongson3-llsc=yes
Message-ID: <20210115144222.GD15166@alpha.franken.de>
References: <20210109193048.478339-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210109193048.478339-1-aurelien@aurel32.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jan 09, 2021 at 08:30:47PM +0100, Aurelien Jarno wrote:
> >From version 2.35, binutils can be configured with
> --enable-mips-fix-loongson3-llsc=yes, which means it defaults to
> -mfix-loongson3-llsc. This breaks labels which might then point at the
> wrong instruction.
> 
> The workaround to explicitly pass -mno-fix-loongson3-llsc has been
> added in Linux version 5.1, but is only enabled when building a Loongson
> 64 kernel. As vendors might use a common toolchain for building Loongson
> and non-Loongson kernels, just move that workaround to
> arch/mips/Makefile. At the same time update the comments to reflect the
> current status.
> 
> Cc: stable@vger.kernel.org # 5.1+
> Cc: YunQiang Su <syq@debian.org>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/mips/Makefile            | 19 +++++++++++++++++++
>  arch/mips/loongson64/Platform | 22 ----------------------
>  2 files changed, 19 insertions(+), 22 deletions(-)

I've applied it to mips-next, but I consider such changes as rather rude.
I would have expected, that the workaround is only enabled via command
line option and not by default.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
