Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD50C433FE
	for <linux-mips@archiver.kernel.org>; Sun,  6 Dec 2020 09:38:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B18C22D03
	for <linux-mips@archiver.kernel.org>; Sun,  6 Dec 2020 09:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgLFJic (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 6 Dec 2020 04:38:32 -0500
Received: from [157.25.102.26] ([157.25.102.26]:44592 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726134AbgLFJic (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Dec 2020 04:38:32 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 0BF622BE0EC;
        Sun,  6 Dec 2020 09:37:59 +0000 (GMT)
Date:   Sun, 6 Dec 2020 07:10:22 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
cc:     linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        tsbogend@alpha.franken.de, xie.he.0141@gmail.com
Subject: Re: MIPS + clang-11 + allnoconfig / tinyconfig builds failed
In-Reply-To: <CA+G9fYtofC2yzWWB4+YmSp2gv-CoG=boZJ4kXbdO250p1d3MBg@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2012060706380.656242@eddie.linux-mips.org>
References: <CA+G9fYtofC2yzWWB4+YmSp2gv-CoG=boZJ4kXbdO250p1d3MBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 25 Nov 2020, Naresh Kamboju wrote:

> /builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/lib/uncached.c:45:6:
> warning: variable 'sp' is uninitialized when used here
> [-Wuninitialized]
>         if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
>             ^~
> /builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/lib/uncached.c:40:18:
> note: initialize the variable 'sp' to silence this warning
>         register long sp __asm__("$sp");
>                         ^
>                          = 0

 FWIW this looks like a compiler bug to me, because $sp, by definition, is 
always initialised.  I suggest that you report it to Clang developers 
instead.

  Maciej

