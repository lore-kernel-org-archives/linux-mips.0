Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932886;
	b=bwMtpHY4udRro4CYpSRoSdWqTo/OuxqMBEvZcf8bU4UitK/VH0TryXBvo2ziFGGPUF72
	 EAA92w4MlfGOyoJXSYwnxqHmRdVPxO8CwAo9W/5RXfSd0sU6ph+ywuxT4p8rp6+9aJrbh
	 4Yj5spabMt50r2pS80NI+CSWKQPbxajndaLCdyPl5bnk59+bcPMaI0gUjWcNQ6M8MAyUm
	 u8oXUocuhxKgPqorVrZmjFG6fvKgU8iMQLEuWKRWkMxB/ghhfNMKSDcLbsFRTsxJX9XW5
	 VHLMAGb0GkxW+9XKAb4IsWdZ3qUGXWCwqwv30pJYNTzqybtO7A1xpOuHXntEWb35YTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932886;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IbqtQ2iXuxj+cm+Qwf97VKDkQ5sBXAh3GDWM+Y5+8nU=;
	b=tv2zGOcLmf/FvfrkOfY+V+YdI2c1YM5TC7Hn5Sn/YY525/7MRi2jiBs5lu+qeUC0c8mP
	 2rb07H9H7Kdno+2dWdjB6KjlGLmCn6Yj+HXqLxkGUAB8E8sBs86Ql9xZXjw+CFgzLMm3p
	 51RbZ/Kzt7bWkIh47PsyYGBi14mqWsSzzNOPdBHrprc10GUY9t06FMXBxALfvmi8ZBmuC
	 QA74r+f7npb5gb1yoHfBTcPEpC2z65uHG0elC5SDIBBjJBr9O31ZfMrGIc4OLmSwNS8Sx
	 yhz8K4QZCYmwGRomY5fgcCEqkBCDXxMCAwoMYIYEnoWLzxYE/9tmPns53BeDNKcPqxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579DE606A32F;
	Tue, 17 Nov 2026 16:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579DE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTM2N-0004s9-00; Tue, 17 Nov 2026 17:28:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3B1DBC05C3; Tue, 17 Nov 2026 17:12:47 +0100 (CET)
Date: Tue, 17 Nov 2026 17:12:47 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	ardb@kernel.org
Subject: Re: [PATCH] MIPS: OCTEON: compute the FDT CRC in device_tree_init()
Message-ID: <avx8_1ffn4OlS4YD@alpha.franken.de>
References: <20261027060214.2687878-1-orgads@gmail.com>
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
In-Reply-To: <20261027060214.2687878-1-orgads@gmail.com>

On Tue, Oct 27, 2026 at 06:02:14AM +0000, Orgad Shaneh wrote:
> device_tree_init() assigns initial_boot_params directly and never calls
> early_init_dt_verify(), so of_fdt_crc32 stays 0 and every boot logs
> 
>   OF: fdt: not creating '/sys/firmware/fdt': CRC check failed
> 
> whether the blob was passed by the bootloader, appended or built in.
> Call early_init_dt_verify() once the prune and the MAC address fill-in
> are done with the blob, so the CRC matches what of_fdt_raw_init() reads
> back. x86 had the same omission, fixed by commit 628df9dc5ad8
> ("x86/devicetree: Initialize device tree before using it").
> 
> Fixes: 08d53aa58cb1 ("of/fdt: export fdt blob as /sys/firmware/fdt")
> Assisted-by: LLM
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> Tested on a CN6335 board (internal device tree, Cavium U-Boot 1.1.1),
> in a 7.3-based tree: the warning is gone and /sys/firmware/fdt holds the
> 11551-byte blob. mips-next with cavium_octeon_defconfig prints the
> warning on the same board without this patch.
> 
>  arch/mips/cavium-octeon/setup.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
> index 7497be7b9431..fa8273799b94 100644
> --- a/arch/mips/cavium-octeon/setup.c
> +++ b/arch/mips/cavium-octeon/setup.c
> @@ -1213,6 +1213,8 @@ void __init device_tree_init(void)
>  	}
>  	if (fill_mac)
>  		octeon_fill_mac_addresses();
> +	/* After the edits above, so the CRC covers the final blob */
> +	early_init_dt_verify(initial_boot_params, __pa(initial_boot_params));
>  	unflatten_and_copy_device_tree();
>  	init_octeon_system_type();
>  }

I've applied https://lore.kernel.org/all/20261025192918.586220-1-carl.smith@alliedtelesis.co.nz/ to mips-next, which is doing the same.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
