Received: from mailapp01.imgtec.com ([195.59.15.196]:55206 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010627AbbAPKwZKU50S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:25 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D747A284AE3F3
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:16 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 22/70] MIPS: asm: bitops: Update ISA constraints for MIPS R6 support
Date: Fri, 16 Jan 2015 10:49:01 +0000
Message-ID: <1421405389-15512-23-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Matthew Fortune <Matthew.Fortune@imgtec.com>
Message-ID: <20150116104901.cy_8J5Ut10LjADFd0MKbufIxJCOEDqZ0aaH6wNjWY8Q@z>

MIPS R6 changed the opcodes for LL/SC instructions so we need to set
the correct ISA level.

Cc: Matthew Fortune <Matthew.Fortune@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/bitops.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index 6663bcca9d0c..cc73fdccbff3 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -15,6 +15,7 @@
 
 #include <linux/compiler.h>
 #include <linux/types.h>
+#include <asm/asm.h>
 #include <asm/barrier.h>
 #include <asm/byteorder.h>		/* sigh ... */
 #include <asm/compiler.h>
@@ -81,7 +82,7 @@ static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
 		"	.set	mips0					\n"
 		: "=&r" (temp), "=" GCC_OFF12_ASM() (*m)
 		: "ir" (1UL << bit), GCC_OFF12_ASM() (*m));
-#ifdef CONFIG_CPU_MIPSR2
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 	} else if (kernel_uses_llsc && __builtin_constant_p(bit)) {
 		do {
 			__asm__ __volatile__(
@@ -91,11 +92,11 @@ static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
 			: "=&r" (temp), "+" GCC_OFF12_ASM() (*m)
 			: "ir" (bit), "r" (~0));
 		} while (unlikely(!temp));
-#endif /* CONFIG_CPU_MIPSR2 */
+#endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
 	} else if (kernel_uses_llsc) {
 		do {
 			__asm__ __volatile__(
-			"	.set	arch=r4000			\n"
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL "%0, %1		# set_bit	\n"
 			"	or	%0, %2				\n"
 			"	" __SC	"%0, %1				\n"
@@ -133,7 +134,7 @@ static inline void clear_bit(unsigned long nr, volatile unsigned long *addr)
 		"	.set	mips0					\n"
 		: "=&r" (temp), "+" GCC_OFF12_ASM() (*m)
 		: "ir" (~(1UL << bit)));
-#ifdef CONFIG_CPU_MIPSR2
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 	} else if (kernel_uses_llsc && __builtin_constant_p(bit)) {
 		do {
 			__asm__ __volatile__(
@@ -143,11 +144,11 @@ static inline void clear_bit(unsigned long nr, volatile unsigned long *addr)
 			: "=&r" (temp), "+" GCC_OFF12_ASM() (*m)
 			: "ir" (bit));
 		} while (unlikely(!temp));
-#endif /* CONFIG_CPU_MIPSR2 */
+#endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
 	} else if (kernel_uses_llsc) {
 		do {
 			__asm__ __volatile__(
-			"	.set	arch=r4000			\n"
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL "%0, %1		# clear_bit	\n"
 			"	and	%0, %2				\n"
 			"	" __SC "%0, %1				\n"
@@ -205,7 +206,7 @@ static inline void change_bit(unsigned long nr, volatile unsigned long *addr)
 
 		do {
 			__asm__ __volatile__(
-			"	.set	arch=r4000			\n"
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL "%0, %1		# change_bit	\n"
 			"	xor	%0, %2				\n"
 			"	" __SC	"%0, %1				\n"
@@ -254,7 +255,7 @@ static inline int test_and_set_bit(unsigned long nr,
 
 		do {
 			__asm__ __volatile__(
-			"	.set	arch=r4000			\n"
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL "%0, %1	# test_and_set_bit	\n"
 			"	or	%2, %0, %3			\n"
 			"	" __SC	"%2, %1				\n"
@@ -308,7 +309,7 @@ static inline int test_and_set_bit_lock(unsigned long nr,
 
 		do {
 			__asm__ __volatile__(
-			"	.set	arch=r4000			\n"
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL "%0, %1	# test_and_set_bit	\n"
 			"	or	%2, %0, %3			\n"
 			"	" __SC	"%2, %1				\n"
@@ -358,7 +359,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		: "=&r" (temp), "+" GCC_OFF12_ASM() (*m), "=&r" (res)
 		: "r" (1UL << bit)
 		: "memory");
-#ifdef CONFIG_CPU_MIPSR2
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 	} else if (kernel_uses_llsc && __builtin_constant_p(nr)) {
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
@@ -380,7 +381,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 
 		do {
 			__asm__ __volatile__(
-			"	.set	arch=r4000			\n"
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL	"%0, %1 # test_and_clear_bit	\n"
 			"	or	%2, %0, %3			\n"
 			"	xor	%2, %3				\n"
@@ -437,7 +438,7 @@ static inline int test_and_change_bit(unsigned long nr,
 
 		do {
 			__asm__ __volatile__(
-			"	.set	arch=r4000			\n"
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL	"%0, %1 # test_and_change_bit	\n"
 			"	xor	%2, %0, %3			\n"
 			"	" __SC	"\t%2, %1			\n"
@@ -485,7 +486,7 @@ static inline unsigned long __fls(unsigned long word)
 	    __builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
 		__asm__(
 		"	.set	push					\n"
-		"	.set	mips32					\n"
+		"	.set	"MIPS_ISA_LEVEL"			\n"
 		"	clz	%0, %1					\n"
 		"	.set	pop					\n"
 		: "=r" (num)
@@ -498,7 +499,7 @@ static inline unsigned long __fls(unsigned long word)
 	    __builtin_constant_p(cpu_has_mips64) && cpu_has_mips64) {
 		__asm__(
 		"	.set	push					\n"
-		"	.set	mips64					\n"
+		"	.set	"MIPS_ISA_LEVEL"			\n"
 		"	dclz	%0, %1					\n"
 		"	.set	pop					\n"
 		: "=r" (num)
@@ -562,7 +563,7 @@ static inline int fls(int x)
 	if (__builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
 		__asm__(
 		"	.set	push					\n"
-		"	.set	mips32					\n"
+		"	.set	"MIPS_ISA_LEVEL"			\n"
 		"	clz	%0, %1					\n"
 		"	.set	pop					\n"
 		: "=r" (x)
-- 
2.2.1
