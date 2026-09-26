Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FC6403E89;
	Sat, 26 Sep 2026 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419304; cv=none; b=DEIub76CKZTiR2bLQTBtFM8oGtkABM2i+9T+DNYleF03n7b2SJbEBX2nvgzawj6uS1AEbIPKoBlPGFSTHXk3wZWRsMDKKkJA5S/dRfSKnUpfm1C7/8f4nrIrapF33e/41F6hRhRaWak2+TD4EfzXmLiOTSpze9ZHZ5bfTOJiaho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419304; c=relaxed/simple;
	bh=MkVT9rIDhIjf5DMHntQtxvvwNm0MNeMOryJv+WJYEoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYJ6xaLzWjn9ab6NW5MVLHC8rbl6nQhwu8pQSY6Pc/pyfRCYaAGoyzSEWT2UUNR+M8H2TFQfljuZT+T2oA9rFPk3SimBuB1BKABI0/+tY5B6BSfYnzB7Iu+0MAVTf2fUmQApMFtt6uVZaoBSJqaG07XGUzybb851Md7kHGIjL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007LB-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F1F47C0BF2; Sat, 26 Sep 2026 11:35:41 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:35:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] MIPS: OCTEON: require the Core-14449 workaround only
 on CN63XX pass 1
Message-ID: <areR7bJxN9YBgrn_@alpha.franken.de>
References: <20260915071306.15006-1-orgads@gmail.com>
 <20260915071306.15006-5-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915071306.15006-5-orgads@gmail.com>

On Tue, Sep 15, 2026 at 07:12:48AM +0000, Orgad Shaneh wrote:
> prom_free_prom_memory() probes the hint field of a compiler-emitted
> PREF and panics when it is not 28, which is what -Wa,-mfix-cn63xxp1
> (CONFIG_CAVIUM_CN63XXP1) rewrites every prefetch in the kernel to. The
> test is gated on OCTEON_IS_MODEL(OCTEON_CN6XXX), so it fires on every
> OCTEON II part, including the pass 2 chips that do not need the
> workaround:
> 
>   Kernel panic - not syncing: OCTEON II DCache prefetch workaround not
>   in place (cfa00004).
>   Please build kernel with proper options (CONFIG_CAVIUM_CN63XXP1).
> 
> on a CN6335-AAP pass 2.2.
> 
> Core-14449 is a CN63XX pass 1.x erratum, and the vendor's own runtime
> check says so: it errors out only for OCTEON_CN63XX_PASS1_X without the
> fix, and otherwise merely warns about lost performance when fixed code
> runs on a part that is not a CN63XX. Narrow the check to CN63XX pass
> 1.x to match.
> 
> The alternative - enabling CONFIG_CAVIUM_CN63XXP1 to satisfy the check -
> is not free: the assembler flag rewrites every prefetch in the kernel
> (77 of them in this build) to pref 0x1c, which is worth avoiding on an
> in-order core whose receive path is dominated by memcpy.
> 
> uasm_i_pref() keeps its OCTEON_CN6XXX condition: it only touches the
> handful of runtime-generated TLB handlers, where the cost does not
> matter.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
> --- a/arch/mips/cavium-octeon/setup.c
> +++ b/arch/mips/cavium-octeon/setup.c
> @@ -1127,7 +1127,7 @@ EXPORT_SYMBOL(prom_putchar);
>  
>  void __init prom_free_prom_memory(void)
>  {
> -	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
> +	if (OCTEON_IS_MODEL(OCTEON_CN63XX_PASS1_X)) {
>  		/* Check for presence of Core-14449 fix.  */
>  		u32 insn;
>  		u32 *foo;
> -- 
> 2.47.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
