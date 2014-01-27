Received: from multi.imgtec.com ([194.200.65.239]:43567 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827297AbaA0UU7Blvsy (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:20:59 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 05/58] MIPS: uapi: inst: Add new EVA opcodes
Date: Mon, 27 Jan 2014 20:18:52 +0000
Message-ID: <1390853985-14246-6-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140127201852.qe-91w4G45GIB6X_ULtHZa1TZoBwVnCjUO1gWbI0SNM@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/uapi/asm/inst.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index b39ba25..9ce652e 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -73,10 +73,16 @@ enum spec2_op {
 enum spec3_op {
 	ext_op, dextm_op, dextu_op, dext_op,
 	ins_op, dinsm_op, dinsu_op, dins_op,
-	lx_op = 0x0a,
-	bshfl_op = 0x20,
-	dbshfl_op = 0x24,
-	rdhwr_op = 0x3b
+	lx_op     = 0x0a, lwle_op   = 0x19,
+	lwre_op   = 0x1a, cachee_op = 0x1b,
+	sbe_op    = 0x1c, she_op    = 0x1d,
+	sce_op    = 0x1e, swe_op    = 0x1f,
+	bshfl_op  = 0x20, swle_op   = 0x21,
+	swre_op   = 0x22, prefe_op  = 0x23,
+	dbshfl_op = 0x24, lbue_op   = 0x28,
+	lhue_op   = 0x29, lbe_op    = 0x2c,
+	lhe_op    = 0x2d, lle_op    = 0x2e,
+	lwe_op    = 0x2f, rdhwr_op  = 0x3b
 };
 
 /*
-- 
1.8.5.3
