Received: from mailapp01.imgtec.com ([195.59.15.196]:22162 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008982AbcERGxbZfCEY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 May 2016 08:53:31 +0200
Subject: Re: [PATCH 1/3] MIPS: Clear Status IPL field when using EIC
References: <1463495466-29689-1-git-send-email-paul.burton@imgtec.com>
 <1463495466-29689-2-git-send-email-paul.burton@imgtec.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <573C1161.6060608@imgtec.com>
Date: Wed, 18 May 2016 07:53:21 +0100
MIME-Version: 1.0
In-Reply-To: <1463495466-29689-2-git-send-email-paul.burton@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, James Hogan <james.hogan@imgtec.com>
Message-ID: <20160518065321.M2SP17OYZwQ27blMAoMm3Fg-Z7V6h9Nba8YMG-opJqo@z>



On 17/05/16 15:31, Paul Burton wrote:
> When using an external interrupt controller (EIC) the interrupt mask
> bits in the cop0 Status register are reused for the Interrupt Priority
> Level, and any interrupts with a priority lower than the field will be
> ignored. Clear the field to 0 by default such that all interrupts are
> serviced. Without doing so we default to arbitrarily ignoring all or
> some subset of interrupts.
>
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
>
>   arch/mips/kernel/irq.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
> index 8eb5af8..f25f7ea 100644
> --- a/arch/mips/kernel/irq.c
> +++ b/arch/mips/kernel/irq.c
> @@ -54,6 +54,9 @@ void __init init_IRQ(void)
>   	for (i = 0; i < NR_IRQS; i++)
>   		irq_set_noprobe(i);
>   
> +	if (cpu_has_veic)
> +		clear_c0_status(ST0_IM);
> +
>   	arch_init_irq();
>   }
>   
Hi Paul

Reviewed-by: Matt Redfearn <matt.redfearn@imgtec.com>
Tested-by: Matt Redfearn <matt.redfearn@imgtec.com>
