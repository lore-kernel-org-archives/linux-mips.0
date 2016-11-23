Received: from mailapp01.imgtec.com ([195.59.15.196]:11377 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993041AbcKWNoKEW1-G (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Nov 2016 14:44:10 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 05/10] MIPS: platform: allow for DTB to be moved during kernel relocation
Date: Wed, 23 Nov 2016 14:43:47 +0100
Message-ID: <1479908632-30392-6-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1479908632-30392-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1479908632-30392-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20161123134347.YRRZGZ2PGs5P3tRxY1-_ZutAyd3fGM3Kbf-h6wuksQY@z>

Add plat_fdt_relocated(void*) API to allow the kernel relocation code to
update platform's information about the DTB location if the DTB had to
be moved due to being placed in a location used by the relocated kernel.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/generic/init.c         | 13 +++++++++++++
 arch/mips/include/asm/bootinfo.h | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index d493ccb..4af6192 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -88,6 +88,19 @@ void __init *plat_get_fdt(void)
 	return (void *)fdt;
 }
 
+void __init plat_fdt_relocated(void *new_location)
+{
+	/*
+	 * reset fdt as the cached value would point to the location
+	 * before relocations happened and update the location argument
+	 * if it was passed using UHI
+	 */
+	fdt = NULL;
+
+	if (fw_arg0 == -2)
+		fw_arg1 = (unsigned long)new_location;
+}
+
 void __init plat_mem_setup(void)
 {
 	if (mach && mach->fixup_fdt)
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index ee9f5f2..e26a093 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -164,6 +164,19 @@ static inline void plat_swiotlb_setup(void) {}
  * Return: Pointer to the flattened device tree blob.
  */
 extern void *plat_get_fdt(void);
+
+#ifdef CONFIG_RELOCATABLE
+
+/**
+ * plat_fdt_relocated() - Update platform's information about relocated dtb
+ *
+ * This function provides a platform-independent API to set platform's
+ * information about relocated DTB if it needs to be moved due to kernel
+ * relocation occurring at boot.
+ */
+void plat_fdt_relocated(void *new_location);
+
+#endif /* CONFIG_RELOCATABLE */
 #endif /* CONFIG_USE_OF */
 
 #endif /* _ASM_BOOTINFO_H */
-- 
2.7.4
