Return-Path: <SRS0=/Yte=C6=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EFCC4727C
	for <linux-mips@archiver.kernel.org>; Mon, 21 Sep 2020 21:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5E0C23A62
	for <linux-mips@archiver.kernel.org>; Mon, 21 Sep 2020 21:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgIUVxO (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 21 Sep 2020 17:53:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:49925 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgIUVxM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 17:53:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-0A; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 97D04C0FE4; Mon, 21 Sep 2020 22:31:04 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:31:04 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: malta: remove mach-malta/malta-dtshim.h header file
Message-ID: <20200921203104.GJ29322@alpha.franken.de>
References: <20200920211343.117262-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920211343.117262-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 11:13:42PM +0200, Thomas Bogendoerfer wrote:
> To clean up mach-* directories move external declaration of malta_dt_shim()
> to mips-boards/malta.h and remove malta-dtshim.h.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mach-malta/malta-dtshim.h | 25 -------------------------
>  arch/mips/include/asm/mips-boards/malta.h       |  2 ++
>  arch/mips/mti-malta/malta-setup.c               |  1 -
>  3 files changed, 2 insertions(+), 26 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-malta/malta-dtshim.h

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
