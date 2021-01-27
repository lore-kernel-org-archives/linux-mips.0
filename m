Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595DAC433E0
	for <linux-mips@archiver.kernel.org>; Wed, 27 Jan 2021 21:12:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10A8164DA1
	for <linux-mips@archiver.kernel.org>; Wed, 27 Jan 2021 21:12:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233901AbhA0VMC (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 27 Jan 2021 16:12:02 -0500
Received: from elvis.franken.de ([193.175.24.41]:60502 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233890AbhA0VLw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 16:11:52 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l4s5l-0003cQ-01; Wed, 27 Jan 2021 22:11:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9CDC0C0AAF; Wed, 27 Jan 2021 22:06:07 +0100 (CET)
Date:   Wed, 27 Jan 2021 22:06:07 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: vpe: Remove vpe_getcwd
Message-ID: <20210127210607.GB21002@alpha.franken.de>
References: <20210122114449.19423-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122114449.19423-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 22, 2021 at 12:44:49PM +0100, Thomas Bogendoerfer wrote:
> I couldn't find any user of the dubious vpe_getcwd so far. So remove it and
> get rid of another set_fs(KERNEL_DS).
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/vpe.h |  3 ---
>  arch/mips/kernel/vpe.c      | 33 ---------------------------------
>  2 files changed, 36 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
