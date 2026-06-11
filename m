Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21FE3F788A;
	Thu, 11 Jun 2026 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185119; cv=none; b=SO4vJ/mnITPULMO5MTw0COSFUquDdaQNjf9suEJrE4qVb0uX4zg6i1sHo32m6a6/eQnG0ll0hJaLdfZi9t/uZD7k21GdVd6/yNIn4MxaD8EFHOUo9Xo3Azd4valCoQ1E7AzECiSyxWLegQ5FGAe3NfiSmnvKnuIlOCaDIby2rjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185119; c=relaxed/simple;
	bh=0gP4p0OW0nBKnpSggtrr5qKGAhEnw2p7kjXUyU3CDsM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HD1D/Tw6MSejKDQAltqz4RvRr/uJmORG3c0IisoDbBqPnBSx6oS6OzKk3znhML3Vd/rF8WUJnezdfrB2eX+JTN+uAV66Af5X5cJechujijikUEEmiEMJjE0b+QWQsWBVL6RzcPwsc3K8vS+DxRYgsZ90ey7yclnccO7mQN9DvXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=3pRLLMQX; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="3pRLLMQX"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c152yyawWOwtqOgmdJ351m5tfsJBbmik79lhDs9C+mM=;
	b=3pRLLMQXbk5Ji4A9Nr/somPIkUqHEODjvTuRHTO+MqQLE8vsaFxa49OIQx3vdq3I3YSzfKjwe
	TCdziiCYZWuQpsNpKj8Ief3gxPdRwEDLjg8av45OjqLzqGDIgOLQUayxMNTbqmapJ5IeDVn1evq
	t0JJEd2E1UK2l2+MLfufj7w=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gbk6b4vJ6z1prRD;
	Thu, 11 Jun 2026 21:30:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 34E524048F;
	Thu, 11 Jun 2026 21:38:29 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Jun
 2026 21:38:27 +0800
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
Subject: [PATCH RFC 2/3] arm64: smp: Pass CPU ID to update_cpu_boot_status()
Date: Thu, 11 Jun 2026 21:38:08 +0800
Message-ID: <20260611133809.3854977-3-ruanjinjie@huawei.com>
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

To support CONFIG_HOTPLUG_PARALLEL, the CPU boot status tracking must
be refactored from a single global variable (secondary_data.status)
to a per-CPU tracking structure to prevent multi-core race conditions.

Add a 'cpu' parameter to update_cpu_boot_status() and update all its
callsites to pass the corresponding CPU ID. This allows updating the
boot status at a per-CPU granularity during parallel bringup.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/smp.h   | 6 +++---
 arch/arm64/kernel/cpufeature.c | 2 +-
 arch/arm64/kernel/smp.c        | 8 ++++----
 arch/arm64/mm/context.c        | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 10ea4f543069..e2151a01731f 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -122,7 +122,7 @@ static inline void __noreturn cpu_park_loop(void)
 	}
 }
 
-static inline void update_cpu_boot_status(int val)
+static inline void update_cpu_boot_status(unsigned int cpu, int val)
 {
 	WRITE_ONCE(secondary_data.status, val);
 	/* Ensure the visibility of the status update */
@@ -134,9 +134,9 @@ static inline void update_cpu_boot_status(int val)
  * which calls for a kernel panic. Update the boot status and park the calling
  * CPU.
  */
-static inline void __noreturn cpu_panic_kernel(void)
+static inline void __noreturn cpu_panic_kernel(unsigned int cpu)
 {
-	update_cpu_boot_status(CPU_PANIC_KERNEL);
+	update_cpu_boot_status(cpu, CPU_PANIC_KERNEL);
 	cpu_park_loop();
 }
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..0552202702bf 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3674,7 +3674,7 @@ static void verify_local_cpu_caps(u16 scope_mask)
 			caps->desc, system_has_cap, cpu_has_cap);
 
 		if (cpucap_panic_on_conflict(caps))
-			cpu_panic_kernel();
+			cpu_panic_kernel(smp_processor_id());
 		else
 			cpu_die_early();
 	}
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 24f8448e1fbb..6bc90ee4820a 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -118,7 +118,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	 * page tables.
 	 */
 	secondary_data.task = idle;
-	update_cpu_boot_status(CPU_MMU_OFF);
+	update_cpu_boot_status(cpu, CPU_MMU_OFF);
 
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
@@ -252,7 +252,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	pr_info("CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n",
 					 cpu, (unsigned long)mpidr,
 					 read_cpuid_id());
-	update_cpu_boot_status(CPU_BOOT_SUCCESS);
+	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
 	complete(&cpu_running);
 
@@ -411,11 +411,11 @@ void __noreturn cpu_die_early(void)
 	rcutree_report_cpu_dead();
 
 	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
-		update_cpu_boot_status(CPU_KILL_ME);
+		update_cpu_boot_status(cpu, CPU_KILL_ME);
 		__cpu_try_die(cpu);
 	}
 
-	update_cpu_boot_status(CPU_STUCK_IN_KERNEL);
+	update_cpu_boot_status(cpu, CPU_STUCK_IN_KERNEL);
 
 	cpu_park_loop();
 }
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 0f4a28b87469..6b8a3245f393 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -72,7 +72,7 @@ void verify_cpu_asid_bits(void)
 		 */
 		pr_crit("CPU%d: smaller ASID size(%u) than boot CPU (%u)\n",
 				smp_processor_id(), asid, asid_bits);
-		cpu_panic_kernel();
+		cpu_panic_kernel(smp_processor_id());
 	}
 }
 
-- 
2.34.1

