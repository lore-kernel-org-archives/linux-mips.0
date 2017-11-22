Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:33670 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990409AbdKVLbcPHKm8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Nov 2017 12:31:32 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH 1/7] MIPS: Add helpers for assembler macro instructions
Date: Wed, 22 Nov 2017 11:30:27 +0000
Message-ID: <b13de64d5dfd644423f5804a3c70d722c9d33105.1511349998.git-series.jhogan@kernel.org>
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
Message-ID: <20171122113027.uczZoROhaDra4ftr7NZ6Cg6lfVmsB1a6VQYXUcL-ZxI@z>

From: James Hogan <jhogan@kernel.org>

Implement a parse_r assembler macro in asm/mipsregs.h to parse a
register in $n form, and a few C macros for defining assembler macro
instructions. These can be used to more transparently support older
binutils versions which don't support for example the msa, virt, xpa, or
crc instructions.

In particular they overcome the difficulty of turning a register name in
$n form into an instruction encoding suitable for giving to .word /
.hword, which is particularly problematic when needed from inline
assembly where the compiler is responsible for register allocation.
Traditionally this had required the use of $at and an extra MOV
instruction, but for CRC instructions with multiple GP register operands
that approach becomes more difficult.

Three assembler macro creation helpers are added:

 - _ASM_MACRO_0(OP, ENC)
   This is to define an assembler macro for an instruction which has no
   operands, for example the VZ TLBGR instruction.

 - _ASM_MACRO_2R(OP, R1, R2, ENC)
   This is to define an assembler macro for an instruction which has 2
   register operands, for example the CFCMSA instruction.

 - _ASM_MACRO_3R(OP, R1, R2, R3, ENC)
   This is to define an assembler macro for an instruction which has 3
   register operands, for example the crc32 instructions.

 - _ASM_MACRO_2R_1S(OP, R1, R2, SEL3, ENC)
   This is to define an assembler macro for a Cop0 move instruction,
   with 2 register operands and an optional register select operand
   which defaults to 0, for example the VZ MFGC0 instruction.

Suggested-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Marcin Nowakowski <marcin.nowakowski@mips.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mipsregs.h | 83 +++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 6b1f1ad0542c..972698557b4b 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1181,6 +1181,89 @@ static inline int mm_insn_16bit(u16 insn)
 #endif
 
 /*
+ * parse_r var, r - Helper assembler macro for parsing register names.
+ *
+ * This converts the register name in $n form provided in \r to the
+ * corresponding register number, which is assigned to the variable \var. It is
+ * needed to allow explicit encoding of instructions in inline assembly where
+ * registers are chosen by the compiler in $n form, allowing us to avoid using
+ * fixed register numbers.
+ *
+ * It also allows newer instructions (not implemented by the assembler) to be
+ * transparently implemented using assembler macros, instead of needing separate
+ * cases depending on toolchain support.
+ *
+ * Simple usage example:
+ * __asm__ __volatile__("parse_r __rt, %0\n\t"
+ *			".insn\n\t"
+ *			"# di    %0\n\t"
+ *			".word   (0x41606000 | (__rt << 16))"
+ *			: "=r" (status);
+ */
+
+/* Match an individual register number and assign to \var */
+#define _IFC_REG(n)				\
+	".ifc	\\r, $" #n "\n\t"		\
+	"\\var	= " #n "\n\t"			\
+	".endif\n\t"
+
+__asm__(".macro	parse_r var r\n\t"
+	"\\var	= -1\n\t"
+	_IFC_REG(0)  _IFC_REG(1)  _IFC_REG(2)  _IFC_REG(3)
+	_IFC_REG(4)  _IFC_REG(5)  _IFC_REG(6)  _IFC_REG(7)
+	_IFC_REG(8)  _IFC_REG(9)  _IFC_REG(10) _IFC_REG(11)
+	_IFC_REG(12) _IFC_REG(13) _IFC_REG(14) _IFC_REG(15)
+	_IFC_REG(16) _IFC_REG(17) _IFC_REG(18) _IFC_REG(19)
+	_IFC_REG(20) _IFC_REG(21) _IFC_REG(22) _IFC_REG(23)
+	_IFC_REG(24) _IFC_REG(25) _IFC_REG(26) _IFC_REG(27)
+	_IFC_REG(28) _IFC_REG(29) _IFC_REG(30) _IFC_REG(31)
+	".iflt	\\var\n\t"
+	".error	\"Unable to parse register name \\r\"\n\t"
+	".endif\n\t"
+	".endm");
+
+#undef _IFC_REG
+
+/*
+ * C macros for generating assembler macros for common instruction formats.
+ *
+ * The names of the operands can be chosen by the caller, and the encoding of
+ * register operand \<Rn> is assigned to __<Rn> where it can be accessed from
+ * the ENC encodings.
+ */
+
+/* Instructions with no operands */
+#define _ASM_MACRO_0(OP, ENC)						\
+	__asm__(".macro	" #OP "\n\t"					\
+		ENC							\
+		".endm")
+
+/* Instructions with 2 register operands */
+#define _ASM_MACRO_2R(OP, R1, R2, ENC)					\
+	__asm__(".macro	" #OP " " #R1 ", " #R2 "\n\t"			\
+		"parse_r __" #R1 ", \\" #R1 "\n\t"			\
+		"parse_r __" #R2 ", \\" #R2 "\n\t"			\
+		ENC							\
+		".endm")
+
+/* Instructions with 3 register operands */
+#define _ASM_MACRO_3R(OP, R1, R2, R3, ENC)				\
+	__asm__(".macro	" #OP " " #R1 ", " #R2 ", " #R3 "\n\t"		\
+		"parse_r __" #R1 ", \\" #R1 "\n\t"			\
+		"parse_r __" #R2 ", \\" #R2 "\n\t"			\
+		"parse_r __" #R3 ", \\" #R3 "\n\t"			\
+		ENC							\
+		".endm")
+
+/* Instructions with 2 register operands and 1 optional select operand */
+#define _ASM_MACRO_2R_1S(OP, R1, R2, SEL3, ENC)				\
+	__asm__(".macro	" #OP " " #R1 ", " #R2 ", " #SEL3 " = 0\n\t"	\
+		"parse_r __" #R1 ", \\" #R1 "\n\t"			\
+		"parse_r __" #R2 ", \\" #R2 "\n\t"			\
+		ENC							\
+		".endm")
+
+/*
  * TLB Invalidate Flush
  */
 static inline void tlbinvf(void)
-- 
git-series 0.9.1
