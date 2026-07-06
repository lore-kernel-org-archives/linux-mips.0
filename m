Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE43B7B99;
	Mon,  6 Jul 2026 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359662; cv=none; b=hnYaKiKrLGQRDiYc83etHUnuDEL5j/gFwIdhRPZJrSJjqoPIlRCeupYHkkDK+1SUOWbnxqfuT1sED/0RPZsTm09rcx913xV0hetjgwF0skM2A+NYYonxI/ZCx5mm6+jM6lNm/wqp++XaPALzcNeL37ckiUkHNIrhpQUVWqytYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359662; c=relaxed/simple;
	bh=OrJgRf8yUKP70qTXIbym8aIyvQGlEpvfTadJCEU3wjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HO7vniJ+7n9QOZVv7nwNkcNT4gpA3PKO9/uZf1X+zALwcF0wcL5ACHlcIKMl3fLS6YK7YaQNEBXxJ5kYeEYELTPInFgzyozzRLm1OJlbvv9ekw12/aXfoi6fpKDmKqGoJcfAVxJIqs8ZmfEZbUcr5J/xg4xtb48n/704zCK7GQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Do1Iqi9T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Do1Iqi9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E77D1F000E9;
	Mon,  6 Jul 2026 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783359661;
	bh=r/cEfdTrJX4Mf9cEJk/e0bkaILx8pnZR7bB5XN7kzuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Do1Iqi9Tj5uD8+kkbkxEKdyzXHqw4nrZQkoq37XGzdvFHeaQyUWf8ib9xJpx7QXni
	 v8t+9IiCIG+BANMBAT84JNSz06KP5kG4iUJEA4D48/5Z/YhuTN1IamXHKpmTlLvh6s
	 Rgq1agqvciTzbhmeY1IkkQI0ySbW6kchsWqK0MXRtEaB5I2MzuQgHwSgNXvi2BE/OV
	 KqudW7MbCdbmvkwY6YCBeSzxM+eJu9V7Fz0l/TR0/Tgq2UGwQa7+BNrWyxKMSAwU/J
	 J6nCGMV6oXm4sakDNiNOFaVTOahFnD5BBgKR0D2iTwznLwoja4AKskaaX5kIaR2FmQ
	 3Zsp8ims2y00A==
Date: Mon, 6 Jul 2026 18:40:50 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 09/12] arm64: cpufeature: Ensure atomic updates to
 system_cpucaps bitmap
Message-ID: <akvooksAvkmG971U@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-10-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624092537.2916971-10-ruanjinjie@huawei.com>

On Wed, Jun 24, 2026 at 05:25:34PM +0800, Jinjie Ruan wrote:
> Parallel CPU bringup allows multiple secondary CPUs to concurrently
> execute update_cpu_capabilities() during early boot.
> 
> The current non-atomic __set_bit() and __clear_bit() helpers perform
> unserialized updates on the shared global bitmap, risking data races
> and feature flag erasure.
> 
> Upgrade these operations to set_bit() and clear_bit() to ensure all
> concurrent modifications are properly serialized via arm64 atomics.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index be75e60d56ca..a1a13f3e01ed 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3548,7 +3548,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>  
>  		if (!caps->matches(caps, cpucap_default_scope(caps))) {
>  			if (match_all)
> -				__clear_bit(caps->capability, system_cpucaps);
> +				clear_bit(caps->capability, system_cpucaps);
>  			continue;
>  		}
>  
> @@ -3559,7 +3559,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>  		if (!match_all && caps->desc && !caps->cpus)
>  			pr_info("detected: %s\n", caps->desc);
>  
> -		__set_bit(caps->capability, system_cpucaps);
> +		set_bit(caps->capability, system_cpucaps);
>  
>  		if (boot_cpu && (caps->type & SCOPE_BOOT_CPU))
>  			set_bit(caps->capability, boot_cpucaps);

I don't think this is sufficient. Even if we use atomic updates for the
low-level bits, the logic here which tries to avoid re-probing features
that have already been detected isn't going to work correctly if it's
running concurrently with itself.

I think the best bet is probably to move update_cpu_capabilities() out
of check_local_cpu_capabilities() and call it after cpuhp_ap_sync_alive()
when the system capabilities are not yet finalised. WDYT? That means
we'd have something akin to setup_boot_cpu_features() for the secondary
CPUs.

Will
