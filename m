Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7253453D9D5;
	Tue, 29 Sep 2026 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701275; cv=none; b=dPeotgbVSr5KfUHKoOaMNvcovrNzT8zeqUEqQKzFlQkVZxVAnYeVqPXPVCy81vPfuZG2FsfiVz3mTpLEGyPsVzq9o7QAJxLBebZWrCJDnR89oC74G2SXJ3u5lp7W8AhkVBPWGB7+j+kJ9yxDSvV/Trlgdz1DzRx9i8f6v+5Grzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701275; c=relaxed/simple;
	bh=Rabq6Q9+T/qOe5bLcUl+TYr43hAHbB8ss/JqYkLZ++g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eudn/dHAD3EIlyJrG9REu2hSNToQyJPvoy1TC/zgVtQO+HHipXt3rdXS2LwMEAYxJrQsuz1SevyaLGI12F4wz1+cTNTABPBRfR7i5g8NOOJQ62RSfT1ks91Jq7Cc/u/yYIb3yIFktf/VFl9mjDd3Nvnr8fvUN2y1LFjOCqVdSzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xBbCO-0005Ga-00; Tue, 29 Sep 2026 19:01:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 2DD2AC0955; Tue, 29 Sep 2026 19:00:36 +0200 (CEST)
Date: Tue, 29 Sep 2026 19:00:36 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] irqchip/mips-gic: Transfer interrupt mask state
 across clusters
Message-ID: <arvutL1S7NsR7mKZ@alpha.franken.de>
References: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
 <20260929-sync-gic-counters-v4-3-ec70c4b60434@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-sync-gic-counters-v4-3-ec70c4b60434@bootlin.com>

On Tue, Sep 29, 2026 at 02:14:10PM +0200, Benoît Monin wrote:
> When an interrupt's affinity is moved to a CPU in another cluster,
> gic_set_affinity() updates the routing (GIC_SH_MAP_VP) and trigger type
> in the destination cluster, but never touched the interrupt's mask state.
> 
> The interrupt mask is per-cluster. After such a move the interrupt may
> be left disabled in the destination cluster, so it never fires despite
> being correctly routed to its new VP.
> 
> Move the mask state along with the interrupt: disable it in the old
> cluster while clearing the route so it is no longer delivered, then
> configure the trigger type in the new cluster and re-enable it there
> if it was enabled in the old cluster.
> 
> Fixes: 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/irqchip/irq-mips-gic.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index f2ae60d39d66..be38989d8e73 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -368,6 +368,7 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
>  	unsigned int irq = GIC_HWIRQ_TO_SHARED(d->hwirq);
>  	unsigned int cpu, cl, old_cpu, old_cl;
>  	unsigned long flags;
> +	bool enabled;
>  
>  	/*
>  	 * The GIC specifies that we can only route an interrupt to one VP(E),
> @@ -389,15 +390,20 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
>  	raw_spin_lock_irqsave(&gic_lock, flags);
>  
>  	/*
> -	 * If we're moving affinity between clusters, stop routing the
> -	 * interrupt to any VP(E) in the old cluster.
> +	 * If we're moving affinity between clusters, save the interrupt's
> +	 * mask state, stop routing it to any VP(E) in the old cluster and
> +	 * disable it there so it is no longer delivered.
>  	 */
>  	if (cl != old_cl) {
>  		if (gic_irq_lock_cluster(d)) {
> +			enabled = read_gic_redir_mask(irq);
>  			write_gic_redir_map_vp(irq, 0);
> +			write_gic_redir_rmask(irq);
>  			mips_cm_unlock_other();
>  		} else {
> +			enabled = read_gic_mask(irq);
>  			write_gic_map_vp(irq, 0);
> +			write_gic_rmask(irq);
>  		}
>  	}
>  
> @@ -409,10 +415,20 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
>  
>  	/*
>  	 * If we're moving affinity between clusters, configure the interrupt
> -	 * trigger type in the new cluster.
> +	 * trigger type and, if it was enabled in the old cluster, enable it
> +	 * in the new one.
>  	 */
> -	if (cl != old_cl)
> +	if (cl != old_cl) {
>  		gic_set_type_locked(d, irqd_get_trigger_type(d));
> +		if (enabled) {
> +			if (gic_irq_lock_cluster(d)) {
> +				write_gic_redir_smask(irq);
> +				mips_cm_unlock_other();
> +			} else {
> +				write_gic_smask(irq);
> +			}
> +		}
> +	}
>  
>  	/* Route the interrupt to its new VP(E) */
>  	if (gic_irq_lock_cluster(d)) {
> 
> -- 
> 2.55.0

Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
