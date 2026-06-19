Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6B349CE1;
	Fri, 19 Jun 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781897237; cv=none; b=iv6BWwL4La9BnGKdXtYUKIoY3Vaf0KLneYnnLtKJBuWE1Erq+Fa4AkYiXbHtNzk8DpetuLDMmDx1H3AmeWDUc+faPS54F8JW1OBUtyq4Ca1VsYcqaxxUbQp+2uH8Bv7h5SUR7O6tU5uvbbYCUCXgbQHud4uupQxa7SaEEhVoaiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781897237; c=relaxed/simple;
	bh=ghoEKmTDil829+zL6ehi7Ykk/cdKar6C7aAIsEYZWMA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uS98/k3QgsVwhK3bUabelLaPM/n3eyFfk/L0y21XOzmsOjIbfWat1m5qK4+pVU6fa2uMwQI8Lkby/qnlGcX6JWVaPYfAg4red7FHTlwiVWOuzy2AEtzURrAb9GQhJUG7SeW298msW81kjUUpT94wCJtZTUfZNGQuZtg+wHGhcJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjZWeR2B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjZWeR2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AC61F000E9;
	Fri, 19 Jun 2026 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781897234;
	bh=2j25ksHlzzgiJapOxjE0LWoxXkD8fo4E5hLsMP9g7Qg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZjZWeR2B4RDHzs11keZnbEX5GPkDO4ewLXSWIxWl3TtZgmPrYzh/es7rKmPgwLYPc
	 G9/iS15aNLl8yRhv+nscp6GyPkttdugCDo+n+FCaVUJ+BeFCIYtF+Tz1RzU+56fFhI
	 OredVk3jQFGyG1m9pAcuqeECZVannJ2qU5Wst0Xngngfq0xCdq56Jxq14dM30kX2B8
	 gRsKlF7lAAdMILqwQRe9JkuVQEHYr2b2MohI3A2GtWVIyLDHkMeHlNd/PDKS9jbNu9
	 +B+qHCkz1stv2sm/Z5ih0nssJKxSD48jJaDNgnSdRxbHlFulBG38L//Ott12V41Y2X
	 B8d3rWSj0UApA==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, kees@kernel.org, nathan@kernel.org, linusw@kernel.org,
 ojeda@kernel.org, david.kaplan@amd.com, lukas.bulwahn@redhat.com,
 ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
 lpieralisi@kernel.org, thuth@redhat.com, oupton@kernel.org,
 yeoreum.yun@arm.com, miko.lenczewski@arm.com, broonie@kernel.org,
 kevin.brodsky@arm.com, james.clark@linaro.org, tabba@google.com,
 mrigendra.chaubey@gmail.com, arnd@arndb.de, anshuman.khandual@arm.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
In-Reply-To: <20260619094130.GU49951@noisy.programming.kicks-ass.net>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com> <87a4srdgk0.ffs@fw13>
 <20260619094130.GU49951@noisy.programming.kicks-ass.net>
Date: Fri, 19 Jun 2026 21:27:11 +0200
Message-ID: <875x3ecovk.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 19 2026 at 11:41, Peter Zijlstra wrote:
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

Probably. Did not think about that as this has to be anyway selected by
the architecture.
