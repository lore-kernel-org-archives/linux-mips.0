Received: from mail-qt0-x241.google.com ([IPv6:2607:f8b0:400d:c0d::241]:38032
        "EHLO mail-qt0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992869AbeAXBkgHrdnZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jan 2018 02:40:36 +0100
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/2] MIPS: Update dma-coherence.h files
Date: Tue, 23 Jan 2018 17:40:10 -0800
Message-ID: <1516758010-7641-3-git-send-email-f.fainelli@gmail.com>
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
Message-ID: <20180124014010.4CoBcPyN4eYlxmLlwyOYAylhWpCtTWGyd_1_Ia_TDV0@z>

Define all functions that differ from the generic implementation, kill
the redundant generic implementation where relevant, and finally include
asm/mach-generic/dma-coherence.h to be future proof when new functions
will be added.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/mach-ath25/dma-coherence.h   | 10 +++++---
 arch/mips/include/asm/mach-bmips/dma-coherence.h   | 24 +++++--------------
 .../include/asm/mach-cavium-octeon/dma-coherence.h | 14 +++++++----
 arch/mips/include/asm/mach-ip27/dma-coherence.h    | 28 +++++-----------------
 arch/mips/include/asm/mach-ip32/dma-coherence.h    | 16 ++++++-------
 arch/mips/include/asm/mach-jazz/dma-coherence.h    | 24 ++++++-------------
 .../include/asm/mach-loongson64/dma-coherence.h    | 16 ++++++-------
 7 files changed, 51 insertions(+), 81 deletions(-)

diff --git a/arch/mips/include/asm/mach-ath25/dma-coherence.h b/arch/mips/include/asm/mach-ath25/dma-coherence.h
index d5defdde32db..63bce15fa54d 100644
--- a/arch/mips/include/asm/mach-ath25/dma-coherence.h
+++ b/arch/mips/include/asm/mach-ath25/dma-coherence.h
@@ -30,35 +30,41 @@ static inline dma_addr_t ath25_dev_offset(struct device *dev)
 	return 0;
 }
 
+#define plat_map_dma_mem	plat_map_dma_mem
 static inline dma_addr_t
 plat_map_dma_mem(struct device *dev, void *addr, size_t size)
 {
 	return virt_to_phys(addr) + ath25_dev_offset(dev);
 }
 
+#define plat_map_dma_mem_page	plat_map_dma_mem_page
 static inline dma_addr_t
 plat_map_dma_mem_page(struct device *dev, struct page *page)
 {
 	return page_to_phys(page) + ath25_dev_offset(dev);
 }
 
+#define plat_dma_addr_to_phys	plat_dma_addr_to_phys
 static inline unsigned long
 plat_dma_addr_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	return dma_addr - ath25_dev_offset(dev);
 }
 
+#define plat_unmap_dma_mem	plat_unmap_dma_mem
 static inline void
 plat_unmap_dma_mem(struct device *dev, dma_addr_t dma_addr, size_t size,
 		   enum dma_data_direction direction)
 {
 }
 
+#define plat_dma_supported	plat_dma_supported
 static inline int plat_dma_supported(struct device *dev, u64 mask)
 {
 	return 1;
 }
 
+#define plat_device_is_coherent	plat_device_is_coherent
 static inline int plat_device_is_coherent(struct device *dev)
 {
 #ifdef CONFIG_DMA_COHERENT
@@ -69,8 +75,6 @@ static inline int plat_device_is_coherent(struct device *dev)
 #endif
 }
 
-static inline void plat_post_dma_flush(struct device *dev)
-{
-}
+#include <asm/mach-generic/dma-coherence.h>
 
 #endif /* __ASM_MACH_ATH25_DMA_COHERENCE_H */
diff --git a/arch/mips/include/asm/mach-bmips/dma-coherence.h b/arch/mips/include/asm/mach-bmips/dma-coherence.h
index d29781f02285..b56380066573 100644
--- a/arch/mips/include/asm/mach-bmips/dma-coherence.h
+++ b/arch/mips/include/asm/mach-bmips/dma-coherence.h
@@ -21,29 +21,15 @@
 
 struct device;
 
