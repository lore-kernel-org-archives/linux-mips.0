Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5A38F92F;
	Thu, 18 Jun 2026 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774771; cv=none; b=qmneSaoYR+VPVb/+fz/KLQ6lSCpE9IWkmqsX0JExV2TnHgiUI0N9h0+qiVkmeNsmo4K3JbiyL3DnLIwCrtiMnrbfucdt/nVLPsg06PXVEWND/dH5CfGYssW/1bjLrySCGT6OWqqpvYD69EpdHXKyhSbaq4anG5GunFs0+frTMFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774771; c=relaxed/simple;
	bh=J+jkQ+sXMm8l9Dh0LfGo1lXcyjA6YktgInzmY+Y4cQI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZGeN5JqwEuGez7p5AWB5zf3hCfGfrCSXPQ0xevWv74YW3CMhxh3LVEFAM3TOdJyGBDSBvhdhtKm1H96MDuHkIABRCeMbCgKwtlvtlbQ96OrB9wObsyDsfHrX4FeM0uLzT9GCX/Jci/aVQIcGrqS1wQ5fd+YDURZ0PgL33sR9l8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Ro5n4Dsx; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Ro5n4Dsx"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FXuskZWum2eND8Kqapvq5CnQPejvfWzbZgr0VCqB+mM=;
	b=Ro5n4DsxTcv6kcYs7xwikkAk0E+3gHlYekrLI9Fnl76bnX6pYxu1ksRN3nVu/o8LEnCGulWn4
	NYHbDMn2L8ZXZbDOkC/9bxJ0EO5TjUstPmISyMxyYmOpRKKSfKS2b9EMry/A0gxrQPqInzl7H83
	eyAYjkOIHutvlhnE6ZVBqIA=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4ggw9z4mYZz1cyQF;
	Thu, 18 Jun 2026 17:17:59 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9535440539;
	Thu, 18 Jun 2026 17:25:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jun
 2026 17:25:55 +0800
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
Subject: [PATCH v2 0/4] arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
Date: Thu, 18 Jun 2026 17:24:40 +0800
Message-ID: <20260618092444.1316336-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Support for parallel secondary CPU bringup is already utilized by x86,
MIPS, and RISC-V. This patch brings this capability to the arm64
architecture.

Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to avoid primary SMT threads
to boot first constraint.

And Add a 'cpu' parameter to update_cpu_boot_status() to allow updating the
boot status at a per-CPU granularity during parallel bringup.

Rework the global `secondary_data` accessed during early boot into
a per-CPU array `cpu_boot_data` to allow secondary CPUs to boot
in parallel.

And reuse `__cpu_logical_map` array in the early boot code in head.S
to resolve each secondary CPU's logical ID concurrently.

Changes in v2:
- Remove RFC.
- Add Tested-by.
- Fix AI review issues in [1].
- Add arch_cpuhp_init_parallel_bringup() to check psci boot.
- Reuse `__cpu_logical_map` instead of a new aray.
- Defer rcutree_report_cpu_starting() until after
  check_local_cpu_capabilities() to prevent a potential control CPU
  deadlock if an early capability check fails.
- Move the assembly in head.S to a macro called `mpidr_to_cpuid`.
- Add `SECONDARY_DATA_SHIFT` for `lsl` to access `cpu_boot_data`.
- Add sizeof(struct secondary_data) power of 2 assert check.
- Expand testing with more data collected from real hardware.

[1] https://sashiko.dev/#/patchset/20260611133809.3854977-1-ruanjinjie%40huawei.com

Jinjie Ruan (4):
  cpu/hotplug: Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST
  arm64: smp: Pass CPU ID to update_cpu_boot_status()
  arm64: smp: Defer RCU reporting until after local CPU capability
    checks
  arm64: Add HOTPLUG_PARALLEL support for secondary CPUs

 arch/Kconfig                    |  4 +++
 arch/arm64/Kconfig              |  1 +
 arch/arm64/include/asm/smp.h    | 17 ++++++++++---
 arch/arm64/kernel/asm-offsets.c |  4 +++
 arch/arm64/kernel/cpufeature.c  | 22 ++++++++--------
 arch/arm64/kernel/head.S        | 36 ++++++++++++++++++++++++++
 arch/arm64/kernel/smp.c         | 45 ++++++++++++++++++++++++++++-----
 arch/arm64/mm/context.c         |  4 +--
 arch/mips/Kconfig               |  1 +
 arch/riscv/Kconfig              |  1 +
 arch/x86/Kconfig                |  1 +
 kernel/cpu.c                    |  6 ++++-
 12 files changed, 119 insertions(+), 23 deletions(-)

-- 
2.34.1

