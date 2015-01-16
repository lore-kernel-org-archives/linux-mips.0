Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:45813 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27009340AbbAPMi3ffZ2g (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 13:38:29 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 4/5] MIPS: Compress MAPPED kernels
Date: Fri, 16 Jan 2015 18:08:07 +0530
Message-ID: <1421411888-3367-5-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1421411888-3367-1-git-send-email-jchandra@broadcom.com>
References: <1421411888-3367-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150116123807.vVertuQuW2IsEeoKGtjcrR2fyfSpiv5s-XbRnz7sVak@z>

Add code to build the wrapper in KSEG0, which in turn loads the
mapped kernel.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/boot/compressed/calc_vmlinuz_load_addr.c | 9 +++++++++
 arch/mips/boot/compressed/decompress.c             | 6 +++++-
 arch/mips/boot/compressed/head.S                   | 5 +++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c b/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c
index 37fe58c..9791e39 100644
--- a/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c
+++ b/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c
@@ -51,6 +51,15 @@ int main(int argc, char *argv[])
 
 	vmlinuz_load_addr += (16 - vmlinux_size % 16);
 
+	/* handle 32/64 bit mapped addresses */
+	if (vmlinuz_load_addr >= 0xffffffffc0000000ULL)
+		vmlinuz_load_addr = 0xffffffff80000000ull |
+					(vmlinuz_load_addr & 0x1fffffff);
+	if (vmlinuz_load_addr >= 0xc0000000ULL &&
+				vmlinuz_load_addr < 0xffffffffULL)
+		vmlinuz_load_addr = 0x80000000ull |
+					(vmlinuz_load_addr & 0x1fffffff);
+
 	printf("0x%llx\n", vmlinuz_load_addr);
 
 	return EXIT_SUCCESS;
diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index 31903cf..f9a2ab9 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -83,6 +83,7 @@ void __stack_chk_fail(void)
 void decompress_kernel(unsigned long boot_heap_start)
 {
 	unsigned long zimage_start, zimage_size;
+	unsigned long long loadaddr = VMLINUX_LOAD_ADDRESS_ULL;
 
 	__stack_chk_guard_setup();
 
@@ -105,9 +106,12 @@ void decompress_kernel(unsigned long boot_heap_start)
 	puthex(VMLINUX_LOAD_ADDRESS_ULL);
 	puts("\n");
 
+#ifdef CONFIG_MAPPED_KERNEL
+	loadaddr = CKSEG0ADDR(loadaddr);
+#endif
 	/* Decompress the kernel with according algorithm */
 	decompress((char *)zimage_start, zimage_size, 0, 0,
-		   (void *)VMLINUX_LOAD_ADDRESS_ULL, 0, error);
+		   (void *)(unsigned long)loadaddr, 0, error);
 
 	/* FIXME: should we flush cache here? */
 	puts("Now, booting the kernel...\n");
diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 409cb48..47ab26f 100644
--- a/arch/mips/boot/compressed/head.S
+++ b/arch/mips/boot/compressed/head.S
@@ -14,6 +14,7 @@
 
 #include <asm/asm.h>
 #include <asm/regdef.h>
+#include <asm/addrspace.h>
 
 	.set noreorder
 	.cprestore
@@ -44,7 +45,11 @@ start:
 	move	a1, s1
 	move	a2, s2
 	move	a3, s3
+#ifdef CONFIG_MAPPED_KERNEL
+	PTR_LI	k0, CKSEG0ADDR(KERNEL_ENTRY)
+#else
 	PTR_LI	k0, KERNEL_ENTRY
+#endif
 	jr	k0
 	 nop
 3:
-- 
1.9.1
