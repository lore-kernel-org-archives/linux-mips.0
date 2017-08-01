Received: from mailapp01.imgtec.com ([195.59.15.196]:2243 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994826AbdHAUdXZ-qgJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Aug 2017 22:33:23 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] Revert "MIPS: Don't unnecessarily include kmalloc.h into <asm/cache.h>."
Date: Tue, 1 Aug 2017 13:32:57 -0700
Message-ID: <20170801203257.31897-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, stable <stable@vger.kernel.org>
Message-ID: <20170801203257.DCDNjqYu2nn9BNklExO7KIdZl6EuOwHKUmV75tywxyc@z>

Commit 296e46db0073 ("MIPS: Don't unnecessarily include kmalloc.h into
<asm/cache.h>.") claimed that the inclusion of the machine's kmalloc.h
from asm/cache.h is unnecessary, but this is not true.

Without including kmalloc.h we don't get a definition for
ARCH_DMA_MINALIGN, which means we no longer suitably align DMA. Further
to this the definition of ARCH_KMALLOC_MINALIGN provided by linux/slab.h
ends up being set to the alignment of an unsigned long long value rather
than to ARCH_DMA_MINALIGN, which means that buffers allocated using
kmalloc may no longer be safely aligned for use with DMA.

Fix this by re-adding the include of kmalloc.h in asm/cache.h. This
reverts commit 296e46db0073 ("MIPS: Don't unnecessarily include
kmalloc.h into <asm/cache.h>.")

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: 296e46db0073 ("MIPS: Don't unnecessarily include kmalloc.h into <asm/cache.h>.")
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: stable <stable@vger.kernel.org> # v4.12+
---

Hi Ralf,

This causes issues with DMA on various systems - please could you merge
it ASAP? It would be great if you submitted your patches to the list for
review in future, since nobody had any opportunity to spot that this
change was broken before you merged it...

Thanks,
    Paul
---
 arch/mips/include/asm/cache.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/cache.h b/arch/mips/include/asm/cache.h
index fc67947ed658..8b14c2706aa5 100644
--- a/arch/mips/include/asm/cache.h
+++ b/arch/mips/include/asm/cache.h
@@ -9,6 +9,8 @@
 #ifndef _ASM_CACHE_H
 #define _ASM_CACHE_H
 
+#include <kmalloc.h>
+
 #define L1_CACHE_SHIFT		CONFIG_MIPS_L1_CACHE_SHIFT
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
-- 
2.13.3
