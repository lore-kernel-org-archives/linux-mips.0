Return-Path: <SRS0=Gkct=DV=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2F2C433E7
	for <linux-mips@archiver.kernel.org>; Wed, 14 Oct 2020 12:47:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C01E21527
	for <linux-mips@archiver.kernel.org>; Wed, 14 Oct 2020 12:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgJNMrK (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 14 Oct 2020 08:47:10 -0400
Received: from [157.25.102.26] ([157.25.102.26]:33818 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727061AbgJNMrK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Oct 2020 08:47:10 -0400
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 784BA2BE086;
        Wed, 14 Oct 2020 13:47:07 +0100 (BST)
Date:   Wed, 14 Oct 2020 13:47:06 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] MIPS: replace add_memory_region with memblock
In-Reply-To: <20201009121449.64081-1-tsbogend@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2010141344200.866917@eddie.linux-mips.org>
References: <20201009121449.64081-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 9 Oct 2020, Thomas Bogendoerfer wrote:

> add_memory_region was the old interface for registering memory and
> was already changed to used memblock internaly. Replace it by
> directly calling memblock functions.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

 For the DEC part:

Acked-by: Maciej W. Rozycki <macro@linux-mips.org>

NB this does not apply cleanly to upstream master, but I was able to 
verify this regardless as the DEC part does.  For future reference: what 
tree do you usually use that you post patches against?

  Maciej
