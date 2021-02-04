Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64C2C433DB
	for <linux-mips@archiver.kernel.org>; Thu,  4 Feb 2021 21:01:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AC0C64FA4
	for <linux-mips@archiver.kernel.org>; Thu,  4 Feb 2021 21:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBDVBN (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 4 Feb 2021 16:01:13 -0500
Received: from elvis.franken.de ([193.175.24.41]:52900 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhBDVBM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Feb 2021 16:01:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7ljq-0002rO-03; Thu, 04 Feb 2021 22:00:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E3A3CC0D71; Thu,  4 Feb 2021 22:00:14 +0100 (CET)
Date:   Thu, 4 Feb 2021 22:00:14 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     James Hartley <james.hartley@sondrel.com>,
        bibo mao <maobibo@loongson.cn>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH mips-next] MIPS: pistachio: remove obsolete
 include/asm/mach-pistachio
Message-ID: <20210204210014.GD19460@alpha.franken.de>
References: <20210204135902.10361-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204135902.10361-1-alobakin@pm.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 04, 2021 at 01:59:29PM +0000, Alexander Lobakin wrote:
> Since commit 02bd530f888c ("MIPS: generic: Increase NR_IRQS to 256")
> include/asm/mach-pistachio/irq.h just does nothing.
> Remove the file along with mach-pistachio folder and include compiler
> directive.
> 
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> ---
>  MAINTAINERS                                |  1 -
>  arch/mips/include/asm/mach-pistachio/irq.h | 15 ---------------
>  arch/mips/pistachio/Platform               |  2 --
>  3 files changed, 18 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-pistachio/irq.h

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
