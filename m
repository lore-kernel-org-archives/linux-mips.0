Received: from multi.imgtec.com ([194.200.65.239]:44812 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6870565AbaA0U0V6vwKX (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:26:21 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 50/58] MIPS: mm: c-r4k: Flush scache to avoid cache aliases
Date: Mon, 27 Jan 2014 20:19:37 +0000
Message-ID: <1390853985-14246-51-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140127201937.f6HVg-1_tEV1NBbtwGlinYWXDlCNHnsrH72J0tBDm3o@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

There is a chance for the secondary cache to have memory
aliases. This can happen if the bootloader is in a non-EVA mode
(or even in EVA mode but with different mapping from the kernel)
and the kernel switching to EVA afterwards. It's best to flush
the icache to avoid having the secondary CPUs fetching stale
data from it.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/c-r4k.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5f8da6a..9761dfa 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -633,6 +633,17 @@ static inline void local_r4k_flush_icache_range(unsigned long start, unsigned lo
 			break;
 		}
 	}
+#ifdef CONFIG_EVA
+	/*
+	 * Due to all possible segment mappings, there might cache aliases
+	 * caused by the bootloader being in non-EVA mode, and the CPU switching
+	 * to EVA during early kernel init. It's best to flush the scache
+	 * to avoid having secondary cores fetching stale data and lead to
+	 * kernel crashes.
+	 */
+	bc_wback_inv(start, (end - start));
+	__sync();
+#endif
 }
 
 static inline void local_r4k_flush_icache_range_ipi(void *args)
-- 
1.8.5.3
