Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC1E3E49F6;
	Sat, 26 Sep 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418496; cv=none; b=rrhAy/pBTMLhRk8Wu4Qmj869uTOJ+fVRSL3YA5ZdMydqCdPj6h6fr0i76UPvWNR4ll5jgnLncWVxfwdvmI0IhViBzvJEjWs4M0GICFRiJlnRzxB7CKASBc+KDDd06i0xDn5rtLfEkWZT+qZoAerX4bpgkKY+7Jy6qrqjWoIXlpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418496; c=relaxed/simple;
	bh=uRAl2CYrIjuc0cxRwdGUWoCEkvXsExGKaj4xKZMdO/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csj8Tuhu6oAknHTpZ4Q6hxsIrZ4rUmjXD5vLH8Oaisfm1mBXCC7CA0+EffsOxsc7JarIEf4N0BWAIZgqaeSceH73rWJEc2aai0HkYgT8Iak3KgbTr5z8xUCKMYgD3VXlN94HlvLTviRxYU3Xv/vyLXyLYzz9WtaBeb8KDg6y7LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007L7-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 737D3C0BDF; Sat, 26 Sep 2026 11:35:23 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:35:23 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] MIPS: OCTEON: program L2C_CTL, not L2C_CFG, on
 OCTEON II
Message-ID: <areR20hl5SIKNG6-@alpha.franken.de>
References: <20260915071306.15006-1-orgads@gmail.com>
 <20260915071306.15006-4-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915071306.15006-4-orgads@gmail.com>

On Tue, Sep 15, 2026 at 07:12:47AM +0000, Orgad Shaneh wrote:
> cvmx_helper_initialize_packet_io_global() sets the L2 arbitration modes
> by rewriting L2C_CFG. That register (0x1180080000000) does not exist on
> OCTEON II; there the L2 controller is configured through L2C_CTL
> (0x1180080800000), whose corresponding fields are rsp_arb_mode and
> xmc_arb_mode.
> 
> On a CN6335 the stray write hung the board hard when this function ran -
> no exception, no watchdog, just a dead console.
> 
> Keep the L2C_CFG write for CN3XXX/CN5XXX and program L2C_CTL on CN6XXX
> with the values the vendor SDK uses there (rsp_arb_mode 1,
> xmc_arb_mode 0), which is the same trade the existing code makes for
> the older parts: keep IO blocks from being starved under high L2 load.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
> --- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
> +++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
> @@ -1014,7 +1014,6 @@ int cvmx_helper_initialize_packet_io_global(void)
>  {
>  	int result = 0;
>  	int interface;
> -	union cvmx_l2c_cfg l2c_cfg;
>  	const int num_interfaces = cvmx_helper_get_number_of_interfaces();
>  
>  	/*
> @@ -1029,10 +1028,21 @@ int cvmx_helper_initialize_packet_io_global(void)
>  	 * to the cores. This avoids conditions where IO blocks might
>  	 * be starved under very high L2 loads.
>  	 */
> -	l2c_cfg.u64 = cvmx_read_csr(CVMX_L2C_CFG);
> -	l2c_cfg.s.lrf_arb_mode = 0;
> -	l2c_cfg.s.rfb_arb_mode = 0;
> -	cvmx_write_csr(CVMX_L2C_CFG, l2c_cfg.u64);
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
> +		union cvmx_l2c_ctl l2c_ctl;
> +
> +		l2c_ctl.u64 = cvmx_read_csr(CVMX_L2C_CTL);
> +		l2c_ctl.s.rsp_arb_mode = 1;
> +		l2c_ctl.s.xmc_arb_mode = 0;
> +		cvmx_write_csr(CVMX_L2C_CTL, l2c_ctl.u64);
> +	} else {
> +		union cvmx_l2c_cfg l2c_cfg;
> +
> +		l2c_cfg.u64 = cvmx_read_csr(CVMX_L2C_CFG);
> +		l2c_cfg.s.lrf_arb_mode = 0;
> +		l2c_cfg.s.rfb_arb_mode = 0;
> +		cvmx_write_csr(CVMX_L2C_CFG, l2c_cfg.u64);
> +	}
>  
>  	cvmx_pko_initialize_global();
>  	for (interface = 0; interface < num_interfaces; interface++) {
> -- 
> 2.47.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
