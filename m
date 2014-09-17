Received: from mailapp01.imgtec.com ([195.59.15.196]:32047 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008413AbaIQI4dlfZMY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 17 Sep 2014 10:56:33 +0200
Message-ID: <54194CB9.4010200@imgtec.com>
Date: Wed, 17 Sep 2014 09:56:25 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 03/24] MIPS: Provide a generic plat_irq_dispatch
References: <1410825087-5497-1-git-send-email-abrestic@chromium.org> <1410825087-5497-4-git-send-email-abrestic@chromium.org>
In-Reply-To: <1410825087-5497-4-git-send-email-abrestic@chromium.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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
To: Andrew Bresticker <abrestic@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Jeffrey Deans <jeffrey.deans@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Jonas Gorski <jogo@openwrt.org>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20140917085625.Ai0Fef369CA_K1Sm928p8kwVU8dNaJs-AsVQ3Lj1btM@z>

Hi Andrew,

On 09/16/2014 12:51 AM, Andrew Bresticker wrote:
> For platforms which boot with device-tree or have correctly chained
> all external interrupt controllers, a generic plat_irq_dispatch() can
> be used.  Implement a plat_irq_dispatch() which simply handles all the
> pending interrupts as reported by C0_Cause.
>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> ---
>   arch/mips/kernel/irq_cpu.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/arch/mips/kernel/irq_cpu.c b/arch/mips/kernel/irq_cpu.c
> index ca98a9f..f17bd08 100644
> --- a/arch/mips/kernel/irq_cpu.c
> +++ b/arch/mips/kernel/irq_cpu.c
> @@ -94,6 +94,21 @@ static struct irq_chip mips_mt_cpu_irq_controller = {
>   	.irq_eoi	= unmask_mips_irq,
>   };
>   
> +asmlinkage void __weak plat_irq_dispatch(void)
> +{
> +	unsigned long pending = read_c0_cause() & read_c0_status() & ST0_IM;
> +	int irq;
> +
> +	if (!pending) {
> +		spurious_interrupt();
> +		return;
> +	}
> +
> +	pending >>= CAUSEB_IP;
> +	for_each_set_bit(irq, &pending, 8)
> +		do_IRQ(MIPS_CPU_IRQ_BASE + irq);
> +}
> +

If I read the for_each_set_bit() macro correctly it'll iterate through 
the bits from least to most significant ones which is the reversed 
priority expected. Some platforms set timer interrupt to bit 7 which is 
should be the highest priority interrupt. Also when cpu_has_vint is set 
the hardware prioritirise from most significant to least significant 
bits so if plat_irq_dispatch() is used with set_vi_handler() it'll cause 
interrupts to be serviced in the wrong order.

Qais

>   static int mips_cpu_intc_map(struct irq_domain *d, unsigned int irq,
>   			     irq_hw_number_t hw)
>   {
