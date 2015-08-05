Received: from smtprelay2.synopsys.com ([198.182.60.111]:41596 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011503AbbHEIf3ybchu convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 5 Aug 2015 10:35:29 +0200
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RFC PATCH v3 3/5] arm: configs: remove CONFIG_MMC_DW_IDMAC
Date: Wed, 5 Aug 2015 08:34:54 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075665B111F@IN01WEMBXB.internal.synopsys.com>
References: <1438762614-22154-1-git-send-email-shawn.lin@rock-chips.com>
 <1438762690-22286-1-git-send-email-shawn.lin@rock-chips.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Vineet.Gupta1@synopsys.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>
Cc: "dianders@chromium.org" <dianders@chromium.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Stefan Agner <stefan@agner.ch>, Zhou Wang <wangzhou.bry@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Wang Long <long.wanglong@huawei.com>, Rob Herring <robh+dt@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>, Lukasz Majewski <l.majewski@samsung.com>, Jun Nie <jun.nie@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Kevin Hao <haokexin@gmail.com>, Olof Johansson <olof@lixom.net>, Ray Jui <rjui@broadcom.com>, Govindraj Raja <govindraj.raja@imgtec.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Scott Branden <sbranden@broadcom.com>, Anand Moon <linux.amoon@gmail.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tushar Behera <trblinux@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Mischa Jonker <mjonker@synopsys.com>, Ralf Baechle <ralf@linux-mips.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Vincent Yang <vincent.yang.fujitsu@gmail.com>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Joachim Eastwood <manabian@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Weijun Yang <Weijun.Yang@csr.com>, Peter Griffin <peter.griffin@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, addy ke <addy.ke@rock-chips.com>, Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>, Jean Delvare <jdelvare@suse.de>, Kevin Hilman <khilman@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Zhangfei Gao <zhangfei.gao@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Andreas Faerber <afaerber@suse.de>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20150805083454.wNIYNUsr1MGgVbwXFl578ZH65wulM6Bjre8_Z5oPrcg@z>

On Wednesday 05 August 2015 01:52 PM, Shawn Lin wrote:
> DesignWare MMC Controller's transfer mode should be decided
> at runtime instead of compile-time. So we remove this config
> option, and elaborate more in Documentation(synopsys-dw-mshc).
>
> Modify these files:
> arch/arc/configs/axs101_defconfig
> arch/arc/configs/axs103_defconfig
> arch/arc/configs/axs103_smp_defconfig

While you remove the config option from ARC defconfigs, you fail to add the
corresponding DT glue in ARC files (like you did for ARM). The pointer to DT is
contained in corresponding defconfig. Please fix that .

-Vineet
