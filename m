Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786C8C77B61
	for <linux-mips@archiver.kernel.org>; Mon, 24 Apr 2023 11:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjDXLdb (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 24 Apr 2023 07:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDXLdb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Apr 2023 07:33:31 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8C02B3586;
        Mon, 24 Apr 2023 04:33:29 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pquRe-0004yK-00; Mon, 24 Apr 2023 13:33:22 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C7BCEC026C; Mon, 24 Apr 2023 13:32:16 +0200 (CEST)
Date:   Mon, 24 Apr 2023 13:32:16 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH] MIPS: uprobes: Restore thread.trap_nr
Message-ID: <20230424113216.GA7962@alpha.franken.de>
References: <1682213883-3654-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1682213883-3654-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 23, 2023 at 09:38:03AM +0800, Tiezhu Yang wrote:
> thread.trap_nr is saved in arch_uprobe_pre_xol(), it should be restored
> in arch_uprobe_{post,abort}_xol() accordingly, actually it was only done
> in the post function, just do it in the abort function too, this change
> is similar with x86 and powerpc.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/kernel/uprobes.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
> index 6b630ed..401b148 100644
> --- a/arch/mips/kernel/uprobes.c
> +++ b/arch/mips/kernel/uprobes.c
> @@ -191,6 +191,7 @@ void arch_uprobe_abort_xol(struct arch_uprobe *aup,
>  {
>  	struct uprobe_task *utask = current->utask;
>  
> +	current->thread.trap_nr = utask->autask.saved_trap_nr;
>  	instruction_pointer_set(regs, utask->vaddr);
>  }
>  
> -- 
> 2.1.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
