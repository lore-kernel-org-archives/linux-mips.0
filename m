Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBEEC4332B
	for <linux-mips@archiver.kernel.org>; Fri, 22 Jan 2021 12:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3789D239EE
	for <linux-mips@archiver.kernel.org>; Fri, 22 Jan 2021 12:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbhAVMEe (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 22 Jan 2021 07:04:34 -0500
Received: from elvis.franken.de ([193.175.24.41]:42485 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727822AbhAVKyi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 05:54:38 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l2u4h-0006yq-01; Fri, 22 Jan 2021 11:53:55 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4E4F5C0BF1; Fri, 22 Jan 2021 11:49:30 +0100 (CET)
Date:   Fri, 22 Jan 2021 11:49:30 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Ming Wang <wangming01@loongson.cn>
Subject: Re: [PATCH] MIPS: Make definitions of MIPSInst_FMA_{FUNC,FMTM}
 consistent with MIPS64 manual
Message-ID: <20210122104930.GA8146@alpha.franken.de>
References: <1611301998-25676-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611301998-25676-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 22, 2021 at 03:53:18PM +0800, Tiezhu Yang wrote:
> The kernel definitions of MIPSInst_FMA_FUNC and MIPSInst_FMA_FFMT are not
> consistent with MADD.fmt, NMADD.fmt and NMSUB.fmt in the MIPS64 manual [1],
> the field func is bit 5..3 and fmt is bit 2..0, fix them. Otherwise there
> exists error when add new instruction simulation.
> 
> [1] https://www.mips.com/?do-download=the-mips64-instruction-set-v6-06
> 
> Reported-by: Ming Wang <wangming01@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/include/asm/inst.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
