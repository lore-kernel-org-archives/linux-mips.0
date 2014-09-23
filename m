Received: from mail-yh0-f51.google.com ([209.85.213.51]:57350 "EHLO
        mail-yh0-f51.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27009492AbaIWOaQ2eSYK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 23 Sep 2014 16:30:16 +0200
From: Pranith Kumar <bobby.prani@gmail.com>
Subject: [PATCH] atomic_read: Use ACCESS_ONCE() instead of cast to volatile
Date: Tue, 23 Sep 2014 10:29:50 -0400
Message-ID: <1411482607-20948-1-git-send-email-bobby.prani@gmail.com>
Return-Path: <bobby.prani@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, David Howells <dhowells@redhat.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Hirokazu Takata <takata@linux-m32r.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Chen Gang <gang.chen@asianux.com>, Victor Kamensky <victor.kamensky@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, "Maciej W. Rozycki" <macro@codesourcery.com>, Sam Ravnborg <sam@ravnborg.org>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, "open list:CRIS PORT" <linux-cris-kernel@axis.com>, "open list:IA64 Itanium PL..." <linux-ia64@vger.kernel.org>, "moderated list:M32R ARCHITECTURE" <linux-m32r@ml.linux-m32r.org>, "open list:M32R ARCHITECTURE" <linux-m32r-ja@ml.linux-m32r.org>, "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, "open list:MIPS" <linux-mips@linux-mips.org>, "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, "open list:TENSILICA XTENSA..." <linux-xtensa@linux-xtensa.org>, "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>
Message-ID: <20140923142950.Ipfuby_RjTsNFHh8I7pHm_KjE-T_7Mw2Y030Eh0xmAI@z>

Use the much reader friendly ACCESS_ONCE() instead of the cast to volatile. This
is purely a style change.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 arch/alpha/include/asm/atomic.h    | 4 ++--
 arch/arm/include/asm/atomic.h      | 2 +-
 arch/arm64/include/asm/atomic.h    | 4 ++--
 arch/avr32/include/asm/atomic.h    | 2 +-
 arch/cris/include/asm/atomic.h     | 2 +-
 arch/frv/include/asm/atomic.h      | 2 +-
 arch/ia64/include/asm/atomic.h     | 4 ++--
 arch/m32r/include/asm/atomic.h     | 2 +-
 arch/m68k/include/asm/atomic.h     | 2 +-
 arch/mips/include/asm/atomic.h     | 4 ++--
 arch/parisc/include/asm/atomic.h   | 4 ++--
 arch/sh/include/asm/atomic.h       | 2 +-
 arch/sparc/include/asm/atomic_32.h | 2 +-
 arch/sparc/include/asm/atomic_64.h | 4 ++--
 arch/x86/include/asm/atomic.h      | 2 +-
 arch/x86/include/asm/atomic64_64.h | 2 +-
 arch/xtensa/include/asm/atomic.h   | 2 +-
 include/asm-generic/atomic.h       | 2 +-
 18 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/alpha/include/asm/atomic.h b/arch/alpha/include/asm/atomic.h
index 6fbb53a..8f8eafb 100644
--- a/arch/alpha/include/asm/atomic.h
+++ b/arch/alpha/include/asm/atomic.h
@@ -17,8 +17,8 @@
 #define ATOMIC_INIT(i)		{ (i) }
 #define ATOMIC64_INIT(i)	{ (i) }
 
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
-#define atomic64_read(v)	(*(volatile long *)&(v)->counter)
+#define atomic_read(v)		ACCESS_ONCE((v)->counter)
+#define atomic64_read(v)	ACCESS_ONCE((v)->counter)
 
 #define atomic_set(v,i)		((v)->counter = (i))
 #define atomic64_set(v,i)	((v)->counter = (i))
diff --git a/arch/arm/include/asm/atomic.h b/arch/arm/include/asm/atomic.h
index 832f1cd..e22c119 100644
--- a/arch/arm/include/asm/atomic.h
+++ b/arch/arm/include/asm/atomic.h
@@ -27,7 +27,7 @@
  * strex/ldrex monitor on some implementations. The reason we can use it for
  * atomic_set() is the clrex or dummy strex done on every exception return.
  */
-#define atomic_read(v)	(*(volatile int *)&(v)->counter)
+#define atomic_read(v)	ACCESS_ONCE((v)->counter)
 #define atomic_set(v,i)	(((v)->counter) = (i))
 
 #if __LINUX_ARM_ARCH__ >= 6
diff --git a/arch/arm64/include/asm/atomic.h b/arch/arm64/include/asm/atomic.h
index b83c325..7047051 100644
--- a/arch/arm64/include/asm/atomic.h
+++ b/arch/arm64/include/asm/atomic.h
@@ -35,7 +35,7 @@
  * strex/ldrex monitor on some implementations. The reason we can use it for
  * atomic_set() is the clrex or dummy strex done on every exception return.
  */
-#define atomic_read(v)	(*(volatile int *)&(v)->counter)
+#define atomic_read(v)	ACCESS_ONCE((v)->counter)
 #define atomic_set(v,i)	(((v)->counter) = (i))
 
 /*
@@ -139,7 +139,7 @@ static inline int __atomic_add_unless(atomic_t *v, int a, int u)
  */
 #define ATOMIC64_INIT(i) { (i) }
 
-#define atomic64_read(v)	(*(volatile long *)&(v)->counter)
+#define atomic64_read(v)	ACCESS_ONCE((v)->counter)
 #define atomic64_set(v,i)	(((v)->counter) = (i))
 
 #define ATOMIC64_OP(op, asm_op)						\
diff --git a/arch/avr32/include/asm/atomic.h b/arch/avr32/include/asm/atomic.h
index 83e980a..2d07ce1 100644
--- a/arch/avr32/include/asm/atomic.h
+++ b/arch/avr32/include/asm/atomic.h
@@ -19,7 +19,7 @@
 
 #define ATOMIC_INIT(i)  { (i) }
 
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
+#define atomic_read(v)		ACCESS_ONCE((v)->counter)
 #define atomic_set(v, i)	(((v)->counter) = i)
 
 #define ATOMIC_OP_RETURN(op, asm_op, asm_con)				\
diff --git a/arch/cris/include/asm/atomic.h b/arch/cris/include/asm/atomic.h
index 0033f9d..279766a 100644
--- a/arch/cris/include/asm/atomic.h
+++ b/arch/cris/include/asm/atomic.h
@@ -17,7 +17,7 @@
 
 #define ATOMIC_INIT(i)  { (i) }
 
-#define atomic_read(v) (*(volatile int *)&(v)->counter)
+#define atomic_read(v) ACCESS_ONCE((v)->counter)
 #define atomic_set(v,i) (((v)->counter) = (i))
 
 /* These should be written in asm but we do it in C for now. */
diff --git a/arch/frv/include/asm/atomic.h b/arch/frv/include/asm/atomic.h
index f6c3a16..102190a 100644
--- a/arch/frv/include/asm/atomic.h
+++ b/arch/frv/include/asm/atomic.h
@@ -31,7 +31,7 @@
  */
 
 #define ATOMIC_INIT(i)		{ (i) }
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
+#define atomic_read(v)		ACCESS_ONCE((v)->counter)
 #define atomic_set(v, i)	(((v)->counter) = (i))
 
 #ifndef CONFIG_FRV_OUTOFLINE_ATOMIC_OPS
diff --git a/arch/ia64/include/asm/atomic.h b/arch/ia64/include/asm/atomic.h
index 42919a8..0bf0350 100644
--- a/arch/ia64/include/asm/atomic.h
+++ b/arch/ia64/include/asm/atomic.h
@@ -21,8 +21,8 @@
 #define ATOMIC_INIT(i)		{ (i) }
 #define ATOMIC64_INIT(i)	{ (i) }
 
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
-#define atomic64_read(v)	(*(volatile long *)&(v)->counter)
+#define atomic_read(v)		ACCESS_ONCE((v)->counter)
+#define atomic64_read(v)	ACCESS_ONCE((v)->counter)
 
 #define atomic_set(v,i)		(((v)->counter) = (i))
 #define atomic64_set(v,i)	(((v)->counter) = (i))
diff --git a/arch/m32r/include/asm/atomic.h b/arch/m32r/include/asm/atomic.h
index 3946b2c..31bb74a 100644
--- a/arch/m32r/include/asm/atomic.h
+++ b/arch/m32r/include/asm/atomic.h
@@ -28,7 +28,7 @@
  *
  * Atomically reads the value of @v.
  */
-#define atomic_read(v)	(*(volatile int *)&(v)->counter)
+#define atomic_read(v)	ACCESS_ONCE((v)->counter)
 
 /**
  * atomic_set - set atomic variable
diff --git a/arch/m68k/include/asm/atomic.h b/arch/m68k/include/asm/atomic.h
index 663d4ba..e85f047 100644
--- a/arch/m68k/include/asm/atomic.h
+++ b/arch/m68k/include/asm/atomic.h
@@ -17,7 +17,7 @@
 
 #define ATOMIC_INIT(i)	{ (i) }
 
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
+#define atomic_read(v)		ACCESS_ONCE((v)->counter)
 #define atomic_set(v, i)	(((v)->counter) = i)
 
 /*
diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index f3ee721..6dd6bfc 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -29,7 +29,7 @@
  *
  * Atomically reads the value of @v.
  */
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
+#define atomic_read(v)		ACCESS_ONCE((v)->counter)
 
 /*
  * atomic_set - set atomic variable
@@ -306,7 +306,7 @@ static __inline__ int __atomic_add_unless(atomic_t *v, int a, int u)
  * @v: pointer of type atomic64_t
  *
  */
-#define atomic64_read(v)	(*(volatile long *)&(v)->counter)
+#define atomic64_read(v)	ACCESS_ONCE((v)->counter)
 
 /*
  * atomic64_set - set atomic variable
diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index 219750b..226f8ca 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -67,7 +67,7 @@ static __inline__ void atomic_set(atomic_t *v, int i)
 
 static __inline__ int atomic_read(const atomic_t *v)
 {
-	return (*(volatile int *)&(v)->counter);
+	return ACCESS_ONCE((v)->counter);
 }
 
 /* exported interface */
@@ -204,7 +204,7 @@ atomic64_set(atomic64_t *v, s64 i)
 static __inline__ s64
 atomic64_read(const atomic64_t *v)
 {
-	return (*(volatile long *)&(v)->counter);
+	return ACCESS_ONCE((v)->counter);
 }
 
 #define atomic64_inc(v)		(atomic64_add(   1,(v)))
diff --git a/arch/sh/include/asm/atomic.h b/arch/sh/include/asm/atomic.h
index f57b8a6..05b9f74 100644
--- a/arch/sh/include/asm/atomic.h
+++ b/arch/sh/include/asm/atomic.h
@@ -14,7 +14,7 @@
 
 #define ATOMIC_INIT(i)	{ (i) }
 
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
+#define atomic_read(v)		ACCESS_ONCE((v)->counter)
 #define atomic_set(v,i)		((v)->counter = (i))
 
 #if defined(CONFIG_GUSA_RB)
diff --git a/arch/sparc/include/asm/atomic_32.h b/arch/sparc/include/asm/atomic_32.h
index 7b024f0..765c177 100644
--- a/arch/sparc/include/asm/atomic_32.h
+++ b/arch/sparc/include/asm/atomic_32.h
@@ -26,7 +26,7 @@ int atomic_cmpxchg(atomic_t *, int, int);
 int __atomic_add_unless(atomic_t *, int, int);
 void atomic_set(atomic_t *, int);
 
-#define atomic_read(v)          (*(volatile int *)&(v)->counter)
+#define atomic_read(v)          ACCESS_ONCE((v)->counter)
 
 #define atomic_add(i, v)	((void)atomic_add_return( (int)(i), (v)))
 #define atomic_sub(i, v)	((void)atomic_add_return(-(int)(i), (v)))
diff --git a/arch/sparc/include/asm/atomic_64.h b/arch/sparc/include/asm/atomic_64.h
index 7e4ca1e..4082749 100644
--- a/arch/sparc/include/asm/atomic_64.h
+++ b/arch/sparc/include/asm/atomic_64.h
@@ -14,8 +14,8 @@
 #define ATOMIC_INIT(i)		{ (i) }
 #define ATOMIC64_INIT(i)	{ (i) }
 
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
-#define atomic64_read(v)	(*(volatile long *)&(v)->counter)
+#define atomic_read(v)		ACCESS_ONCE((v)->counter)
+#define atomic64_read(v)	ACCESS_ONCE((v)->counter)
 
 #define atomic_set(v, i)	(((v)->counter) = i)
 #define atomic64_set(v, i)	(((v)->counter) = i)
diff --git a/arch/x86/include/asm/atomic.h b/arch/x86/include/asm/atomic.h
index bf20c81..5e5cd12 100644
--- a/arch/x86/include/asm/atomic.h
+++ b/arch/x86/include/asm/atomic.h
@@ -24,7 +24,7 @@
  */
 static inline int atomic_read(const atomic_t *v)
 {
-	return (*(volatile int *)&(v)->counter);
+	return ACCESS_ONCE((v)->counter);
 }
 
 /**
diff --git a/arch/x86/include/asm/atomic64_64.h b/arch/x86/include/asm/atomic64_64.h
index 46e9052..f8d273e 100644
--- a/arch/x86/include/asm/atomic64_64.h
+++ b/arch/x86/include/asm/atomic64_64.h
@@ -18,7 +18,7 @@
  */
 static inline long atomic64_read(const atomic64_t *v)
 {
-	return (*(volatile long *)&(v)->counter);
+	return ACCESS_ONCE((v)->counter);
 }
 
 /**
diff --git a/arch/xtensa/include/asm/atomic.h b/arch/xtensa/include/asm/atomic.h
index 6266766..00b7d46 100644
--- a/arch/xtensa/include/asm/atomic.h
+++ b/arch/xtensa/include/asm/atomic.h
@@ -47,7 +47,7 @@
  *
  * Atomically reads the value of @v.
  */
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
+#define atomic_read(v)		ACCESS_ONCE((v)->counter)
 
 /**
  * atomic_set - set atomic variable
diff --git a/include/asm-generic/atomic.h b/include/asm-generic/atomic.h
index 56d4d36..1973ad2 100644
--- a/include/asm-generic/atomic.h
+++ b/include/asm-generic/atomic.h
@@ -126,7 +126,7 @@ ATOMIC_OP(or, |)
  * Atomically reads the value of @v.
  */
 #ifndef atomic_read
-#define atomic_read(v)	(*(volatile int *)&(v)->counter)
+#define atomic_read(v)	ACCESS_ONCE((v)->counter)
 #endif
 
 /**
-- 
2.1.0
