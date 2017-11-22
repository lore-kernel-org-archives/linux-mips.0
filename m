Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:41112 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990425AbdKVLbgm0TE8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Nov 2017 12:31:36 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH 2/7] MIPS: VZ: Update helpers to use new asm macros
Date: Wed, 22 Nov 2017 11:30:28 +0000
Message-ID: <ee2caecba43f2e34afde024bdcfc4f9908974ff1.1511349998.git-series.jhogan@kernel.org>
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
Message-ID: <20171122113028.Mq_WINH2OosmhrFvwrTEK6nHGXDszyqovjGxGT15WK4@z>

From: James Hogan <jhogan@kernel.org>

Update VZ guest register & guest TLB access helpers to use the new
assembly macros for parsing register names and creating custom assembly
macro instructions, which has a number of advantages:

 - Better code can be generated on toolchains which don't support VZ,
   more closely matching those which do, since there is no need to
   bounce values via the $at register. Some differences still remain due
   to the inability to safely fill branch delay slots and R6 compact
   branch forbidden slots with explicitly encoded instructions,
   resulting in some extra NOPs added by the assembler.

 - Some code duplication between toolchains which do and don't support
   VZ instructions is removed, since the helpers are only implemented
   once. When the toolchain doesn't implement the instruction an
   assembly macro implements it instead.

 - Instruction encodings are kept together in the source.