+#define plat_map_dma_mem	plat_map_dma_mem
 extern dma_addr_t plat_map_dma_mem(struct device *dev, void *addr, size_t size);
+#define plat_map_dma_mem_page	plat_map_dma_mem_page
 extern dma_addr_t plat_map_dma_mem_page(struct device *dev, struct page *page);
+#define plat_dma_addr_to_phys	plat_dma_addr_to_phys
 extern unsigned long plat_dma_addr_to_phys(struct device *dev,
 	dma_addr_t dma_addr);
 
-static inline void plat_unmap_dma_mem(struct device *dev, dma_addr_t dma_addr,
-	size_t size, enum dma_data_direction direction)
-{
-}
-
-static inline int plat_dma_supported(struct device *dev, u64 mask)
-{
-	/*
-	 * we fall back to GFP_DMA when the mask isn't all 1s,
-	 * so we can't guarantee allocations that must be
-	 * within a tighter range than GFP_DMA..
-	 */
-	if (mask < DMA_BIT_MASK(24))
-		return 0;
-
-	return 1;
-}
-
+#define plat_device_is_coherent	plat_device_is_coherent
 static inline int plat_device_is_coherent(struct device *dev)
 {
 	return 0;
@@ -51,4 +37,6 @@ static inline int plat_device_is_coherent(struct device *dev)
 
 #define plat_post_dma_flush	bmips_post_dma_flush
 
+#include <asm/mach-generic/dma-coherence.h>
+
 #endif /* __ASM_MACH_BMIPS_DMA_COHERENCE_H */
diff --git a/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h b/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h
index 9110988b92a1..165e13aba3ff 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h
@@ -19,6 +19,7 @@ struct device;
 
 extern void octeon_pci_dma_init(void);
 
+#define plat_map_dma_mem	plat_map_dma_mem
 static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr,
 	size_t size)
 {
@@ -26,6 +27,7 @@ static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr,
 	return 0;
 }
 
+#define plat_map_dma_mem_page	plat_map_dma_mem_page
 static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 	struct page *page)
 {
@@ -33,6 +35,7 @@ static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 	return 0;
 }
 
+#define plat_dma_addr_to_phys	plat_dma_addr_to_phys
 static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
 	dma_addr_t dma_addr)
 {
@@ -40,32 +43,35 @@ static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
 	return 0;
 }
 
+#define plat_unmap_dma_mem	plat_unmap_dma_mem
 static inline void plat_unmap_dma_mem(struct device *dev, dma_addr_t dma_addr,
 	size_t size, enum dma_data_direction direction)
 {
 	BUG();
 }
 
+#define plat_dma_supported	plat_dma_supported
 static inline int plat_dma_supported(struct device *dev, u64 mask)
 {
 	BUG();
 	return 0;
 }
 
+#define plat_device_is_coherent	plat_device_is_coherent
 static inline int plat_device_is_coherent(struct device *dev)
 {
 	return 1;
 }
 
-static inline void plat_post_dma_flush(struct device *dev)
-{
-}
-
+#define phys_to_dma	phys_to_dma
 dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr);
+#define dma_to_phys	dma_to_phys
 phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr);
 
 struct dma_map_ops;
 extern const struct dma_map_ops *octeon_pci_dma_map_ops;
 extern char *octeon_swiotlb;
 
+#include <asm/mach-generic/dma-coherence.h>
+
 #endif /* __ASM_MACH_CAVIUM_OCTEON_DMA_COHERENCE_H */
diff --git a/arch/mips/include/asm/mach-ip27/dma-coherence.h b/arch/mips/include/asm/mach-ip27/dma-coherence.h
index 04d862020ac9..996147f8db4c 100644
--- a/arch/mips/include/asm/mach-ip27/dma-coherence.h
+++ b/arch/mips/include/asm/mach-ip27/dma-coherence.h
@@ -18,6 +18,7 @@
 
 struct device;
 
