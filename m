Received: from mailapp01.imgtec.com ([195.59.15.196]:4653 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011498AbbHFJGAIx14m convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 11:06:00 +0200
From: Govindraj Raja <Govindraj.Raja@imgtec.com>
Subject: RE: [RFC PATCH v4 3/9] mips: pistachio_defconfig: remove
 CONFIG_MMC_DW_IDMAC
Date: Thu, 6 Aug 2015 09:05:52 +0000
Message-ID: <4BF5E8683E87FC4DA89822A5A3EB60CB6F2001@hhmail02.hh.imgtec.org>
References: <1438843469-23807-1-git-send-email-shawn.lin@rock-chips.com>
 <1438843515-23935-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1438843515-23935-1-git-send-email-shawn.lin@rock-chips.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Govindraj.Raja@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Shawn Lin <shawn.lin@rock-chips.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Cc: "heiko@sntech.de" <heiko@sntech.de>, "dianders@chromium.org" <dianders@chromium.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, Wei Xu <xuwei5@hisilicon.com>, Joachim Eastwood <manabian@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Jun Nie <jun.nie@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Message-ID: <20150806090552.PL0fUKfjHRNv8pnWwi1sHwyqLjxle-gmPrluZIFMwhY@z>



> -----Original Message-----
> From: Shawn Lin [mailto:shawn.lin@rock-chips.com]
> Sent: 06 August 2015 07:45 AM
> To: jh80.chung@samsung.com; ulf.hansson@linaro.org
> Cc: heiko@sntech.de; dianders@chromium.org; Vineet.Gupta1@synopsys.com;
> Wei Xu; Joachim Eastwood; Alexey Brodkin; Kukjin Kim; Krzysztof Kozlowski;
> Russell King; Jun Nie; Ralf Baechle; Govindraj Raja; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> mips@linux-mips.org; linux-mmc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-rockchip@lists.infradead.org;
> devicetree@vger.kernel.org; Shawn Lin
> Subject: [RFC PATCH v4 3/9] mips: pistachio_defconfig: remove
> CONFIG_MMC_DW_IDMAC
> 
> DesignWare MMC Controller's transfer mode should be decided at runtime
> instead of compile-time. So we remove this config option and read dw_mmc's
> register to select DMA master.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  arch/mips/configs/pistachio_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Govindraj Raja <govindraj.raja@imgtec.com>

--
Thanks,
Govindraj.R
