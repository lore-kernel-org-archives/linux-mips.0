Received: from mailapp01.imgtec.com ([195.59.15.196]:50578 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993963AbdFJA2RXORut (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 10 Jun 2017 02:28:17 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 04/11] MIPS: cmpxchg: Error out on unsupported xchg() calls
Date: Fri, 9 Jun 2017 17:26:36 -0700
Message-ID: <20170610002644.8434-5-paul.burton@imgtec.com>
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
Message-ID: <20170610002636.fZ1J7LhPZdbm0Dlbd6ZhCgytFc6m5WNV9IlAUwLQHlQ@z>

xchg() has up until now simply returned the x parameter in cases where
it is called with a pointer to a value of an unsupported size. This will
often cause the calling code to hit a failure path, presuming that the
value of x differs from the content of the memory pointed at by ptr, but
we can do better by producing a compile-time or link-time error such
that unsupported calls to xchg() are detectable earlier than runtime.

This patch does this in the same was as is already done for cmpxchg(),
using a call to a missing function annotated with __compiletime_error().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/include/asm/cmpxchg.h | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index ee0214e00ab1..fe652c3e5d8c 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -24,6 +24,21 @@
 # define __scbeqz "beqz"
 #endif
 
+/*
+ * These functions doesn't exist, so if they are called you'll either:
+ *
+ * - Get an error at compile-time due to __compiletime_error, if supported by
+ *   your compiler.
+ *
+ * or:
+ *
+ * - Get an error at link-time due to the call to the missing function.
+ */
+extern void __cmpxchg_called_with_bad_pointer(void)
+	__compiletime_error("Bad argument size for cmpxchg");
+extern unsigned long __xchg_called_with_bad_pointer(void)
+	__compiletime_error("Bad argument size for xchg");
+
 #define __xchg_asm(ld, st, m, val)					\
 ({									\
 	__typeof(*(m)) __ret;						\
@@ -89,9 +104,9 @@ static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int siz
 		return __xchg_u32(ptr, x);
 	case 8:
 		return __xchg_u64(ptr, x);
+	default:
+		return __xchg_called_with_bad_pointer();
 	}
-
-	return x;
 }
 
 #define xchg(ptr, x)							\
@@ -136,19 +151,6 @@ static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int siz
 	__ret;								\
 })
 
-/*
- * This function doesn't exist, so if it is called you'll either:
- *
- * - Get an error at compile-time due to __compiletime_error, if supported by
- *   your compiler.
- *
- * or:
- *
- * - Get an error at link-time due to the call to the missing function.
- */
-extern void __cmpxchg_called_with_bad_pointer(void)
-	__compiletime_error("Bad argument size for cmpxchg");
-
 #define __cmpxchg(ptr, old, new, pre_barrier, post_barrier)		\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
-- 
2.13.1