+#define plat_map_dma_mem	plat_map_dma_mem
 static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr,
 	size_t size)
 {
@@ -26,6 +27,7 @@ static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr,
 	return pa;
 }
 
+#define plat_map_dma_mem_page	plat_map_dma_mem_page
 static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 	struct page *page)
 {
@@ -34,37 +36,19 @@ static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 	return pa;
 }
 
+#define plat_dma_addr_to_phys	plat_dma_addr_to_phys
 static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
 	dma_addr_t dma_addr)
 {
 	return dma_addr & ~(0xffUL << 56);
 }
 
-static inline void plat_unmap_dma_mem(struct device *dev, dma_addr_t dma_addr,
-	size_t size, enum dma_data_direction direction)
-{
-}
-
-static inline int plat_dma_supported(struct device *dev, u64 mask)
-{
-	/*
-	 * we fall back to GFP_DMA when the mask isn't all 1s,
-	 * so we can't guarantee allocations that must be
-	 * within a tighter range than GFP_DMA..
-	 */
-	if (mask < DMA_BIT_MASK(24))
-		return 0;
-
-	return 1;
-}
-
-static inline void plat_post_dma_flush(struct device *dev)
-{
-}
-
+#define plat_device_is_coherent	plat_device_is_coherent
 static inline int plat_device_is_coherent(struct device *dev)
 {
 	return 1;		/* IP27 non-coherent mode is unsupported */
 }
 
+#include <asm/mach-generic/dma-coherence.h>
+
 #endif /* __ASM_MACH_IP27_DMA_COHERENCE_H */
diff --git a/arch/mips/include/asm/mach-ip32/dma-coherence.h b/arch/mips/include/asm/mach-ip32/dma-coherence.h
index 7bdf212587a0..23640029d85c 100644
--- a/arch/mips/include/asm/mach-ip32/dma-coherence.h
+++ b/arch/mips/include/asm/mach-ip32/dma-coherence.h
@@ -26,6 +26,7 @@ struct device;
 
 #define RAM_OFFSET_MASK 0x3fffffffUL
 
+#define plat_map_dma_mem	plat_map_dma_mem
 static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr,
 	size_t size)
 {
@@ -37,6 +38,7 @@ static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr,
 	return pa;
 }
 
+#define plat_map_dma_mem_page	plat_map_dma_mem_page
 static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 	struct page *page)
 {
@@ -51,6 +53,7 @@ static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 }
 
 /* This is almost certainly wrong but it's what dma-ip32.c used to use	*/
+#define plat_dma_addr_to_phys	plat_dma_addr_to_phys
 static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
 	dma_addr_t dma_addr)
 {
@@ -62,11 +65,7 @@ static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
 	return addr;
 }
 
-static inline void plat_unmap_dma_mem(struct device *dev, dma_addr_t dma_addr,
-	size_t size, enum dma_data_direction direction)
-{
-}
-
+#define plat_dma_supported	plat_dma_supported
 static inline int plat_dma_supported(struct device *dev, u64 mask)
 {
 	/*
@@ -80,13 +79,12 @@ static inline int plat_dma_supported(struct device *dev, u64 mask)
 	return 1;
 }
 
-static inline void plat_post_dma_flush(struct device *dev)
-{
-}
-
+#define plat_device_is_coherent	plat_device_is_coherent
 static inline int plat_device_is_coherent(struct device *dev)
 {
 	return 0;		/* IP32 is non-coherent */
 }
 
+#include <asm/mach-generic/dma-coherence.h>
+
 #endif /* __ASM_MACH_IP32_DMA_COHERENCE_H */
diff --git a/arch/mips/include/asm/mach-jazz/dma-coherence.h b/arch/mips/include/asm/mach-jazz/dma-coherence.h
index dc347c25c343..83eb573abcca 100644
--- a/arch/mips/include/asm/mach-jazz/dma-coherence.h
+++ b/arch/mips/include/asm/mach-jazz/dma-coherence.h
@@ -12,49 +12,39 @@
 
 struct device;
 
