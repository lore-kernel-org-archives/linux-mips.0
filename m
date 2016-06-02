Received: from smtpout.microchip.com ([198.175.253.82]:17767 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27033582AbcFBE4vGLttY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Jun 2016 06:56:51 +0200
Subject: Re: [PATCH] clk: microchip: Remove CLK_IS_ROOT
References: <20160601215521.31309-1-sboyd@codeaurora.org>
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Message-ID: <574FBC18.8070608@microchip.com>
Date: Thu, 2 Jun 2016 10:24:48 +0530
MIME-Version: 1.0
In-Reply-To: <20160601215521.31309-1-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Purna.Mandal@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160602045448.01z_xHd3YXRKR_mpw_GrBYJBGRf_70KXs8dmQvmsPE0@z>

On 06/02/2016 03:25 AM, Stephen Boyd wrote:

> This flag is a no-op now (see commit 47b0eeb3dc8a "clk: Deprecate
> CLK_IS_ROOT", 2016-02-02) so remove it.
>
> Cc: Purna Chandra Mandal <purna.mandal@microchip.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: <linux-mips@linux-mips.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>
> I'm going to send this to Linus tomorrow or Friday so we can finally
> remove this flag entirely.
>
>  drivers/clk/microchip/clk-pic32mzda.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/microchip/clk-pic32mzda.c b/drivers/clk/microchip/clk-pic32mzda.c
> index 020a29acc5b0..51f54380474b 100644
> --- a/drivers/clk/microchip/clk-pic32mzda.c
> +++ b/drivers/clk/microchip/clk-pic32mzda.c
> @@ -180,15 +180,15 @@ static int pic32mzda_clk_probe(struct platform_device *pdev)
>  
>  	/* register fixed rate clocks */
>  	clks[POSCCLK] = clk_register_fixed_rate(&pdev->dev, "posc_clk", NULL,
> -						CLK_IS_ROOT, 24000000);
> +						0, 24000000);
>  	clks[FRCCLK] =  clk_register_fixed_rate(&pdev->dev, "frc_clk", NULL,
> -						CLK_IS_ROOT, 8000000);
> +						0, 8000000);
>  	clks[BFRCCLK] = clk_register_fixed_rate(&pdev->dev, "bfrc_clk", NULL,
> -						CLK_IS_ROOT, 8000000);
> +						0, 8000000);
>  	clks[LPRCCLK] = clk_register_fixed_rate(&pdev->dev, "lprc_clk", NULL,
> -						CLK_IS_ROOT, 32000);
> +						0, 32000);
>  	clks[UPLLCLK] = clk_register_fixed_rate(&pdev->dev, "usbphy_clk", NULL,
> -						CLK_IS_ROOT, 24000000);
> +						0, 24000000);
>  	/* fixed rate (optional) clock */
>  	if (of_find_property(np, "microchip,pic32mzda-sosc", NULL)) {
>  		pr_info("pic32-clk: dt requests SOSC.\n");

Tested-by: Purna Chandra Mandal <purna.mandal@microchip.com>
