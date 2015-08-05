Received: from lucky1.263xmail.com ([211.157.147.131]:36740 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011077AbbHEJghrwZd3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 5 Aug 2015 11:36:37 +0200
Subject: Re: [RFC PATCH v3 5/5] ARM: dts: add supports-idmac property
References: <1438762614-22154-1-git-send-email-shawn.lin@rock-chips.com>
 <1438762730-22368-1-git-send-email-shawn.lin@rock-chips.com>
 <1438764734.3504.9.camel@synopsys.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <55C1D69B.4060308@rock-chips.com>
Date: Wed, 5 Aug 2015 17:25:47 +0800
MIME-Version: 1.0
In-Reply-To: <1438764734.3504.9.camel@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-Path: <shawn.lin@rock-chips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: shawn.lin@rock-chips.com, "dianders@chromium.org" <dianders@chromium.org>, "wangzhou.bry@gmail.com" <wangzhou.bry@gmail.com>, "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "javier.martinez@collabora.co.uk" <javier.martinez@collabora.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "haokexin@gmail.com" <haokexin@gmail.com>, "stefan@agner.ch" <stefan@agner.ch>, "addy.ke@rock-chips.com" <addy.ke@rock-chips.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "olof@lixom.net" <olof@lixom.net>, "long.wanglong@huawei.com" <long.wanglong@huawei.com>, "peter.griffin@linaro.org" <peter.griffin@linaro.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mjonker@synopsys.com" <mjonker@synopsys.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "tgih.jun@samsung.com" <tgih.jun@samsung.com>, "govindraj.raja@imgtec.com" <govindraj.raja@imgtec.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "k.kozlowski@samsung.com" <k.kozlowski@samsung.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>, "trblinux@gmail.com" <trblinux@gmail.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, "swarren@nvidia.com" <swarren@nvidia.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arnd@arndb.de" <arnd@arndb.de>, "heiko@sntech.de" <heiko@sntech.de>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "vincent.yang.fujitsu@gmail.com" <vincent.yang.fujitsu@gmail.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "Weijun.Yang@csr.com" <Weijun.Yang@csr.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "khilman@linaro.org" <khilman@linaro.org>, "abrestic@chromium.org" <abrestic@chromium.org>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "l.majewski@samsung.com" <l.majewski@samsung.com>, "jdelvare@suse.de" <jdelvare@suse.de>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>, "kgene@kernel.org" <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "rjui@broadcom.com" <rjui@broadcom.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "linux.amoon@gmail.com" <linux.amoon@gmail.com>, "sbranden@broadcom.com" <sbranden@broadcom.com>, "sjoerd.simons@collabora.co.uk" <sjoerd.simons@collabora.co.uk>, "afaerber@suse.de" <afaerber@suse.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "jun.nie@linaro.org" <jun.nie@linaro.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "manabian@gmail.com" <manabian@gmail.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Message-ID: <20150805092547.vliK6SvMzvnLL4oaqNbSseQEA8M37rkZdVWSAuDLH7k@z>

在 2015/8/5 16:52, Alexey Brodkin 写道:
> Hi Shawn,
>
> On Wed, 2015-08-05 at 16:18 +0800, Shawn Lin wrote:
>> DesignWare MMC Controller's transfer mode should be decided
>> at runtime instead of compile-time. Add "supports-idmac" for
>> all platforms that use internal dma mode to enable this feature
>> at runtime.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> ---
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>   arch/arm/boot/dts/exynos3250-monk.dts              | 1 +
>>   arch/arm/boot/dts/exynos3250-rinato.dts            | 1 +
>>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi    | 1 +
>>   arch/arm/boot/dts/exynos4412-origen.dts            | 1 +
>>   arch/arm/boot/dts/exynos4412-trats2.dts            | 1 +
>>   arch/arm/boot/dts/exynos4x12.dtsi                  | 1 +
>>   arch/arm/boot/dts/exynos5250-arndale.dts           | 2 ++
>>   arch/arm/boot/dts/exynos5250-smdk5250.dts          | 2 ++
>>   arch/arm/boot/dts/exynos5250-snow.dts              | 3 +++
>>   arch/arm/boot/dts/exynos5250-spring.dts            | 2 ++
>>   arch/arm/boot/dts/exynos5260-xyref5260.dts         | 2 ++
>>   arch/arm/boot/dts/exynos5410-smdk5410.dts          | 2 ++
>>   arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 2 ++
>>   arch/arm/boot/dts/exynos5420-peach-pit.dts         | 3 +++
>>   arch/arm/boot/dts/exynos5420-smdk5420.dts          | 2 ++
>>   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 2 ++
>>   arch/arm/boot/dts/exynos5800-peach-pi.dts          | 3 +++
>>   arch/arm/boot/dts/hisi-x5hd2.dtsi                  | 2 ++
>>   arch/arm/boot/dts/rk3288-evb.dtsi                  | 2 ++
>>   arch/arm/boot/dts/rk3288-firefly.dtsi              | 3 +++
>>   arch/arm/boot/dts/rk3288-popmetal.dts              | 2 ++
>>   arch/arm64/boot/dts/exynos/exynos7-espresso.dts    | 2 ++
>>   22 files changed, 42 insertions(+)
> I'm wondering if you're going to care about other platforms
> that use DW MMC?
>
> Just grep for "snps,dw-mshc", "altr,socfpga-dw-mshc",
> "img,pistachio-dw-mshc" and you'll see more dt* files to
> be updated.
   Thanks,  Alexey.
   Yes,  I missed some ARC dt*  files just as Vineet told me. It will be 
fixed in v4.
   Btw, I cannot find "img,pistachio-dw-mshc" in 4.2.0-rc3. And no more 
"dw-mshc" or "dwmmc"
   is found.

> -Alexey
>
>


-- 
Shawn Lin
