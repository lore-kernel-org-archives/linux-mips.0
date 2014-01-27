Received: from multi.imgtec.com ([194.200.65.239]:44755 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825879AbaA0UZ3NxFmw (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:25:29 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 43/58] MIPS: asm: page: Allow __pa_symbol overrides
Date: Mon, 27 Jan 2014 20:19:30 +0000
Message-ID: <1390853985-14246-44-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140127201930.gkO6G7L3xci220Op6LLhGRRTKEpdeti_RjdvJOWZRmg@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

This will allow platforms to use an alternative way to get
the physical address of a symbol.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/page.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 5e08bcc..5699ec3 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -190,7 +190,9 @@ typedef struct { unsigned long pgprot; } pgprot_t;
  * https://patchwork.linux-mips.org/patch/1541/
  */
 
+#ifndef __pa_symbol
 #define __pa_symbol(x)	__pa(RELOC_HIDE((unsigned long)(x), 0))
+#endif
 
 #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
 
-- 
1.8.5.3
