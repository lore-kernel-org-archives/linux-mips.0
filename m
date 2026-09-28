Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A48496D5E;
	Mon, 28 Sep 2026 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591202; cv=none; b=h017EKaBSbrQe3XmQEiCl062WkHmJGQmR1sdIot7Ab7liIhxDtoqVowVactVndtbDnXmmOQ/OwbJ8t06hmZ0qufKo0asraskGItSLhBNE+tnlh6FLSWJJfgofyU6AtAzoCyWUn3DCGNJ1wX3H5BRtqHFbxTa/0madQ4zr2hQkMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591202; c=relaxed/simple;
	bh=tNkYqFD5lTYEl3TRsZsxg1Fml3ykd2WlYRegcEO8odY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHCyRLCmm1Hja0VurSpUF/6jblCQBtDu+Ws+3+tHrgSTHvYy9uPLAODIWfK41C/a6aSPZXW01RLD78MU7G8TgfkBfhHeZU+iig2t+UmpHMgIZjhtrdigq+Ji4HhFrd3xcly6fnPaVgsggMVsXc5oJ2ovM9GPP8fLEjiIsArkSCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xB8ZC-0005Da-00; Mon, 28 Sep 2026 12:26:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 26907C02BE; Mon, 28 Sep 2026 12:26:28 +0200 (CEST)
Date: Mon, 28 Sep 2026 12:26:28 +0200
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
Subject: Re: [PATCH v3 5/5] clocksource: mips-gic-timer: Use local counter on
 synced multi-cluster systems
Message-ID: <arpA1BHikxF0Zrlb@alpha.franken.de>
References: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
 <20260907-sync-gic-counters-v3-5-3d891ddabdaf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907-sync-gic-counters-v3-5-3d891ddabdaf@bootlin.com>

On Mon, Sep 07, 2026 at 02:46:39PM +0200, Benoît Monin wrote:
> [...]
> +static void gic_clocksource_promote(struct work_struct *work)
> +{
> +	if (gic_clock_unstable || gic_clocksource.read == &gic_hpt_read)
> +		return;
> +
> +	if (clocksource_unregister(&gic_clocksource) < 0)
> +		return;
> +
> +	gic_clocksource.read = &gic_hpt_read;
> +#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> +	gic_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_GIC;
> +#endif
> +
> +	if (clocksource_register_hz(&gic_clocksource, gic_frequency) < 0)
> +		return;
> +
> +	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
> +		sched_clock_register(mips_cm_is64 ?
> +				     gic_read_count_64 : gic_read_count_2x32,
> +				     gic_count_width, gic_frequency);
> +	}

this feels like a lot of work for just replacing the read method.

Why not introduce a flag in gic_hpt_read(), which indicates whether
it can read the counter directly or need to do it via
gpt_hpt_read_multicluster() ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
