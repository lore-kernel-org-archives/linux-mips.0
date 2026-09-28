Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF71837F014;
	Mon, 28 Sep 2026 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589319; cv=none; b=LmKHJe5rVVOEDFxFa3oT7Hgo69qU+iRrU9XP0httYgU5za7g3MXBrJ0DXrl0xsYRigOXMivIS19gJOQePKzdkgoMDiKhPGcC6to0xMIl1MONTG/tptcj6DDjHlKP7cvdakYcdR4l8vfhvIq5vmyTpeOS1VtN248hJJlFRRl9h3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589319; c=relaxed/simple;
	bh=Ji6Yb3nwLy8ignZmCgOMB2ZM4EU7IqyEUbkYFNF2UCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVh9O6aYXEcPGvq0U1e3WmEbper7bq3XHsexfD8Xjb2k81EPhpLkhrxZV7JOfZGiD458VDQA5Z4fRaY8lMWVDUgF0j4TqzKVGloG6Pkr7M9E1uSr+Y/1yXCjsotaw6Owspb84js63Vjx7sBhJzrEb22+K+FPAmcsweIi26h4URU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xB84p-0004px-00; Mon, 28 Sep 2026 11:55:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5AD17C02BE; Mon, 28 Sep 2026 11:29:53 +0200 (CEST)
Date: Mon, 28 Sep 2026 11:29:53 +0200
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
Subject: Re: [PATCH v3 4/5] clocksource: mips-gic-timer: Simplify
 gic_next_event() for per-cpu timer
Message-ID: <arozkbowREVQdv7q@alpha.franken.de>
References: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
 <20260907-sync-gic-counters-v3-4-3d891ddabdaf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907-sync-gic-counters-v3-4-3d891ddabdaf@bootlin.com>

On Mon, Sep 07, 2026 at 02:46:38PM +0200, Benoît Monin wrote:
> The GIC clock event device is registered per CPU and is flagged with
> CLOCK_EVT_FEAT_C3STOP. This guarantees that the set_next_event() callback
> is always invoked on the CPU of the event.
> 
> Drop the code path configuring the compare register of another CPU as it
> is never called and does not correctly handle the case of having multiple
> clusters, and document this guarantee by adding the CLOCK_EVT_FEAT_PERCPU
> flag to the clock event device features.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clocksource/mips-gic-timer.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
> index 1501c7db9a8e..cdaf4ba1d509 100644
> --- a/drivers/clocksource/mips-gic-timer.c
> +++ b/drivers/clocksource/mips-gic-timer.c
> @@ -52,18 +52,13 @@ static u64 notrace gic_read_count(void)
>  
>  static int gic_next_event(unsigned long delta, struct clock_event_device *evt)
>  {
> -	int cpu = cpumask_first(evt->cpumask);
>  	u64 cnt;
>  	int res;
>  
>  	cnt = gic_read_count();
>  	cnt += (u64)delta;
> -	if (cpu == raw_smp_processor_id()) {
> -		write_gic_vl_compare(cnt);
> -	} else {
> -		write_gic_vl_other(mips_cm_vp_id(cpu));
> -		write_gic_vo_compare(cnt);
> -	}
> +	write_gic_vl_compare(cnt);
> +
>  	res = ((int)(gic_read_count() - cnt) >= 0) ? -ETIME : 0;
>  	return res;
>  }
> @@ -82,6 +77,7 @@ static void gic_clockevent_cpu_init(unsigned int cpu,
>  {
>  	cd->name		= "MIPS GIC";
>  	cd->features		= CLOCK_EVT_FEAT_ONESHOT |
> +				  CLOCK_EVT_FEAT_PERCPU |
>  				  CLOCK_EVT_FEAT_C3STOP;
>  
>  	cd->rating		= 350;
> 
> -- 
> 2.55.0

Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
