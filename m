Received: from mailapp01.imgtec.com ([195.59.15.196]:18021 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993866AbdHMEjeSpvJd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:39:34 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 07/38] lib/iomap_copy.c: Add __ioread64_copy
Date: Sat, 12 Aug 2017 21:36:15 -0700
Message-ID: <20170813043646.25821-8-paul.burton@imgtec.com>
In-Reply-To: <20170813043646.25821-1-paul.burton@imgtec.com>
References: <20170813043646.25821-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170813043615.mm4CQIeWPUkB1IvnKlI9ZZnth_ttKDsicqzWqSn0mMU@z>

We currently have __ioread32_copy, __iowrite32_copy & __iowrite64_copy
helpers in lib/iomap_copy.c. This patch adds __ioread64_copy to round
out the set, allowing copies from I/O memory using 32 or 64 bit reads.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 include/linux/io.h |  1 +
 lib/iomap_copy.c   | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/io.h b/include/linux/io.h
index 2195d9ea4aaa..29a602a6ee0a 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -31,6 +31,7 @@ struct resource;
 __visible void __iowrite32_copy(void __iomem *to, const void *from, size_t count);
 void __ioread32_copy(void *to, const void __iomem *from, size_t count);
 void __iowrite64_copy(void __iomem *to, const void *from, size_t count);
+void __ioread64_copy(void *to, const void __iomem *from, size_t count);
 
 #ifdef CONFIG_MMU
 int ioremap_page_range(unsigned long addr, unsigned long end,
diff --git a/lib/iomap_copy.c b/lib/iomap_copy.c
index b8f1d6cbb200..2efdf4baf9d4 100644
--- a/lib/iomap_copy.c
+++ b/lib/iomap_copy.c
@@ -89,3 +89,28 @@ void __attribute__((weak)) __iowrite64_copy(void __iomem *to,
 }
 
 EXPORT_SYMBOL_GPL(__iowrite64_copy);
+
+/**
+ * __ioread64_copy - copy data from MMIO space, in 64-bit units
+ * @to: destination (must be 64-bit aligned)
+ * @from: source, in MMIO space (must be 64-bit aligned)
+ * @count: number of 64-bit quantities to copy
+ *
+ * Copy data from MMIO space to kernel space, in units of 32 or 64 bits at a
+ * time.  Order of access is not guaranteed, nor is a memory barrier
+ * performed afterwards.
+ */
+void __ioread64_copy(void *to, const void __iomem *from, size_t count)
+{
+#ifdef CONFIG_64BIT
+	u64 *dst = to;
+	const u64 __iomem *src = from;
+	const u64 __iomem *end = src + count;
+
+	while (src < end)
+		*dst++ = __raw_readq(src++);
+#else
+	__ioread32_copy(to, from, count * 2);
+#endif
+}
+EXPORT_SYMBOL_GPL(__ioread64_copy);
-- 
2.14.0
