Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F355481246;
	Mon, 28 Sep 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584717; cv=none; b=oLxhttC1nbsf0h9cQLHSaDALPLPjHDwXmAllR0QcZ8bgKgOCgYsW/pmb+AZk3FCKe1pfLATe/RFjNqfF18FMn+1m/OcFtpTIPmgXeYGIwhCYv5DEfg5keF2m0RMnwl8YHI6CELwLiJGd/JtCZPs5K+yfU634Wc68wJvhrOToOfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584717; c=relaxed/simple;
	bh=JCs02xKGWIxRv3EUkDUqMdQ9sU+ibP050HNo+JQJ0ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jdq+gY8W1/6MJTkaAqbFPaRJ2GCnO/UmmL2HpWkUtdXDshUMp9DzUw2Mp305SbD7yayCgO5BzYyH7NHvbExf7uUMRtScBCtdWOed7lsVB+atan0paEGOZzYduZUCFG+rkQ1X2Hw9OUM7/6X8W6xM2hwGSin9JR9B2YKuOipFBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xB6sQ-0003sR-00; Mon, 28 Sep 2026 10:38:22 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id ED0A7C02BE; Mon, 28 Sep 2026 10:17:44 +0200 (CEST)
Date: Mon, 28 Sep 2026 10:17:44 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Paul Burton <paulburton@kernel.org>, Radu Rendec <radu@rendec.net>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] irqchip/mips-gic: Fix unbalanced cm_core_lock in
 for_each_online_cpu_gic()
Message-ID: <aroiqM6QcCGJZoaF@alpha.franken.de>
References: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
 <20260907-sync-gic-counters-v3-1-3d891ddabdaf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907-sync-gic-counters-v3-1-3d891ddabdaf@bootlin.com>

On Mon, Sep 07, 2026 at 02:46:35PM +0200, Benoît Monin wrote:
> Commit d9e2ed610a60 ("irqchip/mips-gic: Support multi-cluster in
> for_each_online_cpu_gic()") added a gic_unlock_cluster() call to the
> macro's loop increment, which unconditionally invokes
> mips_cm_unlock_other() on multi-cluster systems. However nothing in the
> loop ever acquires the corresponding mips_cm_lock_other(), so on
> multi-cluster hardware every invocation of for_each_online_cpu_gic()
> releases an unheld per-CPU cm_core_lock.
> 
> With CONFIG_PROVE_LOCKING this triggers a "bad unlock balance detected"
> warning at boot, e.g. from gic_irq_domain_map() while mapping local
> interrupts. Only the first occurrence is reported, since the first
> warning permanently disables lockdep (debug_locks = 0); the unbalanced
> release itself silently persists.
> 
> Fix this by moving both the acquire and release into
> __gic_with_next_online_cpu() so they stay balanced. When advancing to a
> CPU in a remote cluster, lock the CM redirect block for that cluster via
> mips_cm_lock_other(); when leaving a remote cluster (or finishing the
> iteration) release it with mips_cm_unlock_other(). Local-cluster CPUs
> require no locking, so single-cluster systems are unaffected. This also
> makes the redirect region behave correctly when accessing local register
> blocks of CPUs in other clusters.
> 
> Drop the now-unused gic_unlock_cluster() helper and its call from the
> for_each_online_cpu_gic() increment.
> 
> Fixes: d9e2ed610a60 ("irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()")
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/irqchip/irq-mips-gic.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index 19a57c5e2b2e..3b31cbcbed6f 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -70,6 +70,10 @@ static int __gic_with_next_online_cpu(int prev)
>  {
>  	unsigned int cpu;
>  
> +	/* Release the redirect/other region lock to the previous CPU, if any. */
> +	if (prev >= 0)
> +		mips_cm_unlock_other();
> +
>  	/* Discover the next online CPU */
>  	cpu = cpumask_next(prev, cpu_online_mask);
>  
> @@ -77,23 +81,12 @@ static int __gic_with_next_online_cpu(int prev)
>  	if (cpu >= nr_cpu_ids)
>  		return cpu;
>  
> -	/*
> -	 * Move the access lock to the next CPU's GIC local register block.
> -	 *
> -	 * Set GIC_VL_OTHER. Since the caller holds gic_lock nothing can
> -	 * clobber the written value.
> -	 */
> -	write_gic_vl_other(mips_cm_vp_id(cpu));
> +	/* Lock access to redirect/other region to the next CPU */
> +	mips_cm_lock_other_cpu(cpu, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
>  
>  	return cpu;
>  }
>  
> -static inline void gic_unlock_cluster(void)
> -{
> -	if (mips_cps_multicluster_cpus())
> -		mips_cm_unlock_other();
> -}
> -
>  /**
>   * for_each_online_cpu_gic() - Iterate over online CPUs, access local registers
>   * @cpu: An integer variable to hold the current CPU number
> @@ -108,7 +101,6 @@ static inline void gic_unlock_cluster(void)
>  	guard(raw_spinlock_irqsave)(gic_lock);		\
>  	for ((cpu) = __gic_with_next_online_cpu(-1);	\
>  	     (cpu) < nr_cpu_ids;			\
> -	     gic_unlock_cluster(),			\
>  	     (cpu) = __gic_with_next_online_cpu(cpu))
>  
>  /**
> 
> -- 
> 2.55.0

Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
