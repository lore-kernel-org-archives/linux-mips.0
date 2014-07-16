Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:40648 "EHLO
        cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816671AbaGPQA7DSNhP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jul 2014 18:00:59 +0200
Date: Wed, 16 Jul 2014 16:59:05 +0100
From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 1/4] asm-generic: Add dma-contiguous.h
Message-ID: <20140716155905.GS29414@arm.com>
References: <1405525892-60383-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1405525892-60383-2-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1405525892-60383-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Return-Path: <will.deacon@arm.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: "ralf@linux-mips.org" <ralf@linux-mips.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "mina86@mina86.com" <mina86@mina86.com>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
Message-ID: <20140716155905.I3G1rFh4FHjO0mNxdCyKrC06ab6SjOJfeYhIqy1Dnuw@z>

On Wed, Jul 16, 2014 at 04:51:29PM +0100, Zubair Lutfullah Kakakhel wrote:
> This header is used by arm64 and x86 individually.
> 
> Adding to asm-generic to avoid further code repetition while adding cma
> to mips.
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  include/asm-generic/dma-contiguous.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 include/asm-generic/dma-contiguous.h
> 
> diff --git a/include/asm-generic/dma-contiguous.h b/include/asm-generic/dma-contiguous.h
> new file mode 100644
> index 0000000..292c571
> --- /dev/null
> +++ b/include/asm-generic/dma-contiguous.h
> @@ -0,0 +1,9 @@
> +#ifndef _ASM_GENERIC_DMA_CONTIGUOUS_H
> +#define _ASM_GENERIC_DMA_CONTIGUOUS_H
> +
> +#include <linux/types.h>
> +
> +static inline void
> +dma_contiguous_early_fixup(phys_addr_t base, unsigned long size) { }
> +
> +#endif

  Acked-by: Will Deacon <will.deacon@arm.com>

Will
