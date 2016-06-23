Received: from mail-am1on0106.outbound.protection.outlook.com ([157.56.112.106]:24767
        "EHLO emea01-am1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27043809AbcFWMOXmxeHu (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 23 Jun 2016 14:14:23 +0200
Date: Thu, 23 Jun 2016 15:09:06 +0300
From: Aaro Koskinen <aaro.koskinen@nokia.com>
Subject: Re: [PATCH] MIPS: Fix page table corruption on THP permission
 changes.
Message-ID: <20160623120903.GR3012@ak-desktop.emea.nsn-net.net>
References: <1466117431-18020-1-git-send-email-ddaney.cavm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1466117431-18020-1-git-send-email-ddaney.cavm@gmail.com>
Return-Path: <aaro.koskinen@nokia.com>
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
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20160623120906.r_9oz2YA2uxNQAOo-7DE6ewyxovIfiZCpsBrAUTc78k@z>

Hi,

On Thu, Jun 16, 2016 at 03:50:31PM -0700, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> When the core THP code is modifying the permissions of a huge page it
> calls pmd_modify(), which unfortunately was clearing the _PAGE_HUGE bit
> of the page table entry.  The result can be kernel messages like:
> 
> mm/memory.c:397: bad pmd 000000040080004d.
> mm/memory.c:397: bad pmd 00000003ff00004d.
> mm/memory.c:397: bad pmd 000000040100004d.
> 
> or:
> 
> ------------[ cut here ]------------
> WARNING: at mm/mmap.c:3200 exit_mmap+0x150/0x158()
> Modules linked in: ipv6 at24 octeon3_ethernet octeon_srio_nexus m25p80
> CPU: 12 PID: 1295 Comm: pmderr Not tainted 3.10.87-rt80-Cavium-Octeon #4
> Stack : 0000000040808000 0000000014009ce1 0000000000400004 ffffffff81076ba0
>           0000000000000000 0000000000000000 ffffffff85110000 0000000000000119
>           0000000000000004 0000000000000000 0000000000000119 43617669756d2d4f
>           0000000000000000 ffffffff850fda40 ffffffff85110000 0000000000000000
>           0000000000000000 0000000000000009 ffffffff809207a0 0000000000000c80
>           ffffffff80f1bf20 0000000000000001 000000ffeca36828 0000000000000001
>           0000000000000000 0000000000000001 000000ffeca7e700 ffffffff80886924
>           80000003fd7a0000 80000003fd7a39b0 80000003fdea8000 ffffffff80885780
>           80000003fdea8000 ffffffff80f12218 000000000000000c 000000000000050f
>           0000000000000000 ffffffff80865c4c 0000000000000000 0000000000000000
>           ...
> Call Trace:
> [<ffffffff80865c4c>] show_stack+0x6c/0xf8
> [<ffffffff80885780>] warn_slowpath_common+0x78/0xa8
> [<ffffffff809207a0>] exit_mmap+0x150/0x158
> [<ffffffff80882d44>] mmput+0x5c/0x110
> [<ffffffff8088b450>] do_exit+0x230/0xa68
> [<ffffffff8088be34>] do_group_exit+0x54/0x1d0
> [<ffffffff8088bfc0>] __wake_up_parent+0x0/0x18
> 
> ---[ end trace c7b38293191c57dc ]---
> BUG: Bad rss-counter state mm:80000003fa168000 idx:1 val:1536
> 
> Fix by not clearing _PAGE_HUGE bit.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> Cc: stable@vger.kernel.org

Tested-by: Aaro Koskinen <aaro.koskinen@nokia.com>

A.

> ---
>  arch/mips/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index a6b611f..477b1b1 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -632,7 +632,7 @@ static inline struct page *pmd_page(pmd_t pmd)
>  
>  static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  {
> -	pmd_val(pmd) = (pmd_val(pmd) & _PAGE_CHG_MASK) | pgprot_val(newprot);
> +	pmd_val(pmd) = (pmd_val(pmd) & (_PAGE_CHG_MASK | _PAGE_HUGE)) | pgprot_val(newprot);
>  	return pmd;
>  }
>  
> -- 
> 1.7.11.7
> 
> 
