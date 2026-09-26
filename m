Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DCB3438BB;
	Sat, 26 Sep 2026 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418503; cv=none; b=j5oUhzA2gcSIpWeLJm1IwYY0PcVd4HMV6YRfpq/8ee+iiMMH7AfcF+KhMiEfIEji+37yUyviebMWfxtrBXo0nguThE7h4Of0IKUVMxk1639zbokrLGoWl8jZSa3uuBvYdvbN/8yGBdu8zUsOMfYspUBmXq4PnKwdZnml9Hqr1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418503; c=relaxed/simple;
	bh=zorFTG5cupg0AUWhuUqY3fuI4keV2ODEmdq8/X8yXpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fo4lRDQEUdVdsxeuJeRSDP0PaEHrSYOidULIDb1JIWdJF44rcuJqAMnQO0q4DeyIqayp3JRM/hUWDKtJHcXQUWsaPaLsvxO4RMS+VA0YI4kp2RPzBM3T8hwZCum7bJZFdLSnTYNOIsg/L5DL8dIuHZbg4yk14oXz8U3N1IMswnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007L2-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6031FC0B1E; Sat, 26 Sep 2026 11:35:09 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:35:09 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] MIPS: OCTEON: read the L2 crippled fuses from
 MIO_FUS_DAT3 on OCTEON II
Message-ID: <areRzY9uH3rTScm4@alpha.franken.de>
References: <20260915071306.15006-1-orgads@gmail.com>
 <20260915071306.15006-3-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915071306.15006-3-orgads@gmail.com>

On Tue, Sep 15, 2026 at 07:12:46AM +0000, Orgad Shaneh wrote:
> prom_init() decides whether to lock lines into the L2 by reading
> L2D_FUS3, a CN3XXX/CN5XXX register. On OCTEON II the fuses that cripple
> the L2 are MIO_FUS_DAT3[l2c_crip] - which is what cvmx_l2c_get_num_assoc()
> already reads for those parts - so the test looks at an address that is
> not a register on the chip and gets a meaningless answer: it can skip
> L2 locking on a healthy cache, or lock into a reduced one.
> 
> Pick the register by family in a small helper.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
> --- a/arch/mips/cavium-octeon/setup.c
> +++ b/arch/mips/cavium-octeon/setup.c
> @@ -653,6 +653,24 @@ void octeon_user_io_init(void)
>  	write_c0_derraddr1(0);
>  }
>  
> +#ifdef CONFIG_CAVIUM_OCTEON_LOCK_L2
> +static bool __init octeon_l2_is_crippled(void)
> +{
> +	/*
> +	 * L2D_FUS3 exists on CN3XXX/CN5XXX only. On OCTEON II the
> +	 * crippled-L2 fuses live in MIO_FUS_DAT3[l2c_crip].
> +	 */
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
> +		union cvmx_mio_fus_dat3 fus_dat3;
> +
> +		fus_dat3.u64 = cvmx_read_csr(CVMX_MIO_FUS_DAT3);
> +		return fus_dat3.s.l2c_crip != 0;
> +	}
> +
> +	return cvmx_read_csr(CVMX_L2D_FUS3) & (3ull << 34);
> +}
> +#endif
> +
>  /**
>   * prom_init - Early entry point for arch setup
>   */
> @@ -801,7 +819,7 @@ void __init prom_init(void)
>  	}
>  
>  #ifdef CONFIG_CAVIUM_OCTEON_LOCK_L2
> -	if (cvmx_read_csr(CVMX_L2D_FUS3) & (3ull << 34)) {
> +	if (octeon_l2_is_crippled()) {
>  		pr_info("Skipping L2 locking due to reduced L2 cache size\n");
>  	} else {
>  		uint32_t __maybe_unused ebase = read_c0_ebase() & 0x3ffff000;
> -- 
> 2.47.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
