Received: from mail-am1on0076.outbound.protection.outlook.com ([157.56.112.76]:43552
        "EHLO emea01-am1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27043322AbcFUGqGGdfUh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Jun 2016 08:46:06 +0200
From: Noam Camus <noamca@mellanox.com>
Subject: RE: [PATCH V2 63/63] clocksources: Switch back to the clksrc table
Date: Tue, 21 Jun 2016 06:45:58 +0000
Message-ID: <HE1PR05MB162581196C0157F45749344FAA2B0@HE1PR05MB1625.eurprd05.prod.outlook.com>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org>
 <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
In-Reply-To: <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <noamca@mellanox.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Michal Simek <monstr@monstr.eu>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, Ley Foon Tan <lftan@altera.com>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, S?ren Brinkmann <soren.brinkmann@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Alexander Shiyan <shc_work@mail.ru>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Uwe Kleine-K?nig <kernel@pengutronix.de>, Joachim Eastwood <manabian@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Barry Song <baohua@kernel.org>, Baruch Siach <baruch@tkos.co.il>, Santosh Shilimkar <ssantosh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Tony Prisk <linux@prisktech.co.nz>, Arnd Bergmann <arnd@arndb.de>, John Stultz <john.stultz@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Adam Buchbinder <adam.buchbinder@gmail.com>, Tony Lindgren <tony@atomide.com>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@ti.com>, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Hanjun Guo <hanjun.guo@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <Marc.Zyngier@arm.com>, "open list:SYNOPSYS ARC ARCH..." <linux-snps-arc@lists.infradead.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, "open list:RALINK MIPS ARCHI..." <linux-mips@linux-mips.org>, "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, "moderated list:BROADCOM BCM2835..." <linux-rpi-kernel@lists.infradead.org>, "open list:BROADCOM BCM281XX..." <bcm-kernel-feedback-list@broadcom.com>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "open list:TEGRA ARCHITECTUR..." <linux-tegra@vger.kernel.org>, "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>
Message-ID: <20160621064558.ktCqMphPjGyokP5_PX0eCavSzOGc1uPGwfU16ldZ5zs@z>

>From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org] 
>Sent: Friday, June 17, 2016 12:27 AM

>All the clocksource drivers's init function are now converted to return an error code. CLOCKSOURCE_OF_DECLARE is no longer used as well as the clksrc-of table.

>Let's convert back the names:
> - CLOCKSOURCE_OF_DECLARE_RET => CLOCKSOURCE_OF_DECLARE
> - clksrc-of-ret              => clksrc-of

> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
> arch/arc/kernel/time.c                    |  6 +++---
> arch/arm/kernel/smp_twd.c                 |  6 +++---
> arch/microblaze/kernel/timer.c            |  2 +-
> arch/mips/ralink/cevt-rt3352.c            |  2 +-
> arch/nios2/kernel/time.c                  |  2 +-
> drivers/clocksource/arm_arch_timer.c      |  6 +++---
> drivers/clocksource/arm_global_timer.c    |  2 +-
> drivers/clocksource/armv7m_systick.c      |  2 +-
> drivers/clocksource/asm9260_timer.c       |  2 +-
> drivers/clocksource/bcm2835_timer.c       |  2 +-
> drivers/clocksource/bcm_kona_timer.c      |  4 ++--
> drivers/clocksource/cadence_ttc_timer.c   |  2 +-
> drivers/clocksource/clksrc-dbx500-prcmu.c |  2 +-
> drivers/clocksource/clksrc-probe.c        | 14 --------------
> drivers/clocksource/clksrc_st_lpc.c       |  2 +-
> drivers/clocksource/clps711x-timer.c      |  2 +-
> drivers/clocksource/dw_apb_timer_of.c     |  8 ++++----
> drivers/clocksource/exynos_mct.c          |  4 ++--
> drivers/clocksource/fsl_ftm_timer.c       |  2 +-
> drivers/clocksource/h8300_timer16.c       |  2 +-
> drivers/clocksource/h8300_timer8.c        |  2 +-
> drivers/clocksource/h8300_tpu.c           |  2 +-
> drivers/clocksource/meson6_timer.c        |  2 +-
> drivers/clocksource/mips-gic-timer.c      |  2 +-
> drivers/clocksource/moxart_timer.c        |  2 +-
> drivers/clocksource/mps2-timer.c          |  2 +-
> drivers/clocksource/mtk_timer.c           |  2 +-
> drivers/clocksource/mxs_timer.c           |  2 +-
> drivers/clocksource/nomadik-mtu.c         |  2 +-
> drivers/clocksource/pxa_timer.c           |  2 +-
> drivers/clocksource/qcom-timer.c          |  4 ++--
> drivers/clocksource/rockchip_timer.c      |  8 ++++----
> drivers/clocksource/samsung_pwm_timer.c   |  8 ++++----
> drivers/clocksource/sun4i_timer.c         |  2 +-
> drivers/clocksource/tango_xtal.c          |  2 +-
> drivers/clocksource/tegra20_timer.c       |  4 ++--
> drivers/clocksource/time-armada-370-xp.c  |  6 +++---
> drivers/clocksource/time-efm32.c          |  4 ++--
> drivers/clocksource/time-lpc32xx.c        |  2 +-
> drivers/clocksource/time-orion.c          |  2 +-
> drivers/clocksource/time-pistachio.c      |  2 +-
> drivers/clocksource/timer-atlas7.c        |  2 +-
> drivers/clocksource/timer-atmel-pit.c     |  2 +-
> drivers/clocksource/timer-atmel-st.c      |  2 +-
> drivers/clocksource/timer-digicolor.c     |  2 +-
> drivers/clocksource/timer-imx-gpt.c       | 24 ++++++++++++------------
> drivers/clocksource/timer-integrator-ap.c |  2 +-
> drivers/clocksource/timer-keystone.c      |  2 +-
> drivers/clocksource/timer-nps.c           |  4 ++--
> drivers/clocksource/timer-oxnas-rps.c     |  4 ++--
> drivers/clocksource/timer-prima2.c        |  2 +-
> drivers/clocksource/timer-sp804.c         |  4 ++--
> drivers/clocksource/timer-stm32.c         |  2 +-
> drivers/clocksource/timer-sun5i.c         |  4 ++--
> drivers/clocksource/timer-ti-32k.c        |  2 +-
> drivers/clocksource/timer-u300.c          |  2 +-
> drivers/clocksource/versatile.c           |  4 ++--
> drivers/clocksource/vf_pit_timer.c        |  2 +-
> drivers/clocksource/vt8500_timer.c        |  2 +-
> drivers/clocksource/zevio-timer.c         |  2 +-
> include/asm-generic/vmlinux.lds.h         |  2 --
> include/linux/clocksource.h               |  5 +----
> 62 files changed, 98 insertions(+), 117 deletions(-)

[..]

> diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c index b5c7b2b..70c149a 100644
> --- a/drivers/clocksource/timer-nps.c
> +++ b/drivers/clocksource/timer-nps.c
> @@ -96,5 +96,5 @@ static int __init nps_timer_init(struct device_node *node)
> 	return nps_setup_clocksource(node, clk);  }
 
> -CLOCKSOURCE_OF_DECLARE_RET(ezchip_nps400_clksrc, "ezchip,nps400-timer",
> -			   nps_timer_init);
> +CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
> +		       nps_timer_init);
> diff --git a/drivers/clocksource/timer-oxnas-rps.c b/drivers/clocksource/timer-oxnas-rps.c
> index 0d99f40..bd887e2 100644
> --- a/drivers/clocksource/timer-oxnas-rps.c
> +++ b/drivers/clocksource/timer-oxnas-rps.c
> @@ -293,5 +293,5 @@ err_alloc:
>  	return ret;
> }
 

Acked-by: Noam Camus <noamca@mellanox.com>
