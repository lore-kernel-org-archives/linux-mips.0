Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF54C433FE
	for <linux-mips@archiver.kernel.org>; Fri, 11 Dec 2020 21:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B751E2409B
	for <linux-mips@archiver.kernel.org>; Fri, 11 Dec 2020 21:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgLKTzz (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 11 Dec 2020 14:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbgLKTz2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Dec 2020 14:55:28 -0500
X-Greylist: delayed 23673 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Dec 2020 11:54:48 PST
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C031C0613CF;
        Fri, 11 Dec 2020 11:54:48 -0800 (PST)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 9BF112BE0F3;
        Fri, 11 Dec 2020 19:54:45 +0000 (GMT)
Date:   Fri, 11 Dec 2020 19:54:07 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Anders Roxell <anders.roxell@linaro.org>
cc:     tsbogend@alpha.franken.de, natechancellor@gmail.com,
        ndesaulniers@google.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH v2] mips: lib: uncached: fix non-standard usage of variable
 'sp'
In-Reply-To: <20201211102437.3929348-1-anders.roxell@linaro.org>
Message-ID: <alpine.LFD.2.21.2012111950290.2104409@eddie.linux-mips.org>
References: <20201211102437.3929348-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 11 Dec 2020, Anders Roxell wrote:

> diff --git a/arch/mips/lib/uncached.c b/arch/mips/lib/uncached.c
> index 09d5deea747f..f80a67c092b6 100644
> --- a/arch/mips/lib/uncached.c
> +++ b/arch/mips/lib/uncached.c
> @@ -37,10 +37,12 @@
>   */
>  unsigned long run_uncached(void *func)
>  {
> -	register long sp __asm__("$sp");
>  	register long ret __asm__("$2");
>  	long lfunc = (long)func, ufunc;
>  	long usp;
> +	long sp;
> +
> +	__asm__("move %0, $sp" : "=r" (sp));

 I thought it might be better to make `sp' global instead, so that it's 
the compiler that chooses how to schedule accesses.  Have you tried that?

  Maciej

