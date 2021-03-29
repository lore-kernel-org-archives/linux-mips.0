Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720B6C433E8
	for <linux-mips@archiver.kernel.org>; Mon, 29 Mar 2021 09:31:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6007D619AA
	for <linux-mips@archiver.kernel.org>; Mon, 29 Mar 2021 09:31:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhC2Jap (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 29 Mar 2021 05:30:45 -0400
Received: from elvis.franken.de ([193.175.24.41]:33842 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231572AbhC2JaX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 05:30:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lQoE1-0003qb-05; Mon, 29 Mar 2021 11:30:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1E866C1D90; Mon, 29 Mar 2021 11:26:07 +0200 (CEST)
Date:   Mon, 29 Mar 2021 11:26:07 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH 2/2] MIPS: ralink: mt7621: add memory detection support
Message-ID: <20210329092607.GE8484@alpha.franken.de>
References: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
 <20210327053840.471155-2-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210327053840.471155-2-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 26, 2021 at 10:38:40PM -0700, Ilya Lipnitskiy wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
> 
> mt7621 has the following memory map:
> 0x0-0x1c000000: lower 448m memory
> 0x1c000000-0x2000000: peripheral registers
> 0x20000000-0x2400000: higher 64m memory
> 
> detect_memory_region in arch/mips/kernel/setup.c only adds the first
> memory region and isn't suitable for 512m memory detection because
> it may accidentally read the memory area for peripheral registers.
> 
> This commit adds memory detection capability for mt7621:
>   1. Add the highmem area when 512m is detected.
>   2. Guard memcmp from accessing peripheral registers:
>      This only happens when a user decided to change kernel load address
>      to 256m or higher address. Since this is a quite unusual case, we
>      just skip 512m testing and return 256m as memory size.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Minor commit message reword, make mt7621_memory_detect static]
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/include/asm/mach-ralink/mt7621.h |  7 +++---
>  arch/mips/ralink/common.h                  |  1 +
>  arch/mips/ralink/mt7621.c                  | 29 +++++++++++++++++++---
>  arch/mips/ralink/of.c                      |  2 ++
>  4 files changed, 32 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
