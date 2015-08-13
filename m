Received: from szxga02-in.huawei.com ([119.145.14.65]:60015 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010918AbbHMKaCe3RZg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 13 Aug 2015 12:30:02 +0200
Message-ID: <55CC6EE2.4070308@hisilicon.com>
Date: Thu, 13 Aug 2015 11:18:10 +0100
From: Wei Xu <xuwei5@hisilicon.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v4 6/9] arm: hisi_defconfig: remove CONFIG_MMC_DW_IDMAC
References: <1438843469-23807-1-git-send-email-shawn.lin@rock-chips.com> <1438843553-24058-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1438843553-24058-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <xuwei5@hisilicon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Shawn Lin <shawn.lin@rock-chips.com>, jh80.chung@samsung.com, ulf.hansson@linaro.org
Cc: heiko@sntech.de, dianders@chromium.org, Vineet.Gupta1@synopsys.com, Joachim Eastwood <manabian@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Jun Nie <jun.nie@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Govindraj Raja <govindraj.raja@imgtec.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mips@linux-mips.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Yanhaifeng <yanhaifeng@hisilicon.com>, Linuxarm <linuxarm@huawei.com>
Message-ID: <20150813101810.Z-Bvg4L1LXPKWVrcKJNbAksD8FR1Xe2J4_IYUPq4X8k@z>



On 8/6/2015 7:45 AM, Shawn Lin wrote:
> DesignWare MMC Controller's transfer mode should be decided
> at runtime instead of compile-time. So we remove this config
> option and read dw_mmc's register to select DMA master.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Acked-by: Wei Xu <xuwei5@hisilicon.com>

> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/configs/hisi_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
> index 5997dbc..b2e340b 100644
> --- a/arch/arm/configs/hisi_defconfig
> +++ b/arch/arm/configs/hisi_defconfig
> @@ -69,7 +69,6 @@ CONFIG_NOP_USB_XCEIV=y
>  CONFIG_MMC=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_MMC_DW=y
> -CONFIG_MMC_DW_IDMAC=y
>  CONFIG_MMC_DW_PLTFM=y
>  CONFIG_RTC_DRV_PL031=y
>  CONFIG_DMADEVICES=y
> 

Thanks!

Best Regards,
Wei
