Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41873FBB69;
	Thu,  9 Jul 2026 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589402; cv=none; b=WX0ccITINCv06kz7qe+W3ysbcDsgSOMOgy1ldfcQc3eVJFkjFasagvFQHAUxjkb7+76MDl0HPzyakfi3JbPiVUN4QuJhKkrKIwXDOo2yhBm7qYxZgwzAV1x7ENlu8zDAexmzcJuGuu94/MrgQplWdzr5wwbV3kz+LspLTxGJ+DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589402; c=relaxed/simple;
	bh=1xkUoTHBreUsC46AQZZXqxOQVyzJkeuSfBtKeg0wqrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJnnu67uqxP0k54aN394hM7lNCnpkg/VX2bcDtGiDmO7Th81Lc7p3nuIde3FluC9VxqE1nKX6dPsLl0paDB2O8+3dn1qd694Sv5XAsmz5fm2XucWbuINBBXb5Q4hUODqLjJQ/e2vGK9Kb/xNoYzcPCPRIfuWAfKUfRcps73XQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rlWNq1EK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rlWNq1EK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E0B6357B;
	Thu,  9 Jul 2026 02:29:56 -0700 (PDT)
Received: from [10.2.200.62] (e119884-lin.cambridge.arm.com [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8989B3F66F;
	Thu,  9 Jul 2026 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589400; bh=1xkUoTHBreUsC46AQZZXqxOQVyzJkeuSfBtKeg0wqrg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rlWNq1EKSkCHRHCISihp/BExtAA5KT9Y509FT7t1L2zEn7PHoRZDqGjpRXUbLDpQN
	 q3DlWKD3mV9QUpCdIPrDFTVamvPZxZupKMLfd0blbsdpipQV49494hT1MZ4vszTu/e
	 fT+r8gYlg5b6RuRn1JQfp5T8xzY2YB5ZcmfCvPuw=
Message-ID: <b9748be5-139d-48c8-b0a6-e0975854a0c1@arm.com>
Date: Thu, 9 Jul 2026 10:29:58 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] MIPS: vdso: Stop using CONFIG_HAVE_GENERIC_VDSO
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
 <20260709-vdso-have_generic_vdso-v1-3-d2e1061f268b@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-3-d2e1061f268b@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/07/2026 08:28, Thomas Weißschuh wrote:
> HAVE_GENERIC_VDSO is about to become an implementation detail.
> 
> Use the MIPS-specific symbol instead. It is equivalent here.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  arch/mips/kernel/vdso.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
> index bd1fc17d3975..29a10045f2b6 100644
> --- a/arch/mips/kernel/vdso.c
> +++ b/arch/mips/kernel/vdso.c
> @@ -129,7 +129,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  	 * This ensures that when the kernel updates the VDSO data userland
>  	 * will observe it without requiring cache invalidations.
>  	 */
> -	if (cpu_has_dc_aliases && IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO)) {
> +	if (cpu_has_dc_aliases && IS_ENABLED(CONFIG_MIPS_GENERIC_GETTIMEOFDAY)) {
>  		base = __ALIGN_MASK(base, shm_align_mask);
>  		base += ((unsigned long)vdso_k_time_data - gic_size) & shm_align_mask;
>  	}
> @@ -137,7 +137,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  	data_addr = base + gic_size;
>  	vdso_addr = data_addr + VDSO_NR_PAGES * PAGE_SIZE;
>  
> -	if (IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO)) {
> +	if (IS_ENABLED(CONFIG_MIPS_GENERIC_GETTIMEOFDAY)) {
>  		vma = vdso_install_vvar_mapping(mm, data_addr);
>  		if (IS_ERR(vma)) {
>  			ret = PTR_ERR(vma);
> 

-- 
Regards,
Vincenzo

