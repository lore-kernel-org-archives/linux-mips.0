Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498349;
	b=txWzyIfXVwDbu36MmFLn9BFP10ClkrCIIELN6B8Uup92myAE+cQmKUgjFWJliFCxlszi
	 Bg4+JhEdAflHJfMwVlmeJpRuOP1LZtlM7tKXifMDnqBwmc9Bl27zftLv+hRvaGLFRjUEx
	 2hnJ8dREmaWbWqSKubW0UcgYwFzOiU5Qx/GWS2vtC59W7tWd8u82MEMMJJIEJXPXei/4Z
	 1+TDFjychiQCc8eI7K2sMI5/jey0YV2ECZ8LTTmuVTPJXb/2PaZxyRQMFN89nrinKU6wm
	 LkRGz5HZPthcMmS8rFu2/4QKwQi01ZECevfaX6RfsXvFfmym8+UJ6njrXl1k/q6XC3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498349;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=CQJLh+vS7OYaAUP51MkMV7udw8y7udD7KSJWpA2e+Dw=;
	b=hASVVBlEHdkHcz0SmW7Uzl8S/htyjbDzTPJ/JMLCaOX3WdXZMDrKYkG6phW/jgMR20Kd
	 x2XCK15Y4A4sNSv3Dh64LvHe0pHGSDS+/9qzyZwf8JGfdgyhM3EHFA5ZWJWW/Vlveh9cX
	 k0fKP5GjOl9s+UkPlIkwcG/Bc5jX6b3g217kIuZ8A2H4Y3IhM4B2+TCjupSNA8kfAFGR7
	 tulXPtcHIYtq6oui5C8Ttb0/Pno8P6WF0YzarsrnJF2lRxr7DAOzt7hk0vXXWus2sjzA/
	 /nbsusWf+1T3o2/m1ik8yBJAMUHgVrD8be8vym6S2XxQgKZDj2hZY+TfykkQAGXof/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aa1PnYSf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D4F606A31A;
	Tue, 20 Oct 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aa1PnYSf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8291F000C8;
	Tue, 20 Oct 2026 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792498348;
	bh=CQJLh+vS7OYaAUP51MkMV7udw8y7udD7KSJWpA2e+Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aa1PnYSfevYL1ZNdXnjb+hI4uRvs1/gGxkB9941j+c/MDXOYLL2KkvdBqZLLcOAk1
	 HBeGTbFDjrYGgfiCTjwIWncOYAiCuI0OG4B8ygWJWkgdsItZCxC2uMUgk+hhyX8K9F
	 Tgk/NlL5XTI4TopYbTnq2DjzBnltSjcHhYKEHrxCWCWxXOg/j9JkjrnXJbVf8yGflG
	 X59sS/RqKELC24Ah7jFmyc218zLJ++sEF9H8BJvoZIF7c9uFv8R6FreL2QMtT0uZdn
	 ObSoVhNkT6920mkJiyqrcTcWqYiaI5NZk+gYgWl4ebXNSY8t+xLzlBHq6Ky94/BWc1
	 nPWxytbnG/D5Q==
Date: Tue, 20 Oct 2026 13:12:24 +0100
From: Lee Jones <lee@kernel.org>
To: Imre Kaloz <kaloz@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v2 46/53] mfd: ioc3: Add IOC4 ATA/ATAPI cell
Message-ID: <179198336665.839288.12369537253671309518@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
 <754bae380c938b63eeaa87e3dccf9755314675ed.1791890466.git.kaloz@kernel.org>
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
In-Reply-To: <754bae380c938b63eeaa87e3dccf9755314675ed.1791890466.git.kaloz@kernel.org>
X-AI-Review-Draft: <754bae380c938b63eeaa87e3dccf9755314675ed.1791890466.git.kaloz@kernel.org>

--- checkpatch.pl: clean (0 issues) ---

On Tue, 13 Oct 2026, Imre Kaloz wrote:

> Add an IOC4 cell for pata_sgiioc4: a DEFINE_RES_MEM() over struct
> ioc4_ata_regs and a DEFINE_RES_IRQ() for other_ir bit 0
> (IOC4_OTHER_IR_ATA_INT). It joins ioc4_cells[] between the kbd and rtc
> cells.
>
> The ATA passthrough bit follows the drive's INTRQ line, which stays
> asserted until Status is read, unlike the discrete events on the rest
> of other_ir. Make it the one level-triggered bit of the other_ir bank.
> libata reads Status while servicing the interrupt, so ioc3_irq_ack()'s
> W1C write is the only ack needed.
>
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  arch/mips/include/asm/sn/ioc4.h |  1 +
>  drivers/mfd/ioc3.c              | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/arch/mips/include/asm/sn/ioc4.h b/arch/mips/include/asm/sn/ioc4.h
> index 781fcfb81b5e..d23676ae82b4 100644
> --- a/arch/mips/include/asm/sn/ioc4.h
> +++ b/arch/mips/include/asm/sn/ioc4.h
> @@ -129,6 +129,7 @@ struct ioc4 {
>  #define IOC4_OTHER_IR_GEN_INT		0xff000000	/* generic pins */
>
>  #define IOC4_OTHER_IR_KBD_INT_BIT	6	/* bit index */
> +#define IOC4_OTHER_IR_ATA_INT_BIT	0	/* bit index */
>
>  #define IOC4_SSCR_DMA_EN	0x10000000	/* enable ring buffer DMA */
>
> diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
> index 01c919c18b06..b471c90e737c 100644
> --- a/drivers/mfd/ioc3.c
> +++ b/drivers/mfd/ioc3.c
> @@ -850,6 +850,13 @@ static const struct ioc3_variant ioc3_variant = {
>  	(IOC4_SIO_IR_PORT_INT(0) | IOC4_SIO_IR_PORT_INT(1) | \
>  	 IOC4_SIO_IR_PORT_INT(2) | IOC4_SIO_IR_PORT_INT(3))
>
> +/*
> + * In other_ir only ATA passthrough is level triggered. It follows the
> + * drive's INTRQ line, which stays asserted until the host reads Status;
> + * the other other_ir bits are discrete events.
> + */
> +#define IOC4_OTHER_LVL_MASK	IOC4_OTHER_IR_ATA_INT
> +
>  #define IOC4_UART_RES(port) {						\
>  	DEFINE_RES_MEM(offsetof(struct ioc4, uart[port]),		\
>  		       sizeof_field(struct ioc4, uart[port])),		\
> @@ -869,6 +876,12 @@ static const struct resource ioc4_kbd_resources[] = {
>  	DEFINE_RES_IRQ(IOC4_IRQ_OTHER_BASE + IOC4_OTHER_IR_KBD_INT_BIT)
>  };
>
> +static const struct resource ioc4_ata_resources[] = {
> +	DEFINE_RES_MEM(offsetof(struct ioc4, ata),
> +		       sizeof_field(struct ioc4, ata)),
> +	DEFINE_RES_IRQ(IOC4_IRQ_OTHER_BASE + IOC4_OTHER_IR_ATA_INT_BIT)
> +};
> +
>  static const struct resource ioc4_rtc_resources[] = {
>  	DEFINE_RES_MEM(IOC4_BYTEBUS_DEV0, M48T35_REG_SIZE)
>  };
> @@ -898,6 +911,11 @@ static const struct mfd_cell ioc4_cells[] = {
>  		.resources = ioc4_kbd_resources,
>  		.num_resources = ARRAY_SIZE(ioc4_kbd_resources),
>  	},
> +	{
> +		.name = "pata_sgiioc4",
> +		.resources = ioc4_ata_resources,
> +		.num_resources = ARRAY_SIZE(ioc4_ata_resources),
> +	},

Shouldn't this have been added in Patch 31?

>  	{
>  		.name = "rtc-m48t35-ip35",
>  		.resources = ioc4_rtc_resources,
> @@ -974,6 +992,7 @@ static const struct ioc3_irq_bank ioc4_irq_banks[] = {
>  		.ir = offsetof(struct ioc4, other_ir),
>  		.ies = offsetof(struct ioc4, other_ies),
>  		.iec = offsetof(struct ioc4, other_iec),
> +		.lvl_mask = IOC4_OTHER_LVL_MASK,
>  	},
>  };
>
> -- 
> 2.47.3
>

-- 
Lee Jones
