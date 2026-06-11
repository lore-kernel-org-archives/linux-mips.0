Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7E3CAE7F;
	Thu, 11 Jun 2026 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185125; cv=none; b=fhC18aKpwMxGD5mVQP4kPqayEGQEb5fz+Exi2DWW3un/r9c0jjvo0C7r7WLvghjYOuqiKRn+ibhA+ggZhH/hl6HR6sr0yvuK4HWaDozqJyKjKL/8glIzRpZCARhp/nZ8fG8YFdFszDGtcrgf7oOXncIpWoz53piWzRY86EVPfQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185125; c=relaxed/simple;
	bh=ReaZiWUuKh6JEy0J4n97Vm8pMG3JDVBamIZGzxv9qFA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EA7XFYWt/g4DjXpsaxfjSyZUAuaIpAtLxE0ZC9Z9eRJrM4xF46n6yb/02BrRXD2QOTnCOljvcBsLR29moiuK9Oklw4yy3LQLhcj3pFe75dFJaJGNZFKn00DMYdUf490TcrLx75ASyN2mZLYKmaRI1r+i9Bg1PEsMADK6TIRP/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=gu2tKDqF; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="gu2tKDqF"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=N9ITyskFUfN9sQHxb9WrWtrq50c6nS4WUtOGvawk140=;
	b=gu2tKDqFgDiTar0rxDam+VGeZ78nKR1ppnEAzEx5OXstOulBcmo0+DNNaChry6Y+Q6tx2WAIz
	xzcKNg0jcA1osbs2KKxKrrd4jhab4owa7C3Z03s/cJ64tumWgSRv2Sddam0Ewkzfts6dE87t96z
	JQ0KahOs7NO6q/VfRn4LA0E=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gbk682Mfmz1T4K2;
	Thu, 11 Jun 2026 21:30:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F11464056D;
	Thu, 11 Jun 2026 21:38:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Jun
 2026 21:38:29 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <ruanjinjie@huawei.com>, <david.kaplan@amd.com>,
	<lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>, <maz@kernel.org>,
	<timothy.hayes@arm.com>, <lpieralisi@kernel.org>, <thuth@redhat.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<tabba@google.com>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
Date: Thu, 11 Jun 2026 21:38:09 +0800
Message-ID: <20260611133809.3854977-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611133809.3854977-1-ruanjinjie@huawei.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Support for parallel secondary CPU bringup is already utilized by x86,
MIPS, and RISC-V. This patch brings this capability to the arm64
architecture.

Rework the global `secondary_data` accessed during early boot into
a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
enabling the early boot code in head.S to resolve each secondary CPU's
logical ID concurrently.

To fully enable HOTPLUG_PARALLEL, this patch implements:
1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().

Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).

|     test kernel	   | secondary CPUs boot time |
|  ---------------------   |	--------------------  |
|   Without this patch     |		155.672	      |
|   cpuhp.parallel=0	   |		62.897	      |
|   cpuhp.parallel=1	   |		166.703	      |

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig           |  1 +
 arch/arm64/include/asm/smp.h |  8 ++++++++
 arch/arm64/kernel/head.S     | 23 +++++++++++++++++++++++
 arch/arm64/kernel/smp.c      | 27 +++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9091c67e1cc2..8735e9d8ed13 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -113,6 +113,7 @@ config ARM64
 	select CPUMASK_OFFSTACK if NR_CPUS > 256
 	select DCACHE_WORD_ACCESS
 	select HAVE_EXTRA_IPI_TRACEPOINTS
+	select HOTPLUG_PARALLEL if SMP && HOTPLUG_CPU
 	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select DMA_BOUNCE_UNALIGNED_KMALLOC
 	select DMA_DIRECT_REMAP
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index e2151a01731f..c39d4c0f8a37 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -92,6 +92,10 @@ struct secondary_data {
 	long status;
 };
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
+extern struct secondary_data cpu_boot_data[NR_CPUS];
+#endif
+
 extern struct secondary_data secondary_data;
 extern long __early_cpu_boot_status;
 extern void secondary_entry(void);
