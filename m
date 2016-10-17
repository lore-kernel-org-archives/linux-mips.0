Received: from mailapp02.imgtec.com ([217.156.133.132]:20000 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992232AbcJQKFTDBWPU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 12:05:19 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: generic: Fix KASLR for generic kernel.
Date: Mon, 17 Oct 2016 11:05:09 +0100
Message-ID: <1476698709-6771-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161017100509.S5Da1wVVxgbmLr2RkwrXObTJ6Xtl5ILh5HUPpXGT4HY@z>

The KASLR code requires that the plat_get_fdt() function return the
address of the device tree, and it must be available early in the boot,
before prom_init() is called. Move the code determining the address of
the device tree into plat_get_fdt, and call that from prom_init().

The fdt pointer will be set up by plat_get_fdt() called from
relocate_kernel initially and once the relocated kernel has started,
prom_init() will use it again to determine the address in the relocated
image.

Fixes: eed0eabd12ef
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/generic/init.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 0ea73e845440..d493ccbf274a 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -30,9 +30,19 @@ static __initdata const void *mach_match_data;
 
 void __init prom_init(void)
 {
+	plat_get_fdt();
+	BUG_ON(!fdt);
+}
+
+void __init *plat_get_fdt(void)
+{
 	const struct mips_machine *check_mach;
 	const struct of_device_id *match;
 
+	if (fdt)
+		/* Already set up */
+		return (void *)fdt;
+
 	if ((fw_arg0 == -2) && !fdt_check_header((void *)fw_arg1)) {
 		/*
 		 * We booted using the UHI boot protocol, so we have been
@@ -75,12 +85,6 @@ void __init prom_init(void)
 		/* Retrieve the machine's FDT */
 		fdt = mach->fdt;
 	}
-
-	BUG_ON(!fdt);
-}
-
-void __init *plat_get_fdt(void)
-{
 	return (void *)fdt;
 }
 
-- 
2.7.4
