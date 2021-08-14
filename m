Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F1AC4338F
	for <linux-mips@archiver.kernel.org>; Sat, 14 Aug 2021 12:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3BF460F48
	for <linux-mips@archiver.kernel.org>; Sat, 14 Aug 2021 12:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbhHNM7F (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 14 Aug 2021 08:59:05 -0400
Received: from elvis.franken.de ([193.175.24.41]:60528 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230523AbhHNM7F (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 14 Aug 2021 08:59:05 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mEtFD-0001ZR-01; Sat, 14 Aug 2021 14:58:35 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C8585C0814; Sat, 14 Aug 2021 14:46:22 +0200 (CEST)
Date:   Sat, 14 Aug 2021 14:46:22 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Marcin Chojnacki <marcinch7@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: mm: correct build errors for debug code in tlb-r3k
Message-ID: <20210814124622.GA6450@alpha.franken.de>
References: <20210813135434.1015906-1-marcinch7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813135434.1015906-1-marcinch7@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 13, 2021 at 03:54:33PM +0200, Marcin Chojnacki wrote:
> tlb-r3k has debug code hidden under DEBUG_TLB define. This flag
> is undefined by default which results in the code not being compiled.
> If one would enable the flag, the file would not build because of
> the code being not up to date with the rest of this file.
> 
> This commit fixes the normally hidden debug code to bring it in line
> with the rest of the file and make it build with the debug flag enabled.
> 
> Signed-off-by: Marcin Chojnacki <marcinch7@gmail.com>
> ---
>  arch/mips/mm/tlb-r3k.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
> index a36622ebe..ca53f3366 100644
> --- a/arch/mips/mm/tlb-r3k.c
> +++ b/arch/mips/mm/tlb-r3k.c
> @@ -77,7 +77,7 @@ void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		unsigned long size, flags;
>  
>  #ifdef DEBUG_TLB
> -		printk("[tlbrange<%lu,0x%08lx,0x%08lx>]",
> +		printk("[tlbrange<%llu,0x%08lx,0x%08lx>]",
>  			cpu_context(cpu, mm) & asid_mask, start, end);
>  #endif

running checkpatch over your patch gives me

WARNING: printk() should include KERN_<LEVEL> facility level
#29: FILE: arch/mips/mm/tlb-r3k.c:80:
+		printk("[tlbrange<%llu,0x%08lx,0x%08lx>]",


can you fix that as well ? Maybe be even  replacing printk with
pr_debug 

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
