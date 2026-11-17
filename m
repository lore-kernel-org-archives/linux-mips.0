Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932888;
	b=yRjKjig1rSelwqbHcnR5x4joR+vGQst+uY/UJdNjf/ykuGZO5TMcrDAJmjGczDsVz09r
	 NIDAsBZqbcI7YYhMEUxltu7olI50X8eufzEVyCzUUuUvfuA2Uo9har9PyBUGgPuoII27N
	 NaWr5L1KfdQdIfOWj4O/wWXcvpyR1+r73oCvjumPcXiH05ygJrxsJppWOU2Of3i6D4CRf
	 L1tZHqOaxsP+wR7ARKPbYYSMXwkfQmyqUu2p3AEj6/SpHw45jzqFydlbXhAmLxPBU3QVa
	 h3wMcS2Aa2XmJdIeqyypBadATbwt3hN+GWVFF3jX9ICe7d1j8+2q8hb6Ufu402IZ1tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932888;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QPu2YXpmwn+SJM11tKTxIpNQPeylIu52nZvJKYSmG08=;
	b=ePhfmvvpifY1ElldGtnTfuskuBuUI1vhQcu67dwLoRzk4rXg1hs8cYum9/G97xj/53TF
	 HgiPDZMPiDNbrV/VhTyAK53517oV51g4HQicgY00GYTPgvHUwcHAQGUko7nTvhN7ot1+j
	 JQ6moh4j1nTDLprtbhweyzU61U0Q7YmbB0U9DgS0CTSafam6SMfSAoAbEsCHBKoR0z9UO
	 ChkGUIW0skCTrEsektvQaI6Cnm0LHqZA9GSN1W5Z0hcIvElE8QpN1dorFZ/qLVJWW+l/3
	 1EXWxYFNWBIU5kLLK+GxqJDxSFgjJdey8Badl5axHIHfE/3Ofafb2S/G9agqly4SfUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95703606A33D;
	Tue, 17 Nov 2026 16:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95703606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTM2N-0004s5-00; Tue, 17 Nov 2026 17:28:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 64E06C0546; Tue, 17 Nov 2026 17:11:13 +0100 (CET)
Date: Tue, 17 Nov 2026 17:11:13 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Carl Smith <carl.smith@alliedtelesis.co.nz>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Octeon: Verify the device tree so that
 /sys/firmware/fdt is created
Message-ID: <avx8oTkiiFQypQl9@alpha.franken.de>
References: <20261025192918.586220-1-carl.smith@alliedtelesis.co.nz>
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
In-Reply-To: <20261025192918.586220-1-carl.smith@alliedtelesis.co.nz>

On Mon, Oct 26, 2026 at 08:29:18AM +1300, Carl Smith wrote:
> device_tree_init() sets initial_boot_params directly without calling
> early_init_dt_verify(), so the FDT CRC is never computed and
> of_fdt_raw_init() skips creating /syts/firmware/fdt.
> 
>   not creating '/sys/firmware/fdt': CRC check failed
> 
> Call early_init_dt_verify() after the tree has been pruned and the MAC
> addresses filled in, so that the CRC covers the tree that the kernel
> unflattens.
> 
> Tested on a CN7130 with a bootloader-provided device tree.
> Fixes: 08d53aa58cb1 ("of/fdt: export fdt blob as /sys/firmware/fdt")
> 
> Signed-off-by: Carl Smith <carl.smith@alliedtelesis.co.nz>
> ---
>  arch/mips/cavium-octeon/setup.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
> index 1ad2602a0383..f25301e08222 100644
> --- a/arch/mips/cavium-octeon/setup.c
> +++ b/arch/mips/cavium-octeon/setup.c
> @@ -1178,6 +1178,7 @@ void __init device_tree_init(void)
>  	}
>  	if (fill_mac)
>  		octeon_fill_mac_addresses();
> +	early_init_dt_verify(initial_boot_params, __pa(initial_boot_params));
>  	unflatten_and_copy_device_tree();
>  	init_octeon_system_type();
>  }
> -- 
> 2.56.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
