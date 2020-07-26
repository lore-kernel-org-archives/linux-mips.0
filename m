Return-Path: <SRS0=ftTt=BF=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C84C433EA
	for <linux-mips@archiver.kernel.org>; Sun, 26 Jul 2020 08:32:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 318CD20715
	for <linux-mips@archiver.kernel.org>; Sun, 26 Jul 2020 08:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgGZIca (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 26 Jul 2020 04:32:30 -0400
Received: from elvis.franken.de ([193.175.24.41]:49115 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgGZIcX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Jul 2020 04:32:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jzc4y-0004Hg-02; Sun, 26 Jul 2020 10:32:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D06C9C0A2D; Sun, 26 Jul 2020 10:25:01 +0200 (CEST)
Date:   Sun, 26 Jul 2020 10:25:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        stable <stable@vger.kernel.org>
Subject: Re: [PATCH V2] MIPS: CPU#0 is not hotpluggable
Message-ID: <20200726082501.GC5032@alpha.franken.de>
References: <1594896024-16624-1-git-send-email-chenhc@lemote.com>
 <CAAhV-H4QH-cyabcfYyNJv89LpOdpsXN+dpZBYy0gNKmSnsUsKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4QH-cyabcfYyNJv89LpOdpsXN+dpZBYy0gNKmSnsUsKA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 25, 2020 at 02:37:52PM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> What do you think about this patch? Other archs also do the same thing
> except those support hotplug CPU#0.

I'm ok with the patch, I'm just wondering if this is a hardware or
software limitation. If it's the latter, what needs to be done to
support it ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
