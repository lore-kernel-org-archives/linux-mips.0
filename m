Received: from mailapp01.imgtec.com ([195.59.15.196]:52950 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009681AbbGQJgOthpwb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 Jul 2015 11:36:14 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: math-emu: cp1emu: Allow m{f,t}hc emulation on MIPS R6
Date: Fri, 17 Jul 2015 10:36:03 +0100
Message-ID: <1437125763-12527-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150717093603.yaAeOXxffIsCRLcngRW7fsYMvv5hR_O57hI8H1bH60E@z>

The mfhc/mthc instructions are supported on MIPS R6 so emulate
them if needed.

Cc: <stable@vger.kernel.org> # 4.0+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/math-emu/cp1emu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 712f17a2ecf2..70e88efee45b 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -1137,7 +1137,7 @@ emul:
 			break;
 
 		case mfhc_op:
-			if (!cpu_has_mips_r2)
+			if (!cpu_has_mips_r2_r6)
 				goto sigill;
 
 			/* copregister rd -> gpr[rt] */
@@ -1148,7 +1148,7 @@ emul:
 			break;
 
 		case mthc_op:
-			if (!cpu_has_mips_r2)
+			if (!cpu_has_mips_r2_r6)
 				goto sigill;
 
 			/* copregister rd <- gpr[rt] */
-- 
2.4.5
