Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B11C4361B
	for <linux-mips@archiver.kernel.org>; Sat, 19 Dec 2020 15:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2F602220B
	for <linux-mips@archiver.kernel.org>; Sat, 19 Dec 2020 15:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgLSPsK (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 19 Dec 2020 10:48:10 -0500
Received: from elvis.franken.de ([193.175.24.41]:50498 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726748AbgLSPsK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 19 Dec 2020 10:48:10 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kqeS8-0004Nk-00; Sat, 19 Dec 2020 16:47:28 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A920BC01CC; Sat, 19 Dec 2020 16:26:16 +0100 (CET)
Date:   Sat, 19 Dec 2020 16:26:16 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bert Vermeulen <bert@biot.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add support for Realtek RTL838x/RTL839x switch SoCs
Message-ID: <20201219152616.GA5012@alpha.franken.de>
References: <20201215183557.646034-1-bert@biot.com>
 <fbd86bc4-5826-5b2b-5818-3ccd39a090fb@rempel-privat.de>
 <a4d89688-347b-21af-ef29-a28cd480d2d9@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4d89688-347b-21af-ef29-a28cd480d2d9@biot.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 18, 2020 at 12:27:32AM +0100, Bert Vermeulen wrote:
> On 12/15/20 11:11 PM, Oleksij Rempel wrote:
> > Hello Bert,
> > 
> > thank you for your work. Here are some comments..
> 
> Thanks for reviewing. I will send in a V2 with your comments all handled.
> 
> > I assume, after applying all needed changes, there will be no files within
> > arch/mips/include/asm/mach-realtek :)
> 
> I wish! Unfortunately I need somewhere to put the early printk init call,
> and the SoC family ID checks -- as they are heavily used in various drivers.

just as a prevention, don't put realtek specific files into mach-realtek,
but only use realtek as directory name. The mach-xxx directories are
special and I have a mission on my todo to move the non-special files
into their own directores...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
