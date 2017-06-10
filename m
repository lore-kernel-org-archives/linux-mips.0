Received: from mailapp01.imgtec.com ([195.59.15.196]:27443 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993958AbdFJA1lmpntt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 10 Jun 2017 02:27:41 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 02/11] MIPS: cmpxchg: Pull xchg() asm into a macro
Date: Fri, 9 Jun 2017 17:26:34 -0700
Message-ID: <20170610002644.8434-3-paul.burton@imgtec.com>
In-Reply-To: <20170610002644.8434-1-paul.burton@imgtec.com>
References: <20170610002644.8434-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170610002634.EbF2Wo_cSOLoN66fxfEChdFljChbLdohiyAa8GyjstY@z>

Use a macro to generate the 32 & 64 bit variants of the backing code for
xchg(), much as is already done for cmpxchg(). This removes the
duplication that could previously be found in __xchg_u32() &
__xchg_u64().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/include/asm/cmpxchg.h | 81 +++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 48 deletions(-)

diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index 0582c01d229d..a19359649b60 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -24,36 +24,43 @@
 # define __scbeqz "beqz"
 #endif
 
+#define __xchg_asm(ld, st, m, val)					\
+({									\
+	__typeof(*(m)) __ret;						\
+									\
+	if (kernel_uses_llsc) {						\
+		__asm__ __volatile__(					\
+		"	.set	push				\n"	\
+		"	.set	noat				\n"	\
+		"	.set	" MIPS_ISA_ARCH_LEVEL "		\n"	\
+		"1:	" ld "	%0, %2		# __xchg_asm	\n"	\
+		"	.set	mips0				\n"	\
+		"	move	$1, %z3				\n"	\
+		"	.set	" MIPS_ISA_ARCH_LEVEL "		\n"	\
+		"	" st "	$1, %1				\n"	\
+		"\t" __scbeqz "	$1, 1b				\n"	\
+		"	.set	pop				\n"	\
+		: "=&r" (__ret), "=" GCC_OFF_SMALL_ASM() (*m)		\
+		: GCC_OFF_SMALL_ASM() (*m), "Jr" (val)			\
+		: "memory");						\
+	} else {							\
+		unsigned long __flags;					\
+									\
+		raw_local_irq_save(__flags);				\
+		__ret = *m;						\
+		*m = val;						\
+		raw_local_irq_restore(__flags);				\
+	}								\
+									\
+	__ret;								\
+})
+
 static inline unsigned long __xchg_u32(volatile int * m, unsigned int val)
 {
 	__u32 retval;
 
 	smp_mb__before_llsc();
-
-	if (kernel_uses_llsc) {
-		unsigned long dummy;
-
-		__asm__ __volatile__(
-		"	.set	" MIPS_ISA_ARCH_LEVEL "			\n"
-		"1:	ll	%0, %3			# xchg_u32	\n"
-		"	.set	mips0					\n"
-		"	move	%2, %z4					\n"
-		"	.set	" MIPS_ISA_ARCH_LEVEL "			\n"
-		"	sc	%2, %1					\n"
-		"\t" __scbeqz "	%2, 1b					\n"
-		"	.set	mips0					\n"
-		: "=&r" (retval), "=" GCC_OFF_SMALL_ASM() (*m), "=&r" (dummy)
-		: GCC_OFF_SMALL_ASM() (*m), "Jr" (val)
-		: "memory");
-	} else {
-		unsigned long flags;
-
-		raw_local_irq_save(flags);
-		retval = *m;
-		*m = val;
-		raw_local_irq_restore(flags);	/* implies memory barrier  */
-	}
-
+	retval = __xchg_asm("ll", "sc", m, val);
 	smp_llsc_mb();
 
 	return retval;
@@ -65,29 +72,7 @@ static inline __u64 __xchg_u64(volatile __u64 * m, __u64 val)
 	__u64 retval;
 
 	smp_mb__before_llsc();
-
-	if (kernel_uses_llsc) {
-		unsigned long dummy;
-
-		__asm__ __volatile__(
-		"	.set	" MIPS_ISA_ARCH_LEVEL "			\n"
-		"1:	lld	%0, %3			# xchg_u64	\n"
-		"	move	%2, %z4					\n"
-		"	scd	%2, %1					\n"
-		"\t" __scbeqz "	%2, 1b					\n"
-		"	.set	mips0					\n"
-		: "=&r" (retval), "=" GCC_OFF_SMALL_ASM() (*m), "=&r" (dummy)
-		: GCC_OFF_SMALL_ASM() (*m), "Jr" (val)
-		: "memory");
-	} else {
-		unsigned long flags;
-
-		raw_local_irq_save(flags);
-		retval = *m;
-		*m = val;
-		raw_local_irq_restore(flags);	/* implies memory barrier  */
-	}
-
+	retval = __xchg_asm("lld", "scd", m, val);
 	smp_llsc_mb();
 
 	return retval;
-- 
2.13.1
