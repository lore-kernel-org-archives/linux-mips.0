Received: from mail-bn3nam01on0045.outbound.protection.outlook.com ([104.47.33.45]:1697
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992992AbcLMUZrLCVSv (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 13 Dec 2016 21:25:47 +0100
Subject: [PATCH v3] MIPS: OCTEON: Enable KASLR
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <086dba14-cbbf-5fb8-ae39-bfb2f725d91a@cavium.com>
Date: Tue, 13 Dec 2016 14:25:37 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
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
Cc: ralf@linux-mips.org
Message-ID: <20161213202537.lZuzqs_mGdZ94Em9MGP1hZS650EZTiJp-RAzXmYlNok@z>

This patch enables KASLR for OCTEON systems. The SMP startup code is
such that the secondaries monitor the volatile variable
'octeon_processor_relocated_kernel_entry' for any non-zero value.
The 'plat_post_relocation hook' is used to set that value to the
kernel entry point of the relocated kernel. The secondary CPUs will
then jusmp to the new kernel, perform their initialization again
and begin waiting for the boot CPU to start them via the relocated
loop 'octeon_spin_wait_boot'. Inspired by Steven's code from Cavium.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
---
Changes in v3:
  - Remove unneeded instructions and correct spelling.

Changes in v2:
  - Add missing code to set 'octeon_processor_relocated_kernel_entry'
    which was forgotten. Mental note, don't submit patches at 3a.m.
---
 arch/mips/Kconfig                                    |  3 ++-
 arch/mips/cavium-octeon/smp.c                        | 20 ++++++++++++++++++--
 .../asm/mach-cavium-octeon/kernel-entry-init.h       | 15 +++++++++++++--
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b3c5bde..65d7e20 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -909,6 +909,7 @@ config CAVIUM_OCTEON_SOC
 	select NR_CPUS_DEFAULT_16
 	select BUILTIN_DTB
 	select MTD_COMPLEX_MAPPINGS
+	select SYS_SUPPORTS_RELOCATABLE
 	help
 	  This option supports all of the Octeon reference boards from Cavium
 	  Networks. It builds a kernel that dynamically determines the Octeon
@@ -2570,7 +2571,7 @@ config SYS_SUPPORTS_NUMA

 config RELOCATABLE
 	bool "Relocatable kernel"
-	depends on SYS_SUPPORTS_RELOCATABLE && (CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_MIPS32_R6 || CPU_MIPS64_R6)
+	depends on SYS_SUPPORTS_RELOCATABLE && (CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_MIPS32_R6 || CPU_MIPS64_R6 || CAVIUM_OCTEON_SOC)
 	help
 	  This builds a kernel image that retains relocation information
 	  so it can be loaded someplace besides the default 1MB.
diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 256fe6f..889c3f4 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -24,12 +24,17 @@
 volatile unsigned long octeon_processor_boot = 0xff;
 volatile unsigned long octeon_processor_sp;
 volatile unsigned long octeon_processor_gp;
+#ifdef CONFIG_RELOCATABLE
+volatile unsigned long octeon_processor_relocated_kernel_entry;
+#endif /* CONFIG_RELOCATABLE */

 #ifdef CONFIG_HOTPLUG_CPU
 uint64_t octeon_bootloader_entry_addr;
 EXPORT_SYMBOL(octeon_bootloader_entry_addr);
 #endif

+extern void kernel_entry(unsigned long arg1, ...);
+
 static void octeon_icache_flush(void)
 {
 	asm volatile ("synci 0($0)\n");
@@ -180,6 +185,19 @@ static void __init octeon_smp_setup(void)
 	octeon_smp_hotplug_setup();
 }

+
+#ifdef CONFIG_RELOCATABLE
+int plat_post_relocation(long offset)
+{
+	unsigned long entry = (unsigned long)kernel_entry;
+
+	/* Send secondaries into relocated kernel */
+	octeon_processor_relocated_kernel_entry = entry + offset;
+
+	return 0;
+}
+#endif /* CONFIG_RELOCATABLE */
+
 /**
  * Firmware CPU startup hook
  *
@@ -333,8 +351,6 @@ void play_dead(void)
 		;
 }

-extern void kernel_entry(unsigned long arg1, ...);
-
 static void start_after_reset(void)
 {
 	kernel_entry(0, 0, 0);	/* set a2 = 0 for secondary core */
diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
index c4873e8..c38b38c 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
@@ -99,9 +99,20 @@
 	# to begin
 	#

-	# This is the variable where the next core to boot os stored
-	PTR_LA	t0, octeon_processor_boot
 octeon_spin_wait_boot:
+#ifdef CONFIG_RELOCATABLE
+	PTR_LA	t0, octeon_processor_relocated_kernel_entry
+	LONG_L	t0, (t0)
+	beq	zero, t0, 1f
+	nop
+
+	jr	t0
+	nop
+1:
+#endif /* CONFIG_RELOCATABLE */
+
+	# This is the variable where the next core to boot is stored
+	PTR_LA	t0, octeon_processor_boot
 	# Get the core id of the next to be booted
 	LONG_L	t1, (t0)
 	# Keep looping if it isn't me
-- 
1.9.1
