Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]:6461
        "EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6825888Ab3EGR6dABhPL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 7 May 2013 19:58:33 +0200
Message-ID: <518940BB.3080307@caviumnetworks.com>
Date: Tue, 7 May 2013 10:58:19 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Make virt_to_phys() work for all unmapped addresses.
References: <1367947427-21649-1-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1367947427-21649-1-git-send-email-ddaney.cavm@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Jiang Liu <liuj97@gmail.com>, eunb.song@samsung.com, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20130507175819.pLGT8gS54uininM8EYkCdMi91aVN3v7irUbWOJFZcmE@z>

It doesn't apply anymore.  It was against v3.4.

I will send one against Linus' tree soon.

David Daney


On 05/07/2013 10:23 AM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
>
> As reported:
>    This problem was discovered when doing BGP traffic with the TCP MD5 option
>    activated, where the following call chain caused a crash:
>
>     * tcp_v4_rcv
>     *  tcp_v4_timewait_ack
>     *   tcp_v4_send_ack -> follow stack variable rep.th
>     *    tcp_v4_md5_hash_hdr
>     *     tcp_md5_hash_header
>     *      sg_init_one
>     *       sg_set_buf
>     *        virt_to_page
>
>    I noticed that tcp_v4_send_reset uses a similar stack variable and
>    also calls tcp_v4_md5_hash_hdr, so it has the same problem.
>
> The networking core can indirectly call virt_to_phys() on stack
> addresses, if this is done from PID 0, the stack will usually be in
> CKSEG0, so virt_to_phys() needs to work there as well
>
> Signed-off-by: David Daney <david.daney@cavium.com>
> ---
>
> Not tested against kernel.org kernel, but it may still apply
>
> This could also fix problems noted by Eunbong Song with the
> free_initmem_default() call.
>
>   arch/mips/include/asm/io.h   | 2 +-
>   arch/mips/include/asm/page.h | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> index a58f229..37fa957 100644
> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -116,7 +116,7 @@ static inline void set_io_port_base(unsigned long base)
>    */
>   static inline unsigned long virt_to_phys(volatile const void *address)
>   {
> -	return (unsigned long)address - PAGE_OFFSET + PHYS_OFFSET;
> +	return __pa(address);
>   }
>
>   /*
> diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
> index cee3893..e09bff9 100644
> --- a/arch/mips/include/asm/page.h
> +++ b/arch/mips/include/asm/page.h
> @@ -48,7 +48,6 @@
>   #ifndef __ASSEMBLY__
>
>   #include <linux/pfn.h>
> -#include <asm/io.h>
>
>   extern void build_clear_page(void);
>   extern void build_copy_page(void);
> @@ -139,7 +138,6 @@ typedef struct { unsigned long pgprot; } pgprot_t;
>    */
>   #define ptep_buddy(x)	((pte_t *)((unsigned long)(x) ^ sizeof(pte_t)))
>
> -#endif /* !__ASSEMBLY__ */
>
>   /*
>    * __pa()/__va() should be used only during mem init.
> @@ -156,6 +154,9 @@ typedef struct { unsigned long pgprot; } pgprot_t;
>   #endif
>   #define __va(x)		((void *)((unsigned long)(x) + PAGE_OFFSET - PHYS_OFFSET))
>
> +#include <asm/io.h>
> +#endif /* !__ASSEMBLY__ */
> +
>   /*
>    * RELOC_HIDE was originally added by 6007b903dfe5f1d13e0c711ac2894bdd4a61b1ad
>    * (lmo) rsp. 8431fd094d625b94d364fe393076ccef88e6ce18 (kernel.org).  The
>
