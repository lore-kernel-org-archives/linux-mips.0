Received: from mailapp01.imgtec.com ([195.59.15.196]:3050 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992881AbdC3SidSh8kr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Mar 2017 20:38:33 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/2] MIPS: module: Ensure we always clean up r_mips_hi16_list
Date: Thu, 30 Mar 2017 11:37:44 -0700
Message-ID: <20170330183746.25339-2-paul.burton@imgtec.com>
In-Reply-To: <20170330183746.25339-1-paul.burton@imgtec.com>
References: <20170330183746.25339-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170330183744.vypU_UyUSIZZa0E0KJp0jbmM_4RX7ZxYv-9VK-Ydb9E@z>

If we hit an error whilst processing a reloc then we would return early
from apply_relocate & potentially not free entries in r_mips_hi16_list,
thereby leaking memory. Fix this by ensuring that we always run the code
to free r_mipps_hi16_list when errors occur.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: 861667dc82f5 ("MIPS: Fix race condition in module relocation code.")
Fixes: 04211a574641 ("MIPS: Bail on unsupported module relocs")
Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
---

 arch/mips/kernel/module.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 94627a3a6a0d..ddcfb59593b6 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -251,7 +251,7 @@ int apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
 	u32 *location;
 	unsigned int i, type;
 	Elf_Addr v;
-	int res;
+	int err = 0;
 
 	pr_debug("Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
@@ -270,7 +270,8 @@ int apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
 				continue;
 			pr_warn("%s: Unknown symbol %s\n",
 				me->name, strtab + sym->st_name);
-			return -ENOENT;
+			err = -ENOENT;
+			goto out;
 		}
 
 		type = ELF_MIPS_R_TYPE(rel[i]);
@@ -283,29 +284,32 @@ int apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
 		if (!handler) {
 			pr_err("%s: Unknown relocation type %u\n",
 			       me->name, type);
-			return -EINVAL;
+			err = -EINVAL;
+			goto out;
 		}
 
 		v = sym->st_value;
-		res = handler(me, location, v);
-		if (res)
-			return res;
+		err = handler(me, location, v);
+		if (err)
+			goto out;
 	}
 
+out:
 	/*
-	 * Normally the hi16 list should be deallocated at this point.	A
+	 * Normally the hi16 list should be deallocated at this point. A
 	 * malformed binary however could contain a series of R_MIPS_HI16
-	 * relocations not followed by a R_MIPS_LO16 relocation.  In that
-	 * case, free up the list and return an error.
+	 * relocations not followed by a R_MIPS_LO16 relocation, or if we hit
+	 * an error processing a reloc we might have gotten here before
+	 * reaching the R_MIPS_LO16. In either case, free up the list and
+	 * return an error.
 	 */
 	if (me->arch.r_mips_hi16_list) {
 		free_relocation_chain(me->arch.r_mips_hi16_list);
 		me->arch.r_mips_hi16_list = NULL;
-
-		return -ENOEXEC;
+		err = err ?: -ENOEXEC;
 	}
 
-	return 0;
+	return err;
 }
 
 /* Given an address, look for it in the module exception tables. */
-- 
2.12.1
