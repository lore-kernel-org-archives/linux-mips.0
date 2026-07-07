Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA0213B293;
	Tue,  7 Jul 2026 03:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783393370; cv=none; b=jeVr+9KwJhHGt8XhRBOcjXEGBrzzA4szy8+OTRQZS2hX4L4anMJWqPjinKDfFLXCqyWMuf2CejLGL9yV3dOIa3AZylUhbodm1gj48GTyiHCEd03ZfuIP92bkpZFVwzLjj9qQPNLnAk24bKOVjR37HLumfWXUcFEFOjf4p2exRIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783393370; c=relaxed/simple;
	bh=jzEzSBYAnImlOyMHNej43RqyT7Dvy3QB55NeJr4VqH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JsgAyZAc6KjbLPajMa/gV8Q7cPXCBtSxB0Q2APexHGJR/x2vH/25aW3oE7yD+A+Ces88ykv7Kh3A3UI4ZJUczhaznCPn/nbhll90dNWRpdwiXcLdzwgLRgRWVP4YQxG3rVYPVA0c+JUdQsWjhvAm/RbaXdZfrJCCZHacaKTbwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RdrZkx6I; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="RdrZkx6I"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EXqyHBs1kBtCPhYjI0EwQemI55P4LRleAN6bdVwX2cs=;
	b=RdrZkx6I/RpcC4QwldmkROMcQcdlP6D9E+UpBI643BBQKOMjsWQHmCBCBXwTKYzoNi6q93vdA
	d739jgKEfUa8EgxZlpMphkHOoCYR23asyh9OZo8RTo8VTuc5Q6wjCdvqPcmMaovwaNvjOdItCVc
	hnbkdDYC4RRVTApzctXQxms=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gvQlP0rwdzKm5j;
	Tue,  7 Jul 2026 10:53:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D4ED540565;
	Tue,  7 Jul 2026 11:02:36 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 11:02:34 +0800
Message-ID: <58a9fd8b-387c-41c6-91a2-48ec885870d5@huawei.com>
Date: Tue, 7 Jul 2026 11:02:32 +0800
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
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akvoVCNFwDorQg6y@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 7/7/2026 1:39 AM, Will Deacon wrote:
> On Wed, Jun 24, 2026 at 05:25:30PM +0800, Jinjie Ruan wrote:
>> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
>> index c14b179c595d..87f92cf9ffa8 100644
>> --- a/arch/arm64/kernel/smp.c
>> +++ b/arch/arm64/kernel/smp.c
>> @@ -35,6 +35,7 @@
>>  #include <linux/kgdb.h>
>>  #include <linux/kvm_host.h>
>>  #include <linux/nmi.h>
>> +#include <linux/lockdep.h>
>>  
>>  #include <asm/alternative.h>
>>  #include <asm/atomic.h>
>> @@ -215,15 +216,23 @@ asmlinkage notrace void secondary_start_kernel(void)
>>  	if (system_uses_irq_prio_masking())
>>  		init_gic_priority_masking();
>>  
>> -	rcutree_report_cpu_starting(cpu);
>> -	trace_hardirqs_off();
>> +	lockdep_hardirqs_off(CALLER_ADDR0);
>>  
>> +	/*
>> +	 * Since RCU is still offline on this CPU, any nested native printk
>> +	 * or lock acquisition would normally trigger a false-positive
>> +	 * "suspicious RCU usage" lockdep splat.
>> +	 */
>> +	lockdep_off();
> 
> On the flip side, should we really be taking locks at this point? I'm
> actually quite sympathetic to lockdep here and I worry that disabling
> it briefly is going to hide real problems down the line.

Hi Will,

I fully share your concern. Disabling lockdep globally or even across a
large function like check_local_cpu_capabilities() is risky — it would
suppress *all* lock validation in that path, not just the harmless
early-boot warnings.

> 
> ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") was to
> handle the useless print in cpuinfo_detect_icache_policy(), but I've
> decided just to remove that one. So I think the remaining prints we have
> to worry about in this early boot code are from error paths in the
> CPU feature detection logic (check_local_cpu_capabilities()).
> 
> Given that those error paths should all be fatal, perhaps we could
> rework cpu_die_early() and cpu_panic_kernel() as macros that take a
> string argument and either call printk_deferred() (similarly to what you
> suggested in a previous version of your series [1]) or do the
> lockdep_off() there before a pr_crit().
> 
> What do you think?

That is an excellent point. Reworking cpu_die_early() and
cpu_panic_kernel() to uniformly use printk_deferred() based on the
specific error type or the string argument is a much cleaner approach.

This makes perfect sense because these paths are inherently fatal, and
switching to deferred printing avoids the risky lock-taking and RCU
runtime constraints during early boot entirely. It cleanly resolves the
diagnostic noise without broadly blinding lockdep or hiding potential
locking issues down the line.

I fully agree with this approach.

Best regards,
Jinjie

> 
> Will
> 
> [1] https://lore.kernel.org/all/20260618092444.1316336-4-ruanjinjie@huawei.com/

