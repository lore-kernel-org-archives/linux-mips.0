Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B320A40BCBB;
	Sat, 26 Sep 2026 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419298; cv=none; b=Ho/olH7QWnB3CwRow3l/qS7jQyx/yTvbDbQdUKXoeiLCvLeAoJ6T3nee5QtGYqkHQLux9gsrneuATt4HEwaW1KGxnsRtYUAGyrz+j8mif8Md8/QHzE71Fs3MI8HQ1DvF6IvwQQGKUlTkkVDotlUEbFwigOXfr0Ct6KFwwViklkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419298; c=relaxed/simple;
	bh=ed7HsDHriYrHElPsv+mn2vmxRLaB0S17KT/sVtk3G/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvR84S3M2O+Aka35rAaJ+g/45UjwT7qEks60zJIeR9mu7CdmqiIOUuffXmBPePjKKCfArhuUzVQR6hmKLkM+TuPQU/KwLt5Ig5u+oy0H42UrW/aOyGCnHv0H0hbL4x2dRB49998KzD/hv4phoPpqCUJPYo4cOhFnMB3m/lneWO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007Kq-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E723AC0AC0; Sat, 26 Sep 2026 11:34:37 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:34:37 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] MIPS: OCTEON: cvmx-l2c: use the OCTEON II register
 model on all CN6XXX
Message-ID: <areRrVgv61sfHZno@alpha.franken.de>
References: <20260915071306.15006-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915071306.15006-1-orgads@gmail.com>

