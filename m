Received: from mailapp01.imgtec.com ([195.59.15.196]:47439 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993969AbdHWSVPAMJSI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 20:21:15 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 09/11] MIPS: Remove __invalidate_kernel_vmap_range
Date: Wed, 23 Aug 2017 11:17:52 -0700
Message-ID: <20170823181754.24044-10-paul.burton@imgtec.com>
In-Reply-To: <20170823181754.24044-1-paul.burton@imgtec.com>
References: <20170823181754.24044-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, trivial@kernel.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170823181752.5kujsyOCPb4ui0CLIfi3CHsyoYcmKB3ot2ariesciM4@z>

The __invalidate_kernel_vmap_range function pointer global variable
isn't used anywhere. Remove it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/mm/cache.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 0324e1085b16..44ac64d51827 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -45,7 +45,6 @@ void (*__flush_cache_vunmap)(void);
 
 void (*__flush_kernel_vmap_range)(unsigned long vaddr, int size);
 EXPORT_SYMBOL_GPL(__flush_kernel_vmap_range);
-void (*__invalidate_kernel_vmap_range)(unsigned long vaddr, int size);
 
 /* MIPS specific cache operations */
 void (*flush_cache_sigtramp)(unsigned long addr);
-- 
2.14.1
