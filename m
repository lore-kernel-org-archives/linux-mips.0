Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EB9C63697
	for <linux-mips@archiver.kernel.org>; Thu, 19 Nov 2020 12:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE17A2468B
	for <linux-mips@archiver.kernel.org>; Thu, 19 Nov 2020 12:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbgKSMz3 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 19 Nov 2020 07:55:29 -0500
Received: from elvis.franken.de ([193.175.24.41]:43164 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727285AbgKSMz2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 07:55:28 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kfjTD-00054t-01; Thu, 19 Nov 2020 13:55:27 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2F5CAC0259; Thu, 19 Nov 2020 13:53:48 +0100 (CET)
Date:   Thu, 19 Nov 2020 13:53:48 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] MIPS: vdso: Use vma page protection for remapping
Message-ID: <20201119125348.GB6314@alpha.franken.de>
References: <20201113110952.68086-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113110952.68086-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 13, 2020 at 12:09:49PM +0100, Thomas Bogendoerfer wrote:
> MIPS protection bits are setup during runtime so using defines like
> PAGE_READONLY ignores these runtime changes. To fix this we simply
> use the page protection of the setup vma.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/vdso.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
