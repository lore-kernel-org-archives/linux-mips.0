Received: from multi.imgtec.com ([194.200.65.239]:44846 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6870568AbaA0U2DZNNca (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:28:03 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 56/58] MIPS: malta: malta-init: Fix System Controller memory mapping for EVA
Date: Mon, 27 Jan 2014 20:19:43 +0000
Message-ID: <1390853985-14246-57-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140127201943.Mvd0nkaqhgHIS5C4CYBqWN3IDeoICOrT5FgvhY1iNfw@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Shift System Controller memory mapping to 0x80000000

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mti-malta/malta-init.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/mti-malta/malta-init.c b/arch/mips/mti-malta/malta-init.c
index fcebfce..deb1d7b 100644
--- a/arch/mips/mti-malta/malta-init.c
+++ b/arch/mips/mti-malta/malta-init.c
@@ -238,10 +238,23 @@ mips_pci_controller:
 			  MSC01_PCI_SWAP_BYTESWAP << MSC01_PCI_SWAP_MEM_SHF |
 			  MSC01_PCI_SWAP_BYTESWAP << MSC01_PCI_SWAP_BAR0_SHF);
 #endif
+#ifndef CONFIG_EVA
 		/* Fix up target memory mapping.  */
 		MSC_READ(MSC01_PCI_BAR0, mask);
 		MSC_WRITE(MSC01_PCI_P2SCMSKL, mask & MSC01_PCI_BAR0_SIZE_MSK);
+#else
+		/*
+		 * Setup the Malta max (2GB) memory for PCI DMA in host bridge
+		 * in transparent addressing mode, starting from 0x80000000.
+		 */
+		mask = PHYS_OFFSET | (1<<3);
+		MSC_WRITE(MSC01_PCI_BAR0, mask);
 
+		mask = PHYS_OFFSET;
+		MSC_WRITE(MSC01_PCI_HEAD4, mask);
+		MSC_WRITE(MSC01_PCI_P2SCMSKL, mask);
+		MSC_WRITE(MSC01_PCI_P2SCMAPL, mask);
+#endif
 		/* Don't handle target retries indefinitely.  */
 		if ((data & MSC01_PCI_CFG_MAXRTRY_MSK) ==
 		    MSC01_PCI_CFG_MAXRTRY_MSK)
-- 
1.8.5.3
