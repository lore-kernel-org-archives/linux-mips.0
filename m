Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:38563 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994674AbeE3XKRipnHQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 31 May 2018 01:10:17 +0200
Date: Wed, 30 May 2018 16:09:55 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v2 1/1] MIPS: BCM47XX: Enable MIPS32 74K Core
 ExternalSync for BCM47XX PCIe erratum
Message-ID: <20180530230955.ggmiv2r5b2gkfczm@pburton-laptop>
References: <20180528002451.2622-1-ikegami@allied-telesis.co.jp>
 <20180528002451.2622-2-ikegami@allied-telesis.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180528002451.2622-2-ikegami@allied-telesis.co.jp>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: James Hogan <jhogan@kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Hauke Mehrtens <hauke@hauke-m.de>, Rafa~B Mi~Becki <zajec5@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20180530230955.zTpEZGBZn_hqcFd6cL_32oxiQCHk499b4ITfqo4AwfU@z>

Hi Tokunori,

On Mon, May 28, 2018 at 09:24:51AM +0900, Tokunori Ikegami wrote:
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index cf3fd549e16d..75039e89694f 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -427,8 +427,18 @@ static inline void check_errata(void)
>  		 * making use of VPE1 will be responsable for that VPE.
>  		 */
>  		if ((c->processor_id & PRID_REV_MASK) <= PRID_REV_34K_V1_0_2)
> -			write_c0_config7(read_c0_config7() | MIPS_CONF7_RPS);
> +			set_c0_config7(MIPS_CONF7_RPS);
>  		break;
> +#ifdef CONFIG_BCMA_DRIVER_PCI_HOSTMODE
> +	case CPU_74K:
> +		/*
> +		 * BCM47XX Erratum "R10: PCIe Transactions Periodically Fail"
> +		 * Enable ExternalSync for sync instruction to take effect
> +		 */
> +		pr_info("ExternalSync has been enabled\n");
> +		set_c0_config7(MIPS_CONF7_ES);
> +		break;
> +#endif

Could this be moved to platform-specific code, in order to avoid the
platform-specific #ifdef in generic code?

For example, this would seem like a good fit for the existing
bcm47xx_cpu_fixes() function.

Thanks,
    Paul
