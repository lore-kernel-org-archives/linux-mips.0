Received: from smtprelay2.synopsys.com ([198.182.60.111]:58886 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27010604AbbHGFt3a82qG convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 7 Aug 2015 07:49:29 +0200
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RFC PATCH v4 4/9] arc: axs10x_defconfig: remove
 CONFIG_MMC_DW_IDMAC
Date: Fri, 7 Aug 2015 05:48:32 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075665B17BF@IN01WEMBXB.internal.synopsys.com>
References: <1438843469-23807-1-git-send-email-shawn.lin@rock-chips.com>
 <1438843526-23976-1-git-send-email-shawn.lin@rock-chips.com>
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
To: Shawn Lin <shawn.lin@rock-chips.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Cc: "heiko@sntech.de" <heiko@sntech.de>, "dianders@chromium.org" <dianders@chromium.org>, Wei Xu <xuwei5@hisilicon.com>, Joachim Eastwood <manabian@gmail.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Jun Nie <jun.nie@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Govindraj Raja <govindraj.raja@imgtec.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Message-ID: <20150807054832.8cOyKRwRvmGDoVLMLouccT1XdhT0P5FFMAOPnYDLbfU@z>

On Thursday 06 August 2015 12:19 PM, Shawn Lin wrote:
> DesignWare MMC Controller's transfer mode should be decided
> at runtime instead of compile-time. So we remove this config
> option and read dw_mmc's register to select DMA master.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Acked-by: Vineet Gupta <vgupta@synopsys.com>

Thx,
-Vineet
