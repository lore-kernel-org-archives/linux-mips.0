Received: from mail-da0-f44.google.com ([209.85.210.44]:41825 "EHLO
        mail-da0-f44.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6825727Ab3BZWggahll8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Feb 2013 23:36:36 +0100
From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH] MIPS: Fix logic errors in bitops.c
Date: Tue, 26 Feb 2013 14:35:23 -0800
Message-ID: <1361918123-19404-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: David Daney <david.daney@cavium.com>, Jim Quinlan <jim2101024@gmail.com>, stable@vger.kernel.org
Message-ID: <20130226223523.OOso03N3TJKsx5evS3UwVN2Dwz-OOKyS76oE_2yh7xE@z>

From: David Daney <david.daney@cavium.com>

commit 92d11594f6 (MIPS: Remove irqflags.h dependency from bitops.h)
factored some of the bitops code out into a separate file
(arch/mips/lib/bitops.c).  Unfortunately the logic converting a bit
mask into a boolean result was lost in some of the functions.  We had:

   int res;
   unsigned long shifted_result_bit;
   .
   .
   .
   res = shifted_result_bit;
   return res;

Which truncates off the high 32 bits (thus yielding an incorrect
value) on 64-bit systems.

The manifestation of this is that a non-SMP 64-bit kernel will not
boot as the bitmap operations in bootmem.c are all screwed up.

Signed-off-by: David Daney <david.daney@cavium.com>
Cc: Jim Quinlan <jim2101024@gmail.com>
Cc: <stable@vger.kernel.org>
---
 arch/mips/lib/bitops.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/lib/bitops.c b/arch/mips/lib/bitops.c
index 239a9c9..f3f7756 100644
--- a/arch/mips/lib/bitops.c
+++ b/arch/mips/lib/bitops.c
@@ -90,12 +90,12 @@ int __mips_test_and_set_bit(unsigned long nr,
 	unsigned bit = nr & SZLONG_MASK;
 	unsigned long mask;
 	unsigned long flags;
-	unsigned long res;
+	int res;
 
 	a += nr >> SZLONG_LOG;
 	mask = 1UL << bit;
 	raw_local_irq_save(flags);
-	res = (mask & *a);
+	res = (mask & *a) != 0;
 	*a |= mask;
 	raw_local_irq_restore(flags);
 	return res;
@@ -116,12 +116,12 @@ int __mips_test_and_set_bit_lock(unsigned long nr,
 	unsigned bit = nr & SZLONG_MASK;
 	unsigned long mask;
 	unsigned long flags;
-	unsigned long res;
+	int res;
 
 	a += nr >> SZLONG_LOG;
 	mask = 1UL << bit;
 	raw_local_irq_save(flags);
-	res = (mask & *a);
+	res = (mask & *a) != 0;
 	*a |= mask;
 	raw_local_irq_restore(flags);
 	return res;
@@ -141,12 +141,12 @@ int __mips_test_and_clear_bit(unsigned long nr, volatile unsigned long *addr)
 	unsigned bit = nr & SZLONG_MASK;
 	unsigned long mask;
 	unsigned long flags;
-	unsigned long res;
+	int res;
 
 	a += nr >> SZLONG_LOG;
 	mask = 1UL << bit;
 	raw_local_irq_save(flags);
-	res = (mask & *a);
+	res = (mask & *a) != 0;
 	*a &= ~mask;
 	raw_local_irq_restore(flags);
 	return res;
@@ -166,12 +166,12 @@ int __mips_test_and_change_bit(unsigned long nr, volatile unsigned long *addr)
 	unsigned bit = nr & SZLONG_MASK;
 	unsigned long mask;
 	unsigned long flags;
-	unsigned long res;
+	int res;
 
 	a += nr >> SZLONG_LOG;
 	mask = 1UL << bit;
 	raw_local_irq_save(flags);
-	res = (mask & *a);
+	res = (mask & *a) != 0;
 	*a ^= mask;
 	raw_local_irq_restore(flags);
 	return res;
-- 
1.7.11.7
