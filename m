Return-Path: <SRS0=Ie6I=DU=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E419CC433E7
	for <linux-mips@archiver.kernel.org>; Tue, 13 Oct 2020 09:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F39320714
	for <linux-mips@archiver.kernel.org>; Tue, 13 Oct 2020 09:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404215AbgJMJcv (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 13 Oct 2020 05:32:51 -0400
Received: from elvis.franken.de ([193.175.24.41]:60148 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404206AbgJMJcv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Oct 2020 05:32:51 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kSGfg-0003Vf-00; Tue, 13 Oct 2020 11:32:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 87CBDC0188; Tue, 13 Oct 2020 11:31:30 +0200 (CEST)
Date:   Tue, 13 Oct 2020 11:31:30 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: ingenic: Remove CPU_SUPPORTS_HUGEPAGES
Message-ID: <20201013093130.GA18418@alpha.franken.de>
References: <20201012143319.GA24291@roeck-us.net>
 <20201012192739.49259-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012192739.49259-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 12, 2020 at 09:27:39PM +0200, Paul Cercueil wrote:
> While it is true that Ingenic SoCs support huge pages, we cannot use
> them yet as PTEs don't have any single bit that is free. Right now,
> having that symbol only causes build errors, so remove it until the
> situation with PTEs is resolved.
> 
> Fixes: f0f4a753079c ("MIPS: generic: Add support for Ingenic SoCs")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
