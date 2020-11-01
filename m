Return-Path: <SRS0=F5f4=EH=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B171C2D0A3
	for <linux-mips@archiver.kernel.org>; Sun,  1 Nov 2020 13:18:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0655A2158C
	for <linux-mips@archiver.kernel.org>; Sun,  1 Nov 2020 13:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgKANSZ (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 1 Nov 2020 08:18:25 -0500
Received: from elvis.franken.de ([193.175.24.41]:60927 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbgKANSZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 1 Nov 2020 08:18:25 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kZDFX-0005St-00; Sun, 01 Nov 2020 14:18:23 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F0427C05D9; Sun,  1 Nov 2020 14:15:22 +0100 (CET)
Date:   Sun, 1 Nov 2020 14:15:22 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: add support for TIF_NOTIFY_SIGNAL
Message-ID: <20201101131522.GA4111@alpha.franken.de>
References: <116773a7-acc4-0f18-9249-532a844502ef@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <116773a7-acc4-0f18-9249-532a844502ef@kernel.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 29, 2020 at 10:16:53AM -0600, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for mips.
> 
> Cc: linux-mips@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
> 
> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
> 
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
> 
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.
> 
>  arch/mips/include/asm/thread_info.h | 4 +++-
>  arch/mips/kernel/signal.c           | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Acked-By: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Please take the patch into your tree.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
