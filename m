Received: from smtp1.linux-foundation.org ([140.211.169.13]:51136 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1493553AbZHJWfl (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 11 Aug 2009 00:35:41 +0200
Date: Mon, 10 Aug 2009 15:35:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] MIPS: Octeon:  Add hardware RNG platform device.
Message-ID: <20090810153503.07dee9c4.akpm@linux-foundation.org>
In-Reply-To: <1249929025-29625-1-git-send-email-ddaney@caviumnetworks.com>
References: <4A806529.3060609@caviumnetworks.com>
	<1249929025-29625-1-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <akpm@linux-foundation.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: ralf@linux-mips.org, torvalds@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20090810223503.8oD0V2gbcz3B_C1BmimYsGp8GdHjbyvA7lGPbs6i_1E@z>

On Mon, 10 Aug 2009 11:30:24 -0700
David Daney <ddaney@caviumnetworks.com> wrote:

> Add a platform device for the Octeon Random Number Generator (RNG).
> 
> ...
>
>  device_initcall(octeon_cf_device_init);
> +
> +/* Octeon Random Number Generator.  */
> +static int __init octeon_rng_device_init(void)
> +{
> +	struct platform_device *pd;
> +	struct resource rng_resources[2];
> +	unsigned int res_count;
> +	int ret = 0;
> +
> +	memset(rng_resources, 0, sizeof(rng_resources));
> +	res_count = 0;
> +	rng_resources[res_count].flags = IORESOURCE_MEM;
> +	rng_resources[res_count].start = XKPHYS_TO_PHYS(CVMX_RNM_CTL_STATUS);
> +	rng_resources[res_count].end = rng_resources[res_count].start + 0xf;
> +	res_count++;
> +
> +	rng_resources[res_count].flags = IORESOURCE_MEM;
> +	rng_resources[res_count].start = cvmx_build_io_address(8, 0);
> +	rng_resources[res_count].end = rng_resources[res_count].start + 0x7;
> +	res_count++;

You could do

	strut resource rng_resources[2] = {
		{
			.flags = IORESOURCE_MEM,
			.start = XKPHYS_TO_PHYS(CVMX_RNM_CTL_STATUS),
	{etc}

here. 

> +	pd = platform_device_alloc("octeon_rng", -1);
> +	if (!pd) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	ret = platform_device_add_resources(pd, rng_resources, res_count);

use ARRAY_SIZE() here.

> +	if (ret)
> +		goto fail;
> +
> +	ret = platform_device_add(pd);
> +	if (ret)
> +		goto fail;
> +
> +	return ret;
> +fail:
> +	platform_device_put(pd);
> +
> +out:
> +	return ret;
> +}

Or not bother ;)  It doesn't make any difference.

> --- /dev/null
> +++ b/arch/mips/include/asm/octeon/cvmx-rnm-defs.h
>
> ...
>
> +	uint64_t u64;
>
> ...
>

This file should include types.h (at least).
