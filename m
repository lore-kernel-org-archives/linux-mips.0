Received: from mailapp01.imgtec.com ([195.59.15.196]:20318 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27027385AbcD1QGybodv6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 Apr 2016 18:06:54 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: netlogic: Fix CP0_EBASE redefinition warnings
Date: Thu, 28 Apr 2016 17:06:16 +0100
Message-ID: <1461859576-7036-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Jayachandran C <jchandra@broadcom.com>, linux-mips@linux-mips.org
Message-ID: <20160428160616.abJHZGzeM7R-2sb0qZtjHTeOEF-nKO3ibq5gW3J77Ss@z>

A couple of netlogic assembly files define CP0_EBASE to $15, the same as
CP0_PRID in mipsregs.h, and use it for accessing both CP0_PRId and
CP0_EBase registers. However commit 609cf6f2291a ("MIPS: CPS: Early
debug using an ns16550-compatible UART") added a different definition of
CP0_EBASE to mipsregs.h, which included a register select of 1. This
causes harmless build warnings like the following:

  arch/mips/netlogic/common/reset.S:53:0: warning: "CP0_EBASE" redefined
  #define CP0_EBASE $15
  ^
  In file included from arch/mips/netlogic/common/reset.S:41:0:
  ./arch/mips/include/asm/mipsregs.h:63:0: note: this is the location of the previous definition
  #define CP0_EBASE $15, 1
  ^

Update the code to use the definitions from mipsregs.h for accessing
both registers.

Fixes: 609cf6f2291a ("MIPS: CPS: Early debug using an ns16550-compatible UART")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Jayachandran C <jchandra@broadcom.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/netlogic/common/reset.S   | 11 +++++------
 arch/mips/netlogic/common/smpboot.S |  4 +---
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/mips/netlogic/common/reset.S b/arch/mips/netlogic/common/reset.S
index edbab9b8691f..c474981a6c0d 100644
--- a/arch/mips/netlogic/common/reset.S
+++ b/arch/mips/netlogic/common/reset.S
@@ -50,7 +50,6 @@
 #include <asm/netlogic/xlp-hal/sys.h>
 #include <asm/netlogic/xlp-hal/cpucontrol.h>
 
-#define CP0_EBASE	$15
 #define SYS_CPU_COHERENT_BASE	CKSEG1ADDR(XLP_DEFAULT_IO_BASE) + \
 			XLP_IO_SYS_OFFSET(0) + XLP_IO_PCI_HDRSZ + \
 			SYS_CPU_NONCOHERENT_MODE * 4
@@ -92,7 +91,7 @@
  * registers. On XLPII CPUs, usual cache instructions work.
  */
 .macro	xlp_flush_l1_dcache
-	mfc0	t0, CP0_EBASE, 0
+	mfc0	t0, CP0_PRID
 	andi	t0, t0, PRID_IMP_MASK
 	slt	t1, t0, 0x1200
 	beqz	t1, 15f
@@ -171,7 +170,7 @@ FEXPORT(nlm_reset_entry)
 	nop
 
 1:	/* Entry point on core wakeup */
-	mfc0	t0, CP0_EBASE, 0	/* processor ID */
+	mfc0	t0, CP0_PRID		/* processor ID */
 	andi	t0, PRID_IMP_MASK
 	li	t1, 0x1500		/* XLP 9xx */
 	beq	t0, t1, 2f		/* does not need to set coherent */
@@ -182,8 +181,8 @@ FEXPORT(nlm_reset_entry)
 	nop
 
 	/* set bit in SYS coherent register for the core */
-	mfc0	t0, CP0_EBASE, 1
-	mfc0	t1, CP0_EBASE, 1
+	mfc0	t0, CP0_EBASE
+	mfc0	t1, CP0_EBASE
 	srl	t1, 5
 	andi	t1, 0x3			/* t1 <- node */
 	li	t2, 0x40000
@@ -232,7 +231,7 @@ EXPORT(nlm_boot_siblings)
 
 	 * NOTE: All GPR contents are lost after the mtcr above!
 	 */
-	mfc0	v0, CP0_EBASE, 1
+	mfc0	v0, CP0_EBASE
 	andi	v0, 0x3ff		/* v0 <- node/core */
 
 	/*
diff --git a/arch/mips/netlogic/common/smpboot.S b/arch/mips/netlogic/common/smpboot.S
index 805355b0bd05..f0cc4c9de2bb 100644
--- a/arch/mips/netlogic/common/smpboot.S
+++ b/arch/mips/netlogic/common/smpboot.S
@@ -48,8 +48,6 @@
 #include <asm/netlogic/xlp-hal/sys.h>
 #include <asm/netlogic/xlp-hal/cpucontrol.h>
 
-#define CP0_EBASE	$15
-
 	.set	noreorder
 	.set	noat
 	.set	arch=xlr		/* for mfcr/mtcr, XLR is sufficient */
@@ -86,7 +84,7 @@ NESTED(nlm_boot_secondary_cpus, 16, sp)
 	PTR_L	gp, 0(t1)
 
 	/* a0 has the processor id */
-	mfc0	a0, CP0_EBASE, 1
+	mfc0	a0, CP0_EBASE
 	andi	a0, 0x3ff		/* a0 <- node/core */
 	PTR_LA	t0, nlm_early_init_secondary
 	jalr	t0
-- 
2.4.10
