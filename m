Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:39603 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990596AbdKVLbktnoO8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Nov 2017 12:31:40 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH 4/7] MIPS: XPA: Use XPA instructions in assembly
Date: Wed, 22 Nov 2017 11:30:30 +0000
Message-ID: <d0796e7bb73cc584c329314184811ef2a5e9507b.1511349998.git-series.jhogan@kernel.org>
In-Reply-To: <cover.41391a6cc5670b90bb8e77eadd07c712793eab03.1511349998.git-series.jhogan@kernel.org>
References: <cover.41391a6cc5670b90bb8e77eadd07c712793eab03.1511349998.git-series.jhogan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
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
Cc: Marcin Nowakowski <marcin.nowakowski@mips.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171122113030.ztrlUZlBPItx7kc0kQLNI1fOW52L9_YjVQEoU4snC0U@z>

From: James Hogan <jhogan@kernel.org>

Utilise XPA instructions MFHC0 & MTHC0 in inline assembly instead of
directly encoding them with the _ASM_INSN* macros, and transparently
implement these instructions as assembler macros if the toolchain
doesn't support them natively, using the recently introduced assembler
macro helpers.

The old direct encodings were restricted to using the register $at, so
this allows the extra register moves to go away (saving a grand total of
24 bytes).

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/Makefile               |  6 ++++++
 arch/mips/include/asm/mipsregs.h | 26 ++++++++++++++++----------
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 9f6a26d72f9f..cbd560aeb5a6 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -216,6 +216,12 @@ cflags-$(toolchain-msa)			+= -DTOOLCHAIN_SUPPORTS_MSA
 endif
 toolchain-virt				:= $(call cc-option-yn,$(mips-cflags) -mvirt)
 cflags-$(toolchain-virt)		+= -DTOOLCHAIN_SUPPORTS_VIRT
+# For -mmicromips, use -Wa,-fatal-warnings to catch unsupported -mxpa which
+# only warns
+xpa-cflags-y				:= $(mips-cflags)
+xpa-cflags-$(micromips-ase)		+= -mmicromips -Wa$(comma)-fatal-warnings
+toolchain-xpa				:= $(call cc-option-yn,$(xpa-cflags-y) -mxpa)
+cflags-$(toolchain-xpa)			+= -DTOOLCHAIN_SUPPORTS_XPA
 
 #
 # Firmware support
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 000530b18f2e..02f8ae1fac04 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1487,18 +1487,27 @@ do {									\
 	local_irq_restore(__flags);					\
 } while (0)
 
+#ifndef TOOLCHAIN_SUPPORTS_XPA
+_ASM_MACRO_2R_1S(mfhc0, rt, rs, sel,
+	_ASM_INSN_IF_MIPS(0x40400000 | __rt << 16 | __rs << 11 | \\sel)
+	_ASM_INSN32_IF_MM(0x000000f4 | __rt << 21 | __rs << 16 | \\sel << 11));
+_ASM_MACRO_2R_1S(mthc0, rt, rd, sel,
+	_ASM_INSN_IF_MIPS(0x40c00000 | __rt << 16 | __rd << 11 | \\sel)
+	_ASM_INSN32_IF_MM(0x000002f4 | __rt << 21 | __rd << 16 | \\sel << 11));
+#define _ASM_SET_XPA ""
+#else	/* !TOOLCHAIN_SUPPORTS_XPA */
+#define _ASM_SET_XPA ".set\txpa\n\t"
+#endif
+
 #define __readx_32bit_c0_register(source)				\
 ({									\
 	unsigned int __res;						\
 									\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
-	"	.set	noat					\n"	\
 	"	.set	mips32r2				\n"	\
-	"	# mfhc0 $1, %1					\n"	\
-	_ASM_INSN_IF_MIPS(0x40410000 | ((%1 & 0x1f) << 11))		\
-	_ASM_INSN32_IF_MM(0x002000f4 | ((%1 & 0x1f) << 16))		\
-	"	move	%0, $1					\n"	\
+	_ASM_SET_XPA							\
+	"	mfhc0	%0, $%1					\n"	\
 	"	.set	pop					\n"	\
 	: "=r" (__res)							\
 	: "i" (source));						\
@@ -1509,12 +1518,9 @@ do {									\
 do {									\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
-	"	.set	noat					\n"	\
 	"	.set	mips32r2				\n"	\
-	"	move	$1, %0					\n"	\
-	"	# mthc0 $1, %1					\n"	\
-	_ASM_INSN_IF_MIPS(0x40c10000 | ((%1 & 0x1f) << 11))		\
-	_ASM_INSN32_IF_MM(0x002002f4 | ((%1 & 0x1f) << 16))		\
+	_ASM_SET_XPA							\
+	"	mthc0	%0, $%1					\n"	\
 	"	.set	pop					\n"	\
 	:								\
 	: "r" (value), "i" (register));					\
-- 
git-series 0.9.1
