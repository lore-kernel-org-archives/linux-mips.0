Return-Path: <SRS0=Surf=DP=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D14C4363C
	for <linux-mips@archiver.kernel.org>; Thu,  8 Oct 2020 15:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A597A21927
	for <linux-mips@archiver.kernel.org>; Thu,  8 Oct 2020 15:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731078AbgJHPan (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 8 Oct 2020 11:30:43 -0400
Received: from [157.25.102.26] ([157.25.102.26]:45398 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730918AbgJHPam (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Oct 2020 11:30:42 -0400
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 034142BE086;
        Thu,  8 Oct 2020 16:30:38 +0100 (BST)
Date:   Thu, 8 Oct 2020 16:30:35 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Serge Semin <fancer.lancer@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
In-Reply-To: <20201008152006.4khkbzsxqmmz76rw@mobilestation>
Message-ID: <alpine.LFD.2.21.2010081628100.866917@eddie.linux-mips.org>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de> <20201008152006.4khkbzsxqmmz76rw@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 8 Oct 2020, Serge Semin wrote:

> At least I don't see a decent reason to preserve them. The memory registration
> method does nearly the same sanity checks. The memory reservation function
> defers a bit in adding the being reserved memory first. That seems redundant,
> since the reserved memory won't be available for the system anyway. Do I miss
> something?

 At the very least it serves informational purposes as it shows up in 
/proc/iomem.

  Maciej
