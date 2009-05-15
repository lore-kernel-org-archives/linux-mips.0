Received: from wf-out-1314.google.com ([209.85.200.173]:6315 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org
	with ESMTP id S20023149AbZEOWU1 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 15 May 2009 23:20:27 +0100
Subject: [PATCH 21/30] loongson: define Loongson2F arch specific phys prot
 access
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Content-Type: text/plain
Date: Sat, 16 May 2009 06:20:18 +0800
Message-ID: <1242426018.10164.164.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Arnaud Patard <apatard@mandriva.com>, loongson-dev@googlegroups.com, zhangfx@lemote.com, yanh@lemote.com, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090515222018.PUnr4dzKf05AzzCHTWvOCNR6PRjhm5GlWssKfwd1AMs@z>

From 6eba97d7176eace554caddcc40c7e9719354fc62 Mon Sep 17 00:00:00 2001
From: Wu Zhangjin <wuzhangjin@gmail.com>
Date: Sat, 16 May 2009 04:34:23 +0800
Subject: [PATCH 21/30] loongson: define Loongson2F arch specific phys
prot access

The main purpose is to uncache accelerate for video memory access
---
 arch/mips/include/asm/pgtable.h |   13 +++++++++
 arch/mips/loongson/Kconfig      |   12 ++++++++
 arch/mips/loongson/common/mem.c |   56
+++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 0 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h
b/arch/mips/include/asm/pgtable.h
index 6a0edf7..3954da0 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -370,6 +370,19 @@ static inline int io_remap_pfn_range(struct
vm_area_struct *vma,
 #include <asm-generic/pgtable.h>
 
 /*
+ * uncache accelerate for video memory access
+ */
+#ifdef CONFIG_LOONGSON2F
+#define __HAVE_PHYS_MEM_ACCESS_PROT
+
+struct file;
+pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
+                              unsigned long size, pgprot_t vma_prot);
+int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
+                              unsigned long size, pgprot_t *vma_prot);
+#endif
+
+/*
  * We provide our own get_unmapped area to cope with the virtual
aliasing
  * constraints placed on us by the cache architecture.
  */
diff --git a/arch/mips/loongson/Kconfig b/arch/mips/loongson/Kconfig
index 2622017..49cb375 100644
--- a/arch/mips/loongson/Kconfig
+++ b/arch/mips/loongson/Kconfig
@@ -99,3 +99,15 @@ config CS5536
 
 config SYS_HAS_MACH_PROM_INIT_CMDLINE
 	bool
+
+config UCA_SIZE
+ 	hex "Uncache Accelerated Region size"
+ 	depends on LOONGSON2F 
+ 	default 0x400000 if LEMOTE_YEELOONG2F
+ 	default 0x2000000 if LEMOTE_FULOONG2F
+ 	help
+ 	  Uncached Acceleration(UCA) can greatly improve video performance.
+ 	  Normally the Video memory can be accessed in Uncached Accelerated
mode,
+ 	  other peripheral spaces not.
+ 	  
+ 	  Specify a zeroed size to disable this feature. 
diff --git a/arch/mips/loongson/common/mem.c
b/arch/mips/loongson/common/mem.c
index 059d43f..4e1bf29 100644
--- a/arch/mips/loongson/common/mem.c
+++ b/arch/mips/loongson/common/mem.c
@@ -53,3 +53,59 @@ int __uncached_access(struct file *file, unsigned
long addr)
 	return addr >= __pa(high_memory) ||
 		((addr >= LOONGSON_MMIO_MEM_START) && (addr <
LOONGSON_MMIO_MEM_END));
 }
+
+#if defined(CONFIG_CPU_LOONGSON2F)
+
+#include <linux/pci.h>
+#include <linux/sched.h>
+#include <asm/current.h>
+
+static unsigned long uca_start;
+static unsigned long uca_size = CONFIG_UCA_SIZE;
+
+pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
+				     unsigned long size, pgprot_t vma_prot)
+{
+	unsigned long offset = pfn << PAGE_SHIFT;
+	unsigned long end = offset + size;
+
+	if (__uncached_access(file, offset)) {
+		if(uca_start && offset >= uca_start && end <= (uca_start + uca_size))
+			return __pgprot((pgprot_val(vma_prot) & ~_CACHE_MASK)|
_CACHE_UNCACHED_ACCELERATED);
+		else 
+			return pgprot_noncached(vma_prot);
+	}
+	return vma_prot;
+}
+
+static int __init find_vga_mem_init(void)
+{
+	struct pci_dev *dev = 0;
+	struct resource *r;
+	int idx;
+
+	if(uca_start)
+		return 0;
+	for_each_pci_dev(dev) {
+		if ((dev->class >> 8) == PCI_CLASS_DISPLAY_VGA){
+			for (idx=0; idx < PCI_NUM_RESOURCES; idx++) {
+				r = &dev->resource[idx];
+				if (!r->start && r->end) {
+					continue;
+				}
+				if (r->flags & IORESOURCE_IO)
+					continue;
+				if (r->flags & IORESOURCE_MEM){
+					uca_start = r->start;
+					printk("find the frame buffer:start=%lx\n", uca_start);
+					return 0;
+				}
+			}
+
+		}
+	}
+	return 0;
+}
+
+late_initcall(find_vga_mem_init);
+#endif /* !CONFIG_CPU_LOONGSON2F */
-- 
1.6.2.1
