Return-Path: <SRS0=uxCP=6V=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77A9C54E4A
	for <linux-mips@archiver.kernel.org>; Thu,  7 May 2020 08:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0FF52080D
	for <linux-mips@archiver.kernel.org>; Thu,  7 May 2020 08:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgEGIj3 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 7 May 2020 04:39:29 -0400
Received: from elvis.franken.de ([193.175.24.41]:43296 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbgEGIj2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 04:39:28 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jWc3t-0006Ql-00; Thu, 07 May 2020 10:39:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C024AC03A7; Thu,  7 May 2020 10:35:00 +0200 (CEST)
Date:   Thu, 7 May 2020 10:35:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: asm: Use __ASSEMBLY__ to guard some macros to
 avoid build error
Message-ID: <20200507083500.GA8887@alpha.franken.de>
References: <1588830863-30416-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588830863-30416-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 01:54:23PM +0800, Huacai Chen wrote:
> Use __ASSEMBLY__ to guard definitions of some macros (PANIC and PRINT)
> to avoid build error:
> 
> 1, PANIC conflicts with drivers/scsi/smartpqi/smartpqi_init.c
> 2, PRINT conflicts with net/netfilter/nf_conntrack_h323_asn1.c and net/
>    mac80211/debugfs_sta.c

how about prefixing them to make them more unique ? Something like
MIPS_ASM_PRINT/MIPS_ASM_PANIC ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
