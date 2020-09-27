Return-Path: <SRS0=MUgy=DE=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B573BC4346E
	for <linux-mips@archiver.kernel.org>; Sun, 27 Sep 2020 11:11:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C8D6239E5
	for <linux-mips@archiver.kernel.org>; Sun, 27 Sep 2020 11:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgI0LLm (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 27 Sep 2020 07:11:42 -0400
Received: from elvis.franken.de ([193.175.24.41]:60021 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbgI0LLm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Sep 2020 07:11:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kMUaj-0002VG-00; Sun, 27 Sep 2020 13:11:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 24720C1023; Sun, 27 Sep 2020 13:11:29 +0200 (CEST)
Date:   Sun, 27 Sep 2020 13:11:29 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Pujin Shi <shipujin.t@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: idle: Add prototype for function check_wait
Message-ID: <20200927111129.GA6217@alpha.franken.de>
References: <20200927092205.1252-1-shipujin.t@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927092205.1252-1-shipujin.t@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 27, 2020 at 05:22:05PM +0800, Pujin Shi wrote:
> This commit adds a prototype to fix warning at W=1:
> 
>   arch/mips/kernel/idle.c:126:13: error: no previous prototype for 'check_wait' [-Werror=missing-prototypes]
> 
> Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
> ---
>  arch/mips/include/asm/idle.h | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
