Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA23F380FC3;
	Mon, 22 Jun 2026 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782114674; cv=none; b=AtRNurigol4njfBeMR6UDHlkajhw/fPPM5kBiCQWczlekFrET/QQpLvrGEO5TiR30dijW/GodGw3g1eEk6CVcmPynEdwOdc6qDioI3LYJ2RHjwze6+uGkpG/az5K4rzgGbUddekGXnzPFN6RPLB2rYNSjRl3iSiQjZqD4IPKYJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782114674; c=relaxed/simple;
	bh=WbFm1sFv9ijKgz0CpBPxgcre7lV86NzDJX87UO6kW6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RXDyam8IzUUZ5Mx/2tiy1l79flYI/bZhHz7AFGd4bkosO4h28TFAn10vqZE+Svw++Fkk6ZMl0dJFG/aL++XgRjdyNznyVIwhBmugcGaowASGnzXJyFZxaCK0E+vEQbk1pezc4SLpCMwNdL6ACrvt+Z+dG5JDmFgariz8lChw9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=6bkt8gOm; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="6bkt8gOm"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Du1YAWXs/UPrnLFElgZgTTCbCcDeMhPmRE4iiOQnDj4=;
	b=6bkt8gOmaa7gWDwBIF0VGol5P+GXGe6FD1A0V+JeDqhpPMXS+CBpbpxjmLOVzcBQawZT6DrE6
	vCcXWNTux9dudn5wkzhhguKcufFWw9wIBIbXXgppi7D2/dXzJ7HH2L66kqcxbbE2/Rlox6dTmpa
	/lOq7K/lA8TPpVdPa6RIt4Y=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gkKsK5vtszLlTn;
	Mon, 22 Jun 2026 15:41:57 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D9E2940572;
	Mon, 22 Jun 2026 15:51:01 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 15:50:59 +0800
Message-ID: <b0a758f9-0836-4d99-a424-573e5c8d1fe4@huawei.com>
Date: Mon, 22 Jun 2026 15:50:58 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
To: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <oupton@kernel.org>, <yeoreum.yun@arm.com>,
	<miko.lenczewski@arm.com>, <broonie@kernel.org>, <kevin.brodsky@arm.com>,
	<james.clark@linaro.org>, <tabba@google.com>, <mrigendra.chaubey@gmail.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com> <87a4srdgk0.ffs@fw13>
 <20260619094130.GU49951@noisy.programming.kicks-ass.net>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260619094130.GU49951@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 6/19/2026 5:41 PM, Peter Zijlstra wrote:
> On Thu, Jun 18, 2026 at 05:17:03PM +0200, Thomas Gleixner wrote:
> 
>> Something simple like the uncompiled below should just work, no?
>>
>> ---
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>>  	bool
>>  	select HOTPLUG_SPLIT_STARTUP
>>  
>> +config HOTPLUG_PARALLEL_SMT
>> +	bool
>> +	select HOTPLUG_PARALLEL
> 
> 	depends on ARCH_SUPPORTS_SCHED_SMT ?

Maybe select HOTPLUG_SMT?

