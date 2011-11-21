Received: from smtp2.infineon.com ([217.10.60.23]:33832 "EHLO
        smtp2.infineon.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1903777Ab1KUPbB convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Nov 2011 16:31:01 +0100
From: <thomas.langer@lantiq.com>
Subject: RE: [PATCH V2 4/6] MIPS: lantiq: add basic support for FALC-ON
Date: Mon, 21 Nov 2011 15:30:53 +0000
Message-ID: <0509FD3B91656A408BE277C2D2CD5B3B0FFAAD@MUCSE501.eu.infineon.com>
References: <1321882525-13780-1-git-send-email-blogic@openwrt.org>
 <1321882525-13780-4-git-send-email-blogic@openwrt.org>
In-Reply-To: <1321882525-13780-4-git-send-email-blogic@openwrt.org>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: blogic@openwrt.org, ralf@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20111121153053.OiyV6jhqYgvI-BOIsX6n_4zCba13gxeAW7QXEzlaG_M@z>

Hello John,

I found an issue with the machine_restart function.

> +
> +static void
> +ltq_machine_restart(char *command)
> +{
> +	pr_notice("System restart\n");
> +	local_irq_disable();
> +
> +	/* reboot magic */
> +	ltq_w32(BOOT_PW1, (void *)BOOT_PW1_REG); /* 'LTQ\0' */
> +	ltq_w32(BOOT_PW2, (void *)BOOT_PW2_REG); /* '\0QTL' */
> +	ltq_w32(0, (void *)BOOT_REG_BASE); /* reset Bootreg RVEC */
> +
> +	/* watchdog magic */
> +	ltq_w32(WDT_PW1, (void *)WDT_REG_BASE);
> +	ltq_w32(WDT_PW2 |
> +		(0x3 << 26) | /* PWL */
> +		(0x2 << 24) | /* CLKDIV */
> +		(0x1 << 31) | /* enable */
> +		(1), /* reload */
> +		(void *)WDT_REG_BASE);

The watchdog needs some time for the reset (1 tick of watchdog but many
ticks of the cpu). With unreachable(), there is no valid code after the
register access. Please add some loop like
	while(1)
		;
here (and a comment).

> +	unreachable();
> +}

Can you please create and send an updated patch?

Thanks,
Thomas
