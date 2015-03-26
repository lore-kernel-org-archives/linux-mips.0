Received: from mailapp01.imgtec.com ([195.59.15.196]:15231 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007636AbbCZQ4zArR61 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Mar 2015 17:56:55 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: dma-default: Fix 32-bit fall back to GFP_DMA
Date: Thu, 26 Mar 2015 16:56:33 +0000
Message-ID: <1427388993-17697-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20150326165633.Ri4FGsfll-OUHVeeugmEs1vgl3A9hqtZi461sWdHtMU@z>

If there is a DMA zone (usually 24bit = 16MB I believe), but no DMA32
zone, as is the case for some 32-bit kernels, then massage_gfp_flags()
will cause DMA memory allocated for devices with a 32..63-bit
coherent_dma_mask to fall back to using __GFP_DMA, even though there may
only be 32-bits of physical address available anyway.

Correct that case to compare against a mask the size of phys_addr_t
instead of always using a 64-bit mask.

Fixes: a2e715a86c6d ("MIPS: DMA: Fix computation of DMA flags from device's coherent_dma_mask.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 2.6.36+
---
This works around problems encountered on Malta with ethernet and IDE
drivers being unable to allocate any coherent memory when the entire
16MB DMA zone is taken up with static kernel data (a separate problem),
even though their coherent_dma_masks are 32-bit. This can happen when
PROVE_RCU and PROVE_LOCKING are set, especially since commit
1413c0389333 ("lockdep: Increase static allocations") was applied in
v3.16.
---
 arch/mips/mm/dma-default.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/dma-default.c b/arch/mips/mm/dma-default.c
index af5f046e627e..501557026768 100644
--- a/arch/mips/mm/dma-default.c
+++ b/arch/mips/mm/dma-default.c
@@ -100,7 +100,7 @@ static gfp_t massage_gfp_flags(const struct device *dev, gfp_t gfp)
 	else
 #endif
 #if defined(CONFIG_ZONE_DMA) && !defined(CONFIG_ZONE_DMA32)
-	     if (dev->coherent_dma_mask < DMA_BIT_MASK(64))
+	     if (dev->coherent_dma_mask < DMA_BIT_MASK(sizeof(phys_addr_t)*8))
 		dma_flag = __GFP_DMA;
 	else
 #endif
-- 
2.0.5
