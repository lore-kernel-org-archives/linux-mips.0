Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217909;
	b=F2lM43tk1lbJ+7en6x/QzT//5h2w1F1YbFt0fgYBUYxHqPzPmB1I8AQ+phW1NnmCuTZ+
	 /2T5WCkntPZNvaMMn0Kku91UxvFDhVLXHwvIIePdVxjAsYHCUa/0ghVVEsB/PpAsugO0c
	 wG3Z4E6f5aiAyh/hIzSMI+N9l+8+meIBUo0J5JFbDoCIq9ObI1Q/446/iV+I64plmZ+8S
	 aN4h8nRihyOTmLY/Hr1WbnvNfBe2hhj4A7FiiidwJHpkSH/C7VMDpo/xNlATEBf/rOp9H
	 wGbeGT+uSzp8FAiG1aIZxddu35RKwrKvTljsYAxpBBI/2UIWN6SfctWGYVg6AUvejbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217909;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=o49wDZezadbzzhjMZXVo1RNTg8xkSKbSUV93QZ7B39c=;
	b=aM0qXwvTYBZhnsFz7UHhbYQ4iYPTu4BEIHm6wAwMqTAQ3EC0SePyK0biy4oYssB5am3Y
	 xD+7wwnMEC17UIg5yGdkG5oTgoxLDBf/mf4TNYpxWuE7pieHkoE6S/Rj84Na8qV+/qo50
	 C+DWH716dSe0UWjohmymokWVGXP5s0VcAjlZV+Nex0iNyINdTwBBILXk3t9yZ+MocUjYS
	 oJ0GcxDOlMDJWG1wzN29NC78CqkCL140yPnI6Bux7wRPvJWRPYbA0AEia1LRIiqteXy8h
	 wEnwJY6QkIPA7Mzmur1HMw9RVdtcy4pF5mGAExeJ8yx0bu0NAVOrgGFU4xkcB2kl+uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdwFqAwu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF68606A32C;
	Wed, 28 Oct 2026 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdwFqAwu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE27D1F01828;
	Wed, 28 Oct 2026 20:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793217908;
	bh=o49wDZezadbzzhjMZXVo1RNTg8xkSKbSUV93QZ7B39c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IdwFqAwutRj3c1H1zBUuYH5f2PLuZAa4ubgYBNMRF+S8wFRIeffvXolezNulLDtjf
	 pzlBElszJZLBSSsRp/cgyXFf9qw47M66RpV1bz4KiGp2u30MXodtYZJpYCxgInxOEb
	 jrhgAtKrcTMHPUxO61lVycnaZsxoLqwbO6Gg5AGQ1rxLKf6viCjsU8trmYrUrknNWK
	 f/gtEuZ3a8mMME7Ifd9ijXhB7qJ+b841AVZ3flk4XDcxOW3xKWt8Oxp/oCMdQDPe7j
	 8yZ0l3+CUBtqTFpwkBSdW21JnWjQFfV3UIBJI7c8vivLj0UMEyfZmzzL9CH2Xvv2Iy
	 5SOfGfP2V3EEA==
From: Thomas Gleixner <tglx@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Radu
 Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 2/4] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
In-Reply-To: <20261028-eyeq5_msi-v1-2-c464752fb55f@bootlin.com>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
 <20261028-eyeq5_msi-v1-2-c464752fb55f@bootlin.com>
Date: Wed, 28 Oct 2026 21:05:05 +0100
Message-ID: <87v76ly4jy.ffs@fw13>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 28 2026 at 16:58, Gregory CLEMENT wrote:
> +/*
> + * The caller must hold msi->lock.

Instead of a non-enforcable comment can you please put a
lockdep_assert_held() into the code.

> + */
> +static void __eyeq_msi_mask_irq(struct eyeq_msi *msi, unsigned int bit)
> +{
> +	u16 value;
> +
> +	value = readw(msi->gcsr_base + GCSR_IRQMASK);
> +	value &= ~FIELD_PREP(GCSR_IRQMASK_MASK, BIT(bit));
> +	writew(value, msi->gcsr_base + GCSR_IRQMASK);
> +}

