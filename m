Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95B5326B1;
	Thu,  1 Oct 2026 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871243; cv=none; b=hims8PpnyYgdLqYHQ0I82k06o+cVgYcGT3Csv+a986QMD4UgNlTRB39pmrXMLzDAKUREyGJYqsjXoHJALs9e9nxwu5STeu9WuCCXhga6rViBO9XwwZDFzlDKQ9M6dlvboP/h8HpSojsrkZ5VMKEHV40AX1XGP38PV3NXX6Lix8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871243; c=relaxed/simple;
	bh=DUoGySJh7tQXfazo8Zt2/BAa/G0IbqjgSg6G4zkCMsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4QsY8mJLxz3unDjTVA7pH7hHhCr+1WUlOnkyMxoFhka9aZ9IZJjPIYV8GIYM0KSw7umBJ65KNE0DbP/3Ln+W4GI95cmvmOUSjx6Ai3xMcce73pCqw1yOynvO4KFiHqXJEvSn/iS+8LYaMHdw1xdhHsp9I1/i6wYBWaweeVPhVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmkTbGLg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmkTbGLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B4C1F000FF;
	Thu,  1 Oct 2026 16:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871241;
	bh=P327HWwdIwRT4B+02X740AoF39oh3eZtse2KmPXpuU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VmkTbGLg3Jb83FX6k4Jd+dUFdxIVBhohcOJ/vIA03HbB1GiraHCY3wtw1oVZHC8d/
	 Ya3Avzq2NArUbas5C/0QSXVCox4umq+LjBTLJXPJ+lj3uwCazminOogdSGrjTUCuuI
	 ZDWatvu+2BPhL3r5/7hg8zHadqOHegQakPhbK84v4prP23DBtDd5SI/bSMbTFlNxB0
	 XEhivJJsIhV519us+JMJp5NDHLUYZC5sDySQi/eCFZY0KUiCeMPnkW8GOQGj5VYXP6
	 VbQuk4x46wvZ9AbgYHRsQs9QqOSd3ZmNbSr4cY4c0zON8SaGAsQKQHkjTybP+TmslK
	 s74ODDPI0t5qg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/38] MIPS: SGI-IP27: route XBridge and PIC DMA through the 32-bit window
Date: Thu,  1 Oct 2026 18:11:56 +0200
Message-ID: <cce203c61386970826873f87cc9d0e6c732c3a53.1790857966.git.kaloz@kernel.org>
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

XBridge does not honour the SN0-style 64-bit direct-mapped DMA address:
commands complete but no data moves. PIC moves no data either. Route
both through the 2GB 32-bit window and cap bus_dma_limit at its top, so
SWIOTLB bounces anything above it. PIC is flagged once a following
patch enumerates it.

Only XBridge (part 0xd002) is flagged; a Bridge (0xc002) behind a Hub
keeps the 64-bit direct map. The 64MB bounce pool comes from node 0
whenever DRAM passes 2GB, on Hub any multi-node machine. A PIC bus in
PCI-X mode takes the window too; IRIX does not.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/Kconfig                          |  1 +
 arch/mips/include/asm/pci/bridge.h         |  2 ++
 arch/mips/pci/pci-xtalk-bridge.c           | 26 ++++++++++++++++++++++
 arch/mips/sgi-ip27/ip27-memory.c           | 16 +++++++++++++
 arch/mips/sgi-ip27/ip27-xtalk.c            | 15 ++++++++++---
 include/linux/platform_data/xtalk-bridge.h |  2 ++
 6 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index eb291fa7fd08..20212194e763 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -773,6 +773,7 @@ config SGI_IP27
 	select NR_CPUS_DEFAULT_64
 	select PCI_DRIVERS_GENERIC
 	select PCI_XTALK_BRIDGE
+	select SWIOTLB
 	select SYS_HAS_CPU_R10000
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
diff --git a/arch/mips/include/asm/pci/bridge.h b/arch/mips/include/asm/pci/bridge.h
index eaeafccd82c7..2ea0f1e2cd76 100644
--- a/arch/mips/include/asm/pci/bridge.h
+++ b/arch/mips/include/asm/pci/bridge.h
@@ -810,6 +810,8 @@ struct bridge_controller {
 	unsigned int		int_mapping[8][2];
 	u32			ioc3_sid[8];
 	nasid_t			nasid;
+	bool			is_xbridge;
+	bool			is_pic;
 };
 
 #define BRIDGE_CONTROLLER(bus) \
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index cf115abb54e0..c5dec9b0f72d 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -31,14 +31,38 @@ dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
 
+	/*
+	 * XBridge and PIC move no data for this direct-mapped address; use
+	 * the 2GB 32-bit window instead. An address above the window is not
+	 * clamped here: pcibios_bus_add_device() caps bus_dma_limit at the
+	 * window's top, so such a buffer is bounced through SWIOTLB.
+	 */
+	if (bc->is_xbridge || bc->is_pic)
+		return BRIDGE_DMA_DIRECT_BASE + paddr;
+
 	return bc->baddr + paddr;
 }
 
 phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
