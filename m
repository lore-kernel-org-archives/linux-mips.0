Received: from mailapp01.imgtec.com ([195.59.15.196]:39852 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012529AbaKEIZwetFv0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 5 Nov 2014 09:25:52 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: asm: r4kcache: Add EVA case for protected_writeback_dcache_line
Date: Wed, 5 Nov 2014 08:25:37 +0000
Message-ID: <1415175937-23903-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20141105082537.oB1LCNT3JyOWParMh3hDzPq6tl5aU09qRVbYTFH4rIU@z>

Commit de8974e3f76c0 ("MIPS: asm: r4kcache: Add EVA cache flushing
functions") added cache function for EVA using the cachee instruction.
However, it didn't add a case for the protected_writeback_dcache_line.
mips_dsemul() calls r4k_flush_cache_sigtramp() which in turn uses
the protected_writeback_dcache_line() to flush the trampoline code
back to memory. This used the wrong "cache" instruction leading to
random userland crashes on non-FPU cores.

Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/r4kcache.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index 4520adc8699b..cd6e0afc6833 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -257,7 +257,11 @@ static inline void protected_flush_icache_line(unsigned long addr)
  */
 static inline void protected_writeback_dcache_line(unsigned long addr)
 {
+#ifdef CONFIG_EVA
+	protected_cachee_op(Hit_Writeback_Inv_D, addr);
+#else
 	protected_cache_op(Hit_Writeback_Inv_D, addr);
+#endif
 }
 
 static inline void protected_writeback_scache_line(unsigned long addr)
-- 
2.1.3
