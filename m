Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9257EC433ED
	for <linux-mips@archiver.kernel.org>; Wed,  7 Apr 2021 13:49:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67EFB61382
	for <linux-mips@archiver.kernel.org>; Wed,  7 Apr 2021 13:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242114AbhDGNuC (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 7 Apr 2021 09:50:02 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:38472 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234087AbhDGNuC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 09:50:02 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 74FCF92009C; Wed,  7 Apr 2021 15:49:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 7033092009B;
        Wed,  7 Apr 2021 15:49:51 +0200 (CEST)
Date:   Wed, 7 Apr 2021 15:49:51 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wei Li <liwei391@huawei.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] MIPS: add support for buggy MT7621S core detection
In-Reply-To: <CALCv0x0SwiOAWXk36vuFkspNSM16nS=wdMhm5ZNyOdFUia5zuw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2104071545330.65251@angie.orcam.me.uk>
References: <20210403061912.1012509-1-ilya.lipnitskiy@gmail.com> <alpine.DEB.2.21.2104060311490.65251@angie.orcam.me.uk> <CALCv0x0SwiOAWXk36vuFkspNSM16nS=wdMhm5ZNyOdFUia5zuw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 5 Apr 2021, Ilya Lipnitskiy wrote:

> Thanks for the comments. Including asm/bugs.h in asm/mips-cps.h led to
> some circular dependencies when I tried it, but I will try again based
> on your feedback - indeed it would be much cleaner to have this logic
> in mips_cps_numcores. The only wrinkle is that mips_cps_numcores may
> return a different value on MT7621 after the cores have started due to
> CPULAUNCH flags changing, but nobody calls mips_cps_numcores later
> anyway, so it's a moot point today. I will clean up the change and
> resend.

 Hmm, I don't know this system, but by the look of the code it queries 
launch[2], which I gather refers to the VPE #0 of an inexistent core #1, 
so why would the structure change given that there is no corresponding 
silicon?

  Maciej
