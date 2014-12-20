Received: from mailapp01.imgtec.com ([195.59.15.196]:37876 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009080AbaLTBVryevoW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Dec 2014 02:21:47 +0100
Message-ID: <5494CF23.1080606@imgtec.com>
Date: Fri, 19 Dec 2014 17:21:39 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Fix C0_Pagegrain[IEC] support.
References: <1419038123-30270-1-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1419038123-30270-1-git-send-email-ddaney.cavm@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: David Daney <david.daney@cavium.com>
Message-ID: <20141220012139.IwMfBPQbuCuDPoeCYft7ImmGA3MmGsZoYB5dpRe8BN4@z>

On 12/19/2014 05:15 PM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
>
> If we are generating TLB exception expecting separate vectors, we must
> enable the feature.
>
> Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> Signed-off-by: David Daney <david.daney@cavium.com>
> ---
>
> Very lightly tested, but it seems to make my XI and RI tests work on
> OCTEON II CPUs, which have the C0_Pagegrain[IEC] bit.
>
>   arch/mips/mm/tlb-r4k.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> index e90b2e8..30639a6 100644
> --- a/arch/mips/mm/tlb-r4k.c
> +++ b/arch/mips/mm/tlb-r4k.c
> @@ -489,6 +489,8 @@ static void r4k_tlb_configure(void)
>   #ifdef CONFIG_64BIT
>   		pg |= PG_ELPA;
>   #endif
> +		if (cpu_has_rixiex)
> +			pg |= PG_IEC;
>   		write_c0_pagegrain(pg);
>   	}
>   
David, I think it is still better to use set_c0_pagegrain() because 
PageGrain has a lot of RW bits now and clear all of them may be not good.
