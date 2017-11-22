Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:36976 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991033AbdKVLbmoyox8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Nov 2017 12:31:42 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH 6/7] MIPS: XPA: Standardise readx/writex accessors
Date: Wed, 22 Nov 2017 11:30:32 +0000
Message-ID: <ee83f3d40494dcad3b7cad073c9829ecf9cce2cd.1511349998.git-series.jhogan@kernel.org>
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
Message-ID: <20171122113032.qa1s8EeYM5vpOUlbdWrLIVjIsdKmwQM-yeg82nUJsnA@z>

From: James Hogan <jhogan@kernel.org>

Now that we are using assembler macros to implement XPA instructions on
toolchains which don't support them, pass Cop0 register names to the
__{readx,writex}_32bit_c0_register macros in $n format rather than
register numbers. Also pass a register select which may be useful in
future (for example for MemoryMapID field of WatchHi registers on
I6500).

This is to make them consistent with the normal Cop0 register access
macros which they were originally based on.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mipsregs.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index f2b9af887e83..5b901deab52a 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1499,7 +1499,7 @@ _ASM_MACRO_2R_1S(mthc0, rt, rd, sel,
 #define _ASM_SET_XPA ".set\txpa\n\t"
 #endif
 
-#define __readx_32bit_c0_register(source)				\
+#define __readx_32bit_c0_register(source, sel)				\
 ({									\
 	unsigned int __res;						\
 									\
@@ -1507,23 +1507,23 @@ _ASM_MACRO_2R_1S(mthc0, rt, rd, sel,
 	"	.set	push					\n"	\
 	"	.set	mips32r2				\n"	\
 	_ASM_SET_XPA							\
-	"	mfhc0	%0, $%1					\n"	\
+	"	mfhc0	%0, " #source ", %1			\n"	\
 	"	.set	pop					\n"	\
 	: "=r" (__res)							\
-	: "i" (source));						\
+	: "i" (sel));							\
 	__res;								\
 })
 
-#define __writex_32bit_c0_register(register, value)			\
+#define __writex_32bit_c0_register(register, sel, value)		\
 do {									\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
 	"	.set	mips32r2				\n"	\
 	_ASM_SET_XPA							\
-	"	mthc0	%z0, $%1				\n"	\
+	"	mthc0	%z0, " #register ", %1			\n"	\
 	"	.set	pop					\n"	\
 	:								\
-	: "Jr" (value), "i" (register));				\
+	: "Jr" (value), "i" (sel));					\
 } while (0)
 
 #define read_c0_index()		__read_32bit_c0_register($0, 0)
@@ -1535,14 +1535,14 @@ do {									\
 #define read_c0_entrylo0()	__read_ulong_c0_register($2, 0)
 #define write_c0_entrylo0(val)	__write_ulong_c0_register($2, 0, val)
 
-#define readx_c0_entrylo0()	__readx_32bit_c0_register(2)
-#define writex_c0_entrylo0(val)	__writex_32bit_c0_register(2, val)
+#define readx_c0_entrylo0()	__readx_32bit_c0_register($2, 0)
+#define writex_c0_entrylo0(val)	__writex_32bit_c0_register($2, 0, val)
 
 #define read_c0_entrylo1()	__read_ulong_c0_register($3, 0)
 #define write_c0_entrylo1(val)	__write_ulong_c0_register($3, 0, val)
 
-#define readx_c0_entrylo1()	__readx_32bit_c0_register(3)
-#define writex_c0_entrylo1(val)	__writex_32bit_c0_register(3, val)
+#define readx_c0_entrylo1()	__readx_32bit_c0_register($3, 0)
+#define writex_c0_entrylo1(val)	__writex_32bit_c0_register($3, 0, val)
 
 #define read_c0_conf()		__read_32bit_c0_register($3, 0)
 #define write_c0_conf(val)	__write_32bit_c0_register($3, 0, val)
-- 
git-series 0.9.1
