Received: from 19pmail.ess.barracuda.com ([64.235.154.230]:51078 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992910AbdKAR7hvLer8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Nov 2017 18:59:37 +0100
Date: Wed, 1 Nov 2017 10:58:20 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v6 5/5] MIPS: ranchu: Add Ranchu as a new generic-based
 board
Message-ID: <20171101175820.nhepxzdwfokof6q2@pburton-laptop>
References: <1509364642-21771-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1509364642-21771-6-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1509364642-21771-6-git-send-email-aleksandar.markovic@rt-rk.com>
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
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: linux-mips@linux-mips.org, Miodrag Dinic <miodrag.dinic@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, "David S. Miller" <davem@davemloft.net>, Douglas Leung <douglas.leung@mips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Hogan <james.hogan@mips.com>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Miodrag Dinic <miodrag.dinic@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Ralf Baechle <ralf@linux-mips.org>, Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20171101175820.Cua7yQv7OmgQHEDjI-gD2AHoaRYQTsCatIWOdzfQFSc@z>

Hi Aleksandar,

On Mon, Oct 30, 2017 at 12:56:36PM +0100, Aleksandar Markovic wrote:
> diff --git a/arch/mips/generic/board-ranchu.c b/arch/mips/generic/board-ranchu.c
> new file mode 100644
> index 0000000..0397752
> --- /dev/null
> +++ b/arch/mips/generic/board-ranchu.c
> @@ -0,0 +1,79 @@
> +/*
> + * Support code for virtual Ranchu board for MIPS.
> + *
> + * Author: Miodrag Dinic <miodrag.dinic@mips.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +#include <linux/of_address.h>
> +
> +#include <asm/machine.h>

You should also include asm/mipsregs.h for read_c0_count(), even though it's
presumably being pulled in indirectly as-is.

> +#include <asm/time.h>
> +
> +#define GOLDFISH_TIMER_LOW		0x00
> +#define GOLDFISH_TIMER_HIGH		0x04
> +
> +static __init uint64_t read_rtc_time(void __iomem *base)
> +{
> +	u64 time_low;
> +	u64 time_high;
> +
> +	time_low = readl(base + GOLDFISH_TIMER_LOW);
> +	time_high = readl(base + GOLDFISH_TIMER_HIGH);
> +
> +	return (time_high << 32) | time_low;
> +}
> +
> +static __init unsigned int ranchu_measure_hpt_freq(void)
> +{
> +	u64 rtc_start, rtc_current, rtc_delta;
> +	unsigned int start, count;
> +	struct device_node *np;
> +	void __iomem *rtc_base;
> +
> +	np = of_find_compatible_node(NULL, NULL, "google,goldfish-rtc");
> +	if (!np)
> +		panic("%s(): Failed to find 'google,goldfish-rtc' dt node!",
> +		      __func__);
> +
> +	rtc_base = of_iomap(np, 0);
> +	if (!rtc_base)
> +		panic("%s(): Failed to ioremap Goldfish RTC base!", __func__);
> +
> +	/*
> +	 * poll the nanosecond resolution RTC for 1 second
> +	 * to calibrate the CPU frequency
> +	 */
> +	rtc_start = read_rtc_time(rtc_base);
> +	start = read_c0_count();
> +
> +	do {
> +		rtc_current = read_rtc_time(rtc_base);
> +		rtc_delta = rtc_current - rtc_start;
> +	} while (rtc_delta < NSEC_PER_SEC);
> +
> +	count = read_c0_count() - start;
> +
> +	count += 5000;	/* round */
> +	count -= count % 10000;
> +
> +	return count;
> +}

Would it be possible to have the emulator write the frequency into the
devicetree, as the frequency of a fixed-clock used as the CPU's clock? If that
were possible then there'd be no need for this board setup code at all. Not a
big deal, but it'd be nice.

> +
> +static const struct of_device_id ranchu_of_match[];
> +
> +MIPS_MACHINE(ranchu) = {
> +	.matches = ranchu_of_match,
> +	.measure_hpt_freq = ranchu_measure_hpt_freq,
> +};
> +
> +static const struct of_device_id ranchu_of_match[] = {
> +	{
> +		.compatible = "mti,ranchu",
> +		.data = &__mips_mach_ranchu,
> +	},
> +};

Could you move ranchu_of_match before the MIPS_MACHINE & drop the forward
declaration? That would feel tidier to me. It could also be marked as
__initdata.

In general though, with those & James' comments addressed, I think this is
looking good.

Thanks,
    Paul
