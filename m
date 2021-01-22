Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437CCC43381
	for <linux-mips@archiver.kernel.org>; Fri, 22 Jan 2021 12:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05B14239EF
	for <linux-mips@archiver.kernel.org>; Fri, 22 Jan 2021 12:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbhAVMEU (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 22 Jan 2021 07:04:20 -0500
Received: from elvis.franken.de ([193.175.24.41]:42486 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727825AbhAVKyi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 05:54:38 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l2u4i-0006yq-01; Fri, 22 Jan 2021 11:53:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id ADD4AC0BF1; Fri, 22 Jan 2021 11:51:01 +0100 (CET)
Date:   Fri, 22 Jan 2021 11:51:01 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH 2/2] MIPS: mm: Add prototype for function
 __uncached_access
Message-ID: <20210122105101.GD8146@alpha.franken.de>
References: <20210121013435.450471-1-siyanteng@loongson.cn>
 <20210121013435.450471-2-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121013435.450471-2-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 21, 2021 at 09:34:35AM +0800, Yanteng Si wrote:
> This commit adds a prototype to fix error at W=1:
> 
> arch/mips/mm/cache.c:211:12: error: no previous prototype
> for '__uncached_access' [-Werror=missing-prototypes]
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/include/asm/pgtable.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index 804889b70965..76d36484a0ad 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -65,6 +65,7 @@ struct vm_area_struct;
>  
>  extern unsigned long _page_cachable_default;
>  extern void __update_cache(unsigned long address, pte_t pte);
> +extern int __weak __uncached_access(struct file *file, unsigned long addr);

I'm in favour of removing __uncached_access(). Is there a real good reason
for the special loongson2ef treatment ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
