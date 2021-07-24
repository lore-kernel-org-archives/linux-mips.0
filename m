Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8EBC4338F
	for <linux-mips@archiver.kernel.org>; Sat, 24 Jul 2021 23:05:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89ABA60E90
	for <linux-mips@archiver.kernel.org>; Sat, 24 Jul 2021 23:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhGXWYx (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 24 Jul 2021 18:24:53 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:53906 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhGXWYx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Jul 2021 18:24:53 -0400
Subject: Re: [PATCH] MIPS: check return value of pgtable_pmd_page_ctor
To:     Huang Pei <huangpei@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
References: <20210721093045.2474837-1-huangpei@loongson.cn>
 <20210721093045.2474837-2-huangpei@loongson.cn>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <f00a863e-4313-7a53-3f43-05be99d956d5@gentoo.org>
Date:   Sat, 24 Jul 2021 19:05:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20210721093045.2474837-2-huangpei@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/21/2021 05:30, Huang Pei wrote:
> +. According to Documentation/vm/split_page_table_lock, handle failure
> of pgtable_pmd_page_ctor
> 
> +. Use GFP_KERNEL_ACCOUNT instead of GFP_KERNEL|__GFP_ACCOUNT
> 
> +. Adjust coding style
> 
> Fixes: ed914d48b6a1 ("MIPS: add PMD table accounting into MIPS')
> Reported-by: Joshua Kinard <kumba@gentoo.org>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/include/asm/pgalloc.h | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
> index d0cf997b4ba8..139b4050259f 100644
> --- a/arch/mips/include/asm/pgalloc.h
> +++ b/arch/mips/include/asm/pgalloc.h
> @@ -59,15 +59,20 @@ do {							\
>  
>  static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
> -	pmd_t *pmd = NULL;
> +	pmd_t *pmd;
>  	struct page *pg;
>  
> -	pg = alloc_pages(GFP_KERNEL | __GFP_ACCOUNT, PMD_ORDER);
> -	if (pg) {
> -		pgtable_pmd_page_ctor(pg);
> -		pmd = (pmd_t *)page_address(pg);
> -		pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
> +	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_ORDER);
> +	if (!pg)
> +		return NULL;
> +
> +	if (!pgtable_pmd_page_ctor(pg)) {
> +		__free_pages(pg, PMD_ORDER);
> +		return NULL;
>  	}
> +
> +	pmd = (pmd_t *)page_address(pg);
> +	pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
>  	return pmd;
>  }
>  
> 

Reviewed-by: Joshua Kinard <kumba@gentoo.org>

