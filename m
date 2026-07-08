Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD88407CD3;
	Wed,  8 Jul 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502026; cv=none; b=FhROqNDfBBi5X/arWYNA7b4kSttodshJ6Ow/YfBqjTww4ObbWA+pMfdjLdDr/mdsVbZTLW0s1o3Ex2+V/SdwJMtiMLvv3GErXSBQlOhaFVgX1BxLFFgEfMILg5vNz66ttRsZPMNvUYPXgv4jOzaYFjldHuvWUlXwxjxTDioqlD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502026; c=relaxed/simple;
	bh=m+VxQRj6rdI+EzwGqaHMGF7Lp80v10JPCwWTi786nIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C1I7PnyV08xSN1eSnObJJZn5JYQvcJAsKnNVeILE0biuQ6qAVBrrR0weI461blbVpnP2zbYjXRqgUQc3lxOhjMYFpfm6HukDKMZsleJGiK5LCuvM7TDhGZyHJeKyAzMmPJoutxE36xK8BamygMOhPbcOv9RgKc80l8IxMyiQXQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=c8nNtYDP; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="c8nNtYDP"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pNZgHBwW6XOE+yNXX7LjE5nYB2DdOp0SLcgsRM35PsI=;
	b=c8nNtYDPLGXaVeT9Yg4jaE+Y8x74hbniUp9Pas6ePv/JpAC3tIL0DCzzJRODpiFP+jmLMH/1k
	pk64Ig62T6hyYUjW3OQzAALVewtMFci4AoG8+JNpGMQ4cA/Ld5GgXwjvt5j7BJwSs7DVR4R8x3i
	4kS4nMYUJ3yrN7fYLjuAJ4I=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gwBwx0ndWzKmWS;
	Wed,  8 Jul 2026 17:04:17 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A5E840578;
	Wed,  8 Jul 2026 17:13:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Jul 2026 17:13:31 +0800
Message-ID: <483e471d-d51b-4991-98d8-c0b4a2cdf8d8@huawei.com>
Date: Wed, 8 Jul 2026 17:13:30 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] arm64: smp: Defer RCU registration during
 secondary CPU bringup
To: Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <tsbogend@alpha.franken.de>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <menglong8.dong@gmail.com>, <oupton@kernel.org>,
	<yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>, <broonie@kernel.org>,
	<kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-6-ruanjinjie@huawei.com>
 <akvoVCNFwDorQg6y@willie-the-truck>
 <58a9fd8b-387c-41c6-91a2-48ec885870d5@huawei.com>
 <akzUe3aIKZiEr4at@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akzUe3aIKZiEr4at@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 7/7/2026 6:27 PM, Will Deacon wrote:
> Jinjie,
> 
> On Tue, Jul 07, 2026 at 11:02:32AM +0800, Jinjie Ruan wrote:
>> On 7/7/2026 1:39 AM, Will Deacon wrote:
>>> ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") was to
>>> handle the useless print in cpuinfo_detect_icache_policy(), but I've
>>> decided just to remove that one. So I think the remaining prints we have
>>> to worry about in this early boot code are from error paths in the
>>> CPU feature detection logic (check_local_cpu_capabilities()).
>>>
>>> Given that those error paths should all be fatal, perhaps we could
>>> rework cpu_die_early() and cpu_panic_kernel() as macros that take a
>>> string argument and either call printk_deferred() (similarly to what you
>>> suggested in a previous version of your series [1]) or do the
>>> lockdep_off() there before a pr_crit().
>>>
>>> What do you think?
>>
>> That is an excellent point. Reworking cpu_die_early() and
>> cpu_panic_kernel() to uniformly use printk_deferred() based on the
>> specific error type or the string argument is a much cleaner approach.
>>
>> This makes perfect sense because these paths are inherently fatal, and
>> switching to deferred printing avoids the risky lock-taking and RCU
>> runtime constraints during early boot entirely. It cleanly resolves the
>> diagnostic noise without broadly blinding lockdep or hiding potential
>> locking issues down the line.
>>
>> I fully agree with this approach.
> 
> It's great that your AI chatbot thinks this is fantastic, but what do
> _you_ think? I'm much more interested in your opinion, as you have
> already spent time thinking about this.

Sorry, I had AI polish the language based on my ideas, but the main
points are consistent.

My main concern is that future new features might add printing in the
check_local_cpu_capabilities() function. How can we enforce them to only
use the defer version of printk or the new macro we define?

Is what you referring to similar to the following implementation?


diff --git a/arch/arm64/include/asm/cpufeature.h
b/arch/arm64/include/asm/cpufeature.h
index a57870fa96db..6c95227032b0 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -26,6 +26,18 @@
 #include <linux/kernel.h>
 #include <linux/cpumask.h>

