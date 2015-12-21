Received: from mailapp01.imgtec.com ([195.59.15.196]:50104 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008538AbbLUPVxm8pJn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Dec 2015 16:21:53 +0100
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
        by Websense Email Security Gateway with ESMTPS id 710D741BEF05E
        for <linux-mips@linux-mips.org>; Mon, 21 Dec 2015 15:21:45 +0000 (GMT)
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: dma-default: Defend against NULL dev in massage_gfp_flags
Date: Mon, 21 Dec 2015 15:21:42 +0000
Message-ID: <1450711302-3995-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <20151221152142.k4PXlwDkc_-5HNs5MUbG1oaMIZxWKYf-UYCpdLcWGmY@z>

This patch ensures that the dev parameter is checked for NULL before it
is dereferenced in massage_gfp_flags. If dev is NULL, then fall back
setting the GFP flag requested and available.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---
 arch/mips/mm/dma-default.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/mips/mm/dma-default.c b/arch/mips/mm/dma-default.c
index d8117be729a2..a1976d09d766 100644
--- a/arch/mips/mm/dma-default.c
+++ b/arch/mips/mm/dma-default.c
@@ -88,19 +88,20 @@ static gfp_t massage_gfp_flags(const struct device *dev, gfp_t gfp)
 	else
 #endif
 #if defined(CONFIG_ZONE_DMA32) && defined(CONFIG_ZONE_DMA)
-	     if (dev->coherent_dma_mask < DMA_BIT_MASK(32))
+	     if (dev == NULL || dev->coherent_dma_mask < DMA_BIT_MASK(32))
 			dma_flag = __GFP_DMA;
 	else if (dev->coherent_dma_mask < DMA_BIT_MASK(64))
 			dma_flag = __GFP_DMA32;
 	else
 #endif
 #if defined(CONFIG_ZONE_DMA32) && !defined(CONFIG_ZONE_DMA)
-	     if (dev->coherent_dma_mask < DMA_BIT_MASK(64))
+	     if (dev == NULL || dev->coherent_dma_mask < DMA_BIT_MASK(64))
 		dma_flag = __GFP_DMA32;
 	else
 #endif
 #if defined(CONFIG_ZONE_DMA) && !defined(CONFIG_ZONE_DMA32)
-	     if (dev->coherent_dma_mask < DMA_BIT_MASK(sizeof(phys_addr_t) * 8))
+	     if (dev == NULL ||
+		 dev->coherent_dma_mask < DMA_BIT_MASK(sizeof(phys_addr_t) * 8))
 		dma_flag = __GFP_DMA;
 	else
 #endif
-- 
2.1.4
