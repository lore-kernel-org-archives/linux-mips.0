Received: from mail-wr0-x236.google.com ([IPv6:2a00:1450:400c:c0c::236]:36420
        "EHLO mail-wr0-x236.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992100AbdE1JSuBpJRN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 28 May 2017 11:18:50 +0200
Received: by mail-wr0-x236.google.com with SMTP id l50so21024656wrc.3
        for <linux-mips@linux-mips.org>; Sun, 28 May 2017 02:18:49 -0700 (PDT)
Subject: Re: [PATCH 6/7] clocksource: Rename CLKSRC_OF to TIMER_OF
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-6-git-send-email-daniel.lezcano@linaro.org>
 <20170528030058.GC4528@dragon>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <3bea2d43-e582-5b62-03df-3557028cc4b8@linaro.org>
Date: Sun, 28 May 2017 11:18:40 +0200
MIME-Version: 1.0
In-Reply-To: <20170528030058.GC4528@dragon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Return-Path: <daniel.lezcano@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Shawn Guo <shawnguo@kernel.org>
Cc: tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, Ley Foon Tan <lftan@altera.com>, Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>, John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
Message-ID: <20170528091840.oh49IQWQnb1CPxIk-TQQ341zjsX7Ltf0cIvBpXBTQmo@z>

On 28/05/2017 05:00, Shawn Guo wrote:
> On Sat, May 27, 2017 at 11:58:47AM +0200, Daniel Lezcano wrote:
>> diff --git a/arch/arm/mach-imx/epit.c b/arch/arm/mach-imx/epit.c
>> index fb9a73a..4a4d2e2 100644
>> --- a/arch/arm/mach-imx/epit.c
>> +++ b/arch/arm/mach-imx/epit.c
>> @@ -39,7 +39,7 @@
>>  #define EPITCR_OM_TOGGLE		(1 << 22)
>>  #define EPITCR_OM_CLEAR			(2 << 22)
>>  #define EPITCR_OM_SET			(3 << 22)
>> -#define EPITCR_CLKSRC_OFF		(0 << 24)
>> +#define EPITCR_TIMER_OFF		(0 << 24)
>>  #define EPITCR_CLKSRC_PERIPHERAL	(1 << 24)
>>  #define EPITCR_CLKSRC_REF_HIGH		(1 << 24)
>>  #define EPITCR_CLKSRC_REF_LOW		(3 << 24)
> 
> I do not think this change should be there.

Right. Thanks!


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
