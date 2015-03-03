Received: from mailapp01.imgtec.com ([195.59.15.196]:17184 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011567AbbCCStvHLF6M (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Mar 2015 19:49:51 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 5CCFC5F8672FC
        for <linux-mips@linux-mips.org>; Tue,  3 Mar 2015 18:49:42 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3/4] MIPS: kernel: entry.S: Set correct ISA level for mips_ihb
Date: Tue, 3 Mar 2015 18:48:49 +0000
Message-ID: <1425408530-21613-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1425408530-21613-1-git-send-email-markos.chandras@imgtec.com>
References: <1425408530-21613-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150303184849._0S-ei8SI3BXrqXZYnd5BezfLv65XdjOCLffjf8RyZM@z>

Commit 6ebb496ffc7e("MIPS: kernel: entry.S: Add MIPS R6 related
definitions") added the MIPSR6 definition but it did not update the
ISA level of the actual assembly code so a pre-MIPSR6 jr.hb instruction
was generated instead. Fix this by using the MISP_ISA_LEVEL_RAW macro.

Fixes: 6ebb496ffc7e("MIPS: kernel: entry.S: Add MIPS R6 related definitions")
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/entry.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/entry.S b/arch/mips/kernel/entry.S
index af41ba6db960..7791840cf22c 100644
--- a/arch/mips/kernel/entry.S
+++ b/arch/mips/kernel/entry.S
@@ -10,6 +10,7 @@
 
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
+#include <asm/compiler.h>
 #include <asm/regdef.h>
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
@@ -185,7 +186,7 @@ syscall_exit_work:
  * For C code use the inline version named instruction_hazard().
  */
 LEAF(mips_ihb)
-	.set	mips32r2
+	.set	MIPS_ISA_LEVEL_RAW
 	jr.hb	ra
 	nop
 	END(mips_ihb)
-- 
2.3.1
