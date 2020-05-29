Return-Path: <SRS0=FAjd=7L=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FAFC433E0
	for <linux-mips@archiver.kernel.org>; Fri, 29 May 2020 11:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD9C1207F5
	for <linux-mips@archiver.kernel.org>; Fri, 29 May 2020 11:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgE2LTU (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 29 May 2020 07:19:20 -0400
Received: from elvis.franken.de ([193.175.24.41]:43330 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbgE2LTU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 07:19:20 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jed2g-0002OI-00; Fri, 29 May 2020 13:19:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1E552C05C4; Fri, 29 May 2020 13:18:58 +0200 (CEST)
Date:   Fri, 29 May 2020 13:18:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W . Rozycki " <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: Fix build warning about "PTR_STR" redefinition
Message-ID: <20200529111858.GA11955@alpha.franken.de>
References: <1590740530-15649-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590740530-15649-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 29, 2020 at 04:22:10PM +0800, Huacai Chen wrote:
>  arch/mips/include/asm/inst.h      | 779 ------------------------------------
>  arch/mips/include/asm/unaligned.h | 802 ++++++++++++++++++++++++++++++++++++++

please use a different filename for this to avoid another disaster
because asm/unaligned.h is already used.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
