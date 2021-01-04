Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077BFC433E0
	for <linux-mips@archiver.kernel.org>; Mon,  4 Jan 2021 10:49:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2ECD21E92
	for <linux-mips@archiver.kernel.org>; Mon,  4 Jan 2021 10:49:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbhADKtI (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 4 Jan 2021 05:49:08 -0500
Received: from elvis.franken.de ([193.175.24.41]:57203 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbhADKtH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 05:49:07 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kwNPU-0001xs-00; Mon, 04 Jan 2021 11:48:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B6D2AC07D5; Mon,  4 Jan 2021 11:41:54 +0100 (CET)
Date:   Mon, 4 Jan 2021 11:41:54 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: zboot: head.S clean up
Message-ID: <20210104104154.GA4765@alpha.franken.de>
References: <20201230034723.17266-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230034723.17266-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 30, 2020 at 11:47:22AM +0800, Jiaxun Yang wrote:
> .cprestore is removed as we don't expect Position Independent
> zboot ELF.
> 
> .noreorder is also removed and rest instructions are massaged
> to improve readability.
> 
> t9 register is used for indirect jump as MIPS ABI requirement.
> 
> start label is removed as it already defined in LEAF.
> 
> Reported-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> --
> v2: Remove start label (paul)
> ---
>  arch/mips/boot/compressed/head.S | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
