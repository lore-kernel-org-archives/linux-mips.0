Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A997C433E0
	for <linux-mips@archiver.kernel.org>; Sat, 13 Feb 2021 09:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10A3564E68
	for <linux-mips@archiver.kernel.org>; Sat, 13 Feb 2021 09:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhBMJTn (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 13 Feb 2021 04:19:43 -0500
Received: from elvis.franken.de ([193.175.24.41]:52742 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229475AbhBMJTm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 13 Feb 2021 04:19:42 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lAr4j-0003E3-02; Sat, 13 Feb 2021 10:18:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 385FBC0344; Sat, 13 Feb 2021 10:06:18 +0100 (CET)
Date:   Sat, 13 Feb 2021 10:06:18 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Simplify EVA cache handling
Message-ID: <20210213090618.GC4330@alpha.franken.de>
References: <20210210161615.21228-1-tsbogend@alpha.franken.de>
 <20210210161615.21228-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210161615.21228-2-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 05:16:14PM +0100, Thomas Bogendoerfer wrote:
> protected_cache_op is only used for flushing user addresses, so
> we only need to define protected_cache_op different in EVA mode and
> be done with it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/r4kcache.h | 67 ++++++--------------------------
>  1 file changed, 11 insertions(+), 56 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
