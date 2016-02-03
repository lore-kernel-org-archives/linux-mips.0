Received: from mailapp01.imgtec.com ([195.59.15.196]:24086 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011468AbcBCDpgfgHDQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:45:36 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/5] MIPS: module-rela: Make consistent use of pr_*()
Date: Wed, 3 Feb 2016 03:44:42 +0000
Message-ID: <1454471085-20963-3-git-send-email-paul.burton@imgtec.com>
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
Cc: "Steven J. Hill" <Steven.Hill@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160203034442.6uBKcCzU5z6pCo9VCyT7GqT-ZOpdj9tIR77mg7Rypfw@z>

From: "Steven J. Hill" <Steven.Hill@imgtec.com>

The module relocation handling code has inconsistent use of printk() and
pr_*() functions. Convert printk() calls to use pr_err() and pr_warn().

Signed-off-by: Steven J. Hill <Steven.Hill@imgtec.com>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/module-rela.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kernel/module-rela.c b/arch/mips/kernel/module-rela.c
index 769e316..f1ff64b 100644
--- a/arch/mips/kernel/module-rela.c
+++ b/arch/mips/kernel/module-rela.c
@@ -35,15 +35,13 @@ static int apply_r_mips_32_rela(struct module *me, u32 *location, Elf_Addr v)
 static int apply_r_mips_26_rela(struct module *me, u32 *location, Elf_Addr v)
 {
 	if (v % 4) {
-		pr_err("module %s: dangerous R_MIPS_26 RELArelocation\n",
+		pr_err("module %s: dangerous R_MIPS_26 RELA relocation\n",
 		       me->name);
 		return -ENOEXEC;
 	}
 
 	if ((v & 0xf0000000) != (((unsigned long)location + 4) & 0xf0000000)) {
-		printk(KERN_ERR
-		       "module %s: relocation overflow\n",
-		       me->name);
+		pr_err("module %s: relocation overflow\n", me->name);
 		return -ENOEXEC;
 	}
 
@@ -130,7 +128,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 			/* Ignore unresolved weak symbol */
 			if (ELF_ST_BIND(sym->st_info) == STB_WEAK)
 				continue;
-			printk(KERN_WARNING "%s: Unknown symbol %s\n",
+			pr_warn("%s: Unknown symbol %s\n",
 			       me->name, strtab + sym->st_name);
 			return -ENOENT;
 		}
-- 
2.7.0
