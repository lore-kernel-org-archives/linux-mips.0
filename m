Received: from mailapp01.imgtec.com ([195.59.15.196]:16381 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006859AbbLHKbChsrKp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Dec 2015 11:31:02 +0100
Subject: Re: [PATCH 05/23] mtd: nand: jz4770: kill the ->ecc_layout field
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449527178-5930-6-git-send-email-boris.brezillon@free-electrons.com>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <5666B150.2030406@imgtec.com>
Date: Tue, 8 Dec 2015 10:30:40 +0000
MIME-Version: 1.0
In-Reply-To: <1449527178-5930-6-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Josh Wu <josh.wu@atmel.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, punnaiah choudary kalluri <punnaia@xilinx.com>
Message-ID: <20151208103040.db34MpuWv-TllDa9r-Sn-z0DgDUkll9lh-s771-w6ss@z>

Hi Boris,

On 07/12/15 22:26, Boris Brezillon wrote:
> ->ecc_layout is not used by any board file. Kill this field to avoid any
> confusion. New boards are encouraged to use the default ECC layout defined
> in NAND core.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>   arch/mips/include/asm/mach-jz4740/jz4740_nand.h | 2 --
>   drivers/mtd/nand/jz4740_nand.c                  | 3 ---
>   2 files changed, 5 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-jz4740/jz4740_nand.h b/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
> index 79cff26..398733e 100644
> --- a/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
> +++ b/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
> @@ -25,8 +25,6 @@ struct jz_nand_platform_data {
>   	int			num_partitions;
>   	struct mtd_partition	*partitions;
>
> -	struct nand_ecclayout	*ecc_layout;
> -
>   	unsigned char banks[JZ_NAND_NUM_BANKS];
>
>   	void (*ident_callback)(struct platform_device *, struct nand_chip *,
> diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
> index 5a99a93..c4fe446 100644
> --- a/drivers/mtd/nand/jz4740_nand.c
> +++ b/drivers/mtd/nand/jz4740_nand.c
> @@ -446,9 +446,6 @@ static int jz_nand_probe(struct platform_device *pdev)
>   	chip->ecc.bytes		= 9;
>   	chip->ecc.strength	= 4;
>
> -	if (pdata)
> -		chip->ecc.layout = pdata->ecc_layout;
> -
>   	chip->chip_delay = 50;
>   	chip->cmd_ctrl = jz_nand_cmd_ctrl;
>   	chip->select_chip = jz_nand_select_chip;
>

Is there a typo in this commit title? The JZ4740 and JZ4770 have quite 
different NAND controller interfaces, so I don't think that the JZ4740 
driver will support the JZ4770.

Thanks,

Harvey
