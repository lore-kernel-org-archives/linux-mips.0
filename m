Received: from mailapp01.imgtec.com ([195.59.15.196]:57894 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009140AbaLRPLFRqjBG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:11:05 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 7A0CD1B01E2FC
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:10:56 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 05/67] MIPS: mm: uasm: Add signed 9-bit immediate related macros
Date: Thu, 18 Dec 2014 15:09:14 +0000
Message-ID: <1418915416-3196-6-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20141218150914.AB0n10KTCH0o4gEqHKLQRimYJGjkoJDPSUjuMnutu8U@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

MIPS R6 redefines several instructions and reduces the immediate
field to 9-bits so add related macros for the microassembler.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/uasm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/uasm.c b/arch/mips/mm/uasm.c
index a01b0d6cedd2..1cc8ac30be47 100644
--- a/arch/mips/mm/uasm.c
+++ b/arch/mips/mm/uasm.c
@@ -24,7 +24,8 @@ enum fields {
 	JIMM = 0x080,
 	FUNC = 0x100,
 	SET = 0x200,
-	SCIMM = 0x400
+	SCIMM = 0x400,
+	SIMM9 = 0x800,
 };
 
 #define OP_MASK		0x3f
@@ -41,6 +42,8 @@ enum fields {
 #define FUNC_SH		0
 #define SET_MASK	0x7
 #define SET_SH		0
+#define SIMM9_SH	7
+#define SIMM9_MASK	0x1ff
 
 enum opcode {
 	insn_invalid,
@@ -116,6 +119,14 @@ static inline u32 build_scimm(u32 arg)
 	return (arg & SCIMM_MASK) << SCIMM_SH;
 }
 
+static inline u32 build_scimm9(s32 arg)
+{
+	WARN((arg > 0x1ff || arg < -0x200),
+	       KERN_WARNING "Micro-assembler field overflow\n");
+
+	return (arg & SIMM9_MASK) << SIMM9_SH;
+}
+
 static inline u32 build_func(u32 arg)
 {
 	WARN(arg & ~FUNC_MASK, KERN_WARNING "Micro-assembler field overflow\n");
-- 
2.2.0
