Received: from mailapp01.imgtec.com ([195.59.15.196]:45600 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27031994AbcETW3DpQ3NC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 May 2016 00:29:03 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 4/5] MIPS: Add missing tlbinvf/XPA microMIPS encodings
Date: Fri, 20 May 2016 23:28:40 +0100
Message-ID: <1463783321-24442-5-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1463783321-24442-1-git-send-email-james.hogan@imgtec.com>
References: <1463783321-24442-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160520222840.KYP_kgyEmW8-AXXLecLh3wa5MA0hxek7EGybRHVVCJM@z>

Hardcoded MIPS instruction encodings are provided for tlbinvf, mfhc0 &
mthc0 instructions, but microMIPS encodings are missing. I doubt any
microMIPS cores exist at present which support these instructions, but
the microMIPS encodings exist, and microMIPS cores may support them in
the future. Add the missing microMIPS encodings using the new macros.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mipsregs.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index fa0bde2fb881..e4f6339a60b3 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1080,7 +1080,9 @@ static inline void tlbinvf(void)
 	__asm__ __volatile__(
 		".set push\n\t"
 		".set noreorder\n\t"
-		".word 0x42000004\n\t" /* tlbinvf */
+		"# tlbinvf\n\t"
+		_ASM_INSN_IF_MIPS(0x42000004)
+		_ASM_INSN32_IF_MM(0x0000537c)
 		".set pop");
 }
 
@@ -1301,9 +1303,9 @@ do {									\
 	"	.set	push					\n"	\
 	"	.set	noat					\n"	\
 	"	.set	mips32r2				\n"	\
-	"	.insn						\n"	\
 	"	# mfhc0 $1, %1					\n"	\
-	"	.word	(0x40410000 | ((%1 & 0x1f) << 11))	\n"	\
+	_ASM_INSN_IF_MIPS(0x40410000 | ((%1 & 0x1f) << 11))		\
+	_ASM_INSN32_IF_MM(0x002000f4 | ((%1 & 0x1f) << 16))		\
 	"	move	%0, $1					\n"	\
 	"	.set	pop					\n"	\
 	: "=r" (__res)							\
@@ -1319,8 +1321,8 @@ do {									\
 	"	.set	mips32r2				\n"	\
 	"	move	$1, %0					\n"	\
 	"	# mthc0 $1, %1					\n"	\
-	"	.insn						\n"	\
-	"	.word	(0x40c10000 | ((%1 & 0x1f) << 11))	\n"	\
+	_ASM_INSN_IF_MIPS(0x40c10000 | ((%1 & 0x1f) << 11))		\
+	_ASM_INSN32_IF_MM(0x002002f4 | ((%1 & 0x1f) << 16))		\
 	"	.set	pop					\n"	\
 	:								\
 	: "r" (value), "i" (register));					\
-- 
2.4.10
