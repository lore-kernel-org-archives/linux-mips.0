Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F40B481643;
	Mon, 28 Sep 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584715; cv=none; b=jbOFpteUPRPj/M21wpb874aCU1CevjPFOB2zwG7s8kYrmVez7KiH9vDhuMKtls+s0mSrnxtufj5+cGejAxCB9e85wc70F7hafQj2wxA8pMFgZLndjqN4YvE9ixkRJnFQPLJv9sd1Kwyngeg1tKwVH0wGoyktNDwIOSEfLqz4C/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584715; c=relaxed/simple;
	bh=xRNO/by/2nbYzoS2n4kE6HjL3ijCoclEq0fgOfixgEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPArhzC37GwYuiCEhnvt+I4jbkIQAsY3yRRtxBGw7FaKz/opFdIwt5vNA6SfOikjzHZ2SPaDaK3MPL0YoOmQwiKk22o55Ms4D11zBx66omRGYhShszd8kk9eEvtT1o68KdebFaX996Zr218VAw3D873KNapURZ7nOBFCRF4LARM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xB6sQ-0003sT-00; Mon, 28 Sep 2026 10:38:22 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 42272C02BE; Mon, 28 Sep 2026 10:22:07 +0200 (CEST)
Date: Mon, 28 Sep 2026 10:22:07 +0200
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
Subject: Re: [PATCH v3 2/5] irqchip/mips-gic: Fix recursive acquisition of
 gic_lock in gic_set_affinity()
Message-ID: <arojr46BtH7FEQOS@alpha.franken.de>
References: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
 <20260907-sync-gic-counters-v3-2-3d891ddabdaf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907-sync-gic-counters-v3-2-3d891ddabdaf@bootlin.com>

On Mon, Sep 07, 2026 at 02:46:36PM +0200, Benoît Monin wrote:
> Commit 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
> made gic_set_affinity() call gic_set_type() when an interrupt's
> affinity is moved between clusters. gic_set_type() takes gic_lock with
> raw_spin_lock_irqsave(), but gic_set_affinity() holds gic_lock at that
> point, so the same raw spinlock is acquired twice, triggering a deadlock.
> 
> Split gic_set_type() into a gic_set_type_locked() helper that assumes
> gic_lock is already held. gic_set_type() takes gic_lock and calls the
> helper, and gic_set_affinity() calls gic_set_type_locked() directly,
> since it already holds gic_lock.
> 
> Fixes: 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/irqchip/irq-mips-gic.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index 3b31cbcbed6f..f2ae60d39d66 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -297,14 +297,14 @@ static void gic_ack_irq(struct irq_data *d)
>  	}
>  }
>  
> -static int gic_set_type(struct irq_data *d, unsigned int type)
> +static int gic_set_type_locked(struct irq_data *d, unsigned int type)
>  {
>  	unsigned int irq, pol, trig, dual;
> -	unsigned long flags;
> +
> +	lockdep_assert_held(&gic_lock);
>  
>  	irq = GIC_HWIRQ_TO_SHARED(d->hwirq);
>  
> -	raw_spin_lock_irqsave(&gic_lock, flags);
>  	switch (type & IRQ_TYPE_SENSE_MASK) {
>  	case IRQ_TYPE_EDGE_FALLING:
>  		pol = GIC_POL_FALLING_EDGE;
> @@ -351,11 +351,16 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
>  	else
>  		irq_set_chip_handler_name_locked(d, &gic_level_irq_controller,
>  						 handle_level_irq, NULL);
> -	raw_spin_unlock_irqrestore(&gic_lock, flags);
>  
>  	return 0;
>  }
>  
> +static int gic_set_type(struct irq_data *d, unsigned int type)
> +{
> +	guard(raw_spinlock_irqsave)(&gic_lock);
> +	return gic_set_type_locked(d, type);
> +}
> +
>  #ifdef CONFIG_SMP
>  static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
>  			    bool force)
> @@ -407,7 +412,7 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
>  	 * trigger type in the new cluster.
>  	 */
>  	if (cl != old_cl)
> -		gic_set_type(d, irqd_get_trigger_type(d));
> +		gic_set_type_locked(d, irqd_get_trigger_type(d));
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
