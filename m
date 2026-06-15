Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646563DB655;
	Mon, 15 Jun 2026 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517452; cv=none; b=k1zA8K10z7FkCCLuUKO2Xmm5YAnd2ppcAvWodOajtD3UcObd09rRQ2vMx4Dqk6uN2P6XZ5PpJTX1tRunvCO3ckrGxSNyYZNPeOl/x5jrJydZhndk+2zCTEy6KUEBwsm0nlZXE25Cd9L0HG4Ox6ibR9a8cW6BgbvvH1XFsp+Bzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517452; c=relaxed/simple;
	bh=CApkNkwaUI39BKTsOijtLMJpwYEN5rINgmgUu2Xm3C0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F37A6hdUJGkI+eIag/9JeQJONsZYWfJwFdbfmKw7gMde1BiUKEIvw2Co9KFUghnoeecuGc4dfDBNRoYU+Kmcvhs1WlEuKLIO/XcGfikG5y1daNh0GGVzLaAdCcjCH3mi9yLC4HzOZ0fGdND+1cWLYlqyI+eVVKWYIfOQbn18do8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=0RQMYBFx; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="0RQMYBFx"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c4MJ0qLV8hTTEQqlirPS+MBb0jR5ayNJ62Pv7ajO1fw=;
	b=0RQMYBFxPBYzIaMEWnsmo6JDwMkRJG9Ut5a/GPr2uGbfDY3BSNxxhL1uK7tBWkAmbgwyAvGUD
	AvLrnWC/X/O32vMDUQGnyH6A387fl5Bibf1NUYmrmu52SXzqoqf54qlU/Vw/hTS5N5Ui0IAmJKe
	BHxG3wExIub0PYtWuW1iaas=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gf51f59YnzmV6m;
	Mon, 15 Jun 2026 17:49:26 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 42EE340571;
	Mon, 15 Jun 2026 17:57:25 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Jun 2026 17:57:22 +0800
Message-ID: <4588efb4-e757-4ca7-9197-025b67ca9ef6@huawei.com>
Date: Mon, 15 Jun 2026 17:57:22 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for secondary
 CPUs
To: Michael Kelley <mhklinux@outlook.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "pjw@kernel.org"
	<pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "david.kaplan@amd.com" <david.kaplan@amd.com>,
	"lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"timothy.hayes@arm.com" <timothy.hayes@arm.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"oupton@kernel.org" <oupton@kernel.org>, "yeoreum.yun@arm.com"
	<yeoreum.yun@arm.com>, "miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "kevin.brodsky@arm.com"
	<kevin.brodsky@arm.com>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"tabba@google.com" <tabba@google.com>, "mrigendra.chaubey@gmail.com"
	<mrigendra.chaubey@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 6/12/2026 11:45 PM, Michael Kelley wrote:
> From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:38 AM
>>
>> Support for parallel secondary CPU bringup is already utilized by x86,
>> MIPS, and RISC-V. This patch brings this capability to the arm64
>> architecture.
>>
>> Rework the global `secondary_data` accessed during early boot into
>> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
>> enabling the early boot code in head.S to resolve each secondary CPU's
>> logical ID concurrently.
>>
>> To fully enable HOTPLUG_PARALLEL, this patch implements:
>> 1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
>> 2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
>>
>> Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).
>>
>> |     test kernel	   | secondary CPUs boot time |
>> |  ---------------------   |	--------------------  |
>> |   Without this patch     |		155.672	      |
>> |   cpuhp.parallel=0	   |		62.897	      |
>> |   cpuhp.parallel=1	   |		166.703	      |
> 
> The last two rows seem mixed up. I would expect parallel=0 to
> result in a longer boot time.

Without this patch:

KVM event statistics (6 entries)
Event name       Samples       Sample%     Time (ns)         Time%
Mean Time (ns)
  DABT_LOW        323112        75.00%    1669148000        17.00%
5165
       WFx         85817        19.00%     723215800         7.00%
8427
     SYS64         14914         3.00%     419934530         4.00%
28157
       IRQ          5643         1.00%    6732439250        70.00%
1193060
     HVC64           282         0.00%      35543970         0.00%
126042
  IABT_LOW             1         0.00%          6130         0.00%
6130

cpuhp.parallel=0:

Event name       Samples       Sample%     Time (ns)         Time%
Mean Time (ns)
 DABT_LOW        308175        80.00%     643628050         6.00%
2088
      WFx         55208        14.00%     261925270         2.00%
4744
    SYS64         14975         3.00%     155727880         1.00%
10399
      IRQ          4755         1.00%    8496162210        88.00%
1786784
    HVC64           280         0.00%      19429900         0.00%
69392
 IABT_LOW             1         0.00%          5850         0.00%
5850

cpuhp.parallel=1:

 Event name       Samples       Sample%     Time (ns)         Time%
Mean Time (ns)
 DABT_LOW        307923        77.00%     692965050         2.00%
     2250
      WFx         59549        15.00%     287888960         0.00%
     4834
    SYS64         15127         3.00%     334366230         1.00%
    22103
      IRQ         12861         3.00%   29784004970        95.00%
  2315838
    HVC64           280         0.00%      21869940         0.00%
    78106
 IABT_LOW             1         0.00%          9320         0.00%
     9320

- Default (no patch): Slowest HVC64 handling (126 μs), highest WFx count
(85k), and most total VM‑exits.

- cpuhp.parallel=1: HVC64 latency improved to 78 μs (close to
cpuhp.parallel=0), but IRQ exits increased dramatically (12.9k, 2.7×
that of `cpuhp.parallel=0`), accounting for 95% of event time and
becoming the new bottleneck.

- cpuhp.parallel=0: Fastest HVC64 (69 μs), lowest IRQ exits (4.8k), and
lowest total samples, delivering the best overall boot performance.

Therefor, `cpuhp.parallel=1` reduces HVC cost but suffers from a massive
increase in IRQ exits, while `cpuhp.parallel=0` avoids this interrupt
storm and therefore performs best in a KVM guest.

> 
> Michael
> 
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/Kconfig           |  1 +
>>  arch/arm64/include/asm/smp.h |  8 ++++++++
>>  arch/arm64/kernel/head.S     | 23 +++++++++++++++++++++++
>>  arch/arm64/kernel/smp.c      | 27 +++++++++++++++++++++++++++
>>  4 files changed, 59 insertions(+)
>>
> 
> 

