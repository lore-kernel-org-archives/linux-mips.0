Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3EFEB64DC
	for <linux-mips@archiver.kernel.org>; Mon, 17 Jul 2023 22:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjGQW2q (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 17 Jul 2023 18:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGQW2p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Jul 2023 18:28:45 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B191799;
        Mon, 17 Jul 2023 15:28:44 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 6CB5D92009C; Tue, 18 Jul 2023 00:28:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 666E992009B;
        Mon, 17 Jul 2023 23:28:43 +0100 (BST)
Date:   Mon, 17 Jul 2023 23:28:43 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Huacai Chen <chenhuacai@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        stable@vger.kernel.org, Huang Pei <huangpei@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Fix cpu_probe_loongson() again
In-Reply-To: <20230626075014.1872632-1-chenhuacai@loongson.cn>
Message-ID: <alpine.DEB.2.21.2307172320240.55436@angie.orcam.me.uk>
References: <20230626075014.1872632-1-chenhuacai@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 26 Jun 2023, Huacai Chen wrote:

> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index e79adcb128e6..b406d8bfb15a 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1677,7 +1677,10 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
>  
>  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>  {
> +	c->cputype = CPU_LOONGSON64;
> +
>  	/* All Loongson processors covered here define ExcCode 16 as GSExc. */
> +	decode_configs(c);
>  	c->options |= MIPS_CPU_GSEXCEX;

 This has misplaced the comment, which is not about `decode_configs' at 
all.  For consistency with other code it also seems like `decode_configs' 
would best be called as the first statement of `cpu_probe_loongson'.

  Maciej
