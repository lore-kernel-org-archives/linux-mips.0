Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8312D3A257F;
	Wed, 24 Jun 2026 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293176; cv=none; b=DxxhoJ2w3zjNINbY7VvVNP2qDlkFRkj2FPu5Pk1T2oaQAArCGKY9vsvLdWTFXufFF/or7204EZge0Y1CnfaMpBqkaKAFs4uMozzehSd0bvPulcO/FR3RuwF8WsFGNGuCuhZRgB3VyWk4JY1CIyO9CaYAd9Txt/uXcal3W1qSMao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293176; c=relaxed/simple;
	bh=FrJMqTula744JwBxAlpoIPkaVXjNIrphhwWEBCx+IlU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=poLfbwK7CCdx5XkMH979muGS4+V69pwlBqV7RJp0jsPgNhaTi19SLImihF+Zh3ue4OdeKYkpxyK1ZcyaH/Xs/C6qWaANd922d4pI99VZHbfh7eHEUsSlCamcReNQh3oRlvWZXLbyPM71mDKZVEuFDBynqkLbT0LHcFCeEGDD7H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=q4D2r/tL; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="q4D2r/tL"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6rmLKcb4WRNUXeQ7hP00fLUu61cNXG6u4DRE42LSnkk=;
	b=q4D2r/tLrukbpLa/BUPY4FNk0Rx6P78YcaJiOiT4ZZlm6uBYwK7G398712jx5Zbewg4V5auz3
	Vln6V+6ykBK44Mw5jJmHHFvX13lL1Rr10sni/YEZ5EQV0A8sqS75Xkq2fMiSmfEgfmm81rLxlZZ
	2Aj0J5TQZVq38VhWptzWepc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4glbtJ1DCYzcZyp;
	Wed, 24 Jun 2026 17:17:12 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B19E22012A;
	Wed, 24 Jun 2026 17:25:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:47 +0800
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
Subject: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
Date: Wed, 24 Jun 2026 17:25:25 +0800
Message-ID: <20260624092537.2916971-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Support for parallel secondary CPU bringup is already utilized by x86,
MIPS, and RISC-V. This patch brings this capability to the arm64
architecture.

Introduce CONFIG_HOTPLUG_PARALLEL_SMT to avoid primary SMT threads
to boot first constraint.

And add a 'cpu' parameter to update_cpu_boot_status() to allow updating
the boot status at a per-CPU granularity during parallel bringup.

Rework the global `secondary_data` and `__early_cpu_boot_status` accessed
during early boot into per-CPU arrays to allow secondary CPUs to boot
in parallel.

And reuse `__cpu_logical_map` array in the early boot code in head.S
to resolve each secondary CPU's logical ID concurrently.

This series includes a subset of the refactoring patches proposed
by Will Deacon, with further adjustments.

Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug

Bringup Time Comparison on real hardware(ms, lower is better):

 |     Platform                     | Baseline|   P=0   |   P=1  | Delta(%)|
 | -------------------------------- | ------- | ------- | ------ | ------- |
 | 192-core server(HIP12)           | 14619.2 | 14619.1 | 8589.4 | 41.21%  |
 | 32-core board                    | 2776.5  | 2881.0  | 1045.0 | 62.36%  |
 | 64-core board                    | 2297.0  |    /    | 814.4  | 64.5%   |

Below is the actual dmesg output demonstrating four concurrent boot
failures on different CPUs:

	CPU4 failed to report alive state
	CPU4: is stuck in kernel
	CPU4: does not support 52-bit VAs

	CPU6 failed to report alive state
	CPU6: is stuck in kernel
	CPU6: does not support 4K granule

	GICv3: CPU8: found redistributor 8 region 0:0x00000000081a0000
	GICv3: CPU8: using allocated LPI pending table @0x0000000100360000
	CPU8: Booted secondary processor 0x0000000008 [0x410fd034]
	...
	CPU16 failed to report alive state
	psci: CPU16 killed (polled 0 ms)
	CPU16: died during early boot

	CPU17: will not boot
	CPU17 failed to report alive state
	psci: CPU17 killed (polled 0 ms)
	CPU17: died during early boot

	CPU18 failed to report alive state
	Kernel panic - not syncing: CPU18 detected unsupported configuration
	CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-rc1-gdd2d3bbca3b5 #151 PREEMPT
	Hardware name: linux,dummy-virt (DT)
	Call trace:
	 show_stack+0x18/0x24 (C)
	 dump_stack_lvl+0x38/0xd0
	 dump_stack+0x18/0x24
	 vpanic+0x4f8/0x4fc
	 do_panic_on_target_cpu+0x0/0x1c
	 secondary_start_kernel+0x0/0x17c
	 cpuhp_bringup_ap+0x2cc/0x2dc
	 cpuhp_invoke_callback+0x168/0x2ac
	 __cpuhp_invoke_callback_range+0x90/0x118
	 _cpu_up+0x148/0x220
	 cpu_up+0xcc/0x158
	 cpuhp_bringup_mask.constprop.0+0x80/0xcc
	 bringup_nonboot_cpus+0x38/0x80
	 smp_init+0x30/0x8c
	 kernel_init_freeable+0x170/0x35c
	 kernel_init+0x24/0x1e0
	 ret_from_fork+0x10/0x20
	SMP: stopping secondary CPUs
	---[ end Kernel panic - not syncing: CPU18 detected unsupported configuration ]---

