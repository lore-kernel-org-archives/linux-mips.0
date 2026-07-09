Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906D725B663;
	Thu,  9 Jul 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589333; cv=none; b=TuP+HFT+nEVhiA8V4SMOcsL8TM1HnxHE+52eBy4F0bDDtnh2di/kFILSzCn57m3SqEK1fP19ezOLliChuJQURi29m4ogXbfub/CcMjZwgTbrMKRE4nTsYMaiA8XmxJYuV/ozE4GWcnlMWde5qz5s+/NSaxIkmQv1BJOQwScQ7js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589333; c=relaxed/simple;
	bh=lXq52tcINHrMd4QLV4yQq3DVLQ4uxG1/EAbehW0cGRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bw/UpG/zMtGcWd58Mp9cZrJk1U2GSUrLJczONR0zrVEX/rIQVHAMABC8PcWosbMFKjyvCNx1BDxnLw1lU8hEtcK7WFf/TJp/t0zhb+pegBtPn9ebRvNEhpsIKfQGe7JgmTOELKOxSxFWo8Asvv3VAEWF7+t5PUEF0J2b4rS5AGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=R95AUyal; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="R95AUyal"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAF9E497;
	Thu,  9 Jul 2026 02:28:37 -0700 (PDT)
Received: from [10.2.200.62] (e119884-lin.cambridge.arm.com [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F3853F66F;
	Thu,  9 Jul 2026 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589322; bh=lXq52tcINHrMd4QLV4yQq3DVLQ4uxG1/EAbehW0cGRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R95AUyalBC3A02Bv/AhkNZPAsPijU6D3yHoZxhBkDkBN4nQDsLJhsZhZORfkJ+9UX
	 kJ/g1BJG/OdscZI2vG3JEFDrpAv1rE2ZsGEda232TL04R4JMkuBVXsKiVDoIFWBqNu
	 Y0AwCWUKZAlSBihL0OdMCw3h4Yv7ql5Qe7tJi4qg=
Message-ID: <86ee2905-4fa4-4f51-9d1d-6e404de320ed@arm.com>
Date: Thu, 9 Jul 2026 10:28:39 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] vDSO: Remove the dependency on HAVE_GENERIC_VDSO from
 ARCH_HAS_VDSO_ARCH_DATA
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
 <20260709-vdso-have_generic_vdso-v1-2-d2e1061f268b@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-2-d2e1061f268b@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/07/2026 08:28, Thomas Weißschuh wrote:
> Align ARCH_HAS_VDSO_ARCH_DATA with ARCH_HAS_VDSO_TIME_DATA, making it
> selectable even without HAVE_GENERIC_VDSO.
> 
> It will only have an effect when HAVE_GENERIC_VDSO is enabled anyways,
> but this make the architecture Kconfig files a bit simpler.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  arch/Kconfig       | 1 -
>  arch/riscv/Kconfig | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index fa7507ac8e13..8a8d1ab39757 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1682,7 +1682,6 @@ config HAVE_SPARSE_SYSCALL_NR
>  	  related optimizations for a given architecture.
>  
>  config ARCH_HAS_VDSO_ARCH_DATA
> -	depends on HAVE_GENERIC_VDSO
>  	bool
>  
>  config ARCH_HAS_VDSO_TIME_DATA
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 3f0a647218e4..353cbfcff783 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -54,7 +54,7 @@ config RISCV
>  	select ARCH_HAS_SYSCALL_WRAPPER
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN
> -	select ARCH_HAS_VDSO_ARCH_DATA if HAVE_GENERIC_VDSO
> +	select ARCH_HAS_VDSO_ARCH_DATA
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
> 

-- 
Regards,
Vincenzo

