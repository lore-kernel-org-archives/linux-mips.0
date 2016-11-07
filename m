Received: from mailapp01.imgtec.com ([195.59.15.196]:8530 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992214AbcKGLTugsMTd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:19:50 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 6/7] MIPS: memcpy: Use a3/$7 for source end address
Date: Mon, 7 Nov 2016 11:18:01 +0000
Message-ID: <20161107111802.12071-7-paul.burton@imgtec.com>
In-Reply-To: <20161107111802.12071-1-paul.burton@imgtec.com>
References: <20161107111802.12071-1-paul.burton@imgtec.com>
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
Message-ID: <20161107111801.k7pxR07tpVVfvTeIfXryA8VNjcU14BHgIqCI9LByNZU@z>

Instead of using the at/$1 register (which does not form part of the
typical calling convention) to provide the end of the source region to
__copy_user* functions, use the a3/$7 register. This prepares us for
being able to call __copy_user* with a standard function call.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/cavium-octeon/octeon-memcpy.S |  8 ++++----
 arch/mips/include/asm/uaccess.h         | 21 ++++++++++++---------
 arch/mips/lib/memcpy.S                  |  8 ++++----
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-memcpy.S b/arch/mips/cavium-octeon/octeon-memcpy.S
index db49fca..9316ab1 100644
--- a/arch/mips/cavium-octeon/octeon-memcpy.S
+++ b/arch/mips/cavium-octeon/octeon-memcpy.S
@@ -57,13 +57,13 @@
 
 /*
  * The exception handler for loads requires that:
- *  1- AT contain the address of the byte just past the end of the source
+ *  1- a3 contain the address of the byte just past the end of the source
  *     of the copy,
- *  2- src_entry <= src < AT, and
+ *  2- src_entry <= src < a3, and
  *  3- (dst - src) == (dst_entry - src_entry),
  * The _entry suffix denotes values when __copy_user was called.
  *
- * (1) is set up up by uaccess.h and maintained by not writing AT in copy_user
+ * (1) is set up up by uaccess.h and maintained by not writing a3 in copy_user
  * (2) is met by incrementing src by the number of bytes copied
  * (3) is met by not doing loads between a pair of increments of dst and src
  *
@@ -386,7 +386,7 @@ EXC(	lb	t1, 0(src),	l_exc)
 l_exc:
 	LOAD	t0, TI_TASK($28)
 	LOAD	t0, THREAD_BUADDR(t0)	# t0 is just past last good address
-	SUB	len, AT, t0		# len number of uncopied bytes
+	SUB	len, a3, t0		# len number of uncopied bytes
 	bnez	ta0, 2f		/* Skip the zeroing out part if inatomic */
 	/*
 	 * Here's where we rely on src and dst being incremented in tandem,
diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 81d632f..562ad49 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -809,7 +809,8 @@ extern void __put_user_unaligned_unknown(void);
 #define DADDI_SCRATCH "$0"
 #endif
 
-extern size_t __copy_user(void *__to, const void *__from, size_t __n);
+extern size_t __copy_user(void *__to, const void *__from, size_t __n,
+			  const void *__from_end);
 
 #ifndef CONFIG_EVA
 #define __invoke_copy_to_user(to, from, n)				\
@@ -874,7 +875,8 @@ extern size_t __copy_user(void *__to, const void *__from, size_t __n);
 	__cu_len;							\
 })
 
-extern size_t __copy_user_inatomic(void *__to, const void *__from, size_t __n);
+extern size_t __copy_user_inatomic(void *__to, const void *__from, size_t __n,
+				   const void *__from_end);
 
 #define __copy_to_user_inatomic(to, from, n)				\
 ({									\
@@ -977,7 +979,7 @@ extern size_t __copy_user_inatomic(void *__to, const void *__from, size_t __n);
 	".set\tnoreorder\n\t"						\
 	__MODULE_JAL(__copy_user)					\
 	".set\tnoat\n\t"						\
-	__UA_ADDU "\t$1, %1, %2\n\t"					\
+	__UA_ADDU "\t$7, %1, %2\n\t"					\
 	".set\tat\n\t"							\
 	".set\treorder"							\
 	: "=r"(__cu_ret_r), "+r" (__cu_to_r),				\
@@ -1013,7 +1015,7 @@ extern size_t __copy_user_inatomic(void *__to, const void *__from, size_t __n);
 	".set\tnoreorder\n\t"						\
 	__MODULE_JAL(__copy_user_inatomic)				\
 	".set\tnoat\n\t"						\
-	__UA_ADDU "\t$1, %1, %2\n\t"					\
+	__UA_ADDU "\t$7, %1, %2\n\t"					\
 	".set\tat\n\t"							\
 	".set\treorder"							\
 	: "=r"(__cu_ret_r), "+r" (__cu_to_r),				\
@@ -1032,12 +1034,13 @@ extern size_t __copy_user_inatomic(void *__to, const void *__from, size_t __n);
 /* EVA specific functions */
 
 extern size_t __copy_user_inatomic_eva(void *__to, const void *__from,
-				       size_t __n);
+				       size_t __n, const void *__from_end);
 extern size_t __copy_from_user_eva(void *__to, const void *__from,
-				   size_t __n);
+				   size_t __n, const void *__from_end);
 extern size_t __copy_to_user_eva(void *__to, const void *__from,
-				 size_t __n);
-extern size_t __copy_in_user_eva(void *__to, const void *__from, size_t __n);
+				 size_t __n, const void *__from_end);
+extern size_t __copy_in_user_eva(void *__to, const void *__from, size_t __n,
+				 const void *__from_end);
 
 #define __invoke_copy_from_user_eva_generic(to, from, n, func_ptr)	\
 ({									\
@@ -1053,7 +1056,7 @@ extern size_t __copy_in_user_eva(void *__to, const void *__from, size_t __n);
 	".set\tnoreorder\n\t"						\
 	__MODULE_JAL(func_ptr)						\
 	".set\tnoat\n\t"						\
-	__UA_ADDU "\t$1, %1, %2\n\t"					\
+	__UA_ADDU "\t$7, %1, %2\n\t"					\
 	".set\tat\n\t"							\
 	".set\treorder"							\
 	: "=r"(__cu_ret_r), "+r" (__cu_to_r),				\
diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index 48684c4..5af9f03 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -70,13 +70,13 @@
 
 /*
  * The exception handler for loads requires that:
- *  1- AT contain the address of the byte just past the end of the source
+ *  1- a3 contain the address of the byte just past the end of the source
  *     of the copy,
- *  2- src_entry <= src < AT, and
+ *  2- src_entry <= src < a3, and
  *  3- (dst - src) == (dst_entry - src_entry),
  * The _entry suffix denotes values when __copy_user was called.
  *
- * (1) is set up up by uaccess.h and maintained by not writing AT in copy_user
+ * (1) is set up up by uaccess.h and maintained by not writing a3 in copy_user
  * (2) is met by incrementing src by the number of bytes copied
  * (3) is met by not doing loads between a pair of increments of dst and src
  *
@@ -549,7 +549,7 @@
 	 nop
 	LOADK	t0, THREAD_BUADDR(t0)	# t0 is just past last good address
 	 nop
-	SUB	len, AT, t0		# len number of uncopied bytes
+	SUB	len, a3, t0		# len number of uncopied bytes
 	bnez	ta2, .Ldone\@	/* Skip the zeroing part if inatomic */
 	/*
 	 * Here's where we rely on src and dst being incremented in tandem,
-- 
2.10.2
