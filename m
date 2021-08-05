Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDCFC4338F
	for <linux-mips@archiver.kernel.org>; Thu,  5 Aug 2021 09:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2808D610CC
	for <linux-mips@archiver.kernel.org>; Thu,  5 Aug 2021 09:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbhHEJRj (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:17:39 -0400
Received: from elvis.franken.de ([193.175.24.41]:46905 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237817AbhHEJRh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 05:17:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mBZV8-0005ti-00; Thu, 05 Aug 2021 11:17:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 77889C0503; Thu,  5 Aug 2021 11:02:18 +0200 (CEST)
Date:   Thu, 5 Aug 2021 11:02:18 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        Peter Zijlstra <peterz@infradead.org>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 02/38] MIPS: Replace deprecated CPU-hotplug functions.
Message-ID: <20210805090218.GA5979@alpha.franken.de>
References: <20210803141621.780504-1-bigeasy@linutronix.de>
 <20210803141621.780504-3-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803141621.780504-3-bigeasy@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 03, 2021 at 04:15:45PM +0200, Sebastian Andrzej Siewior wrote:
> The functions get_online_cpus() and put_online_cpus() have been
> deprecated during the CPU hotplug rework. They map directly to
> cpus_read_lock() and cpus_read_unlock().
> 
> Replace deprecated CPU-hotplug functions with the official version.
> The behavior remains unchanged.
> 
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/mips/kernel/mips-mt-fpaff.c | 10 +++++-----
>  arch/mips/kernel/process.c       |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
