Received: from mailapp01.imgtec.com ([195.59.15.196]:50322 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007825AbcBYA72Tmb3x (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 25 Feb 2016 01:59:28 +0100
Date: Thu, 25 Feb 2016 00:59:21 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Introduce cpu_has_coherent_cache feature
In-Reply-To: <1456324384-18118-3-git-send-email-chenhc@lemote.com>
Message-ID: <alpine.DEB.2.00.1602250050170.15885@tp.orcam.me.uk>
References: <1456324384-18118-1-git-send-email-chenhc@lemote.com> <1456324384-18118-3-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Aurelien Jarno <aurelien@aurel32.net>, "Steven J . Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "Maciej W. Rozycki" <macro@linux-mips.org>
Message-ID: <20160225005921.-dQYdO9fKuQXLbDkBVGZDeKLSETyj_iI-o4JnXOUdGg@z>

On Wed, 24 Feb 2016, Huacai Chen wrote:

> If a platform maintains cache coherency by hardware fully:
>  1) It's icache is coherent with dcache.
>  2) It's dcaches don't alias (maybe depend on PAGE_SIZE).
>  3) It maintains cache coherency across cores (and for DMA).
> 
> So we introduce a MIPS_CPU_CACHE_COHERENT bit, and a cpu feature named
> cpu_has_coherent_cache to modify MIPS's cache flushing functions.
[...]
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index caac3d7..04a38d8 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -428,6 +428,9 @@ static void r4k_blast_scache_setup(void)
>  
>  static inline void local_r4k___flush_cache_all(void * args)
>  {
> +	if (cpu_has_coherent_cache)
> +		return;
> +
[etc.]

 Have you considered setting the relevant handlers to `cache_noop' in 
`r4k_cache_init' instead?  It seems more natural to me and avoids the 
performance hit where `cpu_has_coherent_cache' is variable, which at this 
time means everywhere.

 Also you don't set the MIPS_CPU_CACHE_COHERENT bit anywhere within you 
patch set -- is there a follow-up change you're going to submit?

  Maciej
