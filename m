Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51673C77B76
	for <linux-mips@archiver.kernel.org>; Fri, 21 Apr 2023 23:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjDUXB6 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 21 Apr 2023 19:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjDUXB6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 19:01:58 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF3B3199C
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 16:01:56 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ppzlL-0004c7-00; Sat, 22 Apr 2023 01:01:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6C4FBC0130; Sat, 22 Apr 2023 00:01:08 +0200 (CEST)
Date:   Sat, 22 Apr 2023 00:01:08 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, "kernelci.org bot" <bot@kernelci.org>
Subject: Re: [PATCH for 6.3] MIPS: Define RUNTIME_DISCARD_EXIT in LD script
Message-ID: <20230421220108.GA17472@alpha.franken.de>
References: <20230408203348.28896-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408203348.28896-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 08, 2023 at 09:33:48PM +0100, Jiaxun Yang wrote:
> MIPS's exit sections are discarded at runtime as well.
> 
> Fixes link error:
> `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
> defined in discarded section `.exit.text' of fs/fuse/inode.o
> 
> Fixes: 99cb0d917ffa ("arch: fix broken BuildID for arm64 and riscv")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/kernel/vmlinux.lds.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index 52cbde60edf5..9ff55cb80a64 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -15,6 +15,8 @@
>  #define EMITS_PT_NOTE
>  #endif
>  
> +#define RUNTIME_DISCARD_EXIT
> +
>  #include <asm-generic/vmlinux.lds.h>
>  
>  #undef mips
> -- 
> 2.39.2 (Apple Git-143)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
