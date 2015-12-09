Received: from mailapp01.imgtec.com ([195.59.15.196]:32370 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007066AbbLIKDVRia8S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Dec 2015 11:03:21 +0100
Subject: Re: [PATCH] mips: make mips_cps_{core_init,boot_vpes} work on
 mips32r2
References: <1449599437-9593-1-git-send-email-mar.kolya@gmail.com>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <5667FC62.8050806@imgtec.com>
Date: Wed, 9 Dec 2015 10:03:14 +0000
MIME-Version: 1.0
In-Reply-To: <1449599437-9593-1-git-send-email-mar.kolya@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Nikolay Martynov <mar.kolya@gmail.com>
Cc: linux-mips@linux-mips.org, Paul Burton <Paul.Burton@imgtec.com>
Message-ID: <20151209100314.vaUIn6cqECnX6SARRQJpNuRX_pceaOmWAMbHdyTkC5k@z>

On 12/08/2015 06:30 PM, Nikolay Martynov wrote:
> mips_cps_{core_init,boot_vpes} had 'mips64r2' hardcoded which
> prevented them from being run on mips32. Fix that by choosing
> cpu type based on CONFIG_64BIT.
>
> Tested on mt7621.
>
> Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>
> ---
>   arch/mips/kernel/cps-vec.S | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
> index 8fd5a27..1254a51 100644
> --- a/arch/mips/kernel/cps-vec.S
> +++ b/arch/mips/kernel/cps-vec.S
> @@ -257,7 +257,11 @@ LEAF(mips_cps_core_init)
>   	has_mt	t0, 3f
>   
>   	.set	push
> +#ifdef CONFIG_64BIT
>   	.set	mips64r2
> +#else
> +	.set	mips32r2
> +#endif
>   	.set	mt
>   
>   	/* Only allow 1 TC per VPE to execute... */
> @@ -376,7 +380,11 @@ LEAF(mips_cps_boot_vpes)
>   	 nop
>   
>   	.set	push
> +#ifdef CONFIG_64BIT
>   	.set	mips64r2
> +#else
> +	.set	mips32r2
> +#endif
>   	.set	mt
>   
>   1:	/* Enter VPE configuration state */

This should have already been fixed in this

     http://patchwork.linux-mips.org/patch/10869/

Thanks,
Qais
