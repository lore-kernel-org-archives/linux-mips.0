Received: from mailapp01.imgtec.com ([195.59.15.196]:47807 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992143AbcIBPu70iuPA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Sep 2016 17:50:59 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 04/12] MIPS: Malta: Allow PCI devices DMA to lower 2GB physical
Date: Fri, 2 Sep 2016 16:48:50 +0100
Message-ID: <20160902154859.24269-5-paul.burton@imgtec.com>
In-Reply-To: <20160902154859.24269-1-paul.burton@imgtec.com>
References: <20160902154859.24269-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Alexander Sverdlin <alexander.sverdlin@nokia.com>, linux-kernel@vger.kernel.org
Message-ID: <20160902154850.0H8opqBvvPwVjlT5AHZwZSoCl-kU_56w9-nIoKyRycY@z>

Set the PCI_BAR0 register in all configurations such that PCI devices
can perform DMA to all of the bottom 2GB of the physical address space.
This is imperfect if we make use of the legacy Malta memory map, but it
is an improvement on the inconsistent values setup before.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mti-malta/malta-init.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/mips/mti-malta/malta-init.c b/arch/mips/mti-malta/malta-init.c
index dc2c521..0f3b881 100644
--- a/arch/mips/mti-malta/malta-init.c
+++ b/arch/mips/mti-malta/malta-init.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
+#include <linux/pci_regs.h>
 #include <linux/serial_core.h>
 
 #include <asm/cacheflush.h>
@@ -242,23 +243,19 @@ mips_pci_controller:
 			  MSC01_PCI_SWAP_BYTESWAP << MSC01_PCI_SWAP_MEM_SHF |
 			  MSC01_PCI_SWAP_BYTESWAP << MSC01_PCI_SWAP_BAR0_SHF);
 #endif
-#ifndef CONFIG_EVA
-		/* Fix up target memory mapping.  */
-		MSC_READ(MSC01_PCI_BAR0, mask);
-		MSC_WRITE(MSC01_PCI_P2SCMSKL, mask & MSC01_PCI_BAR0_SIZE_MSK);
-#else
+
 		/*
 		 * Setup the Malta max (2GB) memory for PCI DMA in host bridge
-		 * in transparent addressing mode, starting from 0x80000000.
+		 * in transparent addressing mode.
 		 */
-		mask = PHYS_OFFSET | (1<<3);
+		mask = PHYS_OFFSET | PCI_BASE_ADDRESS_MEM_PREFETCH;
 		MSC_WRITE(MSC01_PCI_BAR0, mask);
-
-		mask = PHYS_OFFSET;
 		MSC_WRITE(MSC01_PCI_HEAD4, mask);
+
+		mask &= MSC01_PCI_BAR0_SIZE_MSK;
 		MSC_WRITE(MSC01_PCI_P2SCMSKL, mask);
 		MSC_WRITE(MSC01_PCI_P2SCMAPL, mask);
-#endif
+
 		/* Don't handle target retries indefinitely.  */
 		if ((data & MSC01_PCI_CFG_MAXRTRY_MSK) ==
 		    MSC01_PCI_CFG_MAXRTRY_MSK)
-- 
2.9.3
