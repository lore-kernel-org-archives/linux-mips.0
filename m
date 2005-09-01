From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: RE: custom ide driver causes "Badness in smp_call_function"
Date: Thu, 1 Sep 2005 12:15:31 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050826141047.GA8777@linux-mips.org>
Message-ID: <20050901161023Z8225398-3678+8096@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050901161531.wNZg9n_XvXiYNWJycz_O91ZwKCI164wGQQg_BiesDtU@z>

Ralf,

I've done more testing with your patch.  When I use it with my non-SMP
kernel, disk access will cause a panic with a cache error message.  Is this
patch only intended for SMP, or is this a legitimate problem?

Bryan


Index: include/asm-mips/mach-generic/ide.h
===================================================================
RCS file: /home/cvs/linux/include/asm-mips/mach-generic/ide.h,v
retrieving revision 1.9
diff -u -r1.9 ide.h
--- include/asm-mips/mach-generic/ide.h	19 Apr 2005 12:26:59 -0000	1.9
+++ include/asm-mips/mach-generic/ide.h	26 Aug 2005 14:04:38 -0000
@@ -19,6 +19,7 @@
 #include <linux/pci.h>
 #include <linux/stddef.h>
 #include <asm/processor.h>
+#include <asm/cacheflush.h>
 
 #ifndef MAX_HWIFS
 # ifdef CONFIG_BLK_DEV_IDEPCI
@@ -105,12 +106,14 @@
 
 /* MIPS port and memory-mapped I/O string operations.  */
 
-static inline void __ide_flush_dcache_range(unsigned long addr, unsigned
long size)
+static inline void __ide_flush_dcache_range(unsigned long addr,
+	unsigned long size)
 {
-	if (cpu_has_dc_aliases) {
-		unsigned long end = addr + size;
-		for (; addr < end; addr += PAGE_SIZE)
-			flush_dcache_page(virt_to_page(addr));
+	unsigned long end = addr + size;
+
+	while (addr < end) {
+		SetPageDcacheDirty(virt_to_page(addr));
+		addr += PAGE_SIZE;
 	}
 }
 
