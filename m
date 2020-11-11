Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B23C56202
	for <linux-mips@archiver.kernel.org>; Thu, 12 Nov 2020 01:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4954C2168B
	for <linux-mips@archiver.kernel.org>; Thu, 12 Nov 2020 01:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgKLBdU (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 11 Nov 2020 20:33:20 -0500
Received: from elvis.franken.de ([193.175.24.41]:54620 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727767AbgKKXGO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Nov 2020 18:06:14 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kczBl-0005fC-03; Thu, 12 Nov 2020 00:06:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 32668C4DDF; Thu, 12 Nov 2020 00:05:41 +0100 (CET)
Date:   Thu, 12 Nov 2020 00:05:41 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 6/6] MIPS: Loongson64: Move decode_cpucfg() to
 loongson_regs.h
Message-ID: <20201111230541.GD19275@alpha.franken.de>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
 <1604387525-23400-7-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604387525-23400-7-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 03, 2020 at 03:12:05PM +0800, Tiezhu Yang wrote:
> Since decode_cpucfg() is only used for Loongson64, just move
> it to loongson_regs.h to avoid the pollution of common code
> with #ifdef CONFIG_CPU_LOONGSON64.

right now I prefer the way it is. Something like this would be
needed, if we are able to build a generic kernel, which works 
also on Loongson64.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
