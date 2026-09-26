Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0D7153BE9;
	Sat, 26 Sep 2026 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418508; cv=none; b=LbSmL9xCSAs4KRbhTSgUX9wIWXNLT8SZchVXslofPed6xVfFHDzw+9SbaCBfBG6zPzVD1V6oanQQb9fKmtLeQMK28axVNEhDgTzcuGdw/CDkubAxEi9XOLSf4g3PFHj1PywmNXhZfXdoq79T0wbyPm+Dql+OfhLkflqHem9N/Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418508; c=relaxed/simple;
	bh=n9uYmziJXCqQFaSw/9GLCEYZESTMVCw37OLPMxiFRMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAeDsOVH4tIoKZjp4CLEHggMViQtl2SdD+vsoB4JVZuz1NBpa7tcufrwS0dr3f0dm7YZPxvq1Y6yULS4wGaFP0nvVguRJmBgThwZWOMXvlmwXBqi0T4HqHKOLC3f/6Q+KxR16MJthBDePwdhBZpROFE7F1HshaDx3IEvBhSUxeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007Ku-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6F491C0AD6; Sat, 26 Sep 2026 11:34:52 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:34:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] MIPS: OCTEON: cvmx-l2c: add the CN66XX L2 geometry
Message-ID: <areRvL0ywRZ76NWZ@alpha.franken.de>
References: <20260915071306.15006-1-orgads@gmail.com>
 <20260915071306.15006-2-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915071306.15006-2-orgads@gmail.com>

On Tue, Sep 15, 2026 at 07:12:45AM +0000, Orgad Shaneh wrote:
> cvmx_l2c_get_set_bits() and cvmx_l2c_get_num_assoc() know the CN63XX as
> the only OCTEON II part, so on a CN6635 both fell through to their
> "Unsupported OCTEON Model" defaults: 2048 sets, and 8 ways which the
> CN3XXX/CN5XXX fuse path - a read of L2D_FUS3, which is not a register
> on OCTEON II - then shifted down to 2.
> 
> The CN66XX L2 has the CN63XX geometry, 16 ways and 1024 sets, and
> reports its fused-off ways in MIO_FUS_DAT3[l2c_crip] like the rest of
> OCTEON II, so name it in those three branches. With this the board
> reports assoc 16, sets 1024, and cvmx_l2c_lock_line() computes the tag
> alias from the right associativity.
> 
> The CN68XX and CN61XX are deliberately left alone: their L2 geometry
> differs from the CN63XX, and the CN68XX also uses bit <2> of
> MIO_FUS_DAT3[l2c_crip], which the decoding here does not handle. I have
> no such board to test on.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> diff --git a/arch/mips/cavium-octeon/executive/cvmx-l2c.c b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
> --- a/arch/mips/cavium-octeon/executive/cvmx-l2c.c
> +++ b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
> @@ -773,7 +773,9 @@ int cvmx_l2c_get_set_bits(void)
>  
>  	if (OCTEON_IS_MODEL(OCTEON_CN56XX) || OCTEON_IS_MODEL(OCTEON_CN58XX))
>  		l2_set_bits = 11;	/* 2048 sets */
> -	else if (OCTEON_IS_MODEL(OCTEON_CN38XX) || OCTEON_IS_MODEL(OCTEON_CN63XX))
> +	else if (OCTEON_IS_MODEL(OCTEON_CN38XX) ||
> +		 OCTEON_IS_MODEL(OCTEON_CN63XX) ||
> +		 OCTEON_IS_MODEL(OCTEON_CN66XX))
>  		l2_set_bits = 10;	/* 1024 sets */
>  	else if (OCTEON_IS_MODEL(OCTEON_CN31XX) || OCTEON_IS_MODEL(OCTEON_CN52XX))
>  		l2_set_bits = 9;	/* 512 sets */
> @@ -805,7 +807,8 @@ int cvmx_l2c_get_num_assoc(void)
>  	    OCTEON_IS_MODEL(OCTEON_CN50XX) ||
>  	    OCTEON_IS_MODEL(OCTEON_CN38XX))
>  		l2_assoc = 8;
> -	else if (OCTEON_IS_MODEL(OCTEON_CN63XX))
> +	else if (OCTEON_IS_MODEL(OCTEON_CN63XX) ||
> +		 OCTEON_IS_MODEL(OCTEON_CN66XX))
>  		l2_assoc = 16;
>  	else if (OCTEON_IS_MODEL(OCTEON_CN31XX) ||
>  		 OCTEON_IS_MODEL(OCTEON_CN30XX))
> @@ -816,7 +819,7 @@ int cvmx_l2c_get_num_assoc(void)
>  	}
>  
>  	/* Check to see if part of the cache is disabled */
> -	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
> +	if (OCTEON_IS_MODEL(OCTEON_CN63XX) || OCTEON_IS_MODEL(OCTEON_CN66XX)) {
>  		union cvmx_mio_fus_dat3 mio_fus_dat3;
>  
>  		mio_fus_dat3.u64 = cvmx_read_csr(CVMX_MIO_FUS_DAT3);
> -- 
> 2.47.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
