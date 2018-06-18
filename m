Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:53181 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994585AbeFRSw0iRI0- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Jun 2018 20:52:26 +0200
Date: Mon, 18 Jun 2018 11:51:41 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: implement smp_cond_load_acquire() for Loongson-3
Message-ID: <20180618185141.yvkrsbdi2gbxjxj7@pburton-laptop>
References: <1529042858-9483-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1529042858-9483-1-git-send-email-chenhc@lemote.com>
Return-Path: <Paul.Burton@mips.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Huacai Chen <chenhuacai@gmail.com>, stable@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <andrea.parri@amarulasolutions.com>, Will Deacon <will.deacon@arm.com>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>, linux-kernel@vger.kernel.org
Message-ID: <20180618185141.YibbQ9urqf41kdet6rHzAq0rY_CcG8DONdZ1eX97Pxs@z>

Hi Huacai,

On Fri, Jun 15, 2018 at 02:07:38PM +0800, Huacai Chen wrote:
> After commit 7f56b58a92aaf2c ("locking/mcs: Use smp_cond_load_acquire()
> in MCS spin loop") Loongson-3 fails to boot. This is because Loongson-3
> has SFB (Store Fill Buffer) and READ_ONCE() may get an old value in a
> tight loop. So in smp_cond_load_acquire() we need a __smp_mb() after
> every READ_ONCE().

Thanks - modifying smp_cond_load_acquire() is a step better than
modifying arch_mcs_spin_lock_contended() to avoid it, but I'm still not
sure we've reached the root of the problem. If tight loops using
READ_ONCE() are at fault then what's special about
smp_cond_load_acquire()? Could other such loops not hit the same
problem?

Is the scenario you encounter the same as that outlined in the "DATA
DEPENDENCY BARRIERS (HISTORICAL)" section of
Documentation/memory-barriers.txt by any chance? If so then perhaps it
would be better to implement smp_read_barrier_depends(), or just raw
read_barrier_depends() depending upon how your SFB functions.

Is there any public documentation describing the behaviour of the store
fill buffer in Loongson-3?

Part of the problem is that I'm still not sure what's actually happening
in your system - it would be helpful to have further information in the
commit message about what actually happens. For example if you could
walk us through an example of the problem step by step in the style of
the diagrams you'll see in Documentation/memory-barriers.txt then I
think that would help us to see what the best solution here is.

I've copied the LKMM maintainers in case they have further input.

Thanks,
    Paul

> This patch introduce a Loongson-specific smp_cond_load_acquire(). And
> it should be backported to as early as linux-4.5, in which release the
> smp_cond_acquire() is introduced.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/barrier.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrier.h
> index a5eb1bb..4ea384d 100644
> --- a/arch/mips/include/asm/barrier.h
> +++ b/arch/mips/include/asm/barrier.h
> @@ -222,6 +222,23 @@
>  #define __smp_mb__before_atomic()	__smp_mb__before_llsc()
>  #define __smp_mb__after_atomic()	smp_llsc_mb()
>  
> +#ifdef CONFIG_CPU_LOONGSON3
> +/* Loongson-3 need a __smp_mb() after READ_ONCE() here */
> +#define smp_cond_load_acquire(ptr, cond_expr)			\
> +({								\
> +	typeof(ptr) __PTR = (ptr);				\
> +	typeof(*ptr) VAL;					\
> +	for (;;) {						\
> +		VAL = READ_ONCE(*__PTR);			\
> +		__smp_mb();					\
> +		if (cond_expr)					\
> +			break;					\
> +		cpu_relax();					\
> +	}							\
> +	VAL;							\
> +})
> +#endif	/* CONFIG_CPU_LOONGSON3 */
> +
>  #include <asm-generic/barrier.h>
>  
>  #endif /* __ASM_BARRIER_H */
> -- 
> 2.7.0
> 
