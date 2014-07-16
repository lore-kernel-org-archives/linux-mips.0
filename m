Received: from mailapp01.imgtec.com ([195.59.15.196]:9061 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861300AbaGPPvyVuJKj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jul 2014 17:51:54 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 1/4] asm-generic: Add dma-contiguous.h
Date: Wed, 16 Jul 2014 16:51:29 +0100
Message-ID: <1405525892-60383-2-git-send-email-Zubair.Kakakhel@imgtec.com>
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
Message-ID: <20140716155129.P0W_AvffXNmjSbJAiho8tK0JZunZDZ7Ld5pTJwHsl48@z>

This header is used by arm64 and x86 individually.

Adding to asm-generic to avoid further code repetition while adding cma
to mips.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 include/asm-generic/dma-contiguous.h | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 include/asm-generic/dma-contiguous.h

diff --git a/include/asm-generic/dma-contiguous.h b/include/asm-generic/dma-contiguous.h
new file mode 100644
index 0000000..292c571
--- /dev/null
+++ b/include/asm-generic/dma-contiguous.h
@@ -0,0 +1,9 @@
+#ifndef _ASM_GENERIC_DMA_CONTIGUOUS_H
+#define _ASM_GENERIC_DMA_CONTIGUOUS_H
+
+#include <linux/types.h>
+
+static inline void
+dma_contiguous_early_fixup(phys_addr_t base, unsigned long size) { }
+
+#endif
-- 
1.9.1
