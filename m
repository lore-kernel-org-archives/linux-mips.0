Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F32C2AF00;
	Thu, 18 Jun 2026 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781797797; cv=none; b=LaZJ/Qz6x+JSgXyhZ/dZEqvppJPmvLf8S+/zG+VOOFDBqjyurwq95AMeeb8IaQD/LsaVhOHAvH3reMQSAYg8MjiaE/BLgjG4EfU64kUgTvymQ/zaVdMYCUAEdtXXUVgL8hjAZrLRzS253UNrD3XIVQOFNFUpz7DGS9Pi8Twxsj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781797797; c=relaxed/simple;
	bh=WWiXxly0mJ3+F0lWHKrSXouTJLJFbZ/rd363dd3/lFc=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qXNqBGnkTlzAQPPUMaVnFgIatReKrp1nKKWNg2ppBXr+BGvY1p0PyOL2QxS4ccUgj8SmfmRnh8Q+46BBSrTFwW8iXfdVNREXqiSZtA0ESR8HYHRHk7oITLAxuFkbycLzG0vHTYf2yYi2GgdL3FRcowC2GFs9e/X18TzPz4AwGoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZa46pD7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZa46pD7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A481F000E9;
	Thu, 18 Jun 2026 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781797796;
	bh=qhtrSbHirGTn3X9GtoAgD1uJ6365h6axZEkDGXJnLig=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=YZa46pD7DMphteXc9fyJEfzFDN3v9hbCr5E3KSw+xc2sAGO2FB84BSaEGhnN5Xw3Q
	 00UIrqFbWsiyD3eR3T3l53dWgRFpsuZeXBFJyAm9BVsdoCkc1Ih7TfOifDe0BzAkeE
	 /GmN/ZEFazUmwf3Te43GzWUKLCLbUVGTq1IQw13XqE1gXoKE+74gvPQCGh+xNzfkrx
	 5Mf97X4K6K2zTq9ygbtvyHPSeb+VNcppHGhK8pLQo6P4t+s9XGtQiPFdcpZKWeqaLf
	 S98IH43bTqjGuG1bC+2bMvt4Y38nQdaDitJxuo/sTcZHwhEqzGWeH27rNxOCQ9Oala
	 zPIOCmXJaCRuA==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, peterz@infradead.org, kees@kernel.org, nathan@kernel.org,
 linusw@kernel.org, ojeda@kernel.org, ruanjinjie@huawei.com,
 david.kaplan@amd.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com,
 maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org,
 thuth@redhat.com, oupton@kernel.org, yeoreum.yun@arm.com,
 miko.lenczewski@arm.com, broonie@kernel.org, kevin.brodsky@arm.com,
 james.clark@linaro.org, tabba@google.com, mrigendra.chaubey@gmail.com,
 arnd@arndb.de, anshuman.khandual@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
In-Reply-To: <20260611133809.3854977-4-ruanjinjie@huawei.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
Date: Thu, 18 Jun 2026 17:49:53 +0200
Message-ID: <877bnvdf1a.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 11 2026 at 21:38, Jinjie Ruan wrote:
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -113,6 +113,7 @@ config ARM64
>  	select CPUMASK_OFFSTACK if NR_CPUS > 256
>  	select DCACHE_WORD_ACCESS
>  	select HAVE_EXTRA_IPI_TRACEPOINTS
> +	select HOTPLUG_PARALLEL if SMP && HOTPLUG_CPU

Why do you tie that to HOTPLUG_CPU? HOTPLUG_CPU lets you unplug/plug
CPUs at runtime, but if its disabled then a SMP system still has to
bring up the APs. So why should that fall back to the existing variant?

> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +extern struct secondary_data cpu_boot_data[NR_CPUS];
> +#endif
> +
>  extern struct secondary_data secondary_data;
>  extern long __early_cpu_boot_status;
>  extern void secondary_entry(void);
> @@ -124,7 +128,11 @@ static inline void __noreturn cpu_park_loop(void)
>  
>  static inline void update_cpu_boot_status(unsigned int cpu, int val)
>  {
> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +	WRITE_ONCE(cpu_boot_data[cpu].status, val);
> +#else
>  	WRITE_ONCE(secondary_data.status, val);
> +#endif

You're really a great fan of #ifdefs, right?

Just convert it over to the parallel mode unconditionally and get rid of
the existing cruft.

>  	/*
>  	 * TTBR0 is only used for the identity mapping at this stage. Make it
>  	 * point to zero page to avoid speculatively fetching new entries.
> @@ -254,7 +276,9 @@ asmlinkage notrace void secondary_start_kernel(void)
>  					 read_cpuid_id());
>  	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
>  	set_cpu_online(cpu, true);
> +#ifndef CONFIG_HOTPLUG_PARALLEL
>  	complete(&cpu_running);
> +#endif

Just for the record. You can get rid of this completion w/o PARALLEL
hotplug by selecting HOTPLUG_SPLIT_STARTUP and implementing the
kick/sync parts.
  
Thanks,

        tglx
