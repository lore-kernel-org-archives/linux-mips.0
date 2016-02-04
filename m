Received: from mailapp01.imgtec.com ([195.59.15.196]:7630 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012657AbcBDNGMldfCl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 4 Feb 2016 14:06:12 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 3/4] MIPS: Support R_MIPS_PC{21,26} rela-style relocs
Date: Thu, 4 Feb 2016 13:05:04 +0000
Message-ID: <1454591105-11841-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454591105-11841-1-git-send-email-paul.burton@imgtec.com>
References: <1454591105-11841-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Alex Smith <alex.smith@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160204130504.rB_6-nHOMA0gacHkH1C7-TZ3cDtZSNA5oLtHBLJfAZ8@z>

MIPS64 code uses rela-style relocs, and MIPS64r6 modules may include the
new R_MIPS_PC21 & R_MIPS_PC26 relocations. We thus need to support these
relocations in order to load MIPS64r6 kernel modules. They are similar
to the existing R_MIPS_PC16 relocation but applying to a wider field.
Implement support for them by genericising the existing R_MIPS_PC16
implementation such that it can be used for different field widths, and
calling it for all 3 reloc types.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 arch/mips/include/asm/elf.h    |  5 +++++
 arch/mips/kernel/module-rela.c | 48 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index cefb7a5..7cec234 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -111,6 +111,11 @@
 #define R_MIPS_CALLHI16		30
 #define R_MIPS_CALLLO16		31
 /*
+ * Introduced for MIPSr6.
+ */
+#define R_MIPS_PC21_S2		60
+#define R_MIPS_PC26_S2		61
+/*
  * This range is reserved for vendor specific relocations.
  */
 #define R_MIPS_LOVENDOR		100
diff --git a/arch/mips/kernel/module-rela.c b/arch/mips/kernel/module-rela.c
index 0570676..b361142 100644
--- a/arch/mips/kernel/module-rela.c
+++ b/arch/mips/kernel/module-rela.c
@@ -16,6 +16,7 @@
  *  Copyright (C) 2001 Rusty Russell.
  *  Copyright (C) 2003, 2004 Ralf Baechle (ralf@linux-mips.org)
  *  Copyright (C) 2005 Thiemo Seufer
+ *  Copyright (C) 2015 Imagination Technologies Ltd.
  */
 
 #include <linux/elf.h>
@@ -65,6 +66,48 @@ static int apply_r_mips_lo16_rela(struct module *me, u32 *location, Elf_Addr v)
 	return 0;
 }
 
+static int apply_r_mips_pc_rela(struct module *me, u32 *location, Elf_Addr v,
+				unsigned bits)
+{
+	unsigned long mask = GENMASK(bits - 1, 0);
+	unsigned long se_bits;
+	long offset;
+
+	if (v % 4) {
+		pr_err("module %s: dangerous R_MIPS_PC%u RELA relocation\n",
+		       me->name, bits);
+		return -ENOEXEC;
+	}
+
+	offset = ((long)v - (long)location) >> 2;
+
+	/* check the sign bit onwards are identical - ie. we didn't overflow */
+	se_bits = (offset & BIT(bits - 1)) ? ~0ul : 0;
+	if ((offset & ~mask) != (se_bits & ~mask)) {
+		pr_err("module %s: relocation overflow\n", me->name);
+		return -ENOEXEC;
+	}
+
+	*location = (*location & ~mask) | (offset & mask);
+
+	return 0;
+}
+
+static int apply_r_mips_pc16_rela(struct module *me, u32 *location, Elf_Addr v)
+{
+	return apply_r_mips_pc_rela(me, location, v, 16);
+}
+
+static int apply_r_mips_pc21_rela(struct module *me, u32 *location, Elf_Addr v)
+{
+	return apply_r_mips_pc_rela(me, location, v, 21);
+}
+
+static int apply_r_mips_pc26_rela(struct module *me, u32 *location, Elf_Addr v)
+{
+	return apply_r_mips_pc_rela(me, location, v, 26);
+}
+
 static int apply_r_mips_64_rela(struct module *me, u32 *location, Elf_Addr v)
 {
 	*(Elf_Addr *)location = v;
@@ -97,9 +140,12 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_MIPS_26]		= apply_r_mips_26_rela,
 	[R_MIPS_HI16]		= apply_r_mips_hi16_rela,
 	[R_MIPS_LO16]		= apply_r_mips_lo16_rela,
+	[R_MIPS_PC16]		= apply_r_mips_pc16_rela,
 	[R_MIPS_64]		= apply_r_mips_64_rela,
 	[R_MIPS_HIGHER]		= apply_r_mips_higher_rela,
-	[R_MIPS_HIGHEST]	= apply_r_mips_highest_rela
+	[R_MIPS_HIGHEST]	= apply_r_mips_highest_rela,
+	[R_MIPS_PC21_S2]	= apply_r_mips_pc21_rela,
+	[R_MIPS_PC26_S2]	= apply_r_mips_pc26_rela,
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.7.0