+#define plat_map_dma_mem	plat_map_dma_mem
 static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr, size_t size)
 {
 	return vdma_alloc(virt_to_phys(addr), size);
 }
 
+#define plat_map_dma_mem_page	plat_map_dma_mem_page
 static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 	struct page *page)
 {
 	return vdma_alloc(page_to_phys(page), PAGE_SIZE);
 }
 
+#define plat_dma_addr_to_phys	plat_dma_addr_to_phys
 static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
 	dma_addr_t dma_addr)
 {
 	return vdma_log2phys(dma_addr);
 }
 
+#define plat_unmap_dma_mem	plat_unmap_dma_mem
 static inline void plat_unmap_dma_mem(struct device *dev, dma_addr_t dma_addr,
 	size_t size, enum dma_data_direction direction)
 {
 	vdma_free(dma_addr);
 }
 
-static inline int plat_dma_supported(struct device *dev, u64 mask)
-{
-	/*
-	 * we fall back to GFP_DMA when the mask isn't all 1s,
-	 * so we can't guarantee allocations that must be
-	 * within a tighter range than GFP_DMA..
-	 */
-	if (mask < DMA_BIT_MASK(24))
-		return 0;
-
-	return 1;
-}
-
-static inline void plat_post_dma_flush(struct device *dev)
-{
-}
-
+#define plat_device_is_coherent	plat_device_is_coherent
 static inline int plat_device_is_coherent(struct device *dev)
 {
 	return 0;
 }
 
+#include <asm/mach-generic/dma-coherence.h>
+
 #endif /* __ASM_MACH_JAZZ_DMA_COHERENCE_H */
diff --git a/arch/mips/include/asm/mach-loongson64/dma-coherence.h b/arch/mips/include/asm/mach-loongson64/dma-coherence.h
index 1602a9e9e8c2..0a9bbc4c1449 100644
--- a/arch/mips/include/asm/mach-loongson64/dma-coherence.h
+++ b/arch/mips/include/asm/mach-loongson64/dma-coherence.h
@@ -17,8 +17,11 @@
 
 struct device;
 
+#define phys_to_dma	phys_to_dma
 extern dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr);
+#define dma_to_phys	dma_to_phys
 extern phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr);
+#define plat_map_dma_mem	plat_map_dma_mem
 static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr,
 					  size_t size)
 {
@@ -29,6 +32,7 @@ static inline dma_addr_t plat_map_dma_mem(struct device *dev, void *addr,
 #endif
 }
 
+#define plat_map_dma_mem_page	plat_map_dma_mem_page
 static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 					       struct page *page)
 {
@@ -39,6 +43,7 @@ static inline dma_addr_t plat_map_dma_mem_page(struct device *dev,
 #endif
 }
 
+#define plat_dma_addr_to_phys	plat_dma_addr_to_phys
 static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
 	dma_addr_t dma_addr)
 {
@@ -51,11 +56,7 @@ static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
 #endif
 }
 
-static inline void plat_unmap_dma_mem(struct device *dev, dma_addr_t dma_addr,
-	size_t size, enum dma_data_direction direction)
-{
-}
-
+#define plat_dma_supported	plat_dma_supported
 static inline int plat_dma_supported(struct device *dev, u64 mask)
 {
 	/*
@@ -69,6 +70,7 @@ static inline int plat_dma_supported(struct device *dev, u64 mask)
 	return 1;
 }
 
+#define plat_device_is_coherent	plat_device_is_coherent
 static inline int plat_device_is_coherent(struct device *dev)
 {
 #ifdef CONFIG_DMA_NONCOHERENT
@@ -78,8 +80,6 @@ static inline int plat_device_is_coherent(struct device *dev)
 #endif /* CONFIG_DMA_NONCOHERENT */
 }
 
-static inline void plat_post_dma_flush(struct device *dev)
-{
-}
+#include <asm/mach-generic/dma-coherence.h>
 
 #endif /* __ASM_MACH_LOONGSON64_DMA_COHERENCE_H */
-- 
2.7.4
