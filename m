Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A604E2F09;
	Wed, 30 Sep 2026 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785317; cv=none; b=D00I1/2tG3YCz2XkBoYJnu5VufyjA84nbU0o6UbHqayZ4s9V2c3Ht8fOFY0mqWVWLGqrlYPLLbA0KhEGvWZA1wQg1th+fZpvs4pCL2/J701lMDU6tkVhPZojQU4nwD+xtsdosA5punWZJJycCeY7zRavlZaD3EqpqCUUq0R7y/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785317; c=relaxed/simple;
	bh=lt81v9C64U2IvH4/zR/upUmqc1WC8Ua/MMjEK6qiyNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5DeARaO3YooYu36m85nVKHjRicZxnRfVWg/ZH6MErBJo/2gyGK0Uiw6nEyw4qW0ilwuvf2zJFXoX+amioE+1Q6MNx3T0S4XiKI3JKkX5fXS/lNO5q4FVcBesQRntL/Kz8PURupjGHRIBaDfzjIaYQwZC3wp/QJvP6Vf9jxObhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xBx3v-0000Re-00; Wed, 30 Sep 2026 18:21:43 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 75397C068C; Wed, 30 Sep 2026 18:21:22 +0200 (CEST)
Date: Wed, 30 Sep 2026 18:21:22 +0200
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
Message-ID: <ar03AkCaaYiY5c6h@alpha.franken.de>
References: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
 <20260929-sync-gic-counters-v4-5-ec70c4b60434@bootlin.com>
 <arvuZDCu_1vp4Yw5@alpha.franken.de>
 <3hJ3aZuPRWSZSVZ0yXJIXA@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3hJ3aZuPRWSZSVZ0yXJIXA@bootlin.com>

On Wed, Sep 30, 2026 at 05:49:17PM +0200, Benoît Monin wrote:
> On Tuesday, 29 September 2026 at 18:59:16 CEST, Thomas Bogendoerfer wrote:
> > >  static int gic_starting_cpu(unsigned int cpu)
> > >  {
> > > -      /* Ensure the GIC counter is running */
> > > -      clear_gic_config(GIC_CONFIG_COUNTSTOP);
> > > +      unsigned int cluster = cpu_cluster(&cpu_data[cpu]);
> > > +
> > > +      if (read_gic_config() & GIC_CONFIG_COUNTSTOP) {
> > > +              clear_gic_config(GIC_CONFIG_COUNTSTOP);
> > > +
> > > +              if (cluster && mips_cm_is64 && !gic_clock_unstable)
> > > +                      gic_sync_counter_64(cluster);
> > > +
> > > +              if (gic_synced_cl_map &&
> > > +                  bitmap_full(gic_synced_cl_map, mips_cps_numclusters()))
> > > +                      schedule_work(&gic_promote_work);
> > 
> > do we really need the workqueue ? As far as I understand
> > sched_clock_register() doesn't use the clocksource mutex, so we should
> > be able to directly call gic_promote() again.
> 
> With CONFIG_IRQ_TIME_ACCOUNTING=y, calling sched_clock_register() from the
> CPU hotplug STARTING callback leads to a deadlock. We also need the
> workqueue to call it.

thank you for checking

Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