On a generic kernel with KVM VZ support enabled this change saves about
2.5KiB of kernel code when TOOLCHAIN_SUPPORTS_VIRT=n, bringing it down
to about 0.5KiB more than when TOOLCHAIN_SUPPORTS_VIRT=y on r6, and just
68 bytes more on r2.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mipsregs.h | 164 +++++++-------------------------
 1 file changed, 37 insertions(+), 127 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 972698557b4b..361c35243366 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1913,14 +1913,40 @@ do {									\
  * Macros to access the guest system control coprocessor
  */
 
-#ifdef TOOLCHAIN_SUPPORTS_VIRT
+#ifndef TOOLCHAIN_SUPPORTS_VIRT
+_ASM_MACRO_2R_1S(mfgc0, rt, rs, sel,
+	_ASM_INSN_IF_MIPS(0x40600000 | __rt << 16 | __rs << 11 | \\sel)
+	_ASM_INSN32_IF_MM(0x000004fc | __rt << 21 | __rs << 16 | \\sel << 11));
+_ASM_MACRO_2R_1S(dmfgc0, rt, rs, sel,
+	_ASM_INSN_IF_MIPS(0x40600100 | __rt << 16 | __rs << 11 | \\sel)
+	_ASM_INSN32_IF_MM(0x580004fc | __rt << 21 | __rs << 16 | \\sel << 11));
+_ASM_MACRO_2R_1S(mtgc0, rt, rd, sel,
+	_ASM_INSN_IF_MIPS(0x40600200 | __rt << 16 | __rd << 11 | \\sel)
+	_ASM_INSN32_IF_MM(0x000006fc | __rt << 21 | __rd << 16 | \\sel << 11));
+_ASM_MACRO_2R_1S(dmtgc0, rt, rd, sel,
+	_ASM_INSN_IF_MIPS(0x40600300 | __rt << 16 | __rd << 11 | \\sel)
+	_ASM_INSN32_IF_MM(0x580006fc | __rt << 21 | __rd << 16 | \\sel << 11));
+_ASM_MACRO_0(tlbgp,    _ASM_INSN_IF_MIPS(0x42000010)
+		       _ASM_INSN32_IF_MM(0x0000017c));
+_ASM_MACRO_0(tlbgr,    _ASM_INSN_IF_MIPS(0x42000009)
+		       _ASM_INSN32_IF_MM(0x0000117c));
+_ASM_MACRO_0(tlbgwi,   _ASM_INSN_IF_MIPS(0x4200000a)
+		       _ASM_INSN32_IF_MM(0x0000217c));
+_ASM_MACRO_0(tlbgwr,   _ASM_INSN_IF_MIPS(0x4200000e)
+		       _ASM_INSN32_IF_MM(0x0000317c));
+_ASM_MACRO_0(tlbginvf, _ASM_INSN_IF_MIPS(0x4200000c)
+		       _ASM_INSN32_IF_MM(0x0000517c));
+#define _ASM_SET_VIRT ""
+#else	/* !TOOLCHAIN_SUPPORTS_VIRT */
+#define _ASM_SET_VIRT ".set\tvirt\n\t"
+#endif
 
 #define __read_32bit_gc0_register(source, sel)				\
 ({ int __res;								\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
 		".set\tmips32r2\n\t"					\
-		".set\tvirt\n\t"					\
+		_ASM_SET_VIRT						\
 		"mfgc0\t%0, $%1, %2\n\t"				\
 		".set\tpop"						\
 		: "=r" (__res)						\
@@ -1933,8 +1959,8 @@ do {									\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
 		".set\tmips64r2\n\t"					\
-		".set\tvirt\n\t"					\
-		"dmfgc0\t%0, $%1, %2\n\t"			\
+		_ASM_SET_VIRT						\
+		"dmfgc0\t%0, $%1, %2\n\t"				\
 		".set\tpop"						\
 		: "=r" (__res)						\
 		: "i" (source), "i" (sel));				\
@@ -1946,7 +1972,7 @@ do {									\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
 		".set\tmips32r2\n\t"					\
-		".set\tvirt\n\t"					\
+		_ASM_SET_VIRT						\
 		"mtgc0\t%z0, $%1, %2\n\t"				\
 		".set\tpop"						\
 		: : "Jr" ((unsigned int)(value)),			\
@@ -1958,75 +1984,13 @@ do {									\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
 		".set\tmips64r2\n\t"					\
-		".set\tvirt\n\t"					\
+		_ASM_SET_VIRT						\
 		"dmtgc0\t%z0, $%1, %2\n\t"				\
 		".set\tpop"						\
 		: : "Jr" (value),					\
 		    "i" (register), "i" (sel));				\
 } while (0)
 
-#else	/* TOOLCHAIN_SUPPORTS_VIRT */
-
-#define __read_32bit_gc0_register(source, sel)				\
-({ int __res;								\
-	__asm__ __volatile__(						\
-		".set\tpush\n\t"					\
-		".set\tnoat\n\t"					\
-		"# mfgc0\t$1, $%1, %2\n\t"				\
-		_ASM_INSN_IF_MIPS(0x40610000 | %1 << 11 | %2)		\
-		_ASM_INSN32_IF_MM(0x002004fc | %1 << 16 | %2 << 11)	\
-		"move\t%0, $1\n\t"					\
-		".set\tpop"						\
-		: "=r" (__res)						\
-		: "i" (source), "i" (sel));				\
-	__res;								\
-})
-
-#define __read_64bit_gc0_register(source, sel)				\
-({ unsigned long long __res;						\
-	__asm__ __volatile__(						\
-		".set\tpush\n\t"					\
-		".set\tnoat\n\t"					\
-		"# dmfgc0\t$1, $%1, %2\n\t"				\
-		_ASM_INSN_IF_MIPS(0x40610100 | %1 << 11 | %2)		\
-		_ASM_INSN32_IF_MM(0x582004fc | %1 << 16 | %2 << 11)	\
-		"move\t%0, $1\n\t"					\
-		".set\tpop"						\
-		: "=r" (__res)						\
-		: "i" (source), "i" (sel));				\
-	__res;								\
-})
-
-#define __write_32bit_gc0_register(register, sel, value)		\
-do {									\
-	__asm__ __volatile__(						\
-		".set\tpush\n\t"					\
-		".set\tnoat\n\t"					\
-		"move\t$1, %z0\n\t"					\
-		"# mtgc0\t$1, $%1, %2\n\t"				\
-		_ASM_INSN_IF_MIPS(0x40610200 | %1 << 11 | %2)		\
-		_ASM_INSN32_IF_MM(0x002006fc | %1 << 16 | %2 << 11)	\
-		".set\tpop"						\
-		: : "Jr" ((unsigned int)(value)),			\
-		    "i" (register), "i" (sel));				\
-} while (0)
-
-#define __write_64bit_gc0_register(register, sel, value)		\
-do {									\
-	__asm__ __volatile__(						\
-		".set\tpush\n\t"					\
-		".set\tnoat\n\t"					\
-		"move\t$1, %z0\n\t"					\
-		"# dmtgc0\t$1, $%1, %2\n\t"				\
-		_ASM_INSN_IF_MIPS(0x40610300 | %1 << 11 | %2)		\
-		_ASM_INSN32_IF_MM(0x582006fc | %1 << 16 | %2 << 11)	\
-		".set\tpop"						\
-		: : "Jr" (value),					\
-		    "i" (register), "i" (sel));				\
-} while (0)
-
-#endif	/* !TOOLCHAIN_SUPPORTS_VIRT */
-
 #define __read_ulong_gc0_register(reg, sel)				\
 	((sizeof(unsigned long) == 4) ?					\
 	(unsigned long) __read_32bit_gc0_register(reg, sel) :		\
@@ -2664,8 +2628,6 @@ static inline void tlb_write_random(void)
 		".set reorder");
 }
 
-#ifdef TOOLCHAIN_SUPPORTS_VIRT
-
 /*
  * Guest TLB operations.
  *
@@ -2676,7 +2638,7 @@ static inline void guest_tlb_probe(void)
 	__asm__ __volatile__(
 		".set push\n\t"
 		".set noreorder\n\t"
-		".set virt\n\t"
+		_ASM_SET_VIRT
 		"tlbgp\n\t"
 		".set pop");
 }
@@ -2686,7 +2648,7 @@ static inline void guest_tlb_read(void)
 	__asm__ __volatile__(
 		".set push\n\t"
 		".set noreorder\n\t"
-		".set virt\n\t"
+		_ASM_SET_VIRT
 		"tlbgr\n\t"
 		".set pop");
 }
@@ -2696,7 +2658,7 @@ static inline void guest_tlb_write_indexed(void)
 	__asm__ __volatile__(
 		".set push\n\t"
 		".set noreorder\n\t"
-		".set virt\n\t"
+		_ASM_SET_VIRT
 		"tlbgwi\n\t"
 		".set pop");
 }
@@ -2706,7 +2668,7 @@ static inline void guest_tlb_write_random(void)
 	__asm__ __volatile__(
 		".set push\n\t"
 		".set noreorder\n\t"
-		".set virt\n\t"
+		_ASM_SET_VIRT
 		"tlbgwr\n\t"
 		".set pop");
 }
@@ -2719,63 +2681,11 @@ static inline void guest_tlbinvf(void)
 	__asm__ __volatile__(
 		".set push\n\t"
 		".set noreorder\n\t"
-		".set virt\n\t"
+		_ASM_SET_VIRT
 		"tlbginvf\n\t"
 		".set pop");
 }
 
-#else	/* TOOLCHAIN_SUPPORTS_VIRT */
-
-/*
- * Guest TLB operations.
- *
- * It is responsibility of the caller to take care of any TLB hazards.
- */
-static inline void guest_tlb_probe(void)
-{
-	__asm__ __volatile__(
-		"# tlbgp\n\t"
-		_ASM_INSN_IF_MIPS(0x42000010)
-		_ASM_INSN32_IF_MM(0x0000017c));
-}
-
-static inline void guest_tlb_read(void)
-{
-	__asm__ __volatile__(
-		"# tlbgr\n\t"
-		_ASM_INSN_IF_MIPS(0x42000009)
-		_ASM_INSN32_IF_MM(0x0000117c));
-}
-
-static inline void guest_tlb_write_indexed(void)
-{
-	__asm__ __volatile__(
-		"# tlbgwi\n\t"
-		_ASM_INSN_IF_MIPS(0x4200000a)
-		_ASM_INSN32_IF_MM(0x0000217c));
-}
-
-static inline void guest_tlb_write_random(void)
-{
-	__asm__ __volatile__(
-		"# tlbgwr\n\t"
-		_ASM_INSN_IF_MIPS(0x4200000e)
-		_ASM_INSN32_IF_MM(0x0000317c));
-}
-
-/*
- * Guest TLB Invalidate Flush
- */
-static inline void guest_tlbinvf(void)
-{
-	__asm__ __volatile__(
-		"# tlbginvf\n\t"
-		_ASM_INSN_IF_MIPS(0x4200000c)
-		_ASM_INSN32_IF_MM(0x0000517c));
-}
-
-#endif	/* !TOOLCHAIN_SUPPORTS_VIRT */
-
 /*
  * Manipulate bits in a register.
  */
-- 
git-series 0.9.1
