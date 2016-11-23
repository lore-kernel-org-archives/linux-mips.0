Received: from mail-sn1nam01on0075.outbound.protection.outlook.com ([104.47.32.75]:16944
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993008AbcKWM0qOdCYP (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 23 Nov 2016 13:26:46 +0100
Subject: [PATCH v2 5/5] MIPS: OCTEON: Enable KASLR
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <d760ef90-ad22-dff7-14b6-2bc6af5a6745@cavium.com>
Date: Wed, 23 Nov 2016 06:26:30 -0600
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
Message-ID: <20161123122630.e2A2AeRhmomK9Awd4xhcwXVDkSlAzX3R9K304g_qOzg@z>

Add KASLR to be selected on OCTEON systems.

Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
---
 arch/mips/Kconfig                                  |  3 +-
 arch/mips/cavium-octeon/smp.c                      | 42 ++++++++++++++++++++++
 .../asm/mach-cavium-octeon/kernel-entry-init.h     |  7 ++--
 arch/mips/kernel/relocate.c                        | 17 +++++++++
 arch/mips/kernel/setup.c                           |  4 ++-
 5 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2638856..323d51c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -892,6 +892,7 @@ config CAVIUM_OCTEON_SOC
 	select NR_CPUS_DEFAULT_16
 	select BUILTIN_DTB
 	select MTD_COMPLEX_MAPPINGS
+	select SYS_SUPPORTS_RELOCATABLE
 	help
 	  This option supports all of the Octeon reference boards from Cavium
 	  Networks. It builds a kernel that dynamically determines the Octeon
@@ -2535,7 +2536,7 @@ config SYS_SUPPORTS_NUMA

 config RELOCATABLE
 	bool "Relocatable kernel"
-	depends on SYS_SUPPORTS_RELOCATABLE && (CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_MIPS32_R6 || CPU_MIPS64_R6)
+	depends on SYS_SUPPORTS_RELOCATABLE && (CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_MIPS32_R6 || CPU_MIPS64_R6 || CAVIUM_OCTEON_SOC)
 	help
 	  This builds a kernel image that retains relocation information
 	  so it can be loaded someplace besides the default 1MB.
diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 4d457d60..4ac97a3 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -12,10 +12,12 @@
 #include <linux/kernel_stat.h>
 #include <linux/sched.h>
 #include <linux/module.h>
+#include <linux/bootmem.h>

 #include <asm/mmu_context.h>
 #include <asm/time.h>
 #include <asm/setup.h>
+#include <asm/sections.h>

 #include <asm/octeon/octeon.h>

@@ -24,6 +26,7 @@
 volatile unsigned long octeon_processor_boot = 0xff;
 volatile unsigned long octeon_processor_sp;
 volatile unsigned long octeon_processor_gp;
+volatile unsigned long octeon_processor_smpentry;

 #ifdef CONFIG_HOTPLUG_CPU
 uint64_t octeon_bootloader_entry_addr;
@@ -180,6 +183,23 @@ static void __init octeon_smp_setup(void)
 	octeon_smp_hotplug_setup();
 }

+#ifdef CONFIG_RELOCATABLE
+static long relocation_offset __initdata;
+
+void __init plat_save_relocation(long offset)
+{
+	relocation_offset = offset;
+}
+
+void __init RELOCATE(volatile unsigned long *addr, unsigned long val)
+{
+	unsigned long *p;
+
+	p = (unsigned long *) ((unsigned long)addr - relocation_offset);
+	*p = val;
+}
+#endif
+
 /**
  * Firmware CPU startup hook
  *
@@ -191,9 +211,17 @@ static void octeon_boot_secondary(int cpu, struct task_struct *idle)
 	pr_info("SMP: Booting CPU%02d (CoreId %2d)...\n", cpu,
 		cpu_logical_map(cpu));

+#ifndef CONFIG_RELOCATABLE
 	octeon_processor_sp = __KSTK_TOS(idle);
 	octeon_processor_gp = (unsigned long)(task_thread_info(idle));
 	octeon_processor_boot = cpu_logical_map(cpu);
+	octeon_processor_smpentry = (unsigned long)&smp_bootstrap;
+#else
+	RELOCATE(&octeon_processor_sp, __KSTK_TOS(idle));
+	RELOCATE(&octeon_processor_gp, (unsigned long)(task_thread_info(idle)));
+	RELOCATE(&octeon_processor_boot, cpu_logical_map(cpu));
+	RELOCATE(&octeon_processor_smpentry, (unsigned long)&smp_bootstrap);
+#endif
 	mb();

 	count = 10000;
@@ -204,6 +232,20 @@ static void octeon_boot_secondary(int cpu, struct task_struct *idle)
 	}
 	if (count == 0)
 		pr_err("Secondary boot timeout\n");
+
+#ifdef CONFIG_RELOCATABLE
+	/*
+	 * The last present CPU is now running in the relocated
+	 * kernel code. We can free up the bootmem pages.
+	 */
+	if ((num_present_cpus() - 1) == cpu) {
+		unsigned long offset;
+
+		offset = __pa_symbol(_text) - __pa_symbol(VMLINUX_LOAD_ADDRESS);
+		free_bootmem_late(__pa_symbol(VMLINUX_LOAD_ADDRESS), offset);
+		relocation_offset = 0;
+	}
+#endif
 }

 /**
diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
index c4873e8..981d072 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
@@ -113,6 +113,9 @@ octeon_spin_wait_boot:
 	# Get my SP from the global variable
 	PTR_LA	t0, octeon_processor_sp
 	LONG_L	sp, (t0)
+	# Get my SMPENTRY target from the global variable
+	PTR_LA	t0, octeon_processor_smpentry
+	LONG_L	t1, (t0)
 	# Set the SP global variable to zero so the master knows we've started
 	LONG_S	zero, (t0)
 #ifdef __OCTEON__
@@ -121,8 +124,8 @@ octeon_spin_wait_boot:
 #else
 	sync
 #endif
-	# Jump to the normal Linux SMP entry point
-	j   smp_bootstrap
+	# Jump to the normal Linux SMP entry point (smp_bootstrap)
+	jr	t1
 	nop
 #else /* CONFIG_SMP */

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index ca1cc30..250ff9c 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -31,6 +31,20 @@ extern u32 _relocation_end[];	/* End relocation table */
 extern long __start___ex_table;	/* Start exception table */
 extern long __stop___ex_table;	/* End exception table */

