Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:46641 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990491AbdLUO7U4OizN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Dec 2017 15:59:20 +0100
Date: Thu, 21 Dec 2017 14:58:02 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH 2/3] MIPS: Add barrier between dcache & icache flushes
Message-ID: <20171221145801.GF5027@jhogan-linux.mipstec.com>
References: <1513854965-3880-1-git-send-email-matt.redfearn@mips.com>
 <1513854965-3880-2-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1513854965-3880-2-git-send-email-matt.redfearn@mips.com>
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, "stable # v4 . 9+" <stable@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>
Message-ID: <20171221145802.KuoC_5F4HLcHvoa76KuMBRgvtKb6BHgiHQ28l6BtRGA@z>

On Thu, Dec 21, 2017 at 11:16:03AM +0000, Matt Redfearn wrote:
> Index-based cache operations may be arbitrarily reordered by out of
> order CPUs. Thus code which writes back the dcache & then invalidates
> the icache using indexed cache ops must include a barrier between
> operating on the 2 caches in order to prevent the scenario in which:
> 
>   - icache invalidation occurs.
>   - icache fetch occurs, due to speculation.
>   - dcache writeback occurs.
> 
> If the above were allowed to happen then the icache would contain stale
> data. Forcing the dcache writeback to complete before the icache
> invalidation avoids this.
> 
> Similarly, the MIPS CM version 2 and above serialises D->I hit-based
> cache operations to the same address, but older CMs and systems without
> a MIPS CM do not and require the same barrier to ensure ordering.
> 
> To ensure these conditions, always enforce a barrier between D and I
> cache operations.
> 
> Suggested-by: Leonid Yegoshin <Leonid.Yegoshin@mips.com>
> Suggested-by: Paul Burton <paul.burton@mips.com>
> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
> Cc: James Hogan <james.hogan@mips.com>
> Cc: stable <stable@vger.kernel.org> # v4.9+

Looks reasonable to me,

Reviewed-by: James Hogan <jhogan@kernel.org>

Cheers
James

> ---
> 
>  arch/mips/mm/c-r4k.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index ce7a54223504..b7186d47184b 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -741,6 +741,9 @@ static inline void __local_r4k_flush_icache_range(unsigned long start,
>  			else
>  				blast_dcache_range(start, end);
>  		}
> +
> +		/* Ensure dcache operation has completed */
> +		mb();
>  	}
>  
>  	if (type == R4K_INDEX ||
> -- 
> 2.7.4
> 
