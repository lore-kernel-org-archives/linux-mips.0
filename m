Received: from mail-bn1bon0072.outbound.protection.outlook.com ([157.56.111.72]:39058
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27009080AbaLTBS7TsKdu (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 20 Dec 2014 02:18:59 +0100
Message-ID: <5494CE74.308@caviumnetworks.com>
Date: Fri, 19 Dec 2014 17:18:44 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Fix C0_Pagegrain[IEC] support.
References: <1419038123-30270-1-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1419038123-30270-1-git-send-email-ddaney.cavm@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>, ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20141220011844.c6o1PbxsTK9TT_tlp406FkpsYLlJXjLHtU24-JRBHn8@z>


Ralf, I forgot to add it to the patch, but if you merge this, can you 
add a Cc: stable@... for the versions that have the patches that broke 
the XI feature?

Thanks,
David Daney

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
>
