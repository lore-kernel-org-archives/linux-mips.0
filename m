Return-Path: <SRS0=AwUQ=5K=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E506EC1975A
	for <linux-mips@archiver.kernel.org>; Wed, 25 Mar 2020 17:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9D632077D
	for <linux-mips@archiver.kernel.org>; Wed, 25 Mar 2020 17:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgCYRe0 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 25 Mar 2020 13:34:26 -0400
Received: from elvis.franken.de ([193.175.24.41]:34593 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727129AbgCYRe0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 13:34:26 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jH9v6-0008NM-01; Wed, 25 Mar 2020 18:34:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D5A55C0D49; Wed, 25 Mar 2020 18:31:23 +0100 (CET)
Date:   Wed, 25 Mar 2020 18:31:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yousong Zhou <yszhou4tech@gmail.com>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Exclude more dsemul code when
 CONFIG_MIPS_FP_SUPPORT=n
Message-ID: <20200325173123.GB17524@alpha.franken.de>
References: <20200324152751.57666-1-yszhou4tech@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324152751.57666-1-yszhou4tech@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 24, 2020 at 11:27:51PM +0800, Yousong Zhou wrote:
> This furthers what commit 42b10815d559 ("MIPS: Don't compile math-emu
> when CONFIG_MIPS_FP_SUPPORT=n") has done
> 
> Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
> ---
> v2 <- v1: Fix using unknown symbol CONFIG_MIPS_FP_EMULATOR, @tsbogend
> 
>  arch/mips/include/asm/processor.h | 12 ++++++------
>  arch/mips/kernel/process.c        | 10 ++++++++--
>  arch/mips/kernel/vdso.c           | 26 +++++++++++++++-----------
>  3 files changed, 29 insertions(+), 19 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
