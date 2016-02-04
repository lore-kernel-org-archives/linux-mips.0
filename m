Received: from mailapp01.imgtec.com ([195.59.15.196]:50903 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012659AbcBDNFnFC80l (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 4 Feb 2016 14:05:43 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 1/4] MIPS: Bail on unsupported module relocs
Date: Thu, 4 Feb 2016 13:05:02 +0000
Message-ID: <1454591105-11841-2-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160204130502.WGtesTaKte3llK8W_HYba0mVsqSXVAlgGSMr_ZaIMHE@z>

When an unsupported reloc is encountered in a module, we currently
blindly branch to whatever would be at its entry in the reloc handler
function pointer arrays. This may be NULL, or if the unsupported reloc
has a type greater than that of the supported reloc with the highest
type then we'll dereference some value after the function pointer array
& branch to that. The result is at best a kernel oops.

Fix this by checking that the reloc type has an entry in the function
pointer array (ie. is less than the number of items in the array) and
that the handler is non-NULL, returning an error code to fail the module
load if no handler is found.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>

---

Changes in v2:
- Use pr_err instead of pr_warn.

 arch/mips/kernel/module-rela.c | 19 ++++++++++++++++---
 arch/mips/kernel/module.c      | 19 ++++++++++++++++---
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/module-rela.c b/arch/mips/kernel/module-rela.c
index 2b70723..9083d63 100644
--- a/arch/mips/kernel/module-rela.c
+++ b/arch/mips/kernel/module-rela.c
@@ -109,9 +109,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		       struct module *me)
 {
 	Elf_Mips_Rela *rel = (void *) sechdrs[relsec].sh_addr;
+	int (*handler)(struct module *me, u32 *location, Elf_Addr v);
 	Elf_Sym *sym;
 	u32 *location;
-	unsigned int i;
+	unsigned int i, type;
 	Elf_Addr v;
 	int res;
 
@@ -134,9 +135,21 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 			return -ENOENT;
 		}
 
-		v = sym->st_value + rel[i].r_addend;
+		type = ELF_MIPS_R_TYPE(rel[i]);
+
+		if (type < ARRAY_SIZE(reloc_handlers_rela))
+			handler = reloc_handlers_rela[type];
+		else
+			handler = NULL;
 
-		res = reloc_handlers_rela[ELF_MIPS_R_TYPE(rel[i])](me, location, v);
+		if (!handler) {
+			pr_err("%s: Unknown relocation type %u\n",
+			       me->name, type);
+			return -EINVAL;
+		}
+
+		v = sym->st_value + rel[i].r_addend;
+		res = handler(me, location, v);
 		if (res)
 			return res;
 	}
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 1833f51..f9b2936 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -197,9 +197,10 @@ int apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
 		   struct module *me)
 {
 	Elf_Mips_Rel *rel = (void *) sechdrs[relsec].sh_addr;
+	int (*handler)(struct module *me, u32 *location, Elf_Addr v);
 	Elf_Sym *sym;
 	u32 *location;
-	unsigned int i;
+	unsigned int i, type;
 	Elf_Addr v;
 	int res;
 
@@ -223,9 +224,21 @@ int apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
 			return -ENOENT;
 		}
 
-		v = sym->st_value;
+		type = ELF_MIPS_R_TYPE(rel[i]);
+
+		if (type < ARRAY_SIZE(reloc_handlers_rel))
+			handler = reloc_handlers_rel[type];
+		else
+			handler = NULL;
 
-		res = reloc_handlers_rel[ELF_MIPS_R_TYPE(rel[i])](me, location, v);
+		if (!handler) {
+			pr_err("%s: Unknown relocation type %u\n",
+			       me->name, type);
+			return -EINVAL;
+		}
+
+		v = sym->st_value;
+		res = handler(me, location, v);
 		if (res)
 			return res;
 	}
-- 
2.7.0
