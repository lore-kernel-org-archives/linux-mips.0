Received: from mailapp01.imgtec.com ([195.59.15.196]:2543 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008132AbbCEA7Vg9SfG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 Mar 2015 01:59:21 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 02/15] MIPS: Fall back to generic implementation of cmpxchg64 on 32-bit platforms
Date: Wed, 4 Mar 2015 16:58:44 -0800
Message-ID: <1425517137-26463-3-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20150305005844.JdrjIFqAqand6OaR1C8mW-D-ud9XLwwxY52k7WElrYM@z>

This is in preparation of adding HAVE_VIRT_CPU_ACCOUNTING_GEN support in
the next patch.

Without having cmpxchg64 to use the generic implementation, kernel linking
will complain:

kernel/built-in.o: In function `cputime_adjust':
cputime.c:(.text+0x33748): undefined reference to `__cmpxchg_called_with_bad_pointer'
cputime.c:(.text+0x33810): undefined reference to `__cmpxchg_called_with_bad_pointer'

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/include/asm/cmpxchg.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index d0a2a68..412f945 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -229,21 +229,22 @@ extern void __cmpxchg_called_with_bad_pointer(void);
 #define cmpxchg(ptr, old, new)		__cmpxchg(ptr, old, new, smp_mb__before_llsc(), smp_llsc_mb())
 #define cmpxchg_local(ptr, old, new)	__cmpxchg(ptr, old, new, , )
 
-#define cmpxchg64(ptr, o, n)						\
+#ifdef CONFIG_64BIT
+#define cmpxchg64_local(ptr, o, n)					\
   ({									\
 	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	cmpxchg((ptr), (o), (n));					\
+	cmpxchg_local((ptr), (o), (n));					\
   })
 
-#ifdef CONFIG_64BIT
-#define cmpxchg64_local(ptr, o, n)					\
+#define cmpxchg64(ptr, o, n)						\
   ({									\
 	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	cmpxchg_local((ptr), (o), (n));					\
+	cmpxchg((ptr), (o), (n));					\
   })
 #else
 #include <asm-generic/cmpxchg-local.h>
 #define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
+#define cmpxchg64(ptr, o, n) cmpxchg64_local((ptr), (o), (n))
 #endif
 
 #endif /* __ASM_CMPXCHG_H */
-- 
1.8.5.3
