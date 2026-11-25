Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634849;
	b=kBJTHNFY/qEjq8/UEbFnHuDiKXIeSnwJVOrCiwagtIWX7Hw2K1YfM9yu1+s+s2tmcNLi
	 YqjPDYG/t1XC2UgCRultVR9MwyGh6hweq/kBnimSMTC9PAdColg3my1T547FpXUKR5C4m
	 CAiWCFHY4rzfh1d40D1C4PCU8Vj0w0SLz9AIytj/naVa3uQgP6wcgzg3xsz6JKZU9jGSU
	 redH3KMNtLsEi9x7SwgGksASwAuuniWKEhPu0MLiLnSnwOezn2KzWib3LlCV5tdnuvaqw
	 O5S5FJRYZe4LFPF8hRgtWovekEPJsq6REpGoMntegcRtz4GQnfYFejut5gReKgi7azg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634849;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=2gVUYjWuMklagfG0sMS8DcE1D1r8uaFoZLlAJQhsW8M=;
	b=ovyGTwyrxOPpip7ApOL1QfMKQPqY6Lf4uDHAE0gTrVTrhKRgHcHb2IzoSFGuM1rz/bRI
	 K743UitP6aulZWzgWHmlG0H6vVTaVLG1NtKexkjERokbn8dzNQL+dEof8cPYuc0YxbFhk
	 Jeoc6xLfGjx5nM4CskCpRSNZu9v1jm+lq8VfoPiDO1RHpyFwSwZqIUlIPCbb5vxk0QIbp
	 JNgt9R7l4V+JWp4O7l48KwMtpDBLzbCNOPiMLvrZZQbFEqCDGx7E0C1kp5Oq6st/RwopG
	 7j1LItYY4nA7dX92tdIpNEoe59HfYWnV5GZNVMMGvAIbnlLCBFDpJj/JykgG5FTPlFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="m+4b/c1h";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D693606A680;
	Wed, 25 Nov 2026 19:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D693606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=m+4b/c1h
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A09C41A17F6;
	Wed, 25 Nov 2026 19:27:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72A3E60480;
	Wed, 25 Nov 2026 19:27:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54F8511E6B0F7;
	Wed, 25 Nov 2026 20:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795634846; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2gVUYjWuMklagfG0sMS8DcE1D1r8uaFoZLlAJQhsW8M=;
	b=m+4b/c1hZVsmZKrjESCy3eP++OK4RZ3+hrXWG0Keh8v6bIsVUZ8mszV+73ivB+lb/2nvjI
	G2vxp+3XujM15d1SYnofLRm81l2FmBAV8A+JSjPODu1YOfhMXusOLesNqh5r+U0ixU6Vj6
	mhCkU8NscACQ9z10DRkP0NupdZ8aw/OFm4dvNJQDmyWh1jX6xl6qEx2YIGG/3aXynqBbEF
	pwVee6TReriSD65zA2yScLeovQZHvb6ufmR4qTRvFJkRV1Y54jM8sQdbTEfWCYShZwPfxO
	tk++0jKKs7TuWPVlCaGANY5JRUnyaB5WVdT98/TBNm3/Xq0E1rfVgD/L0igvXA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 25 Nov 2026 20:27:09 +0100
Subject: [PATCH v5 2/5] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-eyeq5_msi-v5-2-72346cd10736@bootlin.com>
References: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
In-Reply-To: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Each EyeQ5 PCIe port has its own MSI controller. The controller snoops the
MSI write TLPs that the port receives. It raises an interrupt when a write
targets the doorbell window. A port supports a maximum of 4 MSI vectors.

The driver supports two roles, selected by the GCSR mode. In root complex
mode, it registers a PCI MSI parent. In endpoint mode, it registers a
platform MSI parent. The driver chains the snooper domain to one GIC
interrupt.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/irqchip/Kconfig         |   5 +
 drivers/irqchip/Makefile        |   1 +
 drivers/irqchip/irq-eyeq5-msi.c | 475 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 481 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 90daedb7554ae..5d5a2e31d5eab 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -827,6 +827,11 @@ config APPLE_AIC
 	  Support for the Apple Interrupt Controller found on Apple Silicon SoCs,
 	  such as the M1.
 
+config EYEQ5_MSI
+	bool
+	select IRQ_DOMAIN
+	select IRQ_MSI_LIB
+
 config MCHP_EIC
 	bool "Microchip External Interrupt Controller"
 	depends on ARCH_AT91 || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index eb539d41251e2..4b96194e70b72 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -132,6 +132,7 @@ obj-$(CONFIG_MACH_REALTEK_RTL)		+= irq-realtek-rtl.o
 obj-$(CONFIG_WPCM450_AIC)		+= irq-wpcm450-aic.o
 obj-$(CONFIG_IRQ_IDT3243X)		+= irq-idt3243x.o
 obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
