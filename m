Received: from mailapp01.imgtec.com ([195.59.15.196]:37143 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27041868AbcFCIgerHVq8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 3 Jun 2016 10:36:34 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH] MIPS: pistachio: Remove plat_setup_iocoherency
Date: Fri, 3 Jun 2016 09:35:00 +0100
Message-ID: <1464942900-39960-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: James.Hartley@imgtec.com, Zubair.Kakakhel@imgtec.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20160603083500.sPMIBabKtbt0csPpLxcKIbUzi-IFPafY5cFqkRZgSYU@z>

The Pistachio SoC does not have an IOCU.
Hence, DMA is non-coherent.

Remove the function checking for iocoherency and select
CONFIG_DMA_NONCOHERENT in Kconfig

This code is probably accidentally inherited from Malta.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Reviewed-by: James Hartley <james.hartley@imgtec.com>
---
 arch/mips/Kconfig          |  2 +-
 arch/mips/pistachio/init.c | 25 -------------------------
 2 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ac91939..266650e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -384,7 +384,7 @@ config MACH_PISTACHIO
 	select CLKSRC_MIPS_GIC
 	select COMMON_CLK
 	select CSRC_R4K
-	select DMA_MAYBE_COHERENT
+	select DMA_NONCOHERENT
 	select GPIOLIB
 	select IRQ_MIPS_CPU
 	select LIBFDT
diff --git a/arch/mips/pistachio/init.c b/arch/mips/pistachio/init.c
index ab79828..387b9df 100644
--- a/arch/mips/pistachio/init.c
+++ b/arch/mips/pistachio/init.c
@@ -60,29 +60,6 @@ const char *get_system_type(void)
 	return sys_type;
 }
 
-static void __init plat_setup_iocoherency(void)
-{
-	/*
-	 * Kernel has been configured with software coherency
-	 * but we might choose to turn it off and use hardware
-	 * coherency instead.
-	 */
-	if (mips_cm_numiocu() != 0) {
-		/* Nothing special needs to be done to enable coherency */
-		pr_info("CMP IOCU detected\n");
-		hw_coherentio = 1;
-		if (coherentio == 0)
-			pr_info("Hardware DMA cache coherency disabled\n");
-		else
-			pr_info("Hardware DMA cache coherency enabled\n");
-	} else {
-		if (coherentio == 1)
-			pr_info("Hardware DMA cache coherency unsupported, but enabled from command line!\n");
-		else
-			pr_info("Software DMA cache coherency enabled\n");
-	}
-}
-
 void __init *plat_get_fdt(void)
 {
 	if (fw_arg0 != -2)
@@ -93,8 +70,6 @@ void __init *plat_get_fdt(void)
 void __init plat_mem_setup(void)
 {
 	__dt_setup_arch(plat_get_fdt());
-
-	plat_setup_iocoherency();
 }
 
 #define DEFAULT_CPC_BASE_ADDR	0x1bde0000
-- 
1.9.1
