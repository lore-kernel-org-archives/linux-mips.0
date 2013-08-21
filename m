Received: from multi.imgtec.com ([194.200.65.239]:52810 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817419Ab3HUIxzFWILt (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 Aug 2013 10:53:55 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: powertv: Drop BOOTLOADER_DRIVER Kconfig symbol
Date: Wed, 21 Aug 2013 09:53:33 +0100
Message-ID: <1377075213-22398-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20130821085333.PquJoA9xlyRzG_0Ptf7P287jA8tTg1-aZAOjNR2_I-U@z>

The kbldr.h header file required for this was neither committed in the
original submission in a3a0f8c8ed2e2470f4dcd6da95020d41fed84747
"MIPS: PowerTV: Base files for Cisco PowerTV platform"
nor it was ever present in the git tree so this option never worked.
Fixes the following build problem:
arch/mips/powertv/reset.c:25:36: fatal error: asm/mach-powertv/kbldr.h: No such
file or directory
compilation terminated.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com> 
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/Kconfig                     |  1 +
 arch/mips/powertv/Kconfig             |  9 +--------
 arch/mips/powertv/asic/asic_devices.c | 15 +++------------
 arch/mips/powertv/init.c              |  4 ----
 arch/mips/powertv/reset.c             | 12 ------------
 5 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e12764c..d08a3a6 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -416,6 +416,7 @@ config PMC_MSP
 config POWERTV
 	bool "Cisco PowerTV"
 	select BOOT_ELF32
+	select BOOTLOADER_FAMILY
 	select CEVT_R4K
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
diff --git a/arch/mips/powertv/Kconfig b/arch/mips/powertv/Kconfig
index 1a1b03e..dd91fba 100644
--- a/arch/mips/powertv/Kconfig
+++ b/arch/mips/powertv/Kconfig
@@ -1,14 +1,7 @@
-config BOOTLOADER_DRIVER
-	bool "PowerTV Bootloader Driver Support"
-	default n
-	depends on POWERTV
-	help
-	  Use this option if you want to load bootloader driver.
-
 config BOOTLOADER_FAMILY
 	string "POWERTV Bootloader Family string"
 	default "85"
-	depends on POWERTV && !BOOTLOADER_DRIVER
+	depends on POWERTV
 	help
 	  This value should be specified when the bootloader driver is disabled
 	  and must be exactly two characters long. Families supported are:
diff --git a/arch/mips/powertv/asic/asic_devices.c b/arch/mips/powertv/asic/asic_devices.c
index 0238af1..a548c50 100644
--- a/arch/mips/powertv/asic/asic_devices.c
+++ b/arch/mips/powertv/asic/asic_devices.c
@@ -149,18 +149,9 @@ static __init noinline void platform_set_family(void)
 			forced_family[1]);
 	else {
 
-#ifdef CONFIG_BOOTLOADER_DRIVER
-		bootldr_family = (unsigned short) kbldr_GetSWFamily();
-#else
-#if defined(CONFIG_BOOTLOADER_FAMILY)
-		bootldr_family = (unsigned short) BOOTLDRFAMILY(
-			CONFIG_BOOTLOADER_FAMILY[0],
-			CONFIG_BOOTLOADER_FAMILY[1]);
-#else
-#error "Unknown Bootloader Family"
-#endif
-#endif
-	}
+	bootldr_family = (unsigned short) BOOTLDRFAMILY(
+		CONFIG_BOOTLOADER_FAMILY[0],
+		CONFIG_BOOTLOADER_FAMILY[1]);
 
 	pr_info("Bootloader Family = 0x%04X\n", bootldr_family);
 
diff --git a/arch/mips/powertv/init.c b/arch/mips/powertv/init.c
index a01baff..4989263 100644
--- a/arch/mips/powertv/init.c
+++ b/arch/mips/powertv/init.c
@@ -87,8 +87,4 @@ void __init prom_init(void)
 
 	configure_platform();
 	prom_meminit();
-
-#ifndef CONFIG_BOOTLOADER_DRIVER
-	pr_info("\nBootloader driver isn't loaded...\n");
-#endif
 }
diff --git a/arch/mips/powertv/reset.c b/arch/mips/powertv/reset.c
index 0007652..11c32fb 100644
--- a/arch/mips/powertv/reset.c
+++ b/arch/mips/powertv/reset.c
@@ -21,24 +21,12 @@
 #include <linux/io.h>
 #include <asm/reboot.h>			/* Not included by linux/reboot.h */
 
-#ifdef CONFIG_BOOTLOADER_DRIVER
-#include <asm/mach-powertv/kbldr.h>
-#endif
-
 #include <asm/mach-powertv/asic_regs.h>
 #include "reset.h"
 
 static void mips_machine_restart(char *command)
 {
-#ifdef CONFIG_BOOTLOADER_DRIVER
-	/*
-	 * Call the bootloader's reset function to ensure
-	 * that persistent data is flushed before hard reset
-	 */
-	kbldr_SetCauseAndReset();
-#else
 	writel(0x1, asic_reg_addr(watchdog));
-#endif
 }
 
 void mips_reboot_setup(void)
-- 
1.8.3.2
