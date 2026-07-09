Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983BE413D82;
	Thu,  9 Jul 2026 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596036; cv=none; b=n3meowmGWyQZGtRc2XdMSpAkcS9I+CzSeQxuQEl3uBtFuXqWnmYPeZq89jjXsGl+N0zz3uo5d8sgi3sJy0VljBARPEBDjuWvDse3YKkENyENBuyMaXtLb6HA8YBPUI+X/VwQVqsy8t6kYri4X0pkR0Y69XW2kNeOiS57rrIQchE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596036; c=relaxed/simple;
	bh=ziOI0WoAo5Qbds6hxG48DZI+YuJ88JZSVMup/hzNmEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GLxONiqc5YpQBNFCtX7baHyq31NbxWe+O1hzty92KAOZJ6UGbIUopsg5w92V0wNYOZ5E0/nKTIf2X97dP2WIAkIUYacNomkuyGBCIj2MuYuGkmHCwlHjgkh++E107+G0qHFTGG3hbwWD3YScExLjnBjTMuhZFLt/k5MI/tEqqgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ylJoG4UF; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ylJoG4UF"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jCsAiNzXLnSt8Exj9eyYpp9m+fWK6alrT5RLyck+wvA=;
	b=ylJoG4UFdghbxtYEvPIt/SfSw8mGuBQcMTt4Tlqb2OfSuD9eHH/TgZRibMa9NB7vu4msTQOzF
	J8BzA7tS2QoiFwlshvQd8dkJoP9SMNEuD9jc8X7CEJcxs/NSdYPK4Yb28fRY1Zd2pz5qWoW7Sof
	8k/JP/FTKSSGsiHQqdJPWkY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gwsjd64CNz12LDl;
	Thu,  9 Jul 2026 19:11:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7030D2012A;
	Thu,  9 Jul 2026 19:20:28 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 19:20:25 +0800
Message-ID: <1350371d-db50-4c3d-adae-6657e2c0e3fc@huawei.com>
Date: Thu, 9 Jul 2026 19:20:24 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
To: Shrikanth Hegde <sshegde@linux.ibm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <tsbogend@alpha.franken.de>, <tglx@kernel.org>,
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
	<thorsten.blum@linux.dev>, <chang.seok.bae@intel.com>,
	<tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <e0607dbe-4d55-4aee-8368-25110848bc09@linux.ibm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <e0607dbe-4d55-4aee-8368-25110848bc09@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 6/29/2026 12:04 PM, Shrikanth Hegde wrote:
> 
> 
> On 6/24/26 2:55 PM, Jinjie Ruan wrote:
>> Support for parallel secondary CPU bringup is already utilized by x86,
>> MIPS, and RISC-V. This patch brings this capability to the arm64
>> architecture.
>>
>> Introduce CONFIG_HOTPLUG_PARALLEL_SMT to avoid primary SMT threads
>> to boot first constraint.
>>
>> And add a 'cpu' parameter to update_cpu_boot_status() to allow updating
>> the boot status at a per-CPU granularity during parallel bringup.
>>
>> Rework the global `secondary_data` and `__early_cpu_boot_status` accessed
>> during early boot into per-CPU arrays to allow secondary CPUs to boot
>> in parallel.
>>
> 
> Shouldn't this be called CONFIG_BRINGUP_PARALLEL instead?
> Hotplug usually means disable/enable CPU at runtime.

According to my understanding, the parallelism here includes CPU bringup
and hotplug.


