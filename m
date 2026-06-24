Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65523B0AD6;
	Wed, 24 Jun 2026 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293190; cv=none; b=uc4oJd3PBZSfk+YeyEm69ZqzguSJtR6TozgBcg0Okb/XpfR8HWawMyji8P3pC3fg9fherrsufLwX62IOzm6Iz0XcgAXdkcdaYnpycoydIbjCSby7HRce27SIuz/VpfJIpTDzONsxDCGT/Yq+YSIrSU193mcaSXjBHKUWNhXVTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293190; c=relaxed/simple;
	bh=9Bor8qSNO8oe1LYgKJxvPEcRBvy16SD2ZNvSagfAJxs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bTKVhM/jjVAfvbuaTKJgRYVwlXaTNZOavbboGC58A9GLZY6DSjHpaQQ8/XzSLSfDwt5oINozS4YjO/h2/Uc3kjjBMYwc1IKqP9lkm8dtKkkQGKA9m2bHjzCXyxtA2pvtM6oCkSI6gaFVomWTnEDQfFH4Z5HDeqZEAEwsoAmNYRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CICxvjHP; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CICxvjHP"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=P1LAsF3yfHMQr/lL87dOHp3Nz6XBq5TedJFrQXGK3yk=;
	b=CICxvjHPHPnQhaGdXXHk82TWbhOMxvazZEY8n0NI1CZBT7sh0mzQc3QpW5GSdSWoXAOs3WM1V
	Q291LgMeK327EHnOPflyEJdC/RJOfiqSfPxWJIx/cBxckLhTCnogX2xErLsud15Dz/jC0VC2doW
	6He3T5K8iS4HfLK206ZFFPY=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4glbt03tGmz1prKy;
	Wed, 24 Jun 2026 17:16:56 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CF40640569;
	Wed, 24 Jun 2026 17:26:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:26:01 +0800
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
Subject: [PATCH v3 06/12] arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP machinery for CPU onlining
Date: Wed, 24 Jun 2026 17:25:31 +0800
Message-ID: <20260624092537.2916971-7-ruanjinjie@huawei.com>
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

From: Will Deacon <will@kernel.org>

In preparation for enabling parallel bringup of secondary CPUs
on arm64, take the baby step of moving from HOTPLUG_CORE_SYNC_DEAD
to HOTPLUG_SPLIT_STARTUP.

To fully enable HOTPLUG_SPLIT_STARTUP, this patch implements:

1) arch_cpuhp_kick_ap_alive(). Kick the secondary CPU via firmware
without blocking.

2) arch_cpuhp_cleanup_kick_cpu(). Extracts early boot telemetry upon
AP bringup timeouts.

3) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
Enforces the initial pre-online boot handshake from the secondary
CPU side.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig      |  2 +-
 arch/arm64/kernel/smp.c | 39 +++++++++++++++++++--------------------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..24496e9967a8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -231,7 +231,7 @@ config ARM64
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_GENERIC_VDSO
-	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
+	select HOTPLUG_SPLIT_STARTUP if SMP
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 87f92cf9ffa8..9482e8d38b98 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -107,12 +107,9 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	return -EOPNOTSUPP;
 }
 
-static DECLARE_COMPLETION(cpu_running);
-
-int __cpu_up(unsigned int cpu, struct task_struct *idle)
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 {
 	int ret;
-	long status;
 
 	/*
 	 * We need to tell the secondary core where to find its stack and the
@@ -123,22 +120,22 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
-	if (ret) {
-		if (ret != -EPERM)
-			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
-		return ret;
-	}
+	if (ret && ret != -EPERM)
+		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
+	return ret;
+}
+
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
+{
+	long status;
+
+	if (is_alive)
+		return;
 
 	/*
-	 * CPU was successfully started, wait for it to come online or
-	 * time out.
+	 * We failed to synchronise with the CPU, so check if it left us
+	 * any breadcrumbs.
 	 */
-	wait_for_completion_timeout(&cpu_running,
-				    msecs_to_jiffies(5000));
-	if (cpu_online(cpu))
-		return 0;
-
-	pr_crit("CPU%u: failed to come online\n", cpu);
 	secondary_data.task = NULL;
 	status = READ_ONCE(secondary_data.status);
 	if (status == CPU_MMU_OFF)
@@ -170,8 +167,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	case CPU_PANIC_KERNEL:
 		panic("CPU%u detected unsupported configuration\n", cpu);
 	}
-
-	return -EIO;
 }
 
 static void init_gic_priority_masking(void)
@@ -231,6 +226,11 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 */
 	check_local_cpu_capabilities();
 	lockdep_on();
+	/*
+	 * Synchronise with the core bringing us online so that it knows
+	 * we made it into the kernel. We're still not 'online'.
+	 */
+	cpuhp_ap_sync_alive();
 	rcutree_report_cpu_starting(cpu);
 	trace_hardirqs_off_finish();
 
@@ -264,7 +264,6 @@ asmlinkage notrace void secondary_start_kernel(void)
 					 read_cpuid_id());
 	update_cpu_boot_status(CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
-	complete(&cpu_running);
 
 	/*
 	 * Secondary CPUs enter the kernel with all DAIF exceptions masked.
-- 
2.34.1

