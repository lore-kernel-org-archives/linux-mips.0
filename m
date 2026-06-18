Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107A03C5DBA;
	Thu, 18 Jun 2026 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774768; cv=none; b=eL6C4sDs7SF7BnBAjqmmFa+yCGlWAjOItKvJ60/1VvF234afug/dMygzVNbxNfC/G19sct7WgQJgwbmht6tYoRNqH0T1eQ6gK85n8mjkbmBzOLE3BoAodZ5rPXFWiNEQI733fQyHXKFSrbOisKi3ActUt5/BdhQNbuT21CAIn0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774768; c=relaxed/simple;
	bh=34OQojqI5/SFWPFwqnjX7aoX9qTYeV3trRJDz3TJPmc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GGzkBQXjRvdCi8us022irw87ABgM/2En0nJLBABEo7TMKKDQqmThhBwawerULWgFD18j5nXj9zT56bZIbdHER4DiHNE4fDlTDHxElefQwyIYEf1GiRn8hbxMixRcZNhO2nhoJZU770DmhHXWuPunLeGTN8h/u9gizEgopT7wFtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=iklZi2sn; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="iklZi2sn"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=G1fmYR7Bw48yeIaqSnYNhWjdDWiabR6zZde3Hlfn/5k=;
	b=iklZi2sn8UCwgbkC4ASYVWIbolWj7O22qO43+Gm/ir9CNoD3G05AAqzZS/GlgroWTloOILTbC
	DsZSs3LcCfqRT+soo7oWNIEBqcMjbT429CZ4MHaWH/AM/wkq3hticvYcshk29YMTQDjyDNGxHN9
	GGT2qdBpBmdqIS/iDK9swMM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4ggw9t6XVfzpSvL;
	Thu, 18 Jun 2026 17:17:54 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C549D40537;
	Thu, 18 Jun 2026 17:25:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jun
 2026 17:25:57 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<jpoimboe@kernel.org>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<ojeda@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<tabba@google.com>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<apatel@ventanamicro.com>, <mhklinux@outlook.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 1/4] cpu/hotplug: Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST
Date: Thu, 18 Jun 2026 17:24:41 +0800
Message-ID: <20260618092444.1316336-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618092444.1316336-1-ruanjinjie@huawei.com>
References: <20260618092444.1316336-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)

During parallel CPU bringup, x86 requires primary SMT threads to boot
first to avoid siblings stopping during microcode updates. This constraint
is architecture-specific and unnecessary for other platforms
like arm64.

Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to decouple this constraint.
Platforms requiring this temporal order (e.g., x86) can select it
in Kconfig. Other architectures (e.g., arm64) can leave it unselected
to entirely bypass the SMT branch via the preprocessor.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/Kconfig       | 4 ++++
 arch/mips/Kconfig  | 1 +
 arch/riscv/Kconfig | 1 +
 arch/x86/Kconfig   | 1 +
 kernel/cpu.c       | 6 +++++-
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e86880045158..0365d2df2659 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
 	bool
 	select HOTPLUG_SPLIT_STARTUP
 
+config PARALLEL_SMT_PRIMARY_FIRST
+	bool
+	depends on HOTPLUG_PARALLEL
+
 config GENERIC_IRQ_ENTRY
 	bool
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4364f3dba688..84e11ac0cf71 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -642,6 +642,7 @@ config EYEQ
 	select MIPS_CPU_SCACHE
 	select MIPS_GIC
 	select MIPS_L1_CACHE_SHIFT_7
+	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL
 	select PCI_DRIVERS_GENERIC
 	select SMP_UP if SMP
 	select SWAP_IO_SPACE
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d235396c4514..0cc49aecc841 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -210,6 +210,7 @@ config RISCV
 	select OF
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
+	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..3ad4115ad051 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -314,6 +314,7 @@ config X86
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select NEED_SG_DMA_LENGTH
 	select NUMA_MEMBLKS			if NUMA
+	select PARALLEL_SMT_PRIMARY_FIRST	if HOTPLUG_PARALLEL
 	select PCI_DOMAINS			if PCI
 	select PCI_LOCKLESS_CONFIG		if PCI
 	select PERF_EVENTS
diff --git a/kernel/cpu.c b/kernel/cpu.c
index bc4f7a9ba64e..7ef8cdf4d239 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1792,6 +1792,7 @@ static int __init parallel_bringup_parse_param(char *arg)
 }
 early_param("cpuhp.parallel", parallel_bringup_parse_param);
 
+#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST
 #ifdef CONFIG_HOTPLUG_SMT
 static inline bool cpuhp_smt_aware(void)
 {
@@ -1811,7 +1812,8 @@ static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
 {
 	return cpu_none_mask;
 }
-#endif
+#endif /* CONFIG_HOTPLUG_SMT */
+#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */
 
 bool __weak arch_cpuhp_init_parallel_bringup(void)
 {
@@ -1837,6 +1839,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
 	if (!__cpuhp_parallel_bringup)
 		return false;
 
+#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST
 	if (cpuhp_smt_aware()) {
 		const struct cpumask *pmask = cpuhp_get_primary_thread_mask();
 		static struct cpumask tmp_mask __initdata;
@@ -1857,6 +1860,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
 		cpumask_andnot(&tmp_mask, mask, pmask);
 		mask = &tmp_mask;
 	}
+#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */
 
 	/* Bring the not-yet started CPUs up */
 	cpuhp_bringup_mask(mask, ncpus, CPUHP_BP_KICK_AP);
-- 
2.34.1

