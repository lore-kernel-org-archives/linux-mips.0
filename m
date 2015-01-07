Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:2763 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010470AbbAGLVh3c-GB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:37 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 13/17] MIPS: Netlogic: Handle XLP hardware errata
Date: Wed, 7 Jan 2015 16:58:34 +0530
Message-ID: <1420630118-17198-14-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
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
Message-ID: <20150107112834.IELeSb5M4Vj8ndGq2TxEJn9DAriiZpKRlp9AZ_AxL0Q@z>

Core configuration register IFU_BRUB_RESERVE has to be setup to handle
a silicon errata which can result in a CPU hang.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/include/asm/netlogic/xlp-hal/cpucontrol.h |  2 ++
 arch/mips/netlogic/common/reset.S                   | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/mips/include/asm/netlogic/xlp-hal/cpucontrol.h b/arch/mips/include/asm/netlogic/xlp-hal/cpucontrol.h
index 6d2e58a..a06b592 100644
--- a/arch/mips/include/asm/netlogic/xlp-hal/cpucontrol.h
+++ b/arch/mips/include/asm/netlogic/xlp-hal/cpucontrol.h
@@ -46,6 +46,8 @@
 #define CPU_BLOCKID_FPU		9
 #define CPU_BLOCKID_MAP		10
 
+#define IFU_BRUB_RESERVE	0x007
+
 #define ICU_DEFEATURE		0x100
 
 #define LSU_DEFEATURE		0x304
diff --git a/arch/mips/netlogic/common/reset.S b/arch/mips/netlogic/common/reset.S
index 701c4bc..ff2673a 100644
--- a/arch/mips/netlogic/common/reset.S
+++ b/arch/mips/netlogic/common/reset.S
@@ -235,6 +235,24 @@ EXPORT(nlm_boot_siblings)
 	mfc0	v0, CP0_EBASE, 1
 	andi	v0, 0x3ff		/* v0 <- node/core */
 
+	/* Errata: to avoid potential live lock, only apply to 4
+	 * thread per core mode */
+	andi	v1, v0, 0x3             /* v1 <- thread id */
+	bnez	v1, 2f
+	nop
+
+	/* thread 0 of each core. */
+	li	t0, CKSEG1ADDR(RESET_DATA_PHYS)
+	lw	t1, BOOT_THREAD_MODE(t0)        /* t1 <- thread mode */
+	subu	t1, 0x3				/* 4-thread per core mode? */
+	bnez	t1, 2f
+	nop
+
+	li	t0, IFU_BRUB_RESERVE
+	li	t1, 0x55
+	mtcr	t1, t0
+	_ehb
+2:
 	beqz	v0, 4f		/* boot cpu (cpuid == 0)? */
 	nop
 
-- 
1.9.1