On Tue, Sep 15, 2026 at 07:12:44AM +0000, Orgad Shaneh wrote:
> The L2 helpers pick between the OCTEON II and the CN3XXX/CN5XXX
> register model with OCTEON_IS_MODEL(OCTEON_CN63XX), which matches the
> CN63XX only. Every other OCTEON II part - CN66XX, CN68XX, CN61XX -
> takes the CN3XXX/CN5XXX branch and touches registers that do not exist
> on it: L2C_DBG, L2C_LCKBASE, L2C_LCKOFF and L2C_SPAR4 instead of the
> LCKL2 cache operation, the L2C_WPAR_{PPX,IOBX} way-partitioning
> registers and L2C_TADX_TAG.
> 
> On a CN6635 board cvmx_l2c_lock_line(), called from prom_init() under
> CONFIG_CAVIUM_OCTEON_LOCK_L2 to lock the TLB refill and exception
> vectors, therefore went through L2C_DBG/L2C_LCKBASE. Whatever those
> writes hit inside the L2 controller left it silently dropping stores to
> DRAM above 512 MB: a probe that wrote 0x20400000, 0x40000000,
> 0x80000000 and 0xe0000000 in prom_init read its values back before the
> lock block and the old contents right after it, on CCA 0, 2 and 3
> alike, while writes below 256 MB and every u-boot "mw" stuck. Since the
> cvmx bootmem free list keeps its nodes inside the free blocks
> themselves, the kernel's first split above 0x20000000 was lost, the
> walk of the free list stopped there, and the board came up with 248 MB
> of its 8 GB.
> 
> Match the whole CN6XXX family, which is what these register accesses
> are keyed to. The CN63XX keeps exactly the same path.
> 
> The geometry helpers in this file need the same treatment but not the
> same condition; they are handled in the next patch.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> diff --git a/arch/mips/cavium-octeon/executive/cvmx-l2c.c b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
> --- a/arch/mips/cavium-octeon/executive/cvmx-l2c.c
> +++ b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
> @@ -54,7 +54,7 @@ int cvmx_l2c_get_core_way_partition(uint32_t core)
>  	if (core >= cvmx_octeon_num_cores())
>  		return -1;
>  
> -	if (OCTEON_IS_MODEL(OCTEON_CN63XX))
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX))
>  		return cvmx_read_csr(CVMX_L2C_WPAR_PPX(core)) & 0xffff;
>  
>  	/*
> @@ -91,14 +91,14 @@ int cvmx_l2c_set_core_way_partition(uint32_t core, uint32_t mask)
>  	mask &= valid_mask;
>  
>  	/* A UMSK setting which blocks all L2C Ways is an error on some chips */
> -	if (mask == valid_mask && !OCTEON_IS_MODEL(OCTEON_CN63XX))
> +	if (mask == valid_mask && !OCTEON_IS_MODEL(OCTEON_CN6XXX))
>  		return -1;
>  
>  	/* Validate the core number */
>  	if (core >= cvmx_octeon_num_cores())
>  		return -1;
>  
> -	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
>  		cvmx_write_csr(CVMX_L2C_WPAR_PPX(core), mask);
>  		return 0;
>  	}
> @@ -147,10 +147,10 @@ int cvmx_l2c_set_hw_way_partition(uint32_t mask)
>  	mask &= valid_mask;
>  
>  	/* A UMSK setting which blocks all L2C Ways is an error on some chips */
> -	if (mask == valid_mask	&& !OCTEON_IS_MODEL(OCTEON_CN63XX))
> +	if (mask == valid_mask	&& !OCTEON_IS_MODEL(OCTEON_CN6XXX))
>  		return -1;
>  
> -	if (OCTEON_IS_MODEL(OCTEON_CN63XX))
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX))
>  		cvmx_write_csr(CVMX_L2C_WPAR_IOBX(0), mask);
>  	else
>  		cvmx_write_csr(CVMX_L2C_SPAR4,
> @@ -160,7 +160,7 @@ int cvmx_l2c_set_hw_way_partition(uint32_t mask)
>  
>  int cvmx_l2c_get_hw_way_partition(void)
>  {
> -	if (OCTEON_IS_MODEL(OCTEON_CN63XX))
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX))
>  		return cvmx_read_csr(CVMX_L2C_WPAR_IOBX(0)) & 0xffff;
>  	else
>  		return cvmx_read_csr(CVMX_L2C_SPAR4) & (0xFF);
> @@ -313,7 +313,7 @@ static void fault_in(uint64_t addr, int len)
>  
>  int cvmx_l2c_lock_line(uint64_t addr)
>  {
> -	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
>  		int shift = CVMX_L2C_TAG_ADDR_ALIAS_SHIFT;
>  		uint64_t assoc = cvmx_l2c_get_num_assoc();
>  		uint64_t tag = addr >> shift;
> @@ -460,7 +460,7 @@ void cvmx_l2c_flush(void)
>  int cvmx_l2c_unlock_line(uint64_t address)
>  {
>  
> -	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
>  		int assoc;
>  		union cvmx_l2c_tag tag;
>  		uint32_t tag_addr;
> @@ -661,7 +661,7 @@ union cvmx_l2c_tag cvmx_l2c_get_tag(uint32_t association, uint32_t index)
>  			     (int)index, cvmx_l2c_get_num_sets());
>  		return tag;
>  	}
> -	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
>  		union cvmx_l2c_tadx_tag l2c_tadx_tag;
>  		uint64_t address = CVMX_ADD_SEG(CVMX_MIPS_SPACE_XKPHYS,
>  						(association << CVMX_L2C_TAG_ADDR_ALIAS_SHIFT) |
> @@ -745,7 +745,7 @@ uint32_t cvmx_l2c_address_to_index(uint64_t addr)
>  	}
>  
>  	if (indxalias) {
> -		if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
> +		if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
>  			uint32_t a_14_12 = (idx / (CVMX_L2C_MEMBANK_SELECT_SIZE/(1<<CVMX_L2C_IDX_ADDR_SHIFT))) & 0x7;
>  
>  			idx ^= idx / cvmx_l2c_get_num_sets();
> @@ -878,7 +878,7 @@ void cvmx_l2c_flush_line(uint32_t assoc, uint32_t index)
>  		return;
>  	}
>  
> -	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
> +	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
>  		uint64_t address;
>  		/* Create the address based on index and association.
>  		 * Bits<20:17> select the way of the cache block involved in
> -- 
> 2.47.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
