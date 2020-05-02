Return-Path: <SRS0=5aZV=6Q=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5EDC3A5A9
	for <linux-mips@archiver.kernel.org>; Sat,  2 May 2020 11:58:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01112216FD
	for <linux-mips@archiver.kernel.org>; Sat,  2 May 2020 11:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgEBL6s (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 2 May 2020 07:58:48 -0400
Received: from elvis.franken.de ([193.175.24.41]:36650 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbgEBL6s (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 2 May 2020 07:58:48 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jUqn8-00009X-00; Sat, 02 May 2020 13:58:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EEC2BC036B; Sat,  2 May 2020 13:22:21 +0200 (CEST)
Date:   Sat, 2 May 2020 13:22:21 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2] MIPS: perf: Remove unnecessary "fallthrough" pseudo
 keywords
Message-ID: <20200502112221.GA5092@alpha.franken.de>
References: <1588416384-18200-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588416384-18200-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 02, 2020 at 06:46:24PM +0800, Huacai Chen wrote:
> The last branch of switch-case doesn't need a "fallthrough" pseudo
> keyword, and it will cause errors when building a kernel with -Werror:
> 
>    arch/mips/kernel/perf_event_mipsxx.c: In function 'reset_counters':
>    include/linux/compiler_attributes.h:200:41: error: attribute 'fallthrough' not preceding a case label or default label [-Werror]
>      200 | # define fallthrough                    __attribute__((__fallthrough__))
>          |                                         ^~~~~~~~~~~~~
> >> arch/mips/kernel/perf_event_mipsxx.c:932:3: note: in expansion of macro 'fallthrough'
>      932 |   fallthrough;
>          |   ^~~~~~~~~~~
>    arch/mips/kernel/perf_event_mipsxx.c: In function 'loongson3_reset_counters':
>    include/linux/compiler_attributes.h:200:41: error: attribute 'fallthrough' not preceding a case label or default label [-Werror]
>      200 | # define fallthrough                    __attribute__((__fallthrough__))
>          |                                         ^~~~~~~~~~~~~
>    arch/mips/kernel/perf_event_mipsxx.c:903:3: note: in expansion of macro 'fallthrough'
>      903 |   fallthrough;
>          |   ^~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Fix it by removing unnecessary "fallthrough" pseudo keywords.
> 
> Fixes: e9dfbaaeef1c9fe ("MIPS: perf: Add hardware perf events support for new Loongson-3")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/kernel/perf_event_mipsxx.c | 2 --
>  1 file changed, 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
