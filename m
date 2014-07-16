Received: from mailapp01.imgtec.com ([195.59.15.196]:4607 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861305AbaGPPvz2Vv23 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jul 2014 17:51:55 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 2/4] arm64: use generic dma-contiguous.h
Date: Wed, 16 Jul 2014 16:51:30 +0100
Message-ID: <1405525892-60383-3-git-send-email-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <1405525892-60383-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1405525892-60383-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, catalin.marinas@arm.com, will.deacon@arm.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, arnd@arndb.de, gregkh@linuxfoundation.org, m.szyprowski@samsung.com, mina86@mina86.com
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-arch@vger.kernel.org
Message-ID: <20140716155130.o-08y7ew-n_aTOGMPjLW9tLiFct7Vq2mUTlwYp2_BVk@z>

dma-contiguous.h is now in asm-generic. Use that to avoid code
repetition in arm64.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 arch/arm64/include/asm/Kbuild           |  1 +
 arch/arm64/include/asm/dma-contiguous.h | 28 ----------------------------
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 arch/arm64/include/asm/dma-contiguous.h

diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
index 0b3fcf8..92bf7cb 100644
--- a/arch/arm64/include/asm/Kbuild
+++ b/arch/arm64/include/asm/Kbuild
@@ -9,6 +9,7 @@ generic-y += current.h
 generic-y += delay.h
 generic-y += div64.h
 generic-y += dma.h
+generic-y += dma-contiguous.h
 generic-y += emergency-restart.h
 generic-y += early_ioremap.h
 generic-y += errno.h
diff --git a/arch/arm64/include/asm/dma-contiguous.h b/arch/arm64/include/asm/dma-contiguous.h
deleted file mode 100644
index 14c4c0c..0000000
--- a/arch/arm64/include/asm/dma-contiguous.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- * Copyright (c) 2013, The Linux Foundation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 and
- * only version 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef _ASM_DMA_CONTIGUOUS_H
-#define _ASM_DMA_CONTIGUOUS_H
-
-#ifdef __KERNEL__
-#ifdef CONFIG_DMA_CMA
-
-#include <linux/types.h>
-
-static inline void
-dma_contiguous_early_fixup(phys_addr_t base, unsigned long size) { }
-
-#endif
-#endif
-
-#endif
-- 
1.9.1
