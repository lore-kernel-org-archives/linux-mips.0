Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:39734 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992618AbeCBMmZUEula (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Mar 2018 13:42:25 +0100
Date: Fri, 2 Mar 2018 12:07:46 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH V2 1/2] MIPS: Loongson64: Select
 ARCH_MIGHT_HAVE_PC_PARPORT
In-Reply-To: <1519871862-14624-1-git-send-email-chenhc@lemote.com>
Message-ID: <alpine.DEB.2.00.1803021204250.10166@tp.orcam.me.uk>
References: <1519871862-14624-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>
Message-ID: <20180302120746.H5SY3S8aC8hl3vM0Fn1pa1ANQnOIEIHMtpDV-Xh3EDo@z>

On Wed, 28 Feb 2018, Huacai Chen wrote:

> diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
> index bc2fdbf..12812a8b 100644
> --- a/arch/mips/loongson64/Kconfig
> +++ b/arch/mips/loongson64/Kconfig
> @@ -7,6 +7,7 @@ choice
>  config LEMOTE_FULOONG2E
>  	bool "Lemote Fuloong(2e) mini-PC"
>  	select ARCH_SPARSEMEM_ENABLE
> +	select ARCH_MIGHT_HAVE_PC_PARPORT
>  	select CEVT_R4K
>  	select CSRC_R4K
>  	select SYS_HAS_CPU_LOONGSON2E

 Hmm, I don't think the Fuloong(2e) machine has a parallel port connector.  
The chipset may support the port, but with no external connection I think 
there's no point in enabling it.  Or am I missing something?

  Maciej
