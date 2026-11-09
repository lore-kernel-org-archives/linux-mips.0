Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218105;
	b=bzuQvW5vZxtlAaQb28MyewXsRCU215m41VYiVXYguvc6OXlOqKB4e+nyGS1avO62//YD
	 6Q9uRV9+X9HJw5mv5yC28GLwIni5jPV/s9tRVR5dWBt2EMVehhB9QA5rCNi8ARUHvZ3QE
	 PCyBe77Z7pMoP55fc63s6/6/tazJ+zTWTCCg4qbdsMUUbv081+yTeEpKgGK0gElVoT6uP
	 QHpjBvtPft3sIVfa3Bfv3Rj3Du5+T32mShTsa2bQMZ4zRPR8hSN9ULaBDxw6YpXXJ7RdF
	 rp1hq+mMrLZEeCWRjQBrIVbvmVIzhSwvFiKt5+jvXayfFsoJNw5Qi0Uq1+aTeYPs+oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218105;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=vn7V5zWgWjR2AxhbbXtzmU81jhYCCnS3gbGv+/5Hh8Q=;
	b=0Y6HPO73VTxjV//8dJz/Bigt1Fyd1rUuRCrCaFbEI02VtaKNbSNLH6oxjIZ/TUQaBlRV
	 Mr42kTFCpzFHvqG8I7HqPpdpFaIT5EPdZWvHLSnJQCIILY2xBfPC9Fbl2N19HAJDmIqPq
	 7svkm/6Xlv0a0hI+/Hha3cMjMjj0b7qrc58UYMxn0tz2BdeVaYKIYPOKmyDMJsDNtUA7F
	 mAF5boMuBpCQMxXQZsjG6Q+yhWfzjNhCXsm3zbRljCoBpzh4bKXx2w+4trIpTi37U5xMP
	 baL3urGhtdwyLAytZe6UDPbmdw1uVockTZtXAt5zByGYnpZmg1oFgs9yrZQ/yUVtn8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWUG4zbF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60437606A321;
	Mon,  9 Nov 2026 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWUG4zbF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A6D1F0089F;
	Mon,  9 Nov 2026 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218105;
	bh=vn7V5zWgWjR2AxhbbXtzmU81jhYCCnS3gbGv+/5Hh8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FWUG4zbFrGPjlsUUYCS7eLB+wVTHdqvhSomjjUrLfHGzs5DcZBo9eyCdYxfcGEsvu
	 X5IxtbOs5IYFl/GCUOzLWBj3k2p6nVnYd/AymccQWV24NifCdO7c9yJhJQL81xQogJ
	 wAVtB7QA01+tbqeIHkc2di1H2cdvdes2y6PRZMpEtnCKiF3o6g+f7NJJYcxWiq9/ZR
	 FxOJO5TmB+BXtCuw7lCtZ0OND8xswpgssUpfPSPRtkjjifGdBi91tjF3Bhyz46DhJs
	 CPhnfSz5trwWRiz8yevWh95WLjWhYsrAmZ8WPNxCqqt4xjTb0A73Cc4OeD+TB+RDr7
	 y20yyMsf/kVYw==
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
Subject: Re: [PATCH v2 2/4] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
In-Reply-To: <20261102-eyeq5_msi-v2-2-4aa3d3608064@bootlin.com>
References: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
 <20261102-eyeq5_msi-v2-2-4aa3d3608064@bootlin.com>
Date: Mon, 09 Nov 2026 10:55:01 +0100
Message-ID: <87v766uy6i.ffs@fw13>
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

