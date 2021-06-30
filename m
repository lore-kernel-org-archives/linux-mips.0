Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5971C11F65
	for <linux-mips@archiver.kernel.org>; Wed, 30 Jun 2021 12:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5C2861357
	for <linux-mips@archiver.kernel.org>; Wed, 30 Jun 2021 12:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhF3M44 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 30 Jun 2021 08:56:56 -0400
Received: from elvis.franken.de ([193.175.24.41]:59648 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234481AbhF3M44 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Jun 2021 08:56:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lyZjT-0007Hs-01; Wed, 30 Jun 2021 14:54:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D80C0C0755; Wed, 30 Jun 2021 14:42:14 +0200 (CEST)
Date:   Wed, 30 Jun 2021 14:42:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wei Li <liwei391@huawei.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        huawei.libin@huawei.com
Subject: Re: [PATCH RESEND] MIPS: Fix PKMAP with 32-bit MIPS huge page support
Message-ID: <20210630124214.GB7139@alpha.franken.de>
References: <20210629141420.1790569-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629141420.1790569-1-liwei391@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 29, 2021 at 10:14:20PM +0800, Wei Li wrote:
> When 32-bit MIPS huge page support is enabled, we halve the number of
> pointers a PTE page holds, making its last half go to waste.
> Correspondingly, we should halve the number of kmap entries, as we just
> initialized only a single pte table for that in pagetable_init().
> 
> Fixes: 35476311e529 ("MIPS: Add partial 32-bit huge page support")
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
>  arch/mips/include/asm/highmem.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
