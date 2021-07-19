Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FE8C07E9B
	for <linux-mips@archiver.kernel.org>; Mon, 19 Jul 2021 11:27:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10AE7610C7
	for <linux-mips@archiver.kernel.org>; Mon, 19 Jul 2021 11:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236317AbhGSKrS (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 19 Jul 2021 06:47:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:39630 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236076AbhGSKrS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Jul 2021 06:47:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m5RRE-0008KT-00; Mon, 19 Jul 2021 13:27:56 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4775DC0ED2; Mon, 19 Jul 2021 13:27:18 +0200 (CEST)
Date:   Mon, 19 Jul 2021 13:27:18 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Joe Perches <joe@perches.com>
Cc:     David Daney <david.daney@cavium.com>, linux-mips@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: octeon: Remove vestiges of CONFIG_CAVIUM_RESERVE32
Message-ID: <20210719112718.GA7434@alpha.franken.de>
References: <997c0cdbd57752252d87129185a973c7d42e491f.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <997c0cdbd57752252d87129185a973c7d42e491f.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 13, 2021 at 10:49:15AM -0700, Joe Perches wrote:
> The config option CAVIUM_RESERVE32 is not used.
> Remove the dead code controlled by it.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> 
> Uncompiled, untested.
> 
> Found using a grep for unused Kconfig entries:
> 
> $ git grep -P '^\s*#\s*if(?:def\s+|\s*defined\s*\(?\s*)CONFIG_[A-Z0-9_]+' | \
>   grep -oh -P '\bCONFIG_[A-Z0-9_]+\b' | \
>   sort | sed -e 's/^CONFIG_//' -e 's/_MODULE$//' | uniq | \
>   while read config ; do \
>     echo CONFIG_$config; \
>     git grep -w $config -- '*/Kconfig*' | \
>     wc -l; \
>   done | \
>   grep -B1 '^0'
> 
> with some additional inspection of the kernel source tree to verify.
> 
>  arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c | 21 +++---------
>  arch/mips/cavium-octeon/setup.c                    | 38 +---------------------

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
