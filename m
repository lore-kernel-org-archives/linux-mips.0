Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130137;
	b=BArS6NW24HtrrMlScvxq7yAzUn1l5xQKr9aHTOG7m+BTq0B165jqhQ1s1zPYKiMCtytA
	 fkbqicbgoAd0DaRZQQf9cQ+/3To1Uu8TAaaDu0fKLYmrEF5+heJhf+8ezj0vqwBt9lcKf
	 PJbc/eBKqB6/Lg8Fk/o3a29BS2aEZPBtiCMVgD7wdIIXfqg6AJn4+AQ6FLBN9hVYwL+bo
	 UgZlk4CTqcDXtDGa6boOzim94rXdbMn2mxNFdzG4ScSQVZEA2XcAtqXSlS/bYewykLbnf
	 cCXF9rWq5KU3C0SWOcyetSGq2o6sgpOM98DBYNqIa52Djtw5D9v4N1GaQGAt4gfLkeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130137;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=9VUab37bv5x6nwY9kHWT5Uy40zvmS1j1r0LdJGJzzC8=;
	b=Qe9YHyzIF2eh5BtimOxj+jwOCi7miZZGBno/f6vUschlA1oIC2Cp0uBvLlniF3MfCiER
	 fc9uXZ4KJ+TdxzR1gPAKSeoAYdZwVekfEFN1kf4EgvZm7IVgiMMbKgV6caO/tQK/T01uv
	 lesupi2JwPnH4gAuhcb73sv5YxTSLTu+4z0KAkcerd5O+LwP0L4kEp5a+nOtlVyAZH+Wv
	 KkZQ2Ojs2yGQG5ojsj5JmeDkx/GjNq3abyo9l+YjnloFNprfv3wCqv+/6dmkH0wenap0U
	 JuGLikHoFC/rkffqj1VRdsD1WSDioJ8yQeoXght0oTZADKqoHFkvBrJLest+kQMfi3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920C7606A336;
	Sun,  8 Nov 2026 09:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920C7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 02E8D92009E; Sun,  8 Nov 2026 10:28:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EBAA992009B;
	Sun,  8 Nov 2026 09:28:47 +0000 (GMT)
Date: Sun, 8 Nov 2026 09:28:47 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Imre Kaloz <kaloz@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: sgi-ip32: Fence PIO reads on CRIME 1.1
In-Reply-To: <20261107005245.20299-1-kaloz@kernel.org>
Message-ID: <alpine.DEB.2.21.2611080926150.17804@angie.orcam.me.uk>
References: <20261107005245.20299-1-kaloz@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 7 Nov 2026, Imre Kaloz wrote:

> diff --git a/arch/mips/include/asm/mach-ip32/read-fence.h b/arch/mips/include/asm/mach-ip32/read-fence.h
> new file mode 100644
> index 000000000000..7e3105af4c6f
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-ip32/read-fence.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_MACH_IP32_READ_FENCE_H
> +#define __ASM_MACH_IP32_READ_FENCE_H
> +
> +#include <linux/irqflags.h>
> +#include <linux/types.h>
> +
> +extern bool crime_read_fence;
> +void crime_read_fence_end(unsigned long flags);
> +
> +/*
> + * CRIME 1.1 can return a PCI read's data again to the next MACE or PCI
> + * read issued within about 2us, so each read is followed by 5us with
> + * interrupts off.
> + */
> +static inline bool plat_read_fence_begin(unsigned long *flags)
> +{
> +	if (!crime_read_fence)
> +		return false;
> +	local_irq_save(*flags);
> +	return true;
> +}
> +
> +static inline void plat_read_fence_end(unsigned long flags)
> +{
> +	crime_read_fence_end(flags);
> +}

 This seems hackish to me with the call to local_irq_restore() buried in 
crime_read_fence_end().  Why is is out of line?

  Maciej
