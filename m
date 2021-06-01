Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F38C4708F
	for <linux-mips@archiver.kernel.org>; Tue,  1 Jun 2021 09:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36C266108D
	for <linux-mips@archiver.kernel.org>; Tue,  1 Jun 2021 09:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhFAJxh (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 1 Jun 2021 05:53:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:59987 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230170AbhFAJxh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 05:53:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lo13y-0001KW-03; Tue, 01 Jun 2021 11:51:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 88686C1B8C; Tue,  1 Jun 2021 11:48:19 +0200 (CEST)
Date:   Tue, 1 Jun 2021 11:48:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Lobakin <alobakin@pm.me>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] mips: syscalls: use pattern rules to generate
 syscall headers
Message-ID: <20210601094819.GD6961@alpha.franken.de>
References: <20210528034615.2157002-1-masahiroy@kernel.org>
 <20210528034615.2157002-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528034615.2157002-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 28, 2021 at 12:46:15PM +0900, Masahiro Yamada wrote:
> Use pattern rules to unify similar build rules among n32, n64, and o32.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/kernel/syscalls/Makefile | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
