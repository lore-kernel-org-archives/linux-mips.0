Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F52C64E75
	for <linux-mips@archiver.kernel.org>; Fri, 27 Nov 2020 09:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D5E421D93
	for <linux-mips@archiver.kernel.org>; Fri, 27 Nov 2020 09:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbgK0J5M (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 27 Nov 2020 04:57:12 -0500
Received: from elvis.franken.de ([193.175.24.41]:32816 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbgK0J5M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Nov 2020 04:57:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kiaV3-000709-00; Fri, 27 Nov 2020 10:57:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5B6EDC02A2; Fri, 27 Nov 2020 10:32:24 +0100 (CET)
Date:   Fri, 27 Nov 2020 10:32:24 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH v2 0/2] IPS: Fix up apply_r_mips_26_rel and add KASLR
 support for Loongson64
Message-ID: <20201127093223.GA4859@alpha.franken.de>
References: <1606298812-6928-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606298812-6928-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 25, 2020 at 06:06:52PM +0800, Jinyang He wrote:
> Abandon the third patch in v1. There are many other factors that should
> be considered. If possible, I'll fix it later.
> 
> Jinyang He (2):
>   MIPS: KASLR: Correcte valid bits in apply_r_mips_26_rel()
>   MIPS: Loongson64: Add KASLR support
> 
>  arch/mips/Kconfig           |  5 ++++-
>  arch/mips/kernel/relocate.c | 11 +++++++++--
>  2 files changed, 13 insertions(+), 3 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
