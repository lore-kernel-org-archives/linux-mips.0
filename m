Received: from mailapp01.imgtec.com ([195.59.15.196]:29099 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010210AbbGJPxjHnVg1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jul 2015 17:53:39 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/2] MIPS: malta: use generic platform_maar_init
Date: Fri, 10 Jul 2015 16:52:39 +0100
Message-ID: <1436543559-26886-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1436543559-26886-1-git-send-email-paul.burton@imgtec.com>
References: <1436543559-26886-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150710155239.t9DBT-FDuDxiL8KSrC9l_80gWDDa-vHV2O6XDdqEPEw@z>

The default implementation of platform_maar_init is sufficient for Malta
boards where we want to allow speculation in the regions of memory
corresponding to DDR & disallow it elsewhere. Drop the custom
implementation such that the default is used, reducing the duplication
of information provided by the Malta platform code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mti-malta/malta-memory.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/mips/mti-malta/malta-memory.c b/arch/mips/mti-malta/malta-memory.c
index b769657..dadeb83 100644
--- a/arch/mips/mti-malta/malta-memory.c
+++ b/arch/mips/mti-malta/malta-memory.c
@@ -179,31 +179,6 @@ void __init prom_free_prom_memory(void)
 	}
 }
 
-unsigned platform_maar_init(unsigned num_pairs)
-{
-	phys_addr_t mem_end = (physical_memsize & ~0xffffull) - 1;
-	struct maar_config cfg[] = {
-		/* DRAM preceding I/O */
-		{ 0x00000000, 0x0fffffff, MIPS_MAAR_S },
-
-		/* DRAM following I/O */
-		{ 0x20000000, mem_end, MIPS_MAAR_S },
-
-		/* DRAM alias in upper half of physical */
-		{ 0x80000000, 0x80000000 + mem_end, MIPS_MAAR_S },
-	};
-	unsigned i, num_cfg = ARRAY_SIZE(cfg);
-
-	/* If DRAM fits before I/O, drop the region following it */
-	if (physical_memsize <= 0x10000000) {
-		num_cfg--;
-		for (i = 1; i < num_cfg; i++)
-			cfg[i] = cfg[i + 1];
-	}
-
-	return maar_config(cfg, num_cfg, num_pairs);
-}
-
 phys_addr_t mips_cdmm_phys_base(void)
 {
 	/* This address is "typically unused" */
-- 
2.4.4
