Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72D3B8131;
	Mon,  6 Jul 2026 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359585; cv=none; b=lZMKWUzs/nUOpg7DJ4vGBPM6tbwsGBSljzfinnnYAV+P3WsHG0zCMHRU+XKAw2z2mkOG0OnV4/Kpedp1C24HtqXNRyVP49T8Pv//dJsLXmG5FRASfbG3OJOGI5jQcddjZjdnKzxx3KwT4Z5RKCvque2Vnt1bLJpyPZ5HV66FVc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359585; c=relaxed/simple;
	bh=ch88ddXsK8rRVpBUHUc4SKlPkId/XSqS8UhfZgUzXI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fk0yt7A8E3ckrUXXIkBTFQ78zpzSF0Z/YvsVOETPB5UBDT+RPUvnm7w6qFzUawocahbntnlsMfDljpu3VUpzUMqZkgeQWsSytl3NtXJniir0egop8d/PMCwgn5UEd5/5Sv/DU78Ag7twAcMx15yoRKN8YXvKLjNgtFcgjKD15E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgNzUPmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgNzUPmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053371F000E9;
	Mon,  6 Jul 2026 17:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783359583;
	bh=3Ijv0Cx5Er5paIrljXWxNnEthBLXb9Gwgrh0LYZ8Nqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TgNzUPmbDuK7hGi3J7/zuV/uS/0cUt8v9gLyj+gZ/skpvQQEi+BK6ozF3jo3SjnzN
	 bdBSuXMfcPtDUXjzzDbzT3RzSvSaEcT6IeQCxQENaVKAjd22BFLSyiNRKRvE1lS4MW
	 qjREb9gfmwYZXokBPNNanyyVJD83WVIkQyffI+yvLhYB2Gbo8rrIjejishdnRPDrd6
	 ABr8f8fI366cENbWaTCLp+xdDwsYPQ8n44I8kGZbdKxk9KV22JGTZl3/7OcsMOjB/a
	 PSa3hCeiHMWTX5rAoNlGb0mk9Woi6gCnFDzFxfqZbqMbtTL4l273Wa2qNvoOrInwFd
	 OKHpzKAhl9W5A==
Date: Mon, 6 Jul 2026 18:39:32 +0100
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
Subject: Re: [PATCH v3 05/12] arm64: smp: Defer RCU registration during
 secondary CPU bringup
Message-ID: <akvoVCNFwDorQg6y@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-6-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624092537.2916971-6-ruanjinjie@huawei.com>

On Wed, Jun 24, 2026 at 05:25:30PM +0800, Jinjie Ruan wrote:
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index c14b179c595d..87f92cf9ffa8 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -35,6 +35,7 @@
>  #include <linux/kgdb.h>
>  #include <linux/kvm_host.h>
>  #include <linux/nmi.h>
> +#include <linux/lockdep.h>
>  
>  #include <asm/alternative.h>
>  #include <asm/atomic.h>
> @@ -215,15 +216,23 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	if (system_uses_irq_prio_masking())
>  		init_gic_priority_masking();
>  
> -	rcutree_report_cpu_starting(cpu);
> -	trace_hardirqs_off();
> +	lockdep_hardirqs_off(CALLER_ADDR0);
>  
> +	/*
> +	 * Since RCU is still offline on this CPU, any nested native printk
> +	 * or lock acquisition would normally trigger a false-positive
> +	 * "suspicious RCU usage" lockdep splat.
> +	 */
> +	lockdep_off();

On the flip side, should we really be taking locks at this point? I'm
actually quite sympathetic to lockdep here and I worry that disabling
it briefly is going to hide real problems down the line.

ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") was to
handle the useless print in cpuinfo_detect_icache_policy(), but I've
decided just to remove that one. So I think the remaining prints we have
to worry about in this early boot code are from error paths in the
CPU feature detection logic (check_local_cpu_capabilities()).

Given that those error paths should all be fatal, perhaps we could
rework cpu_die_early() and cpu_panic_kernel() as macros that take a
string argument and either call printk_deferred() (similarly to what you
suggested in a previous version of your series [1]) or do the
lockdep_off() there before a pr_crit().

What do you think?

Will

[1] https://lore.kernel.org/all/20260618092444.1316336-4-ruanjinjie@huawei.com/
