Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F84C433C1
	for <linux-mips@archiver.kernel.org>; Sat, 27 Mar 2021 09:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD70661A02
	for <linux-mips@archiver.kernel.org>; Sat, 27 Mar 2021 09:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhC0JmL (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 27 Mar 2021 05:42:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:53063 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230322AbhC0Jlo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Mar 2021 05:41:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lQ5Rt-00055c-00; Sat, 27 Mar 2021 10:41:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F0151C1D41; Sat, 27 Mar 2021 10:40:11 +0100 (CET)
Date:   Sat, 27 Mar 2021 10:40:11 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     f.fainelli@gmail.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/1] MIPS: fix compilation error
Message-ID: <20210327094011.GA4259@alpha.franken.de>
References: <20210326134158.268164-1-sandberg@mailfence.com>
 <20210326164645.433147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326164645.433147-1-sandberg@mailfence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 26, 2021 at 06:46:44PM +0200, Mauri Sandberg wrote:
> Earlier I had some confusion with my configuration as compared to
> ath79_defconfig but now it looks like that enabling
> CONFIG_MIPS_ELF_APPENDED_DTB alone will break compilation.
> 
> Simple fix of removing 'const' did not work and something more is needed.

your first fix works perfect for me. Could please describe what the error
is ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
