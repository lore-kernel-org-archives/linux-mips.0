Received: from mailapp01.imgtec.com ([195.59.15.196]:23247 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011472AbcBCDqU1-lMQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:46:20 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 5/5] MIPS: Implement MIPSr6 R_MIPS_PC2x rel-style relocs
Date: Wed, 3 Feb 2016 03:44:45 +0000
Message-ID: <1454471085-20963-6-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454471085-20963-1-git-send-email-paul.burton@imgtec.com>
References: <1454471085-20963-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Andrey Konovalov <adech.fo@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160203034445.3Qv-eb3x_7o-NELUkb01dLbIgnPN__0S8YrF3xNK1N0@z>

MIPS32r6 code makes use of rel-stye relocations & may contain the new
relocations R_MIPS_PC21_S2 or R_MIPS_PC26_S2 which were introduced with
MIPSr6. Implement support for those relocations such that we can load
MIPS32r6 kernel modules.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

 arch/mips/kernel/module.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index f2de9b8..d62fd56 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -194,6 +194,56 @@ static int apply_r_mips_pc16_rel(struct module *me, u32 *location, Elf_Addr v)
 	return 0;
 }
 
+static int apply_r_mips_pc21_rel(struct module *me, u32 *location, Elf_Addr v)
+{
+	long offset;
+
+	if (v % 4) {
+		pr_err("module %s: dangerous R_MIPS_PC21 REL relocation\n",
+		       me->name);
+		return -ENOEXEC;
+	}
+
+	/* retrieve & sign extend implicit addend */
+	offset = *location & 0x1fffff;
+	offset |= (offset & BIT(20)) ? (~0l & ~0x1fffffl) : 0;
+
+	offset += ((long)v - (long)location) >> 2;
+	if ((offset >> 20) > 0 || (offset >> 20) < -1) {
+		pr_err("module %s: relocation overflow\n", me->name);
+		return -ENOEXEC;
+	}
+
+	*location = (*location & ~0x001fffff) | (offset & 0x001fffff);
+
+	return 0;
+}
+
+static int apply_r_mips_pc26_rel(struct module *me, u32 *location, Elf_Addr v)
+{
+	long offset;
+
+	if (v % 4) {
+		pr_err("module %s: dangerous R_MIPS_PC26 REL relocation\n",
+		       me->name);
+		return -ENOEXEC;
+	}
+
+	/* retrieve & sign extend implicit addend */
+	offset = *location & 0x3ffffff;
+	offset |= (offset & BIT(25)) ? (~0l & ~0x3ffffffl) : 0;
+
+	offset += ((long)v - (long)location) >> 2;
+	if ((offset >> 25) > 0 || (offset >> 25) < -1) {
+		pr_err("module %s: relocation overflow\n", me->name);
+		return -ENOEXEC;
+	}
+
+	*location = (*location & ~0x03ffffff) | (offset & 0x03ffffff);
+
+	return 0;
+}
+
 static int (*reloc_handlers_rel[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
 	[R_MIPS_NONE]		= apply_r_mips_none,
@@ -202,6 +252,8 @@ static int (*reloc_handlers_rel[]) (struct module *me, u32 *location,
 	[R_MIPS_HI16]		= apply_r_mips_hi16_rel,
 	[R_MIPS_LO16]		= apply_r_mips_lo16_rel,
 	[R_MIPS_PC16]		= apply_r_mips_pc16_rel,
+	[R_MIPS_PC21_S2]	= apply_r_mips_pc21_rel,
+	[R_MIPS_PC26_S2]	= apply_r_mips_pc26_rel,
 };
 
 int apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.7.0