+#define cpu_panic_kernel_with_msg(fmt, ...)                            \
+do {                                                                   \
+       printk_deferred(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__);          \
+       cpu_panic_kernel();                                             \
+} while (0)
+
+#define cpu_die_early_with_msg(fmt, ...)                               \
+do {                                                                   \
+       printk_deferred(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__);          \
+       cpu_die_early();                                                \
+} while (0)
+
 /*
  * CPU feature register tracking
  *
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 1a426725265c..20f00819c1cb 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3699,14 +3699,17 @@ static void verify_local_cpu_caps(u16 scope_mask)
        }

        if (i < ARM64_NCAPS) {
-               pr_crit("CPU%d: Detected conflict for capability %d
(%s), System: %d, CPU: %d\n",
-                       smp_processor_id(), caps->capability,
-                       caps->desc, system_has_cap, cpu_has_cap);
+               #define CAP_CONFLICT_FMT "CPU%d: Detected conflict for
capability %d (%s), System: %d, CPU: %d\n"

                if (cpucap_panic_on_conflict(caps))
-                       cpu_panic_kernel();
+                       cpu_panic_kernel_with_msg(CAP_CONFLICT_FMT,
+                                                 smp_processor_id(),
caps->capability,
+                                                 caps->desc,
system_has_cap, cpu_has_cap);
                else
-                       cpu_die_early();
+                       cpu_die_early_with_msg(CAP_CONFLICT_FMT,
+                                              smp_processor_id(),
caps->capability,
+                                              caps->desc,
system_has_cap, cpu_has_cap);
+               #undef CAP_CONFLICT_MSG
        }
 }

@@ -3731,9 +3734,8 @@ __verify_local_elf_hwcaps(const struct
arm64_cpu_capabilities *caps)

        for (; caps->matches; caps++)
                if (cpus_have_elf_hwcap(caps) && !caps->matches(caps,
SCOPE_LOCAL_CPU)) {
-                       pr_crit("CPU%d: missing HWCAP: %s\n",
-                                       smp_processor_id(), caps->desc);
-                       cpu_die_early();
+                       cpu_die_early_with_msg("CPU%d: missing HWCAP: %s\n",
+                                              smp_processor_id(),
caps->desc);
                }
 }

@@ -3750,9 +3752,8 @@ static void verify_sve_features(void)
        unsigned long cpacr = cpacr_save_enable_kernel_sve();

        if (vec_verify_vq_map(ARM64_VEC_SVE)) {
-               pr_crit("CPU%d: SVE: vector length support mismatch\n",
-                       smp_processor_id());
-               cpu_die_early();
+               cpu_die_early_with_msg("CPU%d: SVE: vector length
support mismatch\n",
+                                       smp_processor_id());
        }

        cpacr_restore(cpacr);
@@ -3763,9 +3764,8 @@ static void verify_sme_features(void)
        unsigned long cpacr = cpacr_save_enable_kernel_sme();

        if (vec_verify_vq_map(ARM64_VEC_SME)) {
-               pr_crit("CPU%d: SME: vector length support mismatch\n",
-                       smp_processor_id());
-               cpu_die_early();
+               cpu_die_early_with_msg("CPU%d: SME: vector length
support mismatch\n",
+                                      smp_processor_id());
        }

        cpacr_restore(cpacr);
@@ -3776,6 +3776,7 @@ static void verify_hyp_capabilities(void)
        u64 safe_mmfr1, mmfr0, mmfr1;
        int parange, ipa_max;
        unsigned int safe_vmid_bits, vmid_bits;
+       int cpu = smp_processor_id();

        if (!IS_ENABLED(CONFIG_KVM))
                return;
@@ -3787,19 +3788,15 @@ static void verify_hyp_capabilities(void)
        /* Verify VMID bits */
        safe_vmid_bits = get_vmid_bits(safe_mmfr1);
        vmid_bits = get_vmid_bits(mmfr1);
-       if (vmid_bits < safe_vmid_bits) {
-               pr_crit("CPU%d: VMID width mismatch\n", smp_processor_id());
-               cpu_die_early();
-       }
+       if (vmid_bits < safe_vmid_bits)
+               cpu_die_early_with_msg("CPU%d: VMID width mismatch\n", cpu);

        /* Verify IPA range */
        parange = cpuid_feature_extract_unsigned_field(mmfr0,
                                ID_AA64MMFR0_EL1_PARANGE_SHIFT);
        ipa_max = id_aa64mmfr0_parange_to_phys_shift(parange);
