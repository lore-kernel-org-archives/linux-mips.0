Return-Path: <SRS0=WdV3=CG=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1308C433E2
	for <linux-mips@archiver.kernel.org>; Fri, 28 Aug 2020 07:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C99D820DD4
	for <linux-mips@archiver.kernel.org>; Fri, 28 Aug 2020 07:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgH1Hsa (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 28 Aug 2020 03:48:30 -0400
Received: from elvis.franken.de ([193.175.24.41]:36645 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728274AbgH1Hsa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Aug 2020 03:48:30 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kBZ7c-0007Zj-00; Fri, 28 Aug 2020 09:48:28 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D4FA4C0E03; Fri, 28 Aug 2020 09:41:18 +0200 (CEST)
Date:   Fri, 28 Aug 2020 09:41:18 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
Message-ID: <20200828074118.GA5732@alpha.franken.de>
References: <20200825043807.5741-1-huangpei@loongson.cn>
 <20200825043807.5741-2-huangpei@loongson.cn>
 <0d88a29f-035b-2c91-c802-3a405d8f69d8@gmail.com>
 <20200826101037.5aam5rhuiais3yrc@ambrosehua-HP-xw6600-Workstation>
 <893e5ba3-1f2b-d439-1294-d4860a2bf672@gmail.com>
 <20200827114131.b7weawkym7ke37wx@ambrosehua-HP-xw6600-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827114131.b7weawkym7ke37wx@ambrosehua-HP-xw6600-Workstation>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 27, 2020 at 07:41:31PM +0800, Huang Pei wrote:
> On Wed, Aug 26, 2020 at 04:17:43PM +0300, Sergei Shtylyov wrote:
> 
> >From 218f23077352a7befd2aaad3fa46b93112d4051b Mon Sep 17 00:00:00 2001
> From: Huang Pei <huangpei@loongson.cn>
> Date: Fri, 21 Aug 2020 10:48:40 +0800
> Subject: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
> 
> init_fp_ctx just initialize the fp/msa context, and own_fp_inatomic
> just restore FCSR and 64bit FP regs from it, but miss MSACSR and upper
> MSA regs for MSA, so MSACSR and MSA upper regs's value from previous
> task on current cpu can leak into current task and cause unpredictable
> behavior when MSA context not initialized.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>

Please submit in a new email and not in respone to another mail, and
add a Fixes tag.  Otherwise the fix looks correct to me. Thank you.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