+
+	if (bc->is_xbridge || bc->is_pic)
+		return dma_addr - BRIDGE_DMA_DIRECT_BASE;
+
 	return dma_addr & ~(0xffUL << 56);
 }
 
+/* Bounce a widened DMA mask's out-of-window addresses through SWIOTLB. */
+void pcibios_bus_add_device(struct pci_dev *pdev)
+{
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
+
+	if (bc->is_xbridge || bc->is_pic)
+		pdev->dev.bus_dma_limit = 0xffffffff;
+}
+
 /*
  * Most of the IOC3 PCI config register aren't present
  * we emulate what is needed for a normal PCI enumeration
@@ -663,6 +687,8 @@ static int bridge_probe(struct platform_device *pdev)
 	bc->baddr = (u64)bd->masterwid << 60 | PCI64_ATTR_BAR;
 	bc->base = (struct bridge_regs *)bd->bridge_addr;
 	bc->intr_addr = bd->intr_addr;
+	bc->is_xbridge = bd->is_xbridge;
+	bc->is_pic = bd->is_pic;
 
 	/*
 	 * Clear all pending interrupts.
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 98184dfcd8c5..d51e02ce12a6 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -19,8 +19,10 @@
 #include <linux/nodemask.h>
 #include <linux/sizes.h>
 #include <linux/swap.h>
+#include <linux/swiotlb.h>
 #include <linux/pfn.h>
 #include <linux/highmem.h>
+#include <asm/bootinfo.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 #include <asm/sections.h>
@@ -437,3 +439,17 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 }
+
+/*
+ * XBridge and PIC are driven through their 2GB 32-bit DMA window, so
+ * cap the bounce pool there; which widgets exist isn't known this early,
+ * so reserve it whenever node memory reaches past the window.
+ */
+void __init plat_swiotlb_setup(void)
+{
+	phys_addr_t old_limit = memblock_get_current_limit();
+
+	memblock_set_current_limit(min_t(phys_addr_t, old_limit, SZ_2G));
+	swiotlb_init(max_low_pfn > PFN_DOWN(SZ_2G), SWIOTLB_VERBOSE);
+	memblock_set_current_limit(old_limit);
+}
diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index baa937b474a8..bd2ac24452f5 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -23,7 +23,13 @@
 #define XXBOW_WIDGET_PART_NUM	0xd000	/* Xbow in Xbridge */
 #define BASE_XBOW_PORT		8     /* Lowest external port */
 
-static void bridge_platform_create(nasid_t nasid, int widget, int masterwid)
+enum xtalk_bridge_type {
+	XTALK_BRIDGE,
+	XTALK_XBRIDGE,
+};
+
+static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
+				   enum xtalk_bridge_type type)
 {
 	struct xtalk_bridge_platform_data *bd;
 	struct sgi_w1_platform_data *wd;
@@ -85,6 +91,7 @@ static void bridge_platform_create(nasid_t nasid, int widget, int masterwid)
 	bd->intr_addr	= BIT_ULL(47) + 0x01800000 + PI_INT_PEND_MOD;
 	bd->nasid	= nasid;
 	bd->masterwid	= masterwid;
+	bd->is_xbridge	= type == XTALK_XBRIDGE;
 
 	bd->mem.name	= "Bridge PCI MEM";
 	bd->mem.start	= offset + (widget << SWIN_SIZE_BITS) + BRIDGE_DEVIO0;
@@ -136,8 +143,10 @@ static int probe_one_port(nasid_t nasid, int widget, int masterwid)
 
 	switch (partnum) {
 	case BRIDGE_WIDGET_PART_NUM:
+		bridge_platform_create(nasid, widget, masterwid, XTALK_BRIDGE);
+		break;
 	case XBRIDGE_WIDGET_PART_NUM:
-		bridge_platform_create(nasid, widget, masterwid);
+		bridge_platform_create(nasid, widget, masterwid, XTALK_XBRIDGE);
 		break;
 	default:
 		pr_info("xtalk:n%d/%d unknown widget (0x%x)\n",
@@ -228,7 +237,7 @@ static void xtalk_probe_node(nasid_t nasid)
 
 	switch (partnum) {
 	case BRIDGE_WIDGET_PART_NUM:
-		bridge_platform_create(nasid, 0x8, 0xa);
+		bridge_platform_create(nasid, 0x8, 0xa, XTALK_BRIDGE);
 		break;
 	case XBOW_WIDGET_PART_NUM:
 	case XXBOW_WIDGET_PART_NUM:
diff --git a/include/linux/platform_data/xtalk-bridge.h b/include/linux/platform_data/xtalk-bridge.h
index 51e5001f2c05..171b5bcf56e4 100644
--- a/include/linux/platform_data/xtalk-bridge.h
+++ b/include/linux/platform_data/xtalk-bridge.h
@@ -17,6 +17,8 @@ struct xtalk_bridge_platform_data {
 	unsigned long io_offset;
 	nasid_t	nasid;
 	int	masterwid;
+	bool	is_xbridge;
+	bool	is_pic;
 };
 
 #endif /* PLATFORM_DATA_XTALK_BRIDGE_H */
-- 
2.47.3

