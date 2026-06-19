Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B5F368D45;
	Fri, 19 Jun 2026 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862125; cv=none; b=kgsXJpBXr1pqiRjjYQCyDhYg48bhDIXIq6YiAkB9549twPYHMwzVly97IaW60grDIIgUsxY2k8jMPDdPfBnFRTlIMdT5V7/zXtBeyKqrRcOiT+7zQl/VC/GzJVZ8pMyfDwBLJvisRajbPV8Z5lN/2RipubDYUHvq23pTbFHEhhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862125; c=relaxed/simple;
	bh=j2Qkkop7jtzsGY//Nd1ivpjhXQ+UfznUwGQQwGDPuH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8I1KhjdEyXphZD2nis5nWS0I7PdL+Z3j41dnTri6qScS4gpYmeoGIiY+toxpVIyXAYFZcnKynLcBO5I8uq/txRvBLrDx9q6p7gn5rV5fRrdqxbRv8bZo3Kqq1iI9vjQoAlfY8kHCgN/fNMCzuPDuE4LBpqshe7MZ6WcVrV2Bmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dxCpgYGo; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dxCpgYGo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t2NuC61jQhkLZlTPdr5bUtoaoRRTUEJ6wbF953eCit8=; b=dxCpgYGotPMuA2p6gEibYEHVV3
	8SYC4JMjwV+Fla0Xbzblgh7OCk7snf4aoCvaL5fNDG1m4tQ79ZMZwNdPBvHgv8y6ajbc5f4/YGSBe
	S+O32/eTHR97OKvqdgmMKFQkz9w9zmr2vicnDrlCXPgw4ny9YEgreZAUVptOUKQRahCKBiWhDqhKf
	DSydSwO1kiClKiV4gxdwM4tbiPbercmFalG6w05YvAdx8SRHtNtjt7KI06YAtlWP/SWqW+Fkeb+lY
	X11FaOOKvHvtRfRMcwjrTl8Wgp2VigJeehKMWCaxutPrahrO+YGN+skUyaUbsvocqspsIA7etIWC5
	Izg8KwdA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1waVjA-0000000EM2X-2Lb1;
	Fri, 19 Jun 2026 09:41:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 795F6300CB5; Fri, 19 Jun 2026 11:41:30 +0200 (CEST)
Date: Fri, 19 Jun 2026 11:41:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, kees@kernel.org, nathan@kernel.org,
	linusw@kernel.org, ojeda@kernel.org, david.kaplan@amd.com,
	lukas.bulwahn@redhat.com, ryan.roberts@arm.com, maz@kernel.org,
	timothy.hayes@arm.com, lpieralisi@kernel.org, thuth@redhat.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	tabba@google.com, mrigendra.chaubey@gmail.com, arnd@arndb.de,
	anshuman.khandual@arm.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
Message-ID: <20260619094130.GU49951@noisy.programming.kicks-ass.net>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com>
 <87a4srdgk0.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4srdgk0.ffs@fw13>

On Thu, Jun 18, 2026 at 05:17:03PM +0200, Thomas Gleixner wrote:

> Something simple like the uncompiled below should just work, no?
> 
> ---
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>  	bool
>  	select HOTPLUG_SPLIT_STARTUP
>  
> +config HOTPLUG_PARALLEL_SMT
> +	bool
> +	select HOTPLUG_PARALLEL

	depends on ARCH_SUPPORTS_SCHED_SMT ?