+obj-$(CONFIG_EYEQ5_MSI)			+= irq-eyeq5-msi.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
 obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
diff --git a/drivers/irqchip/irq-eyeq5-msi.c b/drivers/irqchip/irq-eyeq5-msi.c
new file mode 100644
index 0000000000000..765fa60939508
--- /dev/null
+++ b/drivers/irqchip/irq-eyeq5-msi.c
@@ -0,0 +1,475 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mobileye EyeQ5 MSI interrupt controller
+ *
+ * Copyright Mobileye (2026)
+ */
+
+#define pr_fmt(fmt) "eyeq5-msi: " fmt
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
+#include <linux/irqdomain.h>
+#include <linux/msi.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+/*
+ * The snooper decodes the vector number from TLP address bits [4:3], so a
+ * port can serve at most 4 vectors.
+ */
+#define EYEQ_MSI_MAX_VECTORS		4
+
+/*
+ * Vector n is raised by a write to the doorbell base + n * 8.
+ */
+#define EYEQ_MSI_VECTOR_STRIDE		8
+
+/*
+ * Maximum number of loops in the ISR: each vector may be handled twice, then
+ * we stop. A device that keeps setting a vector that is still active must not
+ * hold the CPU in the ISR. The level-triggered parent IRQ calls the handler
+ * again for any status bits still pending.
+ */
+#define EYEQ_MSI_MAX_DRAIN		(EYEQ_MSI_MAX_VECTORS * 2)
+
+#define GCSR_CONFIG			0x00
+#define GCSR_CONFIG_RC			BIT(0)
+
+#define GCSR_IRQSTATUS			0x0a
+#define GCSR_IRQSTATUS_MASK		GENMASK(15, 12)
+
+#define GCSR_IRQMASK			0x0c
+#define GCSR_IRQMASK_MASK		GENMASK(15, 12)
+
+#define MSI_BASE_LO			0x00
+#define MSI_BASE_HI			0x02
+
+#define MSI_CTRL			0x04
+#define MSI_CTRL_EN_OVERRIDE		BIT(15)
+#define MSI_CTRL_BAR_MATCH_MODE		BIT(10)
+#define MSI_CTRL_BAR_COMPARE		GENMASK(9, 7)
+
+#define VECTOR_ADDR_LO			GENMASK_ULL(20, 5)
+#define VECTOR_ADDR_HI			GENMASK_ULL(36, 21)
+
+struct eyeq_msi {
+	raw_spinlock_t			lock;
+	struct irq_domain		*msi_domain;
+	DECLARE_BITMAP(used, EYEQ_MSI_MAX_VECTORS);
+
+	void __iomem			*gcsr_base;
+	void __iomem			*msi_base;
+
+	phys_addr_t			vector_phys;
+
+	int				irq;
+};
+
+static void __eyeq_msi_mask_irq(struct eyeq_msi *msi, unsigned int bit)
+{
+	u16 value;
+
+	lockdep_assert_held(&msi->lock);
+
+	value = readw(msi->gcsr_base + GCSR_IRQMASK);
+	value &= ~FIELD_PREP(GCSR_IRQMASK_MASK, BIT(bit));
+	writew(value, msi->gcsr_base + GCSR_IRQMASK);
+}
+
+static void __eyeq_msi_unmask_irq(struct eyeq_msi *msi, unsigned int bit)
+{
+	u16 value;
+
+	lockdep_assert_held(&msi->lock);
+
+	value = readw(msi->gcsr_base + GCSR_IRQMASK);
+	value |= FIELD_PREP(GCSR_IRQMASK_MASK, BIT(bit));
+	writew(value, msi->gcsr_base + GCSR_IRQMASK);
+}
+
+static void __eyeq_msi_clear_irq(struct eyeq_msi *msi, unsigned int bit)
+{
+	lockdep_assert_held(&msi->lock);
+
+	writew(FIELD_PREP(GCSR_IRQSTATUS_MASK, BIT(bit)),
+	       msi->gcsr_base + GCSR_IRQSTATUS);
+}
+
+static void eyeq_msi_mask_irq(struct irq_data *data)
+{
+	struct eyeq_msi *msi = irq_data_get_irq_chip_data(data);
+
+	guard(raw_spinlock)(&msi->lock);
+	__eyeq_msi_mask_irq(msi, data->hwirq);
+}
+
+static void eyeq_msi_unmask_irq(struct irq_data *data)
+{
+	struct eyeq_msi *msi = irq_data_get_irq_chip_data(data);
+
+	guard(raw_spinlock)(&msi->lock);
+	__eyeq_msi_unmask_irq(msi, data->hwirq);
+}
+
+static void eyeq_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
+{
+	struct eyeq_msi *msi = irq_data_get_irq_chip_data(data);
+	phys_addr_t address;
+
+	memset(msg, 0, sizeof(*msg));
+
+	address = msi->vector_phys + data->hwirq * EYEQ_MSI_VECTOR_STRIDE;
+
+	msg->address_lo = lower_32_bits(address);
+	msg->address_hi = upper_32_bits(address);
+	msg->data = data->hwirq;
+}
+
+/*
+ * The pending bit is write-one-to-cleared in eyeq_msi_isr() before the
+ * vector is dispatched, so there is nothing left to acknowledge here.
+ * handle_edge_irq() nevertheless requires an ack callback.
+ */
+static void eyeq_msi_ack_irq(struct irq_data *data) { }
+
+static struct irq_chip eyeq_msi_irq_chip = {
+	.name			= "EyeQ5-MSI",
+	.irq_mask		= eyeq_msi_mask_irq,
+	.irq_unmask		= eyeq_msi_unmask_irq,
+	.irq_ack		= eyeq_msi_ack_irq,
+	.irq_compose_msi_msg	= eyeq_msi_compose_msg,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= irq_chip_redirect_set_affinity,
+#endif
+};
+
+static void eyeq_msi_isr(struct irq_desc *desc)
+{
+	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
+	struct eyeq_msi *msi = irq_desc_get_handler_data(desc);
+	void __iomem *status_reg;
+	unsigned long pending;
+	unsigned long mask;
+	unsigned int bit;
+	unsigned int i;
+
+	guard_chained_irq(parent_chip, desc);
+
+	status_reg = msi->gcsr_base + GCSR_IRQSTATUS;
+
+	for (i = 0; i < EYEQ_MSI_MAX_DRAIN; i++) {
+		pending = FIELD_GET(GCSR_IRQSTATUS_MASK, readw(status_reg));
+		if (!pending)
+			break;
+
+		/*
+		 * Masked vectors must stay pending in GCSR_IRQSTATUS: unmasking
+		 * them must re-assert the top-level IRQ. Only dispatch and ack
+		 * the bits that are currently unmasked.
+		 */
+		mask = FIELD_GET(GCSR_IRQMASK_MASK,
+				 readw(msi->gcsr_base + GCSR_IRQMASK));
+		pending &= mask;
+		if (!pending)
+			break;
+
+		/*
+		 * Write-one-to-clear status register.
+		 */
+		writew(FIELD_PREP(GCSR_IRQSTATUS_MASK, pending), status_reg);
+
+		for_each_set_bit(bit, &pending, EYEQ_MSI_MAX_VECTORS) {
+			if (!generic_handle_demux_domain_irq(msi->msi_domain, bit))
+				pr_err_ratelimited("unmapped MSI interrupt %u\n", bit);
+		}
+	}
+}
+
+static int eyeq_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				 unsigned int nr_irqs, void *args)
+{
+	struct eyeq_msi *msi = domain->host_data;
+	unsigned long bit;
+
+	if (WARN_ON_ONCE(nr_irqs != 1))
+		return -EINVAL;
+
+	scoped_guard(raw_spinlock_irqsave, &msi->lock) {
+		bit = find_first_zero_bit(msi->used, EYEQ_MSI_MAX_VECTORS);
+		if (bit >= EYEQ_MSI_MAX_VECTORS)
+			return -ENOSPC;
+
+		set_bit(bit, msi->used);
+
+		/*
+		 * Drop a stale latch left by a previous owner so the new
+		 * owner does not receive a spurious MSI on unmask.
+		 */
+		__eyeq_msi_clear_irq(msi, bit);
+	}
+
+	irq_domain_set_info(domain, virq, bit, &eyeq_msi_irq_chip, msi,
+			    handle_edge_irq, NULL, NULL);
+
+	/*
+	 * handle_edge_irq() cannot replay an event that was acked while the
+	 * vector was disabled. Mask the vector immediately so the MSI stays
+	 * pending in GCSR_IRQSTATUS until enable_irq() unmasks it.
+	 */
+	irq_set_status_flags(virq, IRQ_DISABLE_UNLAZY);
+
+	return 0;
+}
+
+static void eyeq_msi_domain_free(struct irq_domain *domain, unsigned int virq,
+				 unsigned int nr_irqs)
+{
+	struct irq_data *data = irq_domain_get_irq_data(domain, virq);
+	irq_hw_number_t hwirq;
+	struct eyeq_msi *msi;
+
+	if (WARN_ON_ONCE(nr_irqs != 1))
+		return;
+
+	if (WARN_ON_ONCE(!data))
+		return;
+
+	msi = irq_data_get_irq_chip_data(data);
+	hwirq = data->hwirq;
+
+	guard(raw_spinlock_irqsave)(&msi->lock);
+
+	if (!test_and_clear_bit(hwirq, msi->used)) {
+		pr_warn("attempt to free unused hwirq %lu\n", (unsigned long)hwirq);
+		return;
+	}
+
+	__eyeq_msi_mask_irq(msi, hwirq);
+	__eyeq_msi_clear_irq(msi, hwirq);
+}
+
+/*
+ * The same callbacks serve the PCI MSI parent (root complex mode) and the
+ * platform MSI parent (endpoint mode).
+ */
+static const struct irq_domain_ops eyeq_msi_domain_ops = {
+	.alloc	= eyeq_msi_domain_alloc,
+	.free	= eyeq_msi_domain_free,
+	.select	= msi_lib_irq_domain_select,
+};
+
+#define EYEQ_MSI_FLAGS_REQUIRED		(MSI_FLAG_USE_DEF_DOM_OPS |	\
+					 MSI_FLAG_USE_DEF_CHIP_OPS |	\
+					 MSI_FLAG_PCI_MSI_MASK_PARENT)
+
+#define EYEQ_MSI_FLAGS_SUPPORTED		(MSI_FLAG_PCI_MSIX |		\
+					 MSI_GENERIC_FLAGS_MASK)
+
+static bool eyeq_msi_init_dev_msi_info(struct device *dev,
+				       struct irq_domain *domain,
+				       struct irq_domain *real_parent,
+				       struct msi_domain_info *info)
+{
+	if (!msi_lib_init_dev_msi_info(dev, domain, real_parent, info))
+		return false;
+
+	/*
+	 * handle_edge_irq() and mask_ack_irq() run on the top-level
+	 * (device) irq_data, so this chip needs an ack callback too.
+	 */
+	info->chip->irq_ack = eyeq_msi_ack_irq;
+
+	return true;
+}
+
+static const struct msi_parent_ops eyeq_msi_parent_ops = {
+	.required_flags		= EYEQ_MSI_FLAGS_REQUIRED,
+	.supported_flags	= EYEQ_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.bus_select_mask	= MATCH_PCI_MSI,
+	.prefix			= "EYEQ-",
+	.init_dev_msi_info	= eyeq_msi_init_dev_msi_info,
+};
+
+/*
+ * In endpoint mode the snooper is a platform MSI controller: the host writes
+ * the doorbell and the snooper raises a local interrupt. Expose it as a
+ * platform MSI parent so endpoint functions can allocate doorbells.
+ */
+static const struct msi_parent_ops eyeq_msi_platform_parent_ops = {
+	.required_flags		= EYEQ_MSI_FLAGS_REQUIRED,
+	.supported_flags	= EYEQ_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.bus_select_mask	= MATCH_PLATFORM_MSI,
+	.prefix			= "EYEQ-P-",
+	.init_dev_msi_info	= eyeq_msi_init_dev_msi_info,
+};
+
+static int eyeq_msi_create_domain(struct eyeq_msi *msi, struct device_node *node, bool is_rc)
+{
+	const struct msi_parent_ops *parent_ops = is_rc ?
+		&eyeq_msi_parent_ops : &eyeq_msi_platform_parent_ops;
+	struct irq_domain_info info = {
+		.fwnode		= of_fwnode_handle(node),
+		.ops		= &eyeq_msi_domain_ops,
+		.host_data	= msi,
+		.size		= EYEQ_MSI_MAX_VECTORS,
+		/*
+		 * The composed doorbell address does not depend on affinity,
+		 * as required by platform MSI doorbell consumers.
+		 */
+		.domain_flags	= is_rc ? 0 : IRQ_DOMAIN_FLAG_MSI_IMMUTABLE,
+	};
+
+	msi->msi_domain = msi_create_parent_irq_domain(&info, parent_ops);
+	if (!msi->msi_domain)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int eyeq_msi_parse_vector_region(struct eyeq_msi *msi, struct device_node *node)
+{
+	struct device_node *memory_node;
+	struct resource resource;
+	int ret;
+
+	memory_node = of_parse_phandle(node, "memory-region", 0);
+	if (!memory_node) {
+		pr_err("missing memory-region property\n");
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(memory_node, 0, &resource);
+	of_node_put(memory_node);
+
+	if (ret) {
+		pr_err("failed to parse MSI vector memory region: %d\n", ret);
+		return ret;
+	}
+
+	msi->vector_phys = resource.start;
+
+	return 0;
+}
+
+static void eyeq_msi_program_hardware(struct eyeq_msi *msi, bool is_rc)
+{
+	u16 control, value;
+	u32 match_bar;
+
+	guard(raw_spinlock_irqsave)(&msi->lock);
+	value = readw(msi->gcsr_base + GCSR_IRQMASK);
+	value &= ~GCSR_IRQMASK_MASK;
+	writew(value, msi->gcsr_base + GCSR_IRQMASK);
+	writew(GCSR_IRQSTATUS_MASK, msi->gcsr_base + GCSR_IRQSTATUS);
+
+	/*
+	 * The register holds address bits 5..36.
+	 */
+	writew(FIELD_GET(VECTOR_ADDR_LO, msi->vector_phys), msi->msi_base + MSI_BASE_LO);
+
+	writew(FIELD_GET(VECTOR_ADDR_HI, msi->vector_phys), msi->msi_base + MSI_BASE_HI);
+
+	/*
+	 * RC mode uses BAR 2 as the no-translation BAR, endpoint mode uses
+	 * BAR 3 as the MSI BAR.
+	 */
+	match_bar = is_rc ? 2 : 3;
+
+	/*
+	 * MSI_ADDR_MASK is left to zero: the vector region only differs from
+	 * its base on address bits [4:3], which hardware excludes from the
+	 * comparison since they hold the vector number.
+	 */
+	control = MSI_CTRL_EN_OVERRIDE | MSI_CTRL_BAR_MATCH_MODE |
+		FIELD_PREP(MSI_CTRL_BAR_COMPARE, match_bar);
+
+	writew(control, msi->msi_base + MSI_CTRL);
+}
+
+static int eyeq_msi_probe(struct platform_device *pdev, struct device_node *parent)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct eyeq_msi *msi;
+	bool is_rc;
+	int ret;
+
+	msi = devm_kzalloc(&pdev->dev, sizeof(*msi), GFP_KERNEL);
+	if (!msi)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&msi->lock);
+	bitmap_zero(msi->used, EYEQ_MSI_MAX_VECTORS);
+	msi->irq = -1;
+
+	msi->gcsr_base = of_iomap(node, 0);
+	if (!msi->gcsr_base) {
+		pr_err("failed to map GCSR registers\n");
+		return -ENOMEM;
+	}
+
+	msi->msi_base = of_iomap(node, 1);
+	if (!msi->msi_base) {
+		pr_err("failed to map MSI registers\n");
+		ret = -ENOMEM;
+		goto err_unmap_gcsr;
+	}
+
+	ret = eyeq_msi_parse_vector_region(msi, node);
+	if (ret)
+		goto err_unmap_msi;
+
+	msi->irq = of_irq_get(node, 0);
+	if (msi->irq <= 0) {
+		ret = msi->irq ?: -EINVAL;
+		pr_err("failed to obtain parent IRQ: %d\n", ret);
+		goto err_unmap_msi;
+	}
+
+	is_rc = FIELD_GET(GCSR_CONFIG_RC, readw(msi->gcsr_base + GCSR_CONFIG));
+
+	eyeq_msi_program_hardware(msi, is_rc);
+
+	ret = eyeq_msi_create_domain(msi, node, is_rc);
+	if (ret) {
+		pr_err("failed to create IRQ domain: %d\n", ret);
+		goto err_dispose_irq;
+	}
+
+	/*
+	 * Install the chained handler only once the domain and hardware are
+	 * ready, otherwise an interrupt could arrive unhandled.
+	 */
+	irq_set_chained_handler_and_data(msi->irq, eyeq_msi_isr, msi);
+
+	pr_info("%s: initialized in %s mode with %u vectors, parent IRQ %d\n",
+		of_node_full_name(node), is_rc ? "root-complex" : "endpoint",
+		EYEQ_MSI_MAX_VECTORS, msi->irq);
+
+	return 0;
+
+err_dispose_irq:
+	irq_dispose_mapping(msi->irq);
+
+err_unmap_msi:
+	iounmap(msi->msi_base);
+
+err_unmap_gcsr:
+	iounmap(msi->gcsr_base);
+
+	return ret;
+}
+
+IRQCHIP_PLATFORM_DRIVER_BEGIN(eyeq5_msi)
+IRQCHIP_MATCH("mobileye,eyeq5-msi", eyeq_msi_probe)
+IRQCHIP_PLATFORM_DRIVER_END(eyeq5_msi)

-- 
2.53.0

