Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893543;
	b=T2pv+Ay3riPWO5UmkSV43pC3sYEPzclrr9tz0xWx6pgjlRr9Y6WLF9AtO6h5hvj5mk/U
	 y0+BGqb+I2g3QkCAeLGkNxGqsStWcebcdT9MicBD4uPqNTzARHk4YKtVg6zRDs3Z+KRIk
	 Aq9GiJoFzJeUTyAEmyvpOXHs4kIKNagcSgmx1/ZkBjQD48F0yUyx+IOU/SckmMloJPgAz
	 xvG3Boq1DoLpvpexdA27zDfqX2rI5rWuLkaBu0nhZy/Sz1wHewQoxvC88CN+EULd2O8PM
	 8KhrMY+w7vN7PVZtRDbcJ18QQhhXMOlVJflpE/UygnHCsNWSe7A/3d0yVmjLM3UudXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893543;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+4XYO83jXDyyjyPHkkGBV8ul5xAsZUwBFLXALt9V5ko=;
	b=R2So1H/x1OPfTiBRSoEu0petN5LjAAVyC6EbYsHyR8a/nnQ7A6kiBa0aUloGQKMb9M6s
	 8FGHtruZzHfjvGH4OjwQzAzOSpl27DIMhRbCAGjuNZIQFWDvqzE6S7++HAQUQRQ8THFus
	 Z/pFaKbxfOXi+zxrcRC9rd9oqz2Lv87eOleA5P0QXS1UdN088jX4AzIFOtfC0RGznE8kz
	 enQVIqyEZI3GgdcDe/deBoaoUFRRcAINnDBrBiY8ccq8NzBcS8v70qhBvLwISHStcfW/m
	 +IkKAWwb6zPtuHAlevbWdH7U2b0iKLUcKa7DSz10adI6enFLbMpSLB3xDT85PcsLmbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C91B606A330;
	Thu,  5 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C91B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeh-00071r-00; Thu, 05 Nov 2026 16:45:35 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A2BAFC077C; Thu,  5 Nov 2026 16:44:38 +0100 (CET)
Date: Thu, 5 Nov 2026 16:44:38 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, macro@orcam.me.uk,
	Thomas Gleixner <tglx@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: SB1250: Validate and update IRQ affinity
Message-ID: <auykZn6pN0a2B1K6@alpha.franken.de>
References: <20261103215043.1190947-1-f.fainelli@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103215043.1190947-1-f.fainelli@gmail.com>

On Tue, Nov 03, 2026 at 01:50:40PM -0800, Florian Fainelli wrote:
> sb1250_set_affinity() selects the first online CPU in the requested
> affinity mask without checking whether such a CPU exists. If the
> intersection is empty, the resulting CPU index is invalid and must
> not be passed to cpu_logical_map().
> 
> Reject affinity masks containing no online CPU with -EINVAL before
> accessing the CPU mapping or interrupt mapper registers.
> 
> Also update the effective affinity mask to reflect the single logical
> CPU selected as the interrupt target.
> 
> Fixes: 421d1563c662 ("mips: Validate online cpus in irq_set_affinity() callbacks")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/mips/sibyte/sb1250/irq.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
> index 2f08ad267a11..d7a656cd7ec0 100644
> --- a/arch/mips/sibyte/sb1250/irq.c
> +++ b/arch/mips/sibyte/sb1250/irq.c
> @@ -76,6 +76,8 @@ static int sb1250_set_affinity(struct irq_data *d, const struct cpumask *mask,
>  	unsigned long flags;
>  
>  	i = cpumask_first_and(mask, cpu_online_mask);
> +	if (i >= nr_cpu_ids)
> +		return -EINVAL;
>  
>  	/* Convert logical CPU to physical CPU */
>  	cpu = cpu_logical_map(i);
> @@ -103,6 +105,7 @@ static int sb1250_set_affinity(struct irq_data *d, const struct cpumask *mask,
>  		____raw_writeq(cur_ints, IOADDR(A_IMR_MAPPER(cpu) +
>  					R_IMR_INTERRUPT_MASK));
>  	}
> +	irq_data_update_effective_affinity(d, cpumask_of(i));
>  	raw_spin_unlock_irqrestore(&sb1250_imr_lock, flags);
>  
>  	return 0;
> -- 
> 2.53.0

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
