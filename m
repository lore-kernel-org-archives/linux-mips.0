Received: from mailapp01.imgtec.com ([195.59.15.196]:29230 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009128AbaLRPNacCuCJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:30 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 9E04CEE6694D2
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:21 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 60/67] MIPS: math-emu: cp1emu: Move the fpucondbit struct to a header
Date: Thu, 18 Dec 2014 15:10:09 +0000
Message-ID: <1418915416-3196-61-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20141218151009.GJM1IOS3hJ1mWZkBANdKr8D-rGMZ4gb47nxlsWG9mdk@z>

The fpucondbit struct will be used later on by the MIPS R2 instruction
emulator, so in order to access it, we need to move it to a header.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/fpu_emulator.h | 12 ++++++++++++
 arch/mips/math-emu/cp1emu.c          | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/mips/include/asm/fpu_emulator.h b/arch/mips/include/asm/fpu_emulator.h
index 3ee347713307..d7670bd80855 100644
--- a/arch/mips/include/asm/fpu_emulator.h
+++ b/arch/mips/include/asm/fpu_emulator.h
@@ -30,6 +30,18 @@
 #include <asm/local.h>
 #include <asm/processor.h>
 
+/* convert condition code register number to csr bit */
+static const unsigned int fpucondbit[8] = {
+	FPU_CSR_COND0,
+	FPU_CSR_COND1,
+	FPU_CSR_COND2,
+	FPU_CSR_COND3,
+	FPU_CSR_COND4,
+	FPU_CSR_COND5,
+	FPU_CSR_COND6,
+	FPU_CSR_COND7
+};
+
 #ifdef CONFIG_DEBUG_FS
 
 struct mips_fpu_emulator_stats {
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index a426c176ee54..0aabdfc90d19 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -67,18 +67,6 @@ static int fpux_emu(struct pt_regs *,
 /* Determine rounding mode from the RM bits of the FCSR */
 #define modeindex(v) ((v) & FPU_CSR_RM)
 
-/* convert condition code register number to csr bit */
-static const unsigned int fpucondbit[8] = {
-	FPU_CSR_COND0,
-	FPU_CSR_COND1,
-	FPU_CSR_COND2,
-	FPU_CSR_COND3,
-	FPU_CSR_COND4,
-	FPU_CSR_COND5,
-	FPU_CSR_COND6,
-	FPU_CSR_COND7
-};
-
 /* (microMIPS) Convert certain microMIPS instructions to MIPS32 format. */
 static const int sd_format[] = {16, 17, 0, 0, 0, 0, 0, 0};
 static const int sdps_format[] = {16, 17, 22, 0, 0, 0, 0, 0};
-- 
2.2.0
