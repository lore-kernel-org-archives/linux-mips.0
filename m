Received: from smtp4-g21.free.fr ([212.27.42.4]:52237 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1904137Ab1KDSME (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 4 Nov 2011 19:12:04 +0100
From: Maxime Bizon <mbizon@freebox.fr>
Subject: [PATCH v2 02/11] MIPS: BCM63XX: hook up plat_ioremap to intercept soc registers remapping.
Date: Fri,  4 Nov 2011 19:09:26 +0100
Message-ID: <1320430175-13725-3-git-send-email-mbizon@freebox.fr>
In-Reply-To: <1320430175-13725-1-git-send-email-mbizon@freebox.fr>
References: <1320430175-13725-1-git-send-email-mbizon@freebox.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.orgralf@linux-mips.org
Cc: Maxime Bizon <mbizon@freebox.fr>, linux-mips@linux-mips.org
Message-ID: <20111104180926.pc1rfbijlqZCtTugv_W80iy4-LaVZyS4FwCuCz3J52w@z>

Internal SOC registers can be directly accessed, no need to waste a
TLB entry.

Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
---
 arch/mips/include/asm/mach-bcm63xx/ioremap.h |   38 ++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-bcm63xx/ioremap.h

diff --git a/arch/mips/include/asm/mach-bcm63xx/ioremap.h b/arch/mips/include/asm/mach-bcm63xx/ioremap.h
new file mode 100644
index 0000000..e3fe04d
--- /dev/null
+++ b/arch/mips/include/asm/mach-bcm63xx/ioremap.h
@@ -0,0 +1,38 @@
+#ifndef BCM63XX_IOREMAP_H_
+#define BCM63XX_IOREMAP_H_
+
+#include <bcm63xx_cpu.h>
+
+static inline phys_t fixup_bigphys_addr(phys_t phys_addr, phys_t size)
+{
+	return phys_addr;
+}
+
+static inline int is_bcm63xx_internal_registers(phys_t offset)
+{
+	switch (bcm63xx_get_cpu_id()) {
+	case BCM6338_CPU_ID:
+	case BCM6345_CPU_ID:
+	case BCM6348_CPU_ID:
+	case BCM6358_CPU_ID:
+		if (offset >= 0xfff00000)
+			return 1;
+		break;
+	}
+	return 0;
+}
+
+static inline void __iomem *plat_ioremap(phys_t offset, unsigned long size,
+					 unsigned long flags)
+{
+	if (is_bcm63xx_internal_registers(offset))
+		return (void __iomem *)offset;
+	return NULL;
+}
+
+static inline int plat_iounmap(const volatile void __iomem *addr)
+{
+	return is_bcm63xx_internal_registers((unsigned long)addr);
+}
+
+#endif /* BCM63XX_IOREMAP_H_ */
-- 
1.7.1.1
