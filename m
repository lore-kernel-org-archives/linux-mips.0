Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656CF522EF3;
	Tue, 13 Oct 2026 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897570; cv=none; b=OtdkfAnvEklH+230Q/qj9vhDzqpxaOzxT1sO/Zn53rPmi+5k3dyV6GWyF+739k3VZwQ8ODITLromomqhmiy68H086ZVcXz/gBN7mqw+TYPWI9cByks+taDnwXEpoUjXucht7gn6Bki8BoqtLE5FK0EJR7KD9TuSGCk1xK2opne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897570; c=relaxed/simple;
	bh=zSi3HcqF79H52t6/KM+fLFZI8scbUR2r0wJElkz0t5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCe5rAxjfPdc+O8e39fdWemca2vKnR1C3tR8AORj/B/d5lMfGcBB6jh7Wz6rTiC7yu/Yh8tvKnxk0C84JXCfOlTBasrhZNttH/EX1Hjc36UhgjNxf7/NIPzX9p/LVSHeug2SkfpowVlAgLaAVEWtVOakm9nINJLKRTQdrSiW/9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cObPB8lK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cObPB8lK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4DD1F00893;
	Tue, 13 Oct 2026 13:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897569;
	bh=WIiKNeDNzRujP8sK5SnI4wnmCS4jvciUXv1qk79M3Ok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cObPB8lKweikkgjZ77cS0Xv+TppngwKq1lcSoMLM8z58z3aTWNCetczz6FXbhOsO3
	 3BXD9844iVeGGb1TY5twml5McXiVXTRaIsU8cexCmkJN6ydBNhpLm+BhNRTbuGDYsn
	 soE2el1w+kzmgNMizVqUu9UE5ATDXg9pSFo3mI/9eEbz199sc3tyrzK7zNe021VqK3
	 IznEuji6yb9fX6Zu94cO79n3MUqyqCAJ1nz7W4e8RfcTsoWfFiJmh4w4DTZqw/mWSO
	 QBSSl9wQ+fD09CZQwe14OazlVcwIadW6hlXFWQmmKhOmgPoKxTIjP6pCoiQteM8hCa
	 bQxwEtndnx0fw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 29/53] MIPS: PCI: xtalk-bridge: match PIC's register-level differences
Date: Tue, 13 Oct 2026 15:16:49 +0200
Message-ID: <b9fc15824764ac21f088ef16b98070340b0f1288.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PIC's config space puts the ASIC at device 0 and the slots at 1-4, its
write-request RAM needs clearing, and b_int_addr[] takes a full XIO
address. Handle each, and clear PIC's NO_SNOOP and RELAX_ORDER bits.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/pci/bridge.h | 11 ++++++
 arch/mips/pci/pci-xtalk-bridge.c   | 60 +++++++++++++++++++++++-------
 2 files changed, 58 insertions(+), 13 deletions(-)

diff --git a/arch/mips/include/asm/pci/bridge.h b/arch/mips/include/asm/pci/bridge.h
index cbf36bcbe0b7..ec17f4bcc6e8 100644
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
@@ -461,6 +468,10 @@ struct bridge_err_cmdword {
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
index 03ccb82a6189..b2c3a8b207da 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -178,7 +178,7 @@ static int ioc3_cfg_wr(void *addr, int where, int size, u32 value)
 
 static int bridge_nslots(struct bridge_controller *bc)
 {
-	return BRIDGE_DEV_CNT;
+	return bc->is_pic ? PIC_NSLOTS : BRIDGE_DEV_CNT;
 }
 
 static void bridge_disable_swapping(struct pci_dev *dev)
@@ -213,6 +213,8 @@ static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
 	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
 	struct bridge_regs *bridge = bc->base;
 	int slot = PCI_SLOT(devfn);
+	/* PIC config-space device 0 is the PIC ASIC; devices start at 1. */
+	int cfgslot = bc->is_pic ? slot + 1 : slot;
 	int fn = PCI_FUNC(devfn);
 	void *addr;
 	u32 cf;
@@ -225,7 +227,7 @@ static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
 	if (slot >= bridge_nslots(bc))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[PCI_VENDOR_ID];
+	addr = &bridge->b_type0_cfg_dev[cfgslot].f[fn].c[PCI_VENDOR_ID];
 	if (get_dbe(cf, (u32 *)addr))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -234,12 +236,12 @@ static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
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
@@ -305,6 +307,8 @@ static int pci_conf0_write_config(struct pci_bus *bus, unsigned int devfn,
 	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
 	struct bridge_regs *bridge = bc->base;
 	int slot = PCI_SLOT(devfn);
+	/* See the matching comment in pci_conf0_read_config(). */
+	int cfgslot = bc->is_pic ? slot + 1 : slot;
 	int fn = PCI_FUNC(devfn);
 	void *addr;
 	u32 cf;
@@ -313,7 +317,7 @@ static int pci_conf0_write_config(struct pci_bus *bus, unsigned int devfn,
 	if (slot >= bridge_nslots(bc))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[PCI_VENDOR_ID];
+	addr = &bridge->b_type0_cfg_dev[cfgslot].f[fn].c[PCI_VENDOR_ID];
 	if (get_dbe(cf, (u32 *)addr))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -322,11 +326,11 @@ static int pci_conf0_write_config(struct pci_bus *bus, unsigned int devfn,
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
@@ -406,6 +410,22 @@ struct bridge_irq_chip_data {
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
@@ -419,9 +439,7 @@ static int bridge_set_affinity(struct irq_data *d, const struct cpumask *mask,
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
@@ -485,9 +503,7 @@ static int bridge_domain_activate(struct irq_domain *domain,
 	int pin = irqd->hwirq;
 	u32 device;
 
-	bridge_write(bc, b_int_addr[pin].addr,
-		     (((bc->intr_addr >> 30) & 0x30000) |
-		      bit | (data->nasid << 8)));
+	bridge_set_int_addr(bc, pin, bit, data->nasid);
 	bridge_set(bc, b_int_enable, (1 << pin));
 	bridge_set(bc, b_int_enable, 0x7ffffe00); /* more stuff in int_enable */
 
@@ -1044,6 +1060,24 @@ static int bridge_probe(struct platform_device *pdev)
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
-- 
2.47.3

