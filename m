Received: from mout.kundenserver.de ([212.227.17.13]:63830 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007663AbcDPUCAs1wve (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 16 Apr 2016 22:02:00 +0200
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] bus: brcmstb_gisb: Rework dependencies
Date: Sat, 16 Apr 2016 22:01:05 +0200
Message-ID: <13932531.o87aikNi0r@wuerfel>
In-Reply-To: <1460571469-20201-1-git-send-email-f.fainelli@gmail.com>
References: <1460571469-20201-1-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Return-Path: <arnd@arndb.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, Olof Johansson <olof@lixom.net>, Punit Agrawal <punit.agrawal@arm.com>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Chen-Yu Tsai <wens@csie.org>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20160416200105.RpvhPF2aEcJMPn2rhGDJJtJYGbUKJB1PebbSeAZ31MQ@z>

On Wednesday 13 April 2016 11:17:48 Florian Fainelli wrote:
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -58,6 +58,8 @@ config ARM_CCN
>  config BRCMSTB_GISB_ARB
>         bool "Broadcom STB GISB bus arbiter"
>         depends on ARM || MIPS
> +       default ARCH_BRCMSTB
> +       default BMIPS_GENERIC
> 

I think having two 'default' statements is not clear to human
readers, how about changing it to

	default ARCH_BRCMSTB || BMIPS_GENERIC


	Arnd