-       if (ipa_max < get_kvm_ipa_limit()) {
-               pr_crit("CPU%d: IPA range mismatch\n", smp_processor_id());
-               cpu_die_early();
-       }
+       if (ipa_max < get_kvm_ipa_limit())
+               cpu_die_early_with_msg("CPU%d: IPA range mismatch\n", cpu);
 }

 static void verify_mpam_capabilities(void)
@@ -3807,29 +3804,24 @@ static void verify_mpam_capabilities(void)
        u64 cpu_idr = read_cpuid(ID_AA64PFR0_EL1);
        u64 sys_idr = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
        u16 cpu_partid_max, cpu_pmg_max, sys_partid_max, sys_pmg_max;
+       int cpu = smp_processor_id();

        if (FIELD_GET(ID_AA64PFR0_EL1_MPAM_MASK, cpu_idr) !=
-           FIELD_GET(ID_AA64PFR0_EL1_MPAM_MASK, sys_idr)) {
-               pr_crit("CPU%d: MPAM version mismatch\n",
smp_processor_id());
-               cpu_die_early();
-       }
+           FIELD_GET(ID_AA64PFR0_EL1_MPAM_MASK, sys_idr))
+               cpu_die_early_with_msg("CPU%d: MPAM version mismatch\n",
cpu);

        cpu_idr = read_cpuid(MPAMIDR_EL1);
        sys_idr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
        if (FIELD_GET(MPAMIDR_EL1_HAS_HCR, cpu_idr) !=
-           FIELD_GET(MPAMIDR_EL1_HAS_HCR, sys_idr)) {
-               pr_crit("CPU%d: Missing MPAM HCR\n", smp_processor_id());
-               cpu_die_early();
-       }
+           FIELD_GET(MPAMIDR_EL1_HAS_HCR, sys_idr))
+               cpu_die_early_with_msg("CPU%d: Missing MPAM HCR\n", cpu);

        cpu_partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, cpu_idr);
        cpu_pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, cpu_idr);
        sys_partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, sys_idr);
        sys_pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, sys_idr);
-       if (cpu_partid_max < sys_partid_max || cpu_pmg_max < sys_pmg_max) {
-               pr_crit("CPU%d: MPAM PARTID/PMG max values are
mismatched\n", smp_processor_id());
-               cpu_die_early();
-       }
+       if (cpu_partid_max < sys_partid_max || cpu_pmg_max < sys_pmg_max)
+               cpu_die_early_with_msg("CPU%d: MPAM PARTID/PMG max
values are mismatched\n", cpu);
 }

 /*
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 25dc5afe9ba0..f615b8b79ada 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1057,8 +1057,10 @@ int vec_verify_vq_map(enum vec_type type)

        bitmap_complement(tmp_map, tmp_map, SVE_VQ_MAX);
        if (bitmap_intersects(tmp_map, info->vq_map, SVE_VQ_MAX)) {
-               pr_warn("%s: cpu%d: Required vector length(s) missing\n",
+               #define VEC_MISSING_FMT "%s: cpu%d: Required vector
length(s) missing\n"
+               printk_deferred(KERN_WARNING pr_fmt(VEC_MISSING_FMT),
                        info->name, smp_processor_id());
+               #undef VEC_MISSING_FMT
                return -EINVAL;
        }

@@ -1086,8 +1088,10 @@ int vec_verify_vq_map(enum vec_type type)
         * no guest is allowed to configure ZCR_EL2.LEN to exceed this:
         */
        if (sve_vl_from_vq(__bit_to_vq(b)) <= info->max_virtualisable_vl) {
-               pr_warn("%s: cpu%d: Unsupported vector length(s) present\n",
-                       info->name, smp_processor_id());
+               #define VEC_UNSUPP_FMT "%s: cpu%d: Unsupported vector
length(s) present\n"
+               printk_deferred(KERN_WARNING pr_fmt(VEC_UNSUPP_FMT),
+                               info->name, smp_processor_id());
+               #undef VEC_UNSUPP_FMT
                return -EINVAL;
        }

diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 0f4a28b87469..374f34d628ba 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -70,9 +70,8 @@ void verify_cpu_asid_bits(void)
                 * We cannot decrease the ASID size at runtime, so panic
if we support
                 * fewer ASID bits than the boot CPU.
                 */
-               pr_crit("CPU%d: smaller ASID size(%u) than boot CPU (%u)\n",
-                               smp_processor_id(), asid, asid_bits);
-               cpu_panic_kernel();
+               cpu_panic_kernel_with_msg("CPU%d: smaller ASID size(%u)
than boot CPU (%u)\n",
+                                         smp_processor_id(), asid,
asid_bits);
        }
 }


> 
> Will

