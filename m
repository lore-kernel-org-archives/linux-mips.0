Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E053C433FE
	for <linux-mips@archiver.kernel.org>; Tue,  8 Dec 2020 06:47:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4666F23A79
	for <linux-mips@archiver.kernel.org>; Tue,  8 Dec 2020 06:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgLHGrQ (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 8 Dec 2020 01:47:16 -0500
Received: from [157.25.102.26] ([157.25.102.26]:59082 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726104AbgLHGrQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Dec 2020 01:47:16 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 1CB4A2BE0EC;
        Tue,  8 Dec 2020 06:46:44 +0000 (GMT)
Date:   Tue, 8 Dec 2020 06:46:41 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jinyang He <hejinyang@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: KASLR: Fix sync_icache() trapped in loop when
 synci_step is zero
In-Reply-To: <642b9149-6de5-fa04-80e2-aed7367b3cce@loongson.cn>
Message-ID: <alpine.LFD.2.21.2012071716470.2104409@eddie.linux-mips.org>
References: <1606878005-11427-1-git-send-email-hejinyang@loongson.cn> <20201202103943.GA9065@alpha.franken.de> <642b9149-6de5-fa04-80e2-aed7367b3cce@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 3 Dec 2020, Jinyang He wrote:

> Thus, only one synci operation is required when synci_step is 0
> on Loongson64 platform. I guess that some other platforms have
> similar implementations on synci, so add judgment conditions in
> `while` to ensure that at least all platforms perform synci
> operations once. For those platforms that do not need synci,
> they just do one more operation similar to nop.

 This is non-compliant and looks to me like a risky choice for what was 
invented to guarantee portability across all MIPS systems.  Compliant 
software will fail with Loongson64 processors unless patched like this 
piece, and you don't really have control over all user software out there 
(I would expect issues with JIT engines and the like).

 If only a single SYNCI operation is ever required why wasn't SYNCI_Step 
set to some large value instead that would in reality prevent looping over 
SYNCI from happening?

  Maciej
