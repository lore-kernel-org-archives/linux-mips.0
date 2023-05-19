Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C2BC7EE26
	for <linux-mips@archiver.kernel.org>; Fri, 19 May 2023 20:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjESUaX (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 19 May 2023 16:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjESUaX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 May 2023 16:30:23 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 761DEE0;
        Fri, 19 May 2023 13:30:22 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 9DAEB92009D; Fri, 19 May 2023 22:30:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 8FB3392009B;
        Fri, 19 May 2023 21:30:21 +0100 (BST)
Date:   Fri, 19 May 2023 21:30:21 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 2/3] MIPS: Introduce config options for LLSC
 availability
In-Reply-To: <20230519164753.72065-3-jiaxun.yang@flygoat.com>
Message-ID: <alpine.DEB.2.21.2305192125360.50034@angie.orcam.me.uk>
References: <20230519164753.72065-1-jiaxun.yang@flygoat.com> <20230519164753.72065-3-jiaxun.yang@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 19 May 2023, Jiaxun Yang wrote:

> --- a/arch/mips/include/asm/cpu-features.h
> +++ b/arch/mips/include/asm/cpu-features.h
> @@ -185,8 +185,13 @@
>  #ifndef cpu_has_ejtag
>  #define cpu_has_ejtag		__opt(MIPS_CPU_EJTAG)
>  #endif
> +
>  #ifndef cpu_has_llsc
> -#define cpu_has_llsc		__isa_ge_or_opt(1, MIPS_CPU_LLSC)
> +# ifdef CONFIG_CPU_MAY_HAVE_LLSC
> +#  define cpu_has_llsc		(IS_ENABLED(CONFIG_CPU_HAS_LLSC) ||  __opt(MIPS_CPU_LLSC))

 Extraneous space and overlong line here.

  Maciej
