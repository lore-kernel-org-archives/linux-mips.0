Received: from mailapp01.imgtec.com ([195.59.15.196]:59995 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010762AbbGaPaOMfgiZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 31 Jul 2015 17:30:14 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: Flush RPS on kernel entry with EVA
Date: Fri, 31 Jul 2015 16:29:38 +0100
Message-ID: <1438356578-1749-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Leonid Yegoshin <leonid.yegoshin@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150731152938.ZXK26TGQOVa7J90qgaubetJbETa9RFnQzqrvSwFV0ZQ@z>

When EVA is enabled, flush the Return Prediction Stack (RPS) present on
some MIPS cores on entry to the kernel from user mode.

This is important specifically for interAptiv with EVA enabled,
otherwise kernel mode RPS mispredicts may trigger speculative fetches of
user return addresses, which may be sensitive in the kernel address
space due to EVA's overlapping user/kernel address spaces.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.15.x-
---
 arch/mips/include/asm/stackframe.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 28d6d9364bd1..a71da576883c 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -152,6 +152,31 @@
 		.set	noreorder
 		bltz	k0, 8f
 		 move	k1, sp
+#ifdef CONFIG_EVA
+		/*
+		 * Flush interAptiv's Return Prediction Stack (RPS) by writing
+		 * EntryHi. Toggling Config7.RPS is slower and less portable.
+		 *
+		 * The RPS isn't automatically flushed when exceptions are
+		 * taken, which can result in kernel mode speculative accesses
+		 * to user addresses if the RPS mispredicts. That's harmless
+		 * when user and kernel share the same address space, but with
+		 * EVA the same user segments may be unmapped to kernel mode,
+		 * even containing sensitive MMIO regions or invalid memory.
+		 *
+		 * This can happen when the kernel sets the return address to
+		 * ret_from_* and jr's to the exception handler, which looks
+		 * more like a tail call than a function call. If nested calls
+		 * don't evict the last user address in the RPS, it will
+		 * mispredict the return and fetch from a user controlled
+		 * address into the icache.
+		 *
+		 * More recent EVA-capable cores with MAAR to restrict
+		 * speculative accesses aren't affected.
+		 */
+		MFC0	k0, CP0_ENTRYHI
+		MTC0	k0, CP0_ENTRYHI
+#endif
 		.set	reorder
 		/* Called from user mode, new stack. */
 		get_saved_sp
-- 
2.3.6
