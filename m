Received: from mail-qt0-x244.google.com ([IPv6:2607:f8b0:400d:c0d::244]:46538
        "EHLO mail-qt0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992866AbeAXBkdWlMxZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jan 2018 02:40:33 +0100
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/2] MIPS: Allow including mach-generic/dma-coherence.h
Date: Tue, 23 Jan 2018 17:40:09 -0800
Message-ID: <1516758010-7641-2-git-send-email-f.fainelli@gmail.com>
In-Reply-To: <1516758010-7641-1-git-send-email-f.fainelli@gmail.com>
References: <1516758010-7641-1-git-send-email-f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
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
Cc: jhogan@kernel.org, david.daney@cavium.com, paul.burton@mips.com, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Bart Van Assche <bart.vanassche@sandisk.com>, Doug Ledford <dledford@redhat.com>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20180124014009.j0bCC_H8xHxNC6wOV7odXA9ERdyOYyACKPTGw_NkEP0@z>

Check whether a platform is already defining any of the functions we
provide in mach-generic/dma-coherence.h. This is a preliminary change to
allow cleaning up machine's dma-coherence.h files.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/mach-generic/dma-coherence.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/mips/include/asm/mach-generic/dma-coherence.h b/arch/mips/include/asm/mach-generic/dma-coherence.h
index 61addb1677e9..e6e7dfa15801 100644
--- a/arch/mips/include/asm/mach-generic/dma-coherence.h
+++ b/arch/mips/include/asm/mach-generic/dma-coherence.h
@@ -11,29 +11,38 @@
 
 struct device;
 
+#ifndef plat_map_dma_mem
 static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr,
 	size_t size)
 {
 	return virt_to_phys(addr);
 }
+#endif
 
+#ifndef plat_map_dma_mem_page
 static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 	struct page *page)
 {
 	return page_to_phys(page);
 }
+#endif
 
+#ifndef plat_dma_addr_to_phys
 static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
 	dma_addr_t dma_addr)
 {
 	return dma_addr;
 }
+#endif
 
+#ifndef plat_unmap_dma_mem
 static inline void plat_unmap_dma_mem(struct device *dev, dma_addr_t dma_addr,
 	size_t size, enum dma_data_direction direction)
 {
 }
+#endif
 
+#ifndef plat_dma_supported
 static inline int plat_dma_supported(struct device *dev, u64 mask)
 {
 	/*
@@ -46,7 +55,9 @@ static inline int plat_dma_supported(struct device *dev, u64 mask)
 
 	return 1;
 }
+#endif
 
+#ifndef plat_device_is_coherent
 static inline int plat_device_is_coherent(struct device *dev)
 {
 #ifdef CONFIG_DMA_PERDEV_COHERENT
@@ -63,6 +74,7 @@ static inline int plat_device_is_coherent(struct device *dev)
 	}
 #endif
 }
+#endif
 
 #ifndef plat_post_dma_flush
 static inline void plat_post_dma_flush(struct device *dev)
@@ -71,15 +83,19 @@ static inline void plat_post_dma_flush(struct device *dev)
 #endif
 
 #ifdef CONFIG_SWIOTLB
+#ifndef phys_to_dma
 static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
 	return paddr;
 }
+#endif
 
+#ifndef dma_to_phys
 static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
 	return daddr;
 }
 #endif
+#endif /* CONFIG_SWIOTLB */
 
 #endif /* __ASM_MACH_GENERIC_DMA_COHERENCE_H */
-- 
2.7.4
