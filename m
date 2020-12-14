Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F10C2BB9A
	for <linux-mips@archiver.kernel.org>; Mon, 14 Dec 2020 17:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C21C922516
	for <linux-mips@archiver.kernel.org>; Mon, 14 Dec 2020 17:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440300AbgLNQ7p (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 14 Dec 2020 11:59:45 -0500
Received: from elvis.franken.de ([193.175.24.41]:40395 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440307AbgLNQ73 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Dec 2020 11:59:29 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1korBJ-0006zU-00; Mon, 14 Dec 2020 17:58:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 311E2C037B; Mon, 14 Dec 2020 16:32:55 +0100 (CET)
Date:   Mon, 14 Dec 2020 16:32:55 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] MIPS: mm: Clean up setup of protection map
Message-ID: <20201214153255.GA9983@alpha.franken.de>
References: <20201113110952.68086-1-tsbogend@alpha.franken.de>
 <20201113110952.68086-4-tsbogend@alpha.franken.de>
 <20201212160716.GA206510@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212160716.GA206510@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Dec 12, 2020 at 08:29:23AM -0800, Guenter Roeck wrote:
> On Fri, Nov 13, 2020 at 12:09:52PM +0100, Thomas Bogendoerfer wrote:
> > Protection map difference between RIXI and non RIXI cpus is _PAGE_NO_EXEC
> > and _PAGE_NO_READ usage. Both already take care of cpu_has_rixi while
> > setting up the page bits. So we just need one setup of protection map
> > and can drop the now unused (and broken for RIXI) PAGE_* defines.
> > 
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> 
> This patch results in:
> 
> drivers/video/fbdev/udlfb.c: In function 'dlfb_ops_mmap':
> drivers/video/fbdev/udlfb.c:343:52: error: 'PAGE_SHARED' undeclared (first use in this function)
>   343 |   if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
>       |                                                    ^~~~~~~~~~~
> 
> when building mips:allmodconfig.

thank you for the report, I've pushed a fix to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
