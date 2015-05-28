Received: from mailapp01.imgtec.com ([195.59.15.196]:30233 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007644AbbE1Uhawvavz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 May 2015 22:37:30 +0200
Subject: [PATCH] MIPS: bugfix of local_r4k_flush_icache_range - added L2
 flush
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Thu, 28 May 2015 13:37:24 -0700
Message-ID: <20150528203724.28800.63700.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, david.daney@cavium.com, cernekee@gmail.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, macro@codesourcery.com, markos.chandras@imgtec.com, kumba@gentoo.org
Message-ID: <20150528203724.42DyarBACDZ7bUe1MPy1gKZeINm7JvAYOcE1SqMYM6o@z>

This function is used to flush code used in NMI and EJTAG debug exceptions.
However, during that exceptions the Status.ERL bit is set, which means
that code runs as UNCACHABLE. So, flush code down to memory is needed.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/mm/c-r4k.c |   10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 0dbb65a51ce5..9f0299bb9a2a 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -666,17 +666,9 @@ static inline void local_r4k_flush_icache_range(unsigned long start, unsigned lo
 			break;
 		}
 	}
-#ifdef CONFIG_EVA
-	/*
-	 * Due to all possible segment mappings, there might cache aliases
-	 * caused by the bootloader being in non-EVA mode, and the CPU switching
-	 * to EVA during early kernel init. It's best to flush the scache
-	 * to avoid having secondary cores fetching stale data and lead to
-	 * kernel crashes.
-	 */
+
 	bc_wback_inv(start, (end - start));
 	__sync();
-#endif
 }
 
 static inline void local_r4k_flush_icache_range_ipi(void *args)
