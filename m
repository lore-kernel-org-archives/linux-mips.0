Received: from mailapp01.imgtec.com ([195.59.15.196]:35345 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009466AbbGAIONxZZa4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Jul 2015 10:14:13 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/7] MIPS: kernel: cps-vec: Replace 'la' macro with PTR_LA
Date: Wed, 1 Jul 2015 09:13:29 +0100
Message-ID: <1435738414-30944-3-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1435738414-30944-1-git-send-email-markos.chandras@imgtec.com>
References: <1435738414-30944-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150701081329.bMZQdRLb9mFKfVcwHxmV9AQI2JWB8AmPgB8_Miy6Qhw@z>

The PTR_LA macro will pick the correct "la" or "dla" macro to
load an address to a register. This gets rids of the following
warnings (and others) when building a 64-bit CPS kernel:

arch/mips/kernel/cps-vec.S:63: Warning: la used to load 64-bit address
arch/mips/kernel/cps-vec.S:159: Warning: la used to load 64-bit address
arch/mips/kernel/cps-vec.S:220: Warning: la used to load 64-bit address
arch/mips/kernel/cps-vec.S:240: Warning: la used to load 64-bit address
[...]

Cc: <stable@vger.kernel.org> # 3.16+
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cps-vec.S | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 55b759a0019e..a4b2d81f45dd 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -60,7 +60,7 @@ LEAF(mips_cps_core_entry)
 	 nop
 
 	/* This is an NMI */
-	la	k0, nmi_handler
+	PTR_LA	k0, nmi_handler
 	jr	k0
 	 nop
 
@@ -156,7 +156,7 @@ dcache_done:
 	ehb
 
 	/* Jump to kseg0 */
-	la	t0, 1f
+	PTR_LA	t0, 1f
 	jr	t0
 	 nop
 
@@ -217,7 +217,7 @@ LEAF(excep_intex)
 
 .org 0x480
 LEAF(excep_ejtag)
-	la	k0, ejtag_debug_handler
+	PTR_LA	k0, ejtag_debug_handler
 	jr	k0
 	 nop
 	END(excep_ejtag)
@@ -237,7 +237,7 @@ LEAF(mips_cps_core_init)
 
 	/* ...and for the moment only 1 VPE */
 	dvpe
-	la	t1, 1f
+	PTR_LA	t1, 1f
 	jr.hb	t1
 	 nop
 
@@ -298,14 +298,14 @@ LEAF(mips_cps_core_init)
 
 LEAF(mips_cps_boot_vpes)
 	/* Retrieve CM base address */
-	la	t0, mips_cm_base
+	PTR_LA	t0, mips_cm_base
 	lw	t0, 0(t0)
 
 	/* Calculate a pointer to this cores struct core_boot_config */
 	lw	t0, GCR_CL_ID_OFS(t0)
 	li	t1, COREBOOTCFG_SIZE
 	mul	t0, t0, t1
-	la	t1, mips_cps_core_bootcfg
+	PTR_LA	t1, mips_cps_core_bootcfg
 	lw	t1, 0(t1)
 	addu	t0, t0, t1
 
@@ -351,7 +351,7 @@ LEAF(mips_cps_boot_vpes)
 
 1:	/* Enter VPE configuration state */
 	dvpe
-	la	t1, 1f
+	PTR_LA	t1, 1f
 	jr.hb	t1
 	 nop
 1:	mfc0	t1, CP0_MVPCONTROL
@@ -445,7 +445,7 @@ LEAF(mips_cps_boot_vpes)
 	/* This VPE should be offline, halt the TC */
 	li	t0, TCHALT_H
 	mtc0	t0, CP0_TCHALT
-	la	t0, 1f
+	PTR_LA	t0, 1f
 1:	jr.hb	t0
 	 nop
 
@@ -466,10 +466,10 @@ LEAF(mips_cps_boot_vpes)
 	.set	noat
 	lw	$1, TI_CPU(gp)
 	sll	$1, $1, LONGLOG
-	la	\dest, __per_cpu_offset
+	PTR_LA	\dest, __per_cpu_offset
 	addu	$1, $1, \dest
 	lw	$1, 0($1)
-	la	\dest, cps_cpu_state
+	PTR_LA	\dest, cps_cpu_state
 	addu	\dest, \dest, $1
 	.set	pop
 	.endm
-- 
2.4.5
