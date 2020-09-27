Return-Path: <SRS0=MUgy=DE=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B232C4346E
	for <linux-mips@archiver.kernel.org>; Sun, 27 Sep 2020 09:11:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13C8823977
	for <linux-mips@archiver.kernel.org>; Sun, 27 Sep 2020 09:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgI0JLB (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 27 Sep 2020 05:11:01 -0400
Received: from elvis.franken.de ([193.175.24.41]:59878 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbgI0JLB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Sep 2020 05:11:01 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kMShv-0001nG-01; Sun, 27 Sep 2020 11:10:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B0710C1023; Sun, 27 Sep 2020 11:04:43 +0200 (CEST)
Date:   Sun, 27 Sep 2020 11:04:43 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Increase range of CONFIG_FORCE_MAX_ZONEORDER
Message-ID: <20200927090443.GB4929@alpha.franken.de>
References: <20200917133528.83091-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917133528.83091-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 17, 2020 at 03:35:28PM +0200, Paul Cercueil wrote:
> There is nothing that prevents us from using lower maximum values.
> It's something that we actually want, when using bigger page sizes on
> devices with low RAM.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
