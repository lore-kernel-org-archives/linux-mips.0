Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C02C43216
	for <linux-mips@archiver.kernel.org>; Thu, 12 Aug 2021 14:25:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C44AD60FD7
	for <linux-mips@archiver.kernel.org>; Thu, 12 Aug 2021 14:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbhHLO0Q (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:26:16 -0400
Received: from elvis.franken.de ([193.175.24.41]:57507 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237963AbhHLO0P (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Aug 2021 10:26:15 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mEBeQ-0002iE-01; Thu, 12 Aug 2021 16:25:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0C3FBC07E5; Thu, 12 Aug 2021 16:10:15 +0200 (CEST)
Date:   Thu, 12 Aug 2021 16:10:15 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huilong Deng <denghuilong@cdjrlc.com>
Cc:     alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com,
        paulburton@kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: generic: Return true/false (not 1/0) from bool
 functions
Message-ID: <20210812141014.GB9924@alpha.franken.de>
References: <20210811043615.57969-1-denghuilong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811043615.57969-1-denghuilong@cdjrlc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 11, 2021 at 12:36:15PM +0800, Huilong Deng wrote:
> ./arch/mips/generic/board-ocelot.c:29:9-10: WARNING: return of 0/1 in
> function 'ocelot_detect' with return type bool
> 
> Signed-off-by: Huilong Deng <denghuilong@cdjrlc.com>
> ---
>  arch/mips/generic/board-ocelot.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
