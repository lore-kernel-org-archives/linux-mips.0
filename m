Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1F2EC54C;
	Wed, 24 Jun 2026 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293203; cv=none; b=CyLkzOnJiLTM8DKWAV7Hd6WCsvLihWTMzH2xbcClGMkU67ieUhho/NBVjcWYTruBB0WzWuywb2yYT3Pn6wOvXTe31gjspQSX6CZxsWNmElp6vbkwfl4S6djLu6vVYsu9lLLVu6wj55yO2HMAHGJDXX90Pzrkxd1Wpp9TeR6SvmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293203; c=relaxed/simple;
	bh=qS/F6KgKPbikAaZQYhy2hq/KtR+lmVTBFVjupaTzmss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqiXoE89p/xYyvlCN+vSXXT8gCU+IUy7MxFy6eBMLE614E0HaJ68BbRSjADjnEkD6HbLLhr2bChiHugNvEr2GdtLwegABDsnL4/zPHSKCSf6w2/0ajHxJKqBLD9BP0dN8QLQinQtj++Bctl4YIas7shU6E1rROK8MAn1DC1y4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=NOw2pEIT; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="NOw2pEIT"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ieofr+x7mCv4RU+fHCV+TK9nLxuSjsWJ0dtdog5pIVA=;
	b=NOw2pEITHKGTM3UczBmJPM8jkaq7W6NTFyORTA/J7kXCCAzXUBEgIB4tMNc7bcnIet9S6PO3S
	Gz4cFvOrKNRgXSoRm6GabZqgBsqQezYG6xEZMf0a/WBtftJK44IHwhXjRG1Rcv+wh7Pms7+Uycl
	HaqZ2cg1A617MnH37otl40c=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4glbt92VTgzKm6V;
	Wed, 24 Jun 2026 17:17:05 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2BBC940539;
	Wed, 24 Jun 2026 17:26:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:26:10 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>,
	<ryan.roberts@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 10/12] arm64: smp: Pass CPU ID to update_cpu_boot_status()
Date: Wed, 24 Jun 2026 17:25:35 +0800
Message-ID: <20260624092537.2916971-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
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
 arch/arm64/mm/context.c        | 5 +++--
 4 files changed, 11 insertions(+), 10 deletions(-)

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
index a1a13f3e01ed..abc3aef9c206 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3685,7 +3685,7 @@ static void verify_local_cpu_caps(u16 scope_mask)
 			caps->desc, system_has_cap, cpu_has_cap);
 
 		if (cpucap_panic_on_conflict(caps))
-			cpu_panic_kernel();
+			cpu_panic_kernel(smp_processor_id());
 		else
 			cpu_die_early();
 	}
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 6b9586a69429..14b94df26b44 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -116,7 +116,7 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 	 * page tables.
 	 */
 	secondary_data.task = idle;
-	update_cpu_boot_status(CPU_MMU_OFF);
+	update_cpu_boot_status(cpu, CPU_MMU_OFF);
 
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
@@ -262,7 +262,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	pr_info("CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n",
 					 cpu, (unsigned long)mpidr,
 					 read_cpuid_id());
-	update_cpu_boot_status(CPU_BOOT_SUCCESS);
+	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
 
 	/*
@@ -420,11 +420,11 @@ void __noreturn cpu_die_early(void)
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
index 0f4a28b87469..e78ae989ad57 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -63,6 +63,7 @@ static u32 get_cpu_asid_bits(void)
 /* Check if the current cpu's ASIDBits is compatible with asid_bits */
 void verify_cpu_asid_bits(void)
 {
+	unsigned int cpu = smp_processor_id();
 	u32 asid = get_cpu_asid_bits();
 
 	if (asid < asid_bits) {
@@ -71,8 +72,8 @@ void verify_cpu_asid_bits(void)
 		 * fewer ASID bits than the boot CPU.
 		 */
 		pr_crit("CPU%d: smaller ASID size(%u) than boot CPU (%u)\n",
-				smp_processor_id(), asid, asid_bits);
-		cpu_panic_kernel();
+			cpu, asid, asid_bits);
+		cpu_panic_kernel(cpu);
 	}
 }
 
-- 
2.34.1

