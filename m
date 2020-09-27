Return-Path: <SRS0=MUgy=DE=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735D8C4346E
	for <linux-mips@archiver.kernel.org>; Sun, 27 Sep 2020 09:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 362EB23977
	for <linux-mips@archiver.kernel.org>; Sun, 27 Sep 2020 09:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgI0JLG (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 27 Sep 2020 05:11:06 -0400
Received: from elvis.franken.de ([193.175.24.41]:59881 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726379AbgI0JLE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Sep 2020 05:11:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kMShw-0001nG-00; Sun, 27 Sep 2020 11:11:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A9E04C1023; Sun, 27 Sep 2020 11:10:49 +0200 (CEST)
Date:   Sun, 27 Sep 2020 11:10:49 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Pujin Shi <shipujin.t@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pujin Shi <shipj@lemote.com>
Subject: Re: [PATCH] MIPS: idle: Add prototype for function check_wait
Message-ID: <20200927091049.GD4929@alpha.franken.de>
References: <20200922065439.3760-1-shipujin.t@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922065439.3760-1-shipujin.t@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 22, 2020 at 02:54:39PM +0800, Pujin Shi wrote:
> This commit adds a prototype to fix warning at W=1:
> 
>   arch/mips/kernel/idle.c:126:13: error: no previous prototype for 'check_wait' [-Werror=missing-prototypes]
> 
> Signed-off-by: Pujin Shi <shipj@lemote.com>

your mail address and signed-off address don't match. Could you please
resent either with a From: Pujin Shi <shipj@lemote.com> in the mail body
or a Signed-off-by with your gmail address ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
