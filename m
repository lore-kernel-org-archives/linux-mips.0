Received: from mailapp01.imgtec.com ([195.59.15.196]:29334 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028461AbcEMGUbhjPTL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 May 2016 08:20:31 +0200
Date: Fri, 13 May 2016 07:20:16 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 1/3] MIPS: ELF: Deconditionalise ABI flags definitions
In-Reply-To: <alpine.DEB.2.00.1605121036270.6794@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1605130411450.6794@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1605121036270.6794@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20160513062016.0wBDjlB8AgfK9LT1xajAMxpHfIVUaT0mvQPBUWDznQo@z>

Move the `mips_elf_abiflags_v0' structure and FP ABI flag macros outside 
#ifndef ELF_ARCH.  These are public interfaces.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
linux-mips-elf-abiflags.diff
Index: linux-sfr-test/arch/mips/include/asm/elf.h
===================================================================
--- linux-sfr-test.orig/arch/mips/include/asm/elf.h	2016-05-12 17:57:02.400979000 +0100
+++ linux-sfr-test/arch/mips/include/asm/elf.h	2016-05-12 18:04:36.577315000 +0100
@@ -175,16 +175,14 @@
 #define SHF_MIPS_NAMES		0x02000000
 #define SHF_MIPS_NODUPES	0x01000000
 
-#ifndef ELF_ARCH
-/* ELF register definitions */
-#define ELF_NGREG	45
-#define ELF_NFPREG	33
-
-typedef unsigned long elf_greg_t;
-typedef elf_greg_t elf_gregset_t[ELF_NGREG];
-
-typedef double elf_fpreg_t;
-typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
+#define MIPS_ABI_FP_ANY		0	/* FP ABI doesn't matter */
+#define MIPS_ABI_FP_DOUBLE	1	/* -mdouble-float */
+#define MIPS_ABI_FP_SINGLE	2	/* -msingle-float */
+#define MIPS_ABI_FP_SOFT	3	/* -msoft-float */
+#define MIPS_ABI_FP_OLD_64	4	/* -mips32r2 -mfp64 */
+#define MIPS_ABI_FP_XX		5	/* -mfpxx */
+#define MIPS_ABI_FP_64		6	/* -mips32r2 -mfp64 */
+#define MIPS_ABI_FP_64A		7	/* -mips32r2 -mfp64 -mno-odd-spreg */
 
 struct mips_elf_abiflags_v0 {
 	uint16_t version;	/* Version of flags structure */
@@ -201,14 +199,16 @@ struct mips_elf_abiflags_v0 {
 	uint32_t flags2;
 };
 
-#define MIPS_ABI_FP_ANY		0	/* FP ABI doesn't matter */
-#define MIPS_ABI_FP_DOUBLE	1	/* -mdouble-float */
-#define MIPS_ABI_FP_SINGLE	2	/* -msingle-float */
-#define MIPS_ABI_FP_SOFT	3	/* -msoft-float */
-#define MIPS_ABI_FP_OLD_64	4	/* -mips32r2 -mfp64 */
-#define MIPS_ABI_FP_XX		5	/* -mfpxx */
-#define MIPS_ABI_FP_64		6	/* -mips32r2 -mfp64 */
-#define MIPS_ABI_FP_64A		7	/* -mips32r2 -mfp64 -mno-odd-spreg */
+#ifndef ELF_ARCH
+/* ELF register definitions */
+#define ELF_NGREG	45
+#define ELF_NFPREG	33
+
+typedef unsigned long elf_greg_t;
+typedef elf_greg_t elf_gregset_t[ELF_NGREG];
+
+typedef double elf_fpreg_t;
+typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 
 #ifdef CONFIG_32BIT
 
