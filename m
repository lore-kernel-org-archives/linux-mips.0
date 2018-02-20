Received: from mail-co1nam03on0066.outbound.protection.outlook.com ([104.47.40.66]:10022
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990421AbeBTKPhfzMo1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 Feb 2018 11:15:37 +0100
Subject: Re: [PATCH] watchdog: add SPDX identifiers for watchdog subsystem
References: <20180220093119.23720-1-marcus.folkesson@gmail.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <c7eae315-c8b8-3a4c-af1d-f7d713beb7c8@xilinx.com>
Date: Tue, 20 Feb 2018 11:14:46 +0100
MIME-Version: 1.0
In-Reply-To: <20180220093119.23720-1-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <michal.simek@xilinx.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Linus Walleij <linus.walleij@linaro.org>, Support Opensource <support.opensource@diasemi.com>, Baruch Siach <baruch@tkos.co.il>, William Breathitt Gray <vilhelm.gray@gmail.com>, Jimmy Vance <jimmy.vance@hpe.com>, Keguang Zhang <keguang.zhang@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Tomas Winkler <tomas.winkler@intel.com>, Johannes Thumshirn <morbidrsa@gmail.com>, Andreas Werner <andreas.werner@men.de>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Wan ZongShun <mcuos.com@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Zwane Mwaikambo <zwanem@gmail.com>, Jim Cromie <jim.cromie@gmail.com>, Barry Song <baohua@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Mans Rullgard <mans@mansr.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jun Nie <jun.nie@linaro.org>, Baoyou Xie <baoyou.xie@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, adi-buildroot-devel@lists.sourceforge.net, linux-mips@linux-mips.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Message-ID: <20180220101446.nFf3RAaBkyo1wT2ThMdXzQKN-TzaGs5utn0yFNoqERY@z>

On 20.2.2018 10:31, Marcus Folkesson wrote:
> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>   license
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> 
> Notes:
>     v1: Please have an extra look at meson_gxbb_wdt.c
> 
>  drivers/watchdog/cadence_wdt.c         |  5 +---
>  drivers/watchdog/of_xilinx_wdt.c       |  8 ++---


Acked-by: Michal Simek <michal.simek@xilinx.com> (For cadence_wdt and
of_xilinx_wdt)

Thanks,
Michal
