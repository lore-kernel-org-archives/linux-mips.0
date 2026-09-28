Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F26C286425;
	Mon, 28 Sep 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584716; cv=none; b=KHH/NGw70WIIA5uci3Vf6O/DB1Vy9JcxLbjLNhYkE3qGkDTwiJOEL5fY+1kfCN3SHccKS5T6EdG80XsX139mkxJOo4Xi61pjLoXUQKuRpb0T7FsV+IrOV9e/ZjSYadl4jEvcn2mkRdvKOBWzYiX9IjXLxFo9LkgDSOwzXuxC6oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584716; c=relaxed/simple;
	bh=wSp8Pc/VGCI1m1KQxlWRyWzMuI0pgTUZVrpsxawskRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDgzcTWG56gJUK5NcQR2NUm9PreRaCt7WiAXTGpKkuNn+n6Chm645wg+9SBmTJvFH0qqLU9jWj6bTZa7ezLFDqLs6ad5NLB8r3KR1CVakY0VyLcxhJRHg7GvLimuvFRuvqzKOaacg8AVPmnArljeezFcKet+wUvX950ZOZbivMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xB6sQ-0003sV-00; Mon, 28 Sep 2026 10:38:22 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 17B4FC02BE; Mon, 28 Sep 2026 10:35:18 +0200 (CEST)
Date: Mon, 28 Sep 2026 10:35:18 +0200
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
Subject: Re: [PATCH v3 3/5] irqchip/mips-gic: Enable interrupt when moving
 affinity across clusters
Message-ID: <aromxuuQiPvajsEl@alpha.franken.de>
References: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
 <20260907-sync-gic-counters-v3-3-3d891ddabdaf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907-sync-gic-counters-v3-3-3d891ddabdaf@bootlin.com>

On Mon, Sep 07, 2026 at 02:46:37PM +0200, Benoît Monin wrote:
> When an interrupt's affinity is moved to a CPU in another cluster,
> gic_set_affinity() updates the routing (GIC_SH_MAP_VP) and trigger type
> in the destination cluster, but never touched the interrupt's mask state.
> 
> The interrupt mask is per-cluster. After such a move the interrupt was
> left disabled in the destination cluster, so it never fires despite
> being correctly routed to its new VP.
> 
> Handle the mask explicitly on a cross-cluster affinity change: in the
> old cluster, write GIC_SH_RMASK to disable the interrupt while clearing
> the route so it is no longer delivered. And in the new cluster, set the
> mask to enable the interrupt along with reconfiguring the trigger type.
> 
> Fixes: 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/irqchip/irq-mips-gic.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index f2ae60d39d66..4b76a65f12c9 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -390,14 +390,17 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
>  
>  	/*
>  	 * If we're moving affinity between clusters, stop routing the
> -	 * interrupt to any VP(E) in the old cluster.
> +	 * interrupt to any VP(E) in the old cluster and disable
> +	 * the interrupt in that cluster.
>  	 */
>  	if (cl != old_cl) {
>  		if (gic_irq_lock_cluster(d)) {
>  			write_gic_redir_map_vp(irq, 0);
> +			write_gic_redir_rmask(irq);
>  			mips_cm_unlock_other();
>  		} else {
>  			write_gic_map_vp(irq, 0);
> +			write_gic_rmask(irq);
>  		}
>  	}
>  
> @@ -409,10 +412,17 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
>  
>  	/*
>  	 * If we're moving affinity between clusters, configure the interrupt
> -	 * trigger type in the new cluster.
> +	 * trigger type and enable the interrupt in the new cluster.
>  	 */
> -	if (cl != old_cl)
> +	if (cl != old_cl) {
>  		gic_set_type_locked(d, irqd_get_trigger_type(d));
> +		if (gic_irq_lock_cluster(d)) {
> +			write_gic_redir_smask(irq);
> +			mips_cm_unlock_other();
> +		} else {
> +			write_gic_smask(irq);
> +		}
> +	}

shouldn't this be done depending on the mask state in the old cluster ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
