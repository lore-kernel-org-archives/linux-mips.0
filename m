Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F754C8300C
	for <linux-mips@archiver.kernel.org>; Fri,  9 Jun 2023 08:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240266AbjFII0h (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 9 Jun 2023 04:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241422AbjFIIZx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Jun 2023 04:25:53 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 506B63C23;
        Fri,  9 Jun 2023 01:24:53 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1q7XQE-0004Jv-05; Fri, 09 Jun 2023 10:24:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3F303C02EE; Fri,  9 Jun 2023 10:21:58 +0200 (CEST)
Date:   Fri, 9 Jun 2023 10:21:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Manuel Lauss <manuel.lauss@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Revert "MIPS: unhide PATA_PLATFORM"
Message-ID: <20230609082158.GF8160@alpha.franken.de>
References: <alpine.DEB.2.21.2306011327300.59991@angie.orcam.me.uk>
 <alpine.DEB.2.21.2306011335100.59991@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2306011335100.59991@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 01, 2023 at 01:56:36PM +0100, Maciej W. Rozycki wrote:
> Revert commit 75b18aac6fa3 ("MIPS: unhide PATA_PLATFORM") now that 
> HAVE_PATA_PLATFORM is set selectively for all the relevant platforms.
> 
> Verified with `db1xxx_defconfig' and `sb1250_swarm_defconfig' by making 
> sure PATA_PLATFORM is still there in `.config' with this change applied, 
> and with `malta_defconfig' by making sure it's now gone.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
>  arch/mips/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
> 
> linux-mips-no-pata-platform.diff
> Index: linux-macro/arch/mips/Kconfig
> ===================================================================
> --- linux-macro.orig/arch/mips/Kconfig
> +++ linux-macro/arch/mips/Kconfig
> @@ -79,7 +79,6 @@ config MIPS
>  	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>  	select HAVE_MOD_ARCH_SPECIFIC
>  	select HAVE_NMI
> -	select HAVE_PATA_PLATFORM
>  	select HAVE_PERF_EVENTS
>  	select HAVE_PERF_REGS
>  	select HAVE_PERF_USER_STACK_DUMP

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
