Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB95C388F9
	for <linux-mips@archiver.kernel.org>; Thu, 12 Nov 2020 01:48:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E753E205ED
	for <linux-mips@archiver.kernel.org>; Thu, 12 Nov 2020 01:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbgKLBdT (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 11 Nov 2020 20:33:19 -0500
Received: from elvis.franken.de ([193.175.24.41]:54614 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727758AbgKKXGI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Nov 2020 18:06:08 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kczBl-0005fC-01; Thu, 12 Nov 2020 00:06:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DDCF3C4DDF; Thu, 12 Nov 2020 00:03:14 +0100 (CET)
Date:   Thu, 12 Nov 2020 00:03:14 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     clang-built-linux@googlegroups.com,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: remove GCC < 4.9 support
Message-ID: <20201111230314.GB19275@alpha.franken.de>
References: <20201111032105.2346303-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111032105.2346303-1-ndesaulniers@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 10, 2020 at 07:21:05PM -0800, Nick Desaulniers wrote:
> Remove a tautology; since
> commit 0bddd227f3dc ("Documentation: update for gcc 4.9 requirement")
> which raised the minimally supported version of GCC to 4.9, this case is
> always true.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/427
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/mips/include/asm/compiler.h | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
