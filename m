Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE022C43381
	for <linux-mips@archiver.kernel.org>; Wed,  3 Feb 2021 10:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9C7264F78
	for <linux-mips@archiver.kernel.org>; Wed,  3 Feb 2021 10:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233740AbhBCKlK (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 3 Feb 2021 05:41:10 -0500
Received: from elvis.franken.de ([193.175.24.41]:49422 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233337AbhBCKlK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 05:41:10 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7FaD-0005T6-03; Wed, 03 Feb 2021 11:40:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 79274C0D4A; Wed,  3 Feb 2021 11:38:01 +0100 (CET)
Date:   Wed, 3 Feb 2021 11:38:01 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     peterz@infradead.org, frederic@kernel.org, peterx@redhat.com,
        afzal.mohd.ma@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH V2] arch: mips: kernel: Fix two spelling in smp.c
Message-ID: <20210203103801.GD7586@alpha.franken.de>
References: <20210202091811.21057-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202091811.21057-1-unixbhaskar@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 02, 2021 at 02:48:11PM +0530, Bhaskar Chowdhury wrote:
> s/logcal/logical/
> s/intercpu/inter-CPU/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Changes from V1 :
>    Bart point out actual sentence construction was right,so keep it as it is.
>    Randy suggested to put better spelling casing,so inducted
>    Subject line adjusted accoring to the change
>  arch/mips/kernel/smp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