@@ -124,7 +128,11 @@ static inline void __noreturn cpu_park_loop(void)
 
 static inline void update_cpu_boot_status(unsigned int cpu, int val)
 {
+#ifdef CONFIG_HOTPLUG_PARALLEL
+	WRITE_ONCE(cpu_boot_data[cpu].status, val);
+#else
 	WRITE_ONCE(secondary_data.status, val);
+#endif
 	/* Ensure the visibility of the status update */
 	dsb(ishst);
 }
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..8f6c1c5e66d2 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -12,6 +12,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <linux/pgtable.h>
+#include <linux/threads.h>
 
 #include <asm/asm_pointer_auth.h>
 #include <asm/assembler.h>
@@ -391,7 +392,29 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 	msr	vbar_el1, x5
 	isb
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
+	mrs	x0, mpidr_el1
+	mov_q	x1, MPIDR_HWID_BITMASK
+	and	x0, x0, x1
+
+	adr_l	x1, __mpidr_to_cpuid_table
+	mov	x19, #0
+.Lfind_cpuid:
+	ldr	x3, [x1, x19, lsl #3]
+	cmp	x3, x0
+	b.eq	.Lfound_cpuid
+	add	x19, x19, #1
+	cmp	x19, #NR_CPUS
+	b.ne	.Lfind_cpuid
+	b	.
+
+.Lfound_cpuid:
+	adr_l	x0, cpu_boot_data
+	lsl	x3, x19, #4
+	add	x0, x0, x3
+#else
 	adr_l	x0, secondary_data
+#endif
 	ldr	x2, [x0, #CPU_BOOT_TASK]
 	cbz	x2, __secondary_too_slow
 
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 6bc90ee4820a..c909bf1c5119 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -61,6 +61,12 @@
  * where to place its SVC stack
  */
 struct secondary_data secondary_data;
+
+#ifdef CONFIG_HOTPLUG_PARALLEL
+struct secondary_data cpu_boot_data[NR_CPUS] ____cacheline_aligned __ro_after_init;
+unsigned long __mpidr_to_cpuid_table[NR_CPUS] ____cacheline_aligned;
+#endif
+
 /* Number of CPUs which aren't online, but looping in kernel text. */
 static int cpus_stuck_in_kernel;
 
@@ -106,8 +112,19 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	return -EOPNOTSUPP;
 }
 
+#ifndef CONFIG_HOTPLUG_PARALLEL
 static DECLARE_COMPLETION(cpu_running);
+#endif
+
+#ifdef CONFIG_HOTPLUG_PARALLEL
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
+{
+	cpu_boot_data[cpu].task = tidle;
+	update_cpu_boot_status(cpu, CPU_MMU_OFF);
 
+	return boot_secondary(cpu, tidle);
+}
+#else
 int __cpu_up(unsigned int cpu, struct task_struct *idle)
 {
 	int ret;
@@ -172,6 +189,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 
 	return -EIO;
 }
+#endif /* CONFIG_HOTPLUG_PARALLEL */
 
 static void init_gic_priority_masking(void)
 {
@@ -206,6 +224,10 @@ asmlinkage notrace void secondary_start_kernel(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
+	cpuhp_ap_sync_alive();
+#endif
+
 	/*
 	 * TTBR0 is only used for the identity mapping at this stage. Make it
 	 * point to zero page to avoid speculatively fetching new entries.
@@ -254,7 +276,9 @@ asmlinkage notrace void secondary_start_kernel(void)
 					 read_cpuid_id());
 	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
+#ifndef CONFIG_HOTPLUG_PARALLEL
 	complete(&cpu_running);
+#endif
 
 	/*
 	 * Secondary CPUs enter the kernel with all DAIF exceptions masked.
@@ -762,6 +786,9 @@ void __init smp_init_cpus(void)
 	 */
 	for (i = 1; i < nr_cpu_ids; i++) {
 		if (cpu_logical_map(i) != INVALID_HWID) {
+#ifdef CONFIG_HOTPLUG_PARALLEL
+			__mpidr_to_cpuid_table[i] = cpu_logical_map(i);
+#endif
 			if (smp_cpu_setup(i))
 				set_cpu_logical_map(i, INVALID_HWID);
 		}
-- 
2.34.1

