Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23290C433DB
	for <linux-mips@archiver.kernel.org>; Thu, 11 Feb 2021 10:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D565F64E6F
	for <linux-mips@archiver.kernel.org>; Thu, 11 Feb 2021 10:35:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhBKKeh (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 11 Feb 2021 05:34:37 -0500
Received: from elvis.franken.de ([193.175.24.41]:44675 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230124AbhBKKbm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Feb 2021 05:31:42 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lA9FS-0005LQ-02; Thu, 11 Feb 2021 11:30:58 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8394AC0E70; Thu, 11 Feb 2021 11:20:54 +0100 (CET)
Date:   Thu, 11 Feb 2021 11:20:54 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 RESEND] MIPS: Make check condition for SDBBP more
 readable
Message-ID: <20210211102054.GC7985@alpha.franken.de>
References: <1612945826-4099-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612945826-4099-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 04:30:26PM +0800, Tiezhu Yang wrote:
> According to MIPS EJTAG Specification [1], a Debug Breakpoint
> exception occurs when an SDBBP instruction is executed, the
> CP0_DEBUG bit DBp indicates that a Debug Breakpoint exception
> occurred.
> 
> When I read the original code, it looks a little confusing
> at first glance, just check bit DBp for SDBBP to make the
> code more readable, it will be much easier to understand.
> 
> [1] http://www.t-es-t.hu/download/mips/md00047f.pdf
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> RESEND due to send to mail list failed.
> 
> v3: update the commit message and modify the patch subject
> 
> v2: add MIPS_DEBUG_DBP definition
> 
>  arch/mips/include/asm/mipsregs.h | 4 ++++
>  arch/mips/kernel/genex.S         | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