+
+/*
+ * Declare this function weak so the platform can choose if they
+ * want the kernel relocation offset.
+ *
+ * WARNING!!!	This is a potential security risk if the platform
+ *		function does not zero out the value before getting
+ *		to userspace!
+ */
+void __weak plat_save_relocation(long offset)
+{
+	/* Do nothing... */
+}
+
 static inline u32 __init get_synci_step(void)
 {
 	u32 res;
@@ -316,6 +330,9 @@ void *__init relocate_kernel(void)
 	arcs_cmdline[0] = '\0';

 	if (offset) {
+		/* Save the relocation offset value. */
+		plat_save_relocation(offset);
+
 		/* Copy the kernel to it's new location */
 		memcpy(loc_new, &_text, kernel_length);

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 36cf8d6..582c711 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -501,11 +501,13 @@ static void __init bootmem_init(void)
 	 * between the original and new locations may be returned to the system.
 	 */
 	if (__pa_symbol(_text) > __pa_symbol(VMLINUX_LOAD_ADDRESS)) {
-		unsigned long offset;
 		extern void show_kernel_relocation(const char *level);
+#ifndef CONFIG_CAVIUM_OCTEON_SOC
+		unsigned long offset;

 		offset = __pa_symbol(_text) - __pa_symbol(VMLINUX_LOAD_ADDRESS);
 		free_bootmem(__pa_symbol(VMLINUX_LOAD_ADDRESS), offset);
+#endif

 #if defined(CONFIG_DEBUG_KERNEL) && defined(CONFIG_DEBUG_INFO)
 		/*
-- 
1.9.1
