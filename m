Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4928A522F00;
	Tue, 13 Oct 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897568; cv=none; b=cu3mn6SBO0N461eexT+DhB8vdDR8lI6HMBBtHjEFi4tdaJxAQ2X4vakgwzPWKNqJ5SOInb9BC+CUJTQsaxENTij23KEvOWs5qdm7QSPejnu9D8AtPPpiG/roEGz9kb0DEjK0vIev1HszifESvRMCJClILNni5WhDmZQ4hd4uTaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897568; c=relaxed/simple;
	bh=CrM0EJ/80xcymeJ9rBkc54stg3u37KmomijV1aPQeTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIaUUaqCq4qqVt1iq7MxT9pywLrf8prKEM/P1KYhb9X0oLjEOzvzbvk67gyJ41lv8+aLht2FLW0sxXVUaGCCiwblLl/nLXzwEJp9NOXOJSppIPLstGIWmNc643WnpnkwJ3473WRd9N2LL+QWEX9Jnrn10HKWeBvTOLNPNXlCM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgCdaub+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgCdaub+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05051F000FF;
	Tue, 13 Oct 2026 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897567;
	bh=D+TBvWMLvmBKwy00oRCucrcOrehKh88e2lighJV2U4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DgCdaub+KjSiCbG5p+snOypdbw3GcbfyeEmJehkkCKR8qkW66gFzLNXfMQ5pn+jbV
	 WPu+ta8s271O0bKGoIUl0tcT6eIKDwZ7mFw8v0xwPqVo9sr9frTddto0l0aTNrjWrl
	 j3zfR9HZyx/p+DS2Hn3lI6VfcjOoPPe2SJ0MIE7rpZ4gt95iGSVCl8tAqEokyCGKL+
	 9UG0kvlW0Y580FGzfj2bTNipHsN5ZMC2A6NHxVsNH5BxUc2Z6bVt4ODP+rO+gF8rfj
	 OBV6ubEQ5L/ST16PnRtlPNkXgH+vx2HqR4TXSPBH8TuLbmn+JIspb3SQJXkUEV4uuh
	 6kcM42ABdwywQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 28/53] MIPS: PCI: xtalk-bridge: recognize the PIC widget's 64-bit-only registers
Date: Tue, 13 Oct 2026 15:16:48 +0200
Message-ID: <15b805388c1af0ecfacfb317980d56c3ab968899.1791890466.git.kaloz@kernel.org>
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

PIC replicates the Bridge/XBridge register layout, twice in one widget
window for its two PCI buses, and does not accept a 32-bit write to half
of a 64-bit register. Flag it, widen the register accessors to the
double word, and spawn a controller per bus.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/pci/bridge.h | 70 +++++++++++++++++++++++++++---
 arch/mips/sgi-ip27/ip27-xtalk.c    | 30 ++++++++++---
 2 files changed, 89 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/pci/bridge.h b/arch/mips/include/asm/pci/bridge.h
index 647ea5c9e34b..cbf36bcbe0b7 100644
--- a/arch/mips/include/asm/pci/bridge.h
+++ b/arch/mips/include/asm/pci/bridge.h
@@ -12,6 +12,8 @@
 #ifndef _ASM_PCI_BRIDGE_H
 #define _ASM_PCI_BRIDGE_H
 
+#include <linux/build_bug.h>
+#include <linux/stddef.h>
 #include <linux/types.h>
 #include <linux/pci.h>
 #include <asm/xtalk/xwidget.h>		/* generic widget header */
@@ -39,6 +41,9 @@
 #define BRIDGE_SSRAM_64K	0x00010000	/* 64kB */
 #define BRIDGE_SSRAM_0K		0x00000000	/* 0kB */
 
+/* PIC replicates its register block twice within one widget's 16MB window. */
+#define PIC_BUS1_OFFSET		0x800000
+
 /* ========================================================================
  *    Bridge address map
  */
@@ -264,6 +269,15 @@ struct bridge_regs {
 	} b_external_flash;			/* 0xC00000 */
 };
 
+/*
+ * Pin b_device[]/b_rrb_map[]'s low-half placement: bridge_readl() and
+ * bridge_writel() rely on it.
+ */
+static_assert(offsetof(struct bridge_regs, b_device[0].reg) == 0x204);
+static_assert(offsetof(struct bridge_regs, b_device[1].reg) == 0x20c);
+static_assert(offsetof(struct bridge_regs, b_rrb_map[0].reg) == 0x284);
+static_assert(offsetof(struct bridge_regs, b_rrb_map[1].reg) == 0x28c);
+
 /*
  * Field formats for Error Command Word and Auxiliary Error Command Word
  * of bridge.
@@ -394,6 +408,7 @@ struct bridge_err_cmdword {
 /* Widget part number of bridge */
 #define BRIDGE_WIDGET_PART_NUM		0xc002
 #define XBRIDGE_WIDGET_PART_NUM		0xd002
+#define PIC_WIDGET_PART_NUM		0xd102
 
 /* Manufacturer of bridge */
 #define BRIDGE_WIDGET_MFGR_NUM		0x036