Changes in v3:
- Add necessary rework patches.
- Fix AI review issues in [2].
  1. Use lockdep_off() and lockdep_on to resolve the lockdep splat
     on failure paths, which avoid printk_deferred() and solve
     the pr_fmt() prefix issue or missing update.
  2. Ensure atomic updates to system_cpucaps bitmap for arm64 cpufeature.
  3. Use NR_CPUS __early_cpu_boot_status array in head.S and not clear
     __early_cpu_boot_status.
  4. Solve get_cpu_ops(0) which evaluates to the boot CPU issue in
    arch_cpuhp_init_parallel_bringup() with Will's rework patch.
- Handle `__early_cpu_boot_status` properly as Will pointed out with
  Will's patch.
- Implement arch_cpuhp_cleanup_kick_cpu() to cleanup for fail boot
  secondary CPUS and add support for error handling with Will's patch.
- Update the code as Thomas suggested. Rename PARALLEL_SMT_PRIMARY_FIRST
  to `HOTPLUG_PARALLEL_SMT` and not select it for RISC-V.
- Select HOTPLUG_PARALLEL if SMP as Thomas suggested.
- Rework early boot data into per-CPU arrays directly rather than using
  CONFIG_HOTPLUG_PARALLEL to differentiate code paths as Thomas suggested.
- Remove `cpu_running` and related complete.
- Add new test data on new hardware.

[2]: https://sashiko.dev/#/patchset/20260618092444.1316336-1-ruanjinjie%40huawei.com

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

Jinjie Ruan (5):
  cpu/hotplug: Introduce CONFIG_HOTPLUG_PARALLEL_SMT
  arm64: cpufeature: Ensure atomic updates to system_cpucaps bitmap
  arm64: smp: Pass CPU ID to update_cpu_boot_status()
  arm64: smp: Rework early boot data into per-CPU arrays
  arm64: Add HOTPLUG_PARALLEL support for secondary CPUs

Will Deacon (7):
  cpu/hotplug: Propagate bring-up status to
    arch_cpuhp_cleanup_kick_cpu()
  arm64: smp: Tidy up smp_prepare_cpus()
  arm64: smp: Tidy up cpuinfo init and cpufeature updates
  arm64: smp: Defer RCU registration during secondary CPU bringup
  arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP machinery for CPU
    onlining
  arm64: cpu_ops: Make 'cpu_operations' pointer global instead of
    per-cpu
  arm64: cpu_ops: Introduce get_secondary_cpu_ops()

 arch/Kconfig                     |   5 ++
 arch/arm64/Kconfig               |   2 +-
 arch/arm64/include/asm/cpu.h     |   6 +-
 arch/arm64/include/asm/cpu_ops.h |   1 +
 arch/arm64/include/asm/smp.h     |  22 +++---
 arch/arm64/kernel/asm-offsets.c  |   2 +
 arch/arm64/kernel/cpu_ops.c      |  34 ++++++---
 arch/arm64/kernel/cpufeature.c   |  27 +++++--
 arch/arm64/kernel/cpuinfo.c      |  11 ---
 arch/arm64/kernel/head.S         |  44 ++++++++++--
 arch/arm64/kernel/setup.c        |   9 +++
 arch/arm64/kernel/smp.c          | 118 +++++++++++++++++--------------
 arch/arm64/mm/context.c          |   5 +-
 arch/arm64/mm/mmu.c              |   2 +-
 arch/mips/Kconfig                |   3 +-
 arch/x86/Kconfig                 |   2 +-
 arch/x86/kernel/smpboot.c        |   4 +-
 include/linux/cpuhotplug.h       |   2 +-
 kernel/cpu.c                     |   8 +--
 19 files changed, 189 insertions(+), 118 deletions(-)

-- 
2.34.1

