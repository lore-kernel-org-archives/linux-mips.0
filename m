Received: from mailapp01.imgtec.com ([195.59.15.196]:21661 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008719AbaIKIhmK43G4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 11 Sep 2014 10:37:42 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 08/10] MIPS: ELF: add definition for the .MIPS.abiflags section
Date: Thu, 11 Sep 2014 08:30:21 +0100
Message-ID: <1410420623-11691-9-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1410420623-11691-1-git-send-email-paul.burton@imgtec.com>
References: <1410420623-11691-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140911073021.anZFMdyOkQs_FzBiwJlYaYv7R4hvlA7kJpiDaggkVGQ@z>

New toolchains will generate a .MIPS.abiflags section, referenced by a
new PT_MIPS_ABIFLAGS program header. This section will provide
information about the requirements of the ELF, including the ISA level
the code is built for, the ASEs it requires, the size of various
registers and its expectations of the floating point mode. This patch
introduces a definition of the structure of this section and the program
header, for use in a subsequent patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/elf.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index 9343529..bfa4bbd 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -28,6 +28,7 @@
 #define PT_MIPS_REGINFO		0x70000000
 #define PT_MIPS_RTPROC		0x70000001
 #define PT_MIPS_OPTIONS		0x70000002
+#define PT_MIPS_ABIFLAGS	0x70000003
 
 /* Flags in the e_flags field of the header */
 #define EF_MIPS_NOREORDER	0x00000001
@@ -174,6 +175,30 @@ typedef elf_greg_t elf_gregset_t[ELF_NGREG];
 typedef double elf_fpreg_t;
 typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 
+struct mips_elf_abiflags_v0 {
+	uint16_t version;	/* Version of flags structure */
+	uint8_t isa_level;	/* The level of the ISA: 1-5, 32, 64 */
+	uint8_t isa_rev;	/* The revision of ISA: 0 for MIPS V and below,
+				   1-n otherwise */
+	uint8_t gpr_size;	/* The size of general purpose registers */
+	uint8_t cpr1_size;	/* The size of co-processor 1 registers */
+	uint8_t cpr2_size;	/* The size of co-processor 2 registers */
+	uint8_t fp_abi;		/* The floating-point ABI */
+	uint32_t isa_ext;	/* Mask of processor-specific extensions */
+	uint32_t ases;		/* Mask of ASEs used */
+	uint32_t flags1;	/* Mask of general flags */
+	uint32_t flags2;
+};
+
+#define MIPS_ABI_FP_ANY		0	/* FP ABI doesn't matter */
+#define MIPS_ABI_FP_DOUBLE	1	/* -mdouble-float */
+#define MIPS_ABI_FP_SINGLE	2	/* -msingle-float */
+#define MIPS_ABI_FP_SOFT	3	/* -msoft-float */
+#define MIPS_ABI_FP_OLD_64	4	/* -mips32r2 -mfp64 */
+#define MIPS_ABI_FP_XX		5	/* -mfpxx */
+#define MIPS_ABI_FP_64		6	/* -mips32r2 -mfp64 */
+#define MIPS_ABI_FP_64A		7	/* -mips32r2 -mfp64 -mno-odd-spreg */
+
 #ifdef CONFIG_32BIT
 
 /*
-- 
2.0.4
