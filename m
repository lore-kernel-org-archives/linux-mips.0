Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDCC534472;
	Thu,  1 Oct 2026 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871248; cv=none; b=u7B2qatzFZWPlAB2IcW5JNNLxe+XJssGMR99Jlu2Acz2KKFuzncb95sZDKuMQA3N/L+hvXb7XnqP4T1Vi0nv4sf7uU4AHDYmEl2nKshtusmHMsD+mcABXwj425Plk+NqeblFf8YO0tUlPP7806ZJOcxSoAkDanEk4NgQqCEyNu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871248; c=relaxed/simple;
	bh=1wrqZn6w24DShnttUZdaToXRjGdQF35LjmxjiF0Yhmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmaRqia5+Ae5WEYAdTLC9I2wBCNFEQGeLPytcW7itaYXe6jy0iB6/BMPL70w9LdIVKjWhjKvGfqo8nNO1k3FCS0enl60+pnw+evrqsayz7EVoyK9o8mMfiCuSQbbugmuUCd35BMa22muB6PyROdn9DaPysUJBwAZsrWjQS7pL3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efpKoI9K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efpKoI9K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60681F00898;
	Thu,  1 Oct 2026 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871246;
	bh=Ejf/+rWJ7AinoyzTaQkjZDD5Kfq/k7dhPUNxDVKJjZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=efpKoI9Kw/OQaEoK+EO8NNvD9RZneGeR2qCqBur6wIMROfk/RvRu5AqHgq241mTWg
	 xG+99VuagjrF4DyHmuTd8QMpkE8jsaGhAnH/6ZeNj/95NShPEQTMagYrwffx2CGdsl
	 N+6pSLD7pX6IBTKbVMh5FFFn/j1Akm9S1w3ph3mm6otsvf4seJ2JdDTeNH/hnFdOL9
	 8ALDa/aq+xtMoX5obkKa8I34VMIHYOHboJnWSwFN8GJkwf8QcjMDPo2Fcluf69665o
	 XyZkSJUQ2Dd6BamDSTeED1bo6h6z2wyp02toDEYV3+CZEzwNLF02qxXIkv7//vZOCR
	 B2hcyom6Rrxsw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/38] MIPS: PCI: xtalk-bridge: match PIC's register-level differences
Date: Thu,  1 Oct 2026 18:11:59 +0200
Message-ID: <6e4ffa881e89a2cc74f279c669ca9f3a7770e120.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PIC's config space puts the ASIC at device 0 and the slots at 1-4, its
write-request RAM needs clearing, and b_int_addr[] takes a full XIO
address. Handle each in the config accessors and in bridge_probe(),
which also clears PIC's NO_SNOOP and RELAX_ORDER control bits.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/pci/bridge.h | 11 ++++++
 arch/mips/pci/pci-xtalk-bridge.c   | 61 +++++++++++++++++++++++-------
 2 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/arch/mips/include/asm/pci/bridge.h b/arch/mips/include/asm/pci/bridge.h
