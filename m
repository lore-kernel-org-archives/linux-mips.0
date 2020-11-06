Return-Path: <SRS0=ffv7=EM=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E641EC55178
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 10:54:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 975172072E
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 10:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgKFKx5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 6 Nov 2020 05:53:57 -0500
Received: from elvis.franken.de ([193.175.24.41]:41183 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727139AbgKFKx4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Nov 2020 05:53:56 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kazNR-0000vt-04; Fri, 06 Nov 2020 11:53:53 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 29ADAC4DDA; Fri,  6 Nov 2020 11:53:22 +0100 (CET)
Date:   Fri, 6 Nov 2020 11:53:22 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mm/hugetlb: Make is_aligned_hugepage_range static
Message-ID: <20201106105322.GF9806@alpha.franken.de>
References: <1603937600-53015-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603937600-53015-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 29, 2020 at 10:13:20AM +0800, Zou Wei wrote:
> Fix the following sparse warning:
> 
> arch/mips/mm/hugetlbpage.c:64:5: warning:
> symbol 'is_aligned_hugepage_range' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  arch/mips/mm/hugetlbpage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/mm/hugetlbpage.c b/arch/mips/mm/hugetlbpage.c
> index 77ffece..774c988 100644
> --- a/arch/mips/mm/hugetlbpage.c
> +++ b/arch/mips/mm/hugetlbpage.c
> @@ -61,7 +61,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
>  /*
>   * This function checks for proper alignment of input addr and len parameters.
>   */
> -int is_aligned_hugepage_range(unsigned long addr, unsigned long len)
> +static int is_aligned_hugepage_range(unsigned long addr, unsigned long len)

this should give then a warning that 'is_aligned_hugepage_range' is unused.
Could you send a patch, which remove function completely ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