> +static struct irq_chip eyeq_msi_irq_chip = {
> +	.name			= "EyeQ5-MSI",
> +	.irq_mask		= eyeq_msi_mask_irq,
> +	.irq_unmask		= eyeq_msi_unmask_irq,
> +	.irq_compose_msi_msg	= eyeq_msi_compose_msg,
> +};
> +
> +static void eyeq_msi_isr(struct irq_desc *desc)
> +{
> +	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
> +	struct eyeq_msi *msi = irq_desc_get_handler_data(desc);
> +	void __iomem *status_reg;
> +	unsigned long pending;
> +	unsigned int bit;
> +	int ret;
> +
> +	chained_irq_enter(parent_chip, desc);
> +
> +	status_reg = msi->gcsr_base + GCSR_IRQSTATUS;
> +
> +	while (true) {
> +		pending = FIELD_GET(GCSR_IRQSTATUS_MASK,
> +				    readw(status_reg));
> +		if (!pending)
> +			break;
> +
> +		/*
> +		 * Write-one-to-clear status register.
> +		 */
> +		writew(FIELD_PREP(GCSR_IRQSTATUS_MASK, pending),
> +		       status_reg);
> +
> +		for_each_set_bit(bit, &pending, msi->num_vectors) {
> +			ret = generic_handle_domain_irq(msi->msi_domain, bit);

You want to look at generic_handle_demux_domain_irq() and related
functionality so you can actually provide a irq_set_affinity() callback
for these demultiplexed interrupts. 

> +			if (ret)
> +				pr_err_ratelimited("unmapped MSI interrupt %u\n",
> +						   bit);

No line break required. You have 100 characters. Otherwise this needs
curly brackets around the "two-liner".

> +		}
> +	}
> +
> +	chained_irq_exit(parent_chip, desc);
> +}
> +
> +static int eyeq_msi_domain_alloc(struct irq_domain *domain,
> +				 unsigned int virq,
> +				 unsigned int nr_irqs,
> +				 void *args)

100 characters... All over the place

> +{
> +	struct eyeq_msi *msi = domain->host_data;
> +	DECLARE_BITMAP(reserved, EYEQ_MSI_MAX_VECTORS);
> +	unsigned long bit = 0;
> +	unsigned int i;
> +
> +	bitmap_zero(reserved, EYEQ_MSI_MAX_VECTORS);
> +
> +	scoped_guard(raw_spinlock_irqsave, &msi->lock) {
> +		for (i = 0; i < nr_irqs; i++) {
> +			bit = find_next_zero_bit(msi->used, msi->num_vectors, bit);
> +			if (bit >= msi->num_vectors) {
> +				/*
> +				 * Roll back this call's allocations: on error the
> +				 * core does not call .free().
> +				 */
> +				for_each_set_bit(bit, reserved,
> +						 EYEQ_MSI_MAX_VECTORS) {
> +					clear_bit(bit, msi->used);
> +					__eyeq_msi_mask_irq(msi, bit);
> +				}
> +
> +				return -ENOSPC;
> +			}
> +
> +			set_bit(bit, msi->used);
> +			__eyeq_msi_unmask_irq(msi, bit);
> +			set_bit(bit, reserved);
> +			bit++;
> +		}
> +	}
> +
> +	i = 0;
> +	for_each_set_bit(bit, reserved, EYEQ_MSI_MAX_VECTORS)

  for....() {

> +		irq_domain_set_info(domain, virq + i++, bit,
> +				    &eyeq_msi_irq_chip, msi,
> +				    handle_simple_irq, NULL, NULL);
> +

  }

See documentation.

> +	return 0;
> +}
> +
> +static void eyeq_msi_domain_free(struct irq_domain *domain,
> +				 unsigned int virq,
> +				 unsigned int nr_irqs)

....

> +{
> +	struct irq_data *data;
> +	struct eyeq_msi *msi;
> +	irq_hw_number_t hwirq;

Reverse fir tree ordering please. See documentation. And please move
these declarations into the scope where they are used.

> +	unsigned int i;
> +
> +	for (i = 0; i < nr_irqs; i++) {

  for (unsigned int i = 0; ...)

> +		data = irq_domain_get_irq_data(domain, virq + i);
> +		if (WARN_ON_ONCE(!data))
> +			continue;
> +


> +static int eyeq_msi_parse_dt(struct eyeq_msi *msi,
> +			     struct device_node *node)
> +{
> +	int ret;
> +
> +	ret = of_property_read_u32(node, "num-vectors",
> +				   &msi->num_vectors);

        int ret = of....();

> +	if (ret) {
> +		pr_err("missing or invalid num-vectors property\n");
> +		return ret;
> +	}
> +

Thanks,

        tglx