index 76c5db983748..81204c3d211d 100644
--- a/arch/mips/include/asm/pci/bridge.h
+++ b/arch/mips/include/asm/pci/bridge.h
@@ -372,6 +372,12 @@ struct bridge_err_cmdword {
 
 #define BRIDGE_ATE_RAM		0x00010000	/* Internal Addr Xlat Ram */
 
+/* PIC Write Request RAM: three 256-entry, 64-bit arrays. */
+#define PIC_WR_REQ_BUFSIZE	256
+#define PIC_WR_REQ_LOWER	0x00018000
+#define PIC_WR_REQ_UPPER	0x00018800
+#define PIC_WR_REQ_PARITY	0x00019000
+
 #define BRIDGE_TYPE0_CFG_DEV0	0x00020000	/* Type 0 Cfg, Device 0 */
 #define BRIDGE_TYPE0_CFG_SLOT_OFF	0x00001000	/* Type 0 Cfg Slot Offset (1..7) */
 #define BRIDGE_TYPE0_CFG_FUNC_OFF	0x00000100	/* Type 0 Cfg Func Offset (1..7) */
@@ -389,6 +395,7 @@ struct bridge_err_cmdword {
 /* Byte offset macros for Bridge device IO spaces */
 
 #define BRIDGE_DEV_CNT		8	/* Up to 8 devices per bridge */
+#define PIC_NSLOTS		4	/* PIC: 4 devices per bus */
 #define BRIDGE_DEVIO0		0x00200000	/* Device IO 0 Addr */
 #define BRIDGE_DEVIO1		0x00400000	/* Device IO 1 Addr */
 #define BRIDGE_DEVIO2		0x00600000	/* Device IO 2 Addr */
@@ -458,6 +465,10 @@ struct bridge_err_cmdword {
 #define BRIDGE_CTRL_WIDGET_ID(n)	((n) << 0)
 #define BRIDGE_CTRL_WIDGET_ID_MASK	(BRIDGE_CTRL_WIDGET_ID(0xf))
 
+/* PIC-only widget control bits, upper 32 bits of the register. */
+#define PIC_CTRL_NO_SNOOP		(0x1ull << 62)
+#define PIC_CTRL_RELAX_ORDER		(0x1ull << 61)
+
 /* Bridge Response buffer Error Upper Register bit fields definition */
 #define BRIDGE_RESP_ERRUPPR_DEVNUM_SHFT (20)
 #define BRIDGE_RESP_ERRUPPR_DEVNUM_MASK (0x7 << BRIDGE_RESP_ERRUPPR_DEVNUM_SHFT)
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index c5dec9b0f72d..35ae7c423973 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -146,12 +146,14 @@ static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
 	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
 	struct bridge_regs *bridge = bc->base;
 	int slot = PCI_SLOT(devfn);
+	/* PIC config-space device 0 is the PIC ASIC; devices start at 1. */
+	int cfgslot = bc->is_pic ? slot + 1 : slot;
 	int fn = PCI_FUNC(devfn);
 	void *addr;
 	u32 cf;
 	int res;
 
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[PCI_VENDOR_ID];
+	addr = &bridge->b_type0_cfg_dev[cfgslot].f[fn].c[PCI_VENDOR_ID];
 	if (get_dbe(cf, (u32 *)addr))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -160,12 +162,12 @@ static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
 	 * generic PCI code a chance to look at it for real ...
 	 */
 	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16))) {
-		addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
+		addr = &bridge->b_type0_cfg_dev[cfgslot].f[fn].l[where >> 2];
 		return ioc3_cfg_rd(addr, where, size, value,
 				   bc->ioc3_sid[slot]);
 	}
 
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[where ^ (4 - size)];
+	addr = &bridge->b_type0_cfg_dev[cfgslot].f[fn].c[where ^ (4 - size)];
 
 	if (size == 1)
 		res = get_dbe(*value, (u8 *)addr);
@@ -231,12 +233,14 @@ static int pci_conf0_write_config(struct pci_bus *bus, unsigned int devfn,
 	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
 	struct bridge_regs *bridge = bc->base;
 	int slot = PCI_SLOT(devfn);
+	/* See the matching comment in pci_conf0_read_config(). */
+	int cfgslot = bc->is_pic ? slot + 1 : slot;
 	int fn = PCI_FUNC(devfn);
 	void *addr;
 	u32 cf;
 	int res;
 
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[PCI_VENDOR_ID];
+	addr = &bridge->b_type0_cfg_dev[cfgslot].f[fn].c[PCI_VENDOR_ID];
 	if (get_dbe(cf, (u32 *)addr))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -245,11 +249,11 @@ static int pci_conf0_write_config(struct pci_bus *bus, unsigned int devfn,
 	 * generic PCI code a chance to look at it for real ...
 	 */
 	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16))) {
-		addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
+		addr = &bridge->b_type0_cfg_dev[cfgslot].f[fn].l[where >> 2];
 		return ioc3_cfg_wr(addr, where, size, value);
 	}
 
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[where ^ (4 - size)];
+	addr = &bridge->b_type0_cfg_dev[cfgslot].f[fn].c[where ^ (4 - size)];
 
 	if (size == 1)
 		res = put_dbe(value, (u8 *)addr);
