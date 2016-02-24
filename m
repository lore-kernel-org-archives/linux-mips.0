Received: from bes.se.axis.com ([195.60.68.10]:33714 "EHLO bes.se.axis.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27010622AbcBXICyamWt9 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 24 Feb 2016 09:02:54 +0100
Message-ID: <56CD63A6.5090305@axis.com>
Date: Wed, 24 Feb 2016 09:02:46 +0100
From: Lars Persson <lars.persson@axis.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] MIPS: Flush highmem pages from dcache in __flush_icache_page
References: <1456164585-26910-1-git-send-email-paul.burton@imgtec.com> <1456164585-26910-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1456164585-26910-2-git-send-email-paul.burton@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <lars.persson@axis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jerome Marchand <jmarchan@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <20160224080246.zXYDhl6d_4zH1jaOcr8RO47-KfYrw5kkbWLxf1hs6Bs@z>


On 02/22/2016 07:09 PM, Paul Burton wrote:
> When a page is to be mapped executable for userspace, we can presume
> that the icache doesn't contain anything valid for its address range but
> we cannot be sure that its content has been written back from the dcache
> to L2 or memory further out. If the icache fills from those memories,
> ie. does not fill from the dcache, then we need to ensure that content
> has been flushed from the dcache. This was being done for lowmem pages
> but not for highmem pages. Fix this by mapping the page & flushing its
> content from the dcache in __flush_icache_page, before the page is
> provided to userland.
>

Reviewed-by: Lars Persson <larper@axis.com>

> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
>
> ---
>
>   arch/mips/mm/cache.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
> index 3f159ca..734cb2f 100644
> --- a/arch/mips/mm/cache.c
> +++ b/arch/mips/mm/cache.c
> @@ -16,6 +16,7 @@
>   #include <linux/mm.h>
>
>   #include <asm/cacheflush.h>
> +#include <asm/highmem.h>
>   #include <asm/processor.h>
>   #include <asm/cpu.h>
>   #include <asm/cpu-features.h>
> @@ -124,10 +125,14 @@ void __flush_icache_page(struct vm_area_struct *vma, struct page *page)
>   	unsigned long addr;
>
>   	if (PageHighMem(page))
> -		return;
> +		addr = (unsigned long)kmap_atomic(page);
> +	else
> +		addr = (unsigned long)page_address(page);
>
> -	addr = (unsigned long) page_address(page);
>   	flush_data_cache_page(addr);
> +
> +	if (PageHighMem(page))
> +		__kunmap_atomic((void *)addr);
>   }
>   EXPORT_SYMBOL_GPL(__flush_icache_page);
>
>