@@ -822,11 +837,54 @@ struct bridge_controller {
 #define BRIDGE_CONTROLLER(bus) \
 	((struct bridge_controller *)((bus)->sysdata))
 
-#define bridge_read(bc, reg)		__raw_readl(&bc->base->reg)
-#define bridge_write(bc, reg, val)	__raw_writel(val, &bc->base->reg)
-#define bridge_set(bc, reg, val)	\
-	__raw_writel(__raw_readl(&bc->base->reg) | (val), &bc->base->reg)
-#define bridge_clr(bc, reg, val)	\
-	__raw_writel(__raw_readl(&bc->base->reg) & ~(val), &bc->base->reg)
+/*
+ * PIC does not accept a 32-bit write to half of a 64-bit register, so
+ * widen each access to the 8-byte-aligned double word and extract or
+ * insert the 32-bit value at its byte position. The pointer is
+ * volatile-qualified because widget_cfg_t is, and b_widget sits in
+ * every bridge_regs.
+ */
+static inline u32 bridge_readl(struct bridge_controller *bc, volatile u32 *reg)
+{
+	void *dw;
+	unsigned int shift;
+
+	if (likely(!bc->is_pic))
+		return __raw_readl(reg);
+
+	dw = (void *)((unsigned long)reg & ~7UL);
+	shift = ((unsigned long)reg & 4) ? 0 : 32;
+
+	return __raw_readq(dw) >> shift;
+}
+
+static inline void bridge_writel(struct bridge_controller *bc,
+				 volatile u32 *reg, u32 val)
+{
+	void *dw;
+	unsigned int shift;
+	u64 tmp;
+
+	if (likely(!bc->is_pic)) {
+		__raw_writel(val, reg);
+		return;
+	}
+
+	dw = (void *)((unsigned long)reg & ~7UL);
+	shift = ((unsigned long)reg & 4) ? 0 : 32;
+
+	tmp = __raw_readq(dw);
+	tmp = (tmp & ~(0xffffffffULL << shift)) | ((u64)val << shift);
+	__raw_writeq(tmp, dw);
+}
+
+#define bridge_read(bc, reg)		bridge_readl(bc, &bc->base->reg)
+#define bridge_write(bc, reg, val)	bridge_writel(bc, &bc->base->reg, val)
+#define bridge_set(bc, reg, val)				\
+	bridge_writel(bc, &bc->base->reg,			\
+		      bridge_readl(bc, &bc->base->reg) | (val))
+#define bridge_clr(bc, reg, val)				\
+	bridge_writel(bc, &bc->base->reg,			\
+		      bridge_readl(bc, &bc->base->reg) & ~(val))
 
 #endif /* _ASM_PCI_BRIDGE_H */
diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index 105977316391..73b2eef96bdb 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -27,6 +27,8 @@
 enum xtalk_bridge_type {
 	XTALK_BRIDGE,
 	XTALK_XBRIDGE,
+	XTALK_PIC_BUS0,
+	XTALK_PIC_BUS1,
 };
 
 static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
@@ -88,21 +90,32 @@ static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
 	}
 
 
-	bd->bridge_addr = RAW_NODE_SWIN_BASE(nasid, widget);
+	bd->bridge_addr = RAW_NODE_SWIN_BASE(nasid, widget) +
+			  (type == XTALK_PIC_BUS1 ? PIC_BUS1_OFFSET : 0);
 	bd->intr_addr	= BIT_ULL(47) + 0x01800000 + PI_INT_PEND_MOD;
 	bd->nasid	= nasid;
 	bd->masterwid	= masterwid;
 	bd->is_xbridge	= type == XTALK_XBRIDGE;
+	bd->is_pic	= type == XTALK_PIC_BUS0 || type == XTALK_PIC_BUS1;
 
+	/* Split a PIC's window at bus 1 or its resource request fails. */
 	bd->mem.name	= "Bridge PCI MEM";
-	bd->mem.start	= offset + (widget << SWIN_SIZE_BITS) + BRIDGE_DEVIO0;
-	bd->mem.end	= offset + (widget << SWIN_SIZE_BITS) + SWIN_SIZE - 1;
+	bd->mem.start	= offset + (widget << SWIN_SIZE_BITS) +
+			  (type == XTALK_PIC_BUS1 ? PIC_BUS1_OFFSET : 0) +
+			  BRIDGE_DEVIO0;
+	bd->mem.end	= offset + (widget << SWIN_SIZE_BITS) +
+			  (type == XTALK_PIC_BUS0 ? PIC_BUS1_OFFSET :
+						    SWIN_SIZE) - 1;
 	bd->mem.flags	= IORESOURCE_MEM;
 	bd->mem_offset	= offset;
 
 	bd->io.name	= "Bridge PCI IO";
-	bd->io.start	= offset + (widget << SWIN_SIZE_BITS) + BRIDGE_DEVIO0;
-	bd->io.end	= offset + (widget << SWIN_SIZE_BITS) + SWIN_SIZE - 1;
+	bd->io.start	= offset + (widget << SWIN_SIZE_BITS) +
+			  (type == XTALK_PIC_BUS1 ? PIC_BUS1_OFFSET : 0) +
+			  BRIDGE_DEVIO0;
+	bd->io.end	= offset + (widget << SWIN_SIZE_BITS) +
+			  (type == XTALK_PIC_BUS0 ? PIC_BUS1_OFFSET :
+						    SWIN_SIZE) - 1;
 	bd->io.flags	= IORESOURCE_IO;
 	bd->io_offset	= offset;
 
@@ -149,6 +162,13 @@ static int probe_one_port(nasid_t nasid, int widget, int masterwid)
 	case XBRIDGE_WIDGET_PART_NUM:
 		bridge_platform_create(nasid, widget, masterwid, XTALK_XBRIDGE);
 		break;
+	case PIC_WIDGET_PART_NUM:
+		/* PIC always has both buses in silicon: probe each. */
+		bridge_platform_create(nasid, widget, masterwid,
+				       XTALK_PIC_BUS0);
+		bridge_platform_create(nasid, widget, masterwid,
+				       XTALK_PIC_BUS1);
+		break;
 	default:
 		pr_info("xtalk:n%d/%d unknown widget (0x%x)\n",
 			nasid, widget, partnum);
-- 
2.47.3

