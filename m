Received: from szxga07-in.huawei.com ([45.249.212.35]:34709 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23994637AbeISJFTBvklQ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 19 Sep 2018 11:05:19 +0200
Date: Wed, 19 Sep 2018 10:04:49 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [RFC PATCH 03/29] mm: remove CONFIG_HAVE_MEMBLOCK
Message-ID: <20180919100449.00006df9@huawei.com>
In-Reply-To: <1536163184-26356-4-git-send-email-rppt@linux.vnet.ibm.com>
References: <1536163184-26356-1-git-send-email-rppt@linux.vnet.ibm.com>
        <1536163184-26356-4-git-send-email-rppt@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-Path: <jonathan.cameron@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Paul Burton <paul.burton@mips.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com
Message-ID: <20180919090449.JAmMurbkKmjUbInErJ6P2AG1jt10NjvdVlmV6ArpRIE@z>

On Wed, 5 Sep 2018 18:59:18 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> All architecures use memblock for early memory management. There is no need
> for the CONFIG_HAVE_MEMBLOCK configuration option.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

Hi Mike,

A minor editing issue in here that is stopping boot on arm64 platforms with latest
version of the mm tree.

> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 76c83c1..bd841bb 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1115,13 +1115,11 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	return 1;
>  }
>  
> -#ifdef CONFIG_HAVE_MEMBLOCK
>  #ifndef MIN_MEMBLOCK_ADDR
>  #define MIN_MEMBLOCK_ADDR	__pa(PAGE_OFFSET)
>  #endif
>  #ifndef MAX_MEMBLOCK_ADDR
>  #define MAX_MEMBLOCK_ADDR	((phys_addr_t)~0)
> -#endif

This isn't the right #endif. It is matching with the #ifndef MAX_MEMBLOCK_ADDR
not the intented #ifdef CONFIG_HAVE_MEMBLOCK.

Now I haven't chased through the exact reason this is causing my acpi
arm64 system not to boot on the basis it is obviously miss-matched anyway
and I'm inherently lazy.  It's resulting in stubs replacing the following weak
functions.

early_init_dt_add_memory_arch
(this is defined elsewhere for some architectures but not arm)

early_init_dt_mark_hotplug_memory_arch
(there is only one definition of this in the kernel so it doesn't
 need to be weak or in the header etc).

early_init_dt_reserve_memory_arch
(defined on mips but nothing else)

Taking out the right endif also lets you drop an #else removing some stub
functions further down in here.

Nice cleanup in general btw.

Thanks,

Jonathan
>  
>  void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>  {
