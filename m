Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A61DC433ED
	for <linux-mips@archiver.kernel.org>; Thu,  8 Apr 2021 15:03:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD57161103
	for <linux-mips@archiver.kernel.org>; Thu,  8 Apr 2021 15:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbhDHPD5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 8 Apr 2021 11:03:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:34929 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231990AbhDHPD5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Apr 2021 11:03:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lUWC8-00053m-00; Thu, 08 Apr 2021 17:03:44 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EBDCBC24D9; Thu,  8 Apr 2021 16:54:55 +0200 (CEST)
Date:   Thu, 8 Apr 2021 16:54:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix new sparse warning
Message-ID: <20210408145455.GA11560@alpha.franken.de>
References: <20210406230348.130713-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406230348.130713-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 07, 2021 at 01:03:48AM +0200, Thomas Bogendoerfer wrote:
> Commit 45deb5faeb9e ("MIPS: uaccess: Remove get_fs/set_fs call sites")
> caused a few new sparse warning, fix them.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/access-helper.h | 7 ++++---
>  arch/mips/kernel/unaligned.c     | 6 +++---
>  2 files changed, 7 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
