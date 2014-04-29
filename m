Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:29457 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843060AbaD2Ob5mEKLe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Apr 2014 16:31:57 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 08/17] MIPS: Netlogic: Enable access to more than 64GB
Date: Tue, 29 Apr 2014 20:07:47 +0530
Message-ID: <cf9ad5487e703b44b7b933c20ce0f12c02699499.1398780013.git.jchandra@broadcom.com>
In-Reply-To: <cover.1398780013.git.jchandra@broadcom.com>
References: <cover.1398780013.git.jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org
Message-ID: <20140429143747.kr-xSG8mlWJZcVq5CVPfQWONBrjvfaLWCJmWaxjjRdI@z>

The ELPA bit needs to be set in the PAGEGRAIN register to enable
access to >64GB physical address. Update reset.S to do this from
every hardware thread.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/common/reset.S |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/netlogic/common/reset.S b/arch/mips/netlogic/common/reset.S
index fda772a..13c1bc5 100644
--- a/arch/mips/netlogic/common/reset.S
+++ b/arch/mips/netlogic/common/reset.S
@@ -74,6 +74,18 @@
 .endm
 
 /*
+ * Allow access to physical mem >64G by enabling ELPA in PAGEGRAIN
+ * register. This is needed before going to C code since the SP can
+ * in this region. Called from all HW threads.
+ */
+.macro xlp_early_mmu_init
+	mfc0	t0, CP0_PAGEMASK, 1
+	li	t1, (1 << 29)		/* ELPA bit */
+	or	t0, t1
+	mtc0	t0, CP0_PAGEMASK, 1
+.endm
+
+/*
  * L1D cache has to be flushed before enabling threads in XLP.
  * On XLP8xx/XLP3xx, we do a low level flush using processor control
  * registers. On XLPII CPUs, usual cache instructions work.
@@ -228,6 +240,8 @@ EXPORT(nlm_boot_siblings)
 #endif
 	mtc0	t1, CP0_STATUS
 
+	xlp_early_mmu_init
+
 	/* mark CPU ready */
 	li	t3, CKSEG1ADDR(RESET_DATA_PHYS)
 	ADDIU	t1, t3, BOOT_CPU_READY
@@ -254,6 +268,7 @@ EXPORT(nlm_reset_entry_end)
 LEAF(nlm_init_boot_cpu)
 #ifdef CONFIG_CPU_XLP
 	xlp_config_lsu
+	xlp_early_mmu_init
 #endif
 	jr	ra
 	nop
-- 
1.7.9.5
