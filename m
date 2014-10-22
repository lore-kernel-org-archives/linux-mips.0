Received: from mailapp01.imgtec.com ([195.59.15.196]:23469 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011331AbaJVJdwlombu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Oct 2014 11:33:52 +0200
Message-ID: <544779F8.2040505@imgtec.com>
Date: Wed, 22 Oct 2014 10:33:44 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 03/19] MIPS: sead3: Stop using GIC REG macros
References: <1413831846-32100-1-git-send-email-abrestic@chromium.org> <1413831846-32100-4-git-send-email-abrestic@chromium.org>
In-Reply-To: <1413831846-32100-4-git-send-email-abrestic@chromium.org>
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
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Paul Burton <paul.burton@imgtec.com>, John Crispin <blogic@openwrt.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20141022093344.vWEJIcLhromL1SujiP1GY4a_TaTGh78yZ5fbHyVKe60@z>

On 10/20/2014 08:03 PM, Andrew Bresticker wrote:
> Stop using the REG macros from gic.h and instead use proper iomem
> accessors.
>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> ---
>   arch/mips/mti-sead3/sead3-int.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/mti-sead3/sead3-int.c b/arch/mips/mti-sead3/sead3-int.c
> index 69ae185..995c401 100644
> --- a/arch/mips/mti-sead3/sead3-int.c
> +++ b/arch/mips/mti-sead3/sead3-int.c
> @@ -20,16 +20,15 @@
>   #define SEAD_CONFIG_BASE		0x1b100110
>   #define SEAD_CONFIG_SIZE		4
>   
> -static unsigned long sead3_config_reg;
> +static void __iomem *sead3_config_reg;
>   
>   void __init arch_init_irq(void)
>   {
>   	if (!cpu_has_veic)
>   		mips_cpu_irq_init();
>   
> -	sead3_config_reg = (unsigned long)ioremap_nocache(SEAD_CONFIG_BASE,
> -		SEAD_CONFIG_SIZE);
> -	gic_present = (REG32(sead3_config_reg) & SEAD_CONFIG_GIC_PRESENT_MSK) >>
> +	sead3_config_reg = ioremap_nocache(SEAD_CONFIG_BASE, SEAD_CONFIG_SIZE);
> +	gic_present = (readl(sead3_config_reg) & SEAD_CONFIG_GIC_PRESENT_MSK) >>
>   		SEAD_CONFIG_GIC_PRESENT_SHF;
>   	pr_info("GIC: %spresent\n", (gic_present) ? "" : "not ");
>   	pr_info("EIC: %s\n",

I think you need to use the __raw_readl() variant here and for all other 
similar changes.

Qais
