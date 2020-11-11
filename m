Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48F6C4742C
	for <linux-mips@archiver.kernel.org>; Thu, 12 Nov 2020 01:48:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D77F205ED
	for <linux-mips@archiver.kernel.org>; Thu, 12 Nov 2020 01:48:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgKLBdS (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 11 Nov 2020 20:33:18 -0500
Received: from elvis.franken.de ([193.175.24.41]:54612 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727743AbgKKXGI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Nov 2020 18:06:08 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kczBl-0005fC-00; Thu, 12 Nov 2020 00:06:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4A106C4DDE; Thu, 12 Nov 2020 00:02:51 +0100 (CET)
Date:   Thu, 12 Nov 2020 00:02:51 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: Remove #include <uapi/asm/types.h> from
 <asm/types.h>
Message-ID: <20201111230251.GA19275@alpha.franken.de>
References: <20201110163631.3322364-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110163631.3322364-1-geert@linux-m68k.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 10, 2020 at 05:36:31PM +0100, Geert Uytterhoeven wrote:
> Everything in arch/mips/include/uapi/asm/types.h is protected by
> "#ifndef __KERNEL__", so it's unused for kernelspace.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This is a resend of a very old patch from 2013, which is still valid.
> 
>  arch/mips/include/asm/types.h | 1 -
>  1 file changed, 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
