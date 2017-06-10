Received: from mailapp01.imgtec.com ([195.59.15.196]:16518 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993975AbdFJA3qTpNbt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 10 Jun 2017 02:29:46 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 09/11] MIPS: cmpxchg: Rearrange __xchg() arguments to match xchg()
Date: Fri, 9 Jun 2017 17:26:41 -0700
Message-ID: <20170610002644.8434-10-paul.burton@imgtec.com>
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
Message-ID: <20170610002641.cFyJh-7qZk3qg_zL3Bp5vIRfSrmYzuNdpFqV41M4vd8@z>

The __xchg() function declares its first 2 arguments in reverse order
compared to the xchg() macro, which is confusing & serves no purpose.
Reorder the arguments such that __xchg() & xchg() match.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/include/asm/cmpxchg.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index a633f61c5545..903f3bf48419 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -73,7 +73,8 @@ extern unsigned long __xchg_called_with_bad_pointer(void)
 extern unsigned long __xchg_small(volatile void *ptr, unsigned long val,
 				  unsigned int size);
 
-static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
+static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
+				   int size)
 {
 	switch (size) {
 	case 1:
@@ -101,7 +102,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int siz
 	smp_mb__before_llsc();						\
 									\
 	__res = (__typeof__(*(ptr)))					\
-		__xchg((unsigned long)(x), (ptr), sizeof(*(ptr)));	\
+		__xchg((ptr), (unsigned long)(x), sizeof(*(ptr)));	\
 									\
 	smp_llsc_mb();							\
 									\
-- 
2.13.1
