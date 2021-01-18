Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBD6C433E6
	for <linux-mips@archiver.kernel.org>; Mon, 18 Jan 2021 14:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1C1E22CA0
	for <linux-mips@archiver.kernel.org>; Mon, 18 Jan 2021 14:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392971AbhARO66 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 18 Jan 2021 09:58:58 -0500
Received: from elvis.franken.de ([193.175.24.41]:33803 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393055AbhARO6x (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Jan 2021 09:58:53 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l1Vyq-0008VQ-01; Mon, 18 Jan 2021 15:58:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A961EC06E7; Mon, 18 Jan 2021 15:57:58 +0100 (CET)
Date:   Mon, 18 Jan 2021 15:57:58 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH mips-next 0/2] MIPS: optimize relocations processing
Message-ID: <20210118145758.GB11749@alpha.franken.de>
References: <20210116150126.20693-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210116150126.20693-1-alobakin@pm.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jan 16, 2021 at 03:01:57PM +0000, Alexander Lobakin wrote:
> This series converts the logics of two main relocation functions,
> one for relocatable kernel and one for modules, from the arrays of
> handlers (callbacks) to plain switch-case functions, which allows
> the compiler to greatly optimize the code, so the relocations will
> be applied faster with lesser code size.
> 
> Tested on MIPS32 R2 with GCC 10.2 and LLVM 11.0 with -O2.
> 
> Alexander Lobakin (2):
>   MIPS: module: optimize module relocations processing
>   MIPS: relocatable: optimize the relocation process
> 
>  arch/mips/kernel/module.c   | 109 +++++++++++++++++-------------------
>  arch/mips/kernel/relocate.c |  54 ++++++++++--------
>  2 files changed, 82 insertions(+), 81 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
