Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE844D2EDB;
	Tue, 29 Sep 2026 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701275; cv=none; b=aGi6D8bfgbHejsEPOJXxVE1YTWO8RPHORdLwcym7F7TOvVCEqlCpTyz18zG/HMkkcjYroAseg1CTRHss4uUCtYcb5lCkchJJZBYWYVAGukszG5dL7kQeSh35JIPaA6pS4wU+WJ9K+WGjJXsdLE4wJMpuGQdGwipdIilrTgIEiSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701275; c=relaxed/simple;
	bh=ze/uNWr1taNBTgB17IPpAVsqleWf30GnpgdmHRoGKjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X93jFYE9/+wYE9bPP9eBS64gfz0ve6JxfFVD8vRVjlZd1qTvX7uLtV9Hll0hsG0swyV4ZqF1hy7uTXbIvXbHbiZL7kjABfZCP6NqOzc/qK34xkxCEO/T9c9jYut1ysiFSabaripd3RbZkU0f7NsUwMEIEawr6y0QZKK7K9B921o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xBbCO-0005GY-00; Tue, 29 Sep 2026 19:01:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A8070C02BE; Tue, 29 Sep 2026 18:59:16 +0200 (CEST)
Date: Tue, 29 Sep 2026 18:59:16 +0200
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
Subject: Re: [PATCH v4 5/5] clocksource: mips-gic-timer: Use local counter on
 synced multi-cluster systems
Message-ID: <arvuZDCu_1vp4Yw5@alpha.franken.de>
References: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
 <20260929-sync-gic-counters-v4-5-ec70c4b60434@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-sync-gic-counters-v4-5-ec70c4b60434@bootlin.com>

On Tue, Sep 29, 2026 at 02:14:12PM +0200, Benoît Monin wrote:
>  static int gic_starting_cpu(unsigned int cpu)
>  {
> -	/* Ensure the GIC counter is running */
> -	clear_gic_config(GIC_CONFIG_COUNTSTOP);
> +	unsigned int cluster = cpu_cluster(&cpu_data[cpu]);
> +
> +	if (read_gic_config() & GIC_CONFIG_COUNTSTOP) {
> +		clear_gic_config(GIC_CONFIG_COUNTSTOP);
> +
> +		if (cluster && mips_cm_is64 && !gic_clock_unstable)
> +			gic_sync_counter_64(cluster);
> +
> +		if (gic_synced_cl_map &&
> +		    bitmap_full(gic_synced_cl_map, mips_cps_numclusters()))
> +			schedule_work(&gic_promote_work);

do we really need the workqueue ? As far as I understand
sched_clock_register() doesn't use the clocksource mutex, so we should
be able to directly call gic_promote() again.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
