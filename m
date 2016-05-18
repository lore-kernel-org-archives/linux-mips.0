Received: from mailapp01.imgtec.com ([195.59.15.196]:38991 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27029944AbcERQMsZE628 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 May 2016 18:12:48 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 1/2] MIPS: Add definitions of SegCtl registers and use them
Date: Wed, 18 May 2016 17:12:35 +0100
Message-ID: <1463587956-9160-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, linux-mips@linux-mips.org, Joshua Kinard <kumba@gentoo.org>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Chris Packham <judge.packham@gmail.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160518161235.2HJhglRSrQPqThKk9SW8ufMeKlMuWI3429uFJfeoS4Q@z>

The SegCtl registers are standard for MIPSr3..MIPSr5. Add definitions of
these registers and use them rather than constants

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Changes in v2: None

 arch/mips/include/asm/mach-malta/kernel-entry-init.h | 6 +++---
 arch/mips/include/asm/mipsregs.h                     | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-malta/kernel-entry-init.h b/arch/mips/include/asm/mach-malta/kernel-entry-init.h
index 0cf8622db27f..ab03eb3fadac 100644
--- a/arch/mips/include/asm/mach-malta/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-malta/kernel-entry-init.h
@@ -56,7 +56,7 @@
 		(0 << MIPS_SEGCFG_PA_SHIFT) |				\
 		(1 << MIPS_SEGCFG_EU_SHIFT)) << 16)
 	or	t0, t2
-	mtc0	t0, $5, 2
+	mtc0	t0, CP0_SEGCTL0
 
 	/* SegCtl1 */
 	li      t0, ((MIPS_SEGCFG_MUSUK << MIPS_SEGCFG_AM_SHIFT) |	\
@@ -67,7 +67,7 @@
 		(0 << MIPS_SEGCFG_PA_SHIFT) |				\
 		(1 << MIPS_SEGCFG_EU_SHIFT)) << 16)
 	ins	t0, t1, 16, 3
-	mtc0	t0, $5, 3
+	mtc0	t0, CP0_SEGCTL1
 
 	/* SegCtl2 */
 	li	t0, ((MIPS_SEGCFG_MUSUK << MIPS_SEGCFG_AM_SHIFT) |	\
@@ -77,7 +77,7 @@
 		(4 << MIPS_SEGCFG_PA_SHIFT) |				\
 		(1 << MIPS_SEGCFG_EU_SHIFT)) << 16)
 	or	t0, t2
-	mtc0	t0, $5, 4
+	mtc0	t0, CP0_SEGCTL2
 
 	jal	mips_ihb
 	mfc0    t0, $16, 5
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 3ad19ad04d8a..639137f12f1a 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -48,6 +48,9 @@
 #define CP0_CONF $3
 #define CP0_CONTEXT $4
 #define CP0_PAGEMASK $5
+#define CP0_SEGCTL0 $5, 2
+#define CP0_SEGCTL1 $5, 3
+#define CP0_SEGCTL2 $5, 4
 #define CP0_WIRED $6
 #define CP0_INFO $7
 #define CP0_HWRENA $7, 0
-- 
2.5.0