@@ -324,6 +328,22 @@ struct bridge_irq_chip_data {
 	nasid_t nasid;
 };
 
+/* PIC takes the full 48-bit XIO address here, source in bits 55:48. */
+static void bridge_set_int_addr(struct bridge_controller *bc, int pin,
+				int bit, nasid_t nasid)
+{
+	if (bc->is_pic) {
+		void *addr = &bc->base->b_int_addr[pin];
+		u64 xio = bc->intr_addr & ((1ULL << 48) - 1);
+
+		__raw_writeq(((u64)bit << 48) | xio, addr);
+	} else {
+		bridge_write(bc, b_int_addr[pin].addr,
+			     (((bc->intr_addr >> 30) & 0x30000) |
+			      bit | (nasid << 8)));
+	}
+}
+
 static int bridge_set_affinity(struct irq_data *d, const struct cpumask *mask,
 			       bool force)
 {
@@ -337,9 +357,7 @@ static int bridge_set_affinity(struct irq_data *d, const struct cpumask *mask,
 	if (ret >= 0) {
 		cpu = cpumask_first_and(mask, cpu_online_mask);
 		data->nasid = cpu_to_node(cpu);
-		bridge_write(data->bc, b_int_addr[pin].addr,
-			     (((data->bc->intr_addr >> 30) & 0x30000) |
-			      bit | (data->nasid << 8)));
+		bridge_set_int_addr(data->bc, pin, bit, data->nasid);
 		bridge_read(data->bc, b_wid_tflush);
 	}
 	return ret;
@@ -403,9 +421,7 @@ static int bridge_domain_activate(struct irq_domain *domain,
 	int pin = irqd->hwirq;
 	u32 device;
 
-	bridge_write(bc, b_int_addr[pin].addr,
-		     (((bc->intr_addr >> 30) & 0x30000) |
-		      bit | (data->nasid << 8)));
+	bridge_set_int_addr(bc, pin, bit, data->nasid);
 	bridge_set(bc, b_int_enable, (1 << pin));
 	bridge_set(bc, b_int_enable, 0x7ffffe00); /* more stuff in int_enable */
 
@@ -711,6 +727,24 @@ static int bridge_probe(struct platform_device *pdev)
 	bridge_set(bc, b_wid_control, BRIDGE_CTRL_PAGE_SIZE);
 #endif
 
+	if (bc->is_pic) {
+		unsigned long ctrl = (unsigned long)&bc->base->b_wid_control;
+		void *ctrl64 = (void *)(ctrl & ~7UL);
+		int i;
+
+		/* Keep DMA snooped and ordered. */
+		__raw_writeq(__raw_readq(ctrl64) &
+			     ~(PIC_CTRL_NO_SNOOP | PIC_CTRL_RELAX_ORDER),
+			     ctrl64);
+
+		/* Clear so a stale entry can't trip a parity error. */
+		for (i = 0; i < PIC_WR_REQ_BUFSIZE * 8; i += 8) {
+			__raw_writeq(0, (u8 *)bc->base + PIC_WR_REQ_LOWER + i);
+			__raw_writeq(0, (u8 *)bc->base + PIC_WR_REQ_UPPER + i);
+			__raw_writeq(0, (u8 *)bc->base + PIC_WR_REQ_PARITY + i);
+		}
+	}
+
 	/*
 	 * Hmm...  IRIX sets additional bits in the address which
 	 * are documented as reserved in the bridge docs.
@@ -721,7 +755,8 @@ static int bridge_probe(struct platform_device *pdev)
 	bridge_write(bc, b_dir_map, (bd->masterwid << 20));	/* DMA */
 	bridge_write(bc, b_int_enable, 0);
 
-	for (slot = 0; slot < 8; slot++) {
+	for (slot = 0; slot < (bc->is_pic ? PIC_NSLOTS : BRIDGE_DEV_CNT);
+	     slot++) {
 		bridge_set(bc, b_device[slot].reg, BRIDGE_DEV_SWAP_DIR);
 		bc->pci_int[slot][0] = -1;
 		bc->pci_int[slot][1] = -1;
-- 
2.47.3