On Mon, Nov 02 2026 at 17:50, Gregory CLEMENT wrote:
> +static void __eyeq_msi_mask_irq(struct eyeq_msi *msi, unsigned int bit)
> +{
> +	u16 value;
> +
> +	lockdep_assert_held(&msi->lock);
> +
> +	value = readw(msi->gcsr_base + GCSR_IRQMASK);
> +	value &= ~FIELD_PREP(GCSR_IRQMASK_MASK, BIT(bit));
> +	writew(value, msi->gcsr_base + GCSR_IRQMASK);
> +}
> +
> +static void __eyeq_msi_unmask_irq(struct eyeq_msi *msi, unsigned int bit)
> +{
> +	u16 value;
> +
> +	lockdep_assert_held(&msi->lock);
> +
> +	value = readw(msi->gcsr_base + GCSR_IRQMASK);
> +	value |= FIELD_PREP(GCSR_IRQMASK_MASK, BIT(bit));
> +	writew(value, msi->gcsr_base + GCSR_IRQMASK);
> +}
> +
> +static void eyeq_msi_mask_irq(struct irq_data *data)
> +{
> +	struct eyeq_msi *msi = irq_data_get_irq_chip_data(data);
> +
> +	guard(raw_spinlock_irqsave)(&msi->lock);

What's the reason for ...irqsave() here? The mask/unmask callbacks are
invoked with the interrupt descriptor lock held and interrupts disabled,
so a plain raw_spinlock() is sufficient, no?

> +static void eyeq_msi_isr(struct irq_desc *desc)
> +{
> +	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
> +	struct eyeq_msi *msi = irq_desc_get_handler_data(desc);
> +	void __iomem *status_reg;
> +	unsigned long pending;
> +	unsigned int bit;
> +
> +	chained_irq_enter(parent_chip, desc);

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/drivers&id=6cf0d999a18e799965cf2cf4a0157e257c805946

> +static int eyeq_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
> +				 unsigned int nr_irqs, void *args)
> +{
> +	DECLARE_BITMAP(reserved, EYEQ_MSI_MAX_VECTORS);
> +	struct eyeq_msi *msi = domain->host_data;
> +	unsigned long bit = 0;
> +	unsigned int i;
> +
> +	bitmap_zero(reserved, EYEQ_MSI_MAX_VECTORS);
> +
> +	scoped_guard(raw_spinlock_irqsave, &msi->lock) {
> +		for (i = 0; i < nr_irqs; i++) {

This does not support MULTI_MSI, so nr_irqs is always 1. That allows to
simplify both alloc() and free() by a lot, no?

> +#define EYEQ_MSI_FLAGS_REQUIRED			\
> +	(MSI_FLAG_USE_DEF_DOM_OPS |		\
> +	 MSI_FLAG_USE_DEF_CHIP_OPS |		\
> +	 MSI_FLAG_PCI_MSI_MASK_PARENT)

Just a cosmetic nit:

#define EYEQ_MSI_FLAGS_REQUIRED		(MSI_FLAG_USE_DEF_DOM_OPS |	\
					 MSI_FLAG_USE_DEF_CHIP_OPS |	\
					 MSI_FLAG_PCI_MSI_MASK_PARENT)

is easier to read. But no strong opinion.

> +#define EYEQ_MSI_FLAGS_SUPPORTED		\
> +	(MSI_FLAG_PCI_MSIX |			\
> +	 MSI_GENERIC_FLAGS_MASK)
> +
> +static const struct msi_parent_ops eyeq_msi_parent_ops = {
> +	.required_flags		= EYEQ_MSI_FLAGS_REQUIRED,
> +	.supported_flags	= EYEQ_MSI_FLAGS_SUPPORTED,
> +	.bus_select_token	= DOMAIN_BUS_NEXUS,
> +	.bus_select_mask	= MATCH_PCI_MSI,
> +	.prefix			= "EYEQ-",
> +	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
> +};
> +
> +/*
> + * In endpoint mode the snooper is a platform MSI controller: the host writes
> + * the doorbell and the snooper raises a local interrupt. Expose it as a
> + * platform MSI parent so endpoint functions can allocate doorbells.
> + */
> +static const struct msi_parent_ops eyeq_msi_platform_parent_ops = {
> +	.required_flags		= EYEQ_MSI_FLAGS_REQUIRED,
> +	.supported_flags	= EYEQ_MSI_FLAGS_SUPPORTED,
> +	.bus_select_token	= DOMAIN_BUS_NEXUS,
> +	.bus_select_mask	= MATCH_PLATFORM_MSI,
> +	.prefix			= "EYEQ-",

It might be sensible to use a distinct prefix here, e.g. 'EYEQ-P-' or so.

> +static int eyeq_msi_create_domain(struct eyeq_msi *msi, struct device_node *node, bool is_rc)

__init ?

> +static int eyeq_msi_parse_vector_region(struct eyeq_msi *msi, struct device_node *node)

__init ?

> +static int eyeq_msi_parse_dt(struct eyeq_msi *msi, struct device_node *node)

__init ?

> +static void eyeq_msi_program_hardware(struct eyeq_msi *msi, bool is_rc)

__init ?

> +
> +static int __init eyeq_msi_of_init(struct device_node *node, struct device_node *parent)
> +{

Also please check the sashiko response vs. handle_simple_irq() and the
affinity mechanism.

Thanks,

        tglx
