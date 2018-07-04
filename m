Received: from mail-pl0-x242.google.com ([IPv6:2607:f8b0:400e:c01::242]:42898
        "EHLO mail-pl0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994657AbeGDRAuoxvrt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 4 Jul 2018 19:00:50 +0200
MIME-Version: 1.0
In-Reply-To: <20180703123214.23090-8-paul@crapouillou.net>
References: <20180703123214.23090-1-paul@crapouillou.net> <20180703123214.23090-8-paul@crapouillou.net>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Wed, 4 Jul 2018 22:30:43 +0530
Message-ID: <CANc+2y7BU5SmgP8yv46PQx2E1Bz1gb0dOQaM0wG=-iReCd8YyQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] dmaengine: dma-jz4780: Enable Fast DMA to the AIC
Content-Type: text/plain; charset="UTF-8"
Return-Path: <prasannatsmkumar@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20180704170043.7BaZC2EImqMEvzbQUJIl8JKvZnH8mxsHuYJfUgjqbW8@z>

On 3 July 2018 at 18:02, Paul Cercueil <paul@crapouillou.net> wrote:
> With the fast DMA bit set, the DMA will transfer twice as much data
> per clock period to the AIC, so there is little point not to set it.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/dma/dma-jz4780.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> index 922e4031e70e..7ee2c121948f 100644
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -52,6 +52,7 @@
>  #define JZ_DMA_DMAC_DMAE       BIT(0)
>  #define JZ_DMA_DMAC_AR         BIT(2)
>  #define JZ_DMA_DMAC_HLT                BIT(3)
> +#define JZ_DMA_DMAC_FAIC       BIT(27)
>  #define JZ_DMA_DMAC_FMSC       BIT(31)
>
>  #define JZ_DMA_DRT_AUTO                0x8
> @@ -929,8 +930,8 @@ static int jz4780_dma_probe(struct platform_device *pdev)
>          * Also set the FMSC bit - it increases MSC performance, so it makes
>          * little sense not to enable it.
>          */
> -       jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DMAC,
> -                         JZ_DMA_DMAC_DMAE | JZ_DMA_DMAC_FMSC);
> +       jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DMAC, JZ_DMA_DMAC_DMAE |
> +                              JZ_DMA_DMAC_FAIC | JZ_DMA_DMAC_FMSC);
>
>         if (jzdma->version == ID_JZ4780)
>                 jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DMACP, 0);
> --
> 2.18.0
>
>

Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>.
