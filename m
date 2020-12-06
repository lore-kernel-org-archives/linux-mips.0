Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F87C19425
	for <linux-mips@archiver.kernel.org>; Sun,  6 Dec 2020 09:38:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8027C22D03
	for <linux-mips@archiver.kernel.org>; Sun,  6 Dec 2020 09:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgLFJie (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 6 Dec 2020 04:38:34 -0500
Received: from [157.25.102.26] ([157.25.102.26]:44596 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726141AbgLFJid (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Dec 2020 04:38:33 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id E168B2BE0ED;
        Sun,  6 Dec 2020 09:37:59 +0000 (GMT)
Date:   Sun, 6 Dec 2020 09:36:16 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Anders Roxell <anders.roxell@linaro.org>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        natechancellor@gmail.com, ndesaulniers@google.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] mips: lib: uncached: fix uninitialized variable 'sp'
In-Reply-To: <20201127083938.2666770-1-anders.roxell@linaro.org>
Message-ID: <alpine.LFD.2.21.2012060915460.656242@eddie.linux-mips.org>
References: <20201127083938.2666770-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 27 Nov 2020, Anders Roxell wrote:

> When building mips tinyconfig with clang the following warning show up:
> 
> /tmp/arch/mips/lib/uncached.c:40:18: note: initialize the variable 'sp' to silence this warning
>         register long sp __asm__("$sp");
>                         ^
>                          = 0
> 
> Rework to make an explicit inline move.

 It's not uninitialised, because by definition $sp has been initialised.  
This code wouldn't have worked for the last 15 years otherwise.
 
 It is however non-standard usage (which may not have been clarified at 
the time this piece was made; I recall extensive discussions around this 
feature over the years):

"6.47.5.2 Specifying Registers for Local Variables
.................................................
[...]

"The only supported use for this feature is to specify registers for
input and output operands when calling Extended 'asm' (*note Extended
Asm::).  [...]"

so the change description should refer to that as the rationale rather 
than an implementation-specific misleading warning (although that can be 
quoted for a reference of course).

> diff --git a/arch/mips/lib/uncached.c b/arch/mips/lib/uncached.c
> index 09d5deea747f..21a4b94a0558 100644
> --- a/arch/mips/lib/uncached.c
> +++ b/arch/mips/lib/uncached.c
> @@ -37,10 +37,11 @@
>   */
>  unsigned long run_uncached(void *func)
>  {
> -	register long sp __asm__("$sp");
>  	register long ret __asm__("$2");
>  	long lfunc = (long)func, ufunc;
>  	long usp;
> +	long sp;
> +	asm ("move %0, $sp" : "=r" (sp));

 Missing newline between the variable block and code here; you may well 
swap it with the empty line below you have left.  Also use `__asm__' for 
consistency, and remove the extraneous space ahead of the parenthesis as 
we don't use them in Linux.  Using a tab to separate the mnemonic from 
operands is also preferable, i.e. "move\t%0, $sp" in this case (using 
actual tabs works better with multi-line assembly, but this is not one).

 I think this should be OK once the issues I mentioned here have been 
addressed.

  Maciej

