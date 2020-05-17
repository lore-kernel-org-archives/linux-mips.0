Return-Path: <SRS0=JGv4=67=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFBBC433E0
	for <linux-mips@archiver.kernel.org>; Sun, 17 May 2020 11:01:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E41292070A
	for <linux-mips@archiver.kernel.org>; Sun, 17 May 2020 11:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgEQLBW (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 17 May 2020 07:01:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:56509 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727832AbgEQLBW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 07:01:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jaH2m-000449-01; Sun, 17 May 2020 13:01:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id ED5A2C04EC; Sun, 17 May 2020 12:59:55 +0200 (CEST)
Date:   Sun, 17 May 2020 12:59:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Split R10000 to allow for R12K+ optimizations
Message-ID: <20200517105955.GB5508@alpha.franken.de>
References: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 13, 2020 at 08:55:27PM -0400, Joshua Kinard wrote:
> From: Joshua Kinard <kumba@gentoo.org>
> 
> The attached patch adds more-specific support for R12000 and higher
> CPUs by splitting the R10000 logic at several places.  This avoids
> the workarounds enabled by R10000_LLSC_WAR and passes -mno-fix-r10000
> to gcc during the kernel compile.

I've seen this patch multiple times already and I always think there
is something wrong with it. So we want to allow a way to disable
bug workarounds for old R10k (rev < 3.0), why not call it that way ?
Something like CONFIG_R10000_WORKAROUNDS, which defaults to y.
The only thing we would be missing is the -march=r12000 not sure,
if this makes much difference. Do I miss something else ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
