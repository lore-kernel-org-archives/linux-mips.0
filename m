Received: from bear.ext.ti.com ([192.94.94.41]:45561 "EHLO bear.ext.ti.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27027022AbcDSMbtsKZ89 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 19 Apr 2016 14:31:49 +0200
Subject: Re: [PATCH v5 39/50] mtd: nand: omap2: switch to mtd_ooblayout_ops
References: <1459354505-32551-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459354505-32551-40-git-send-email-boris.brezillon@free-electrons.com>
 <5714F011.5080409@ti.com> <20160418170518.363f732d@bbrezillon>
 <57160862.90603@ti.com> <20160419132206.5d909f7e@bbrezillon>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <571624EF.9060707@ti.com>
Date: Tue, 19 Apr 2016 15:30:39 +0300
MIME-Version: 1.0
In-Reply-To: <20160419132206.5d909f7e@bbrezillon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <rogerq@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, linux-mips@linux-mips.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Harvey Hunt <harvey.hunt@imgtec.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Stefan Agner <stefan@agner.ch>, linux-sunxi@googlegroups.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, punnaiah choudary kalluri <punnaia@xilinx.com>, Robert Jarzmik <robert.jarzmik@free.fr>, devel@driverdev.osuosl.org, Archit Taneja <architt@codeaurora.org>, linux-samsung-soc@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Huang Shijie <shijie.huang@arm.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Han Xu <b45815@freescale.com>, linux-arm-kernel@lists.infradead.org, Priit Laes <plaes@plaes.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Wenyou Yang <wenyou.yang@atmel.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-api@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Daniel Mack <daniel@zonque.org>
Message-ID: <20160419123039.9mlpSli6QvQDK28RVrBlrL9PjjgVlDlqiJzFK444SPA@z>

On 19/04/16 14:22, Boris Brezillon wrote:
> Hi Roger,
> 
> On Tue, 19 Apr 2016 13:28:50 +0300
> Roger Quadros <rogerq@ti.com> wrote:
> 
>>> @@ -1921,6 +1927,9 @@ static int omap_nand_probe(struct platform_device *pdev)
>>>  		nand_chip->ecc.correct          = omap_correct_data;
>>>  		mtd_set_ooblayout(mtd, &omap_ooblayout_ops);
>>>  		oobbytes_per_step		= nand_chip->ecc.bytes;
>>> +
>>> +		if (nand_chip->options & NAND_BUSWIDTH_16)
>>> +			min_oobbytes		= 1;
>>
>> Shouldn't this have been
>> 		if (!(nand_chip->options & NAND_BUSWIDTH_16)
>> 			min_oobbytes		= 1;
>> ?
> 
> Yep.
> 
>>
>>>  		break;
>>>  
>>>  	case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
>>> @@ -2038,10 +2047,8 @@ static int omap_nand_probe(struct platform_device *pdev)
>>>  	}
>>>  
>>>  	/* check if NAND device's OOB is enough to store ECC signatures */
>>> -	min_oobbytes = (oobbytes_per_step *
>>> -			(mtd->writesize / nand_chip->ecc.size)) +
>>> -		       (nand_chip->options & NAND_BUSWIDTH_16 ?
>>> -			BADBLOCK_MARKER_LENGTH : 1);
>>> +	min_oobbytes += (oobbytes_per_step *
>>> +			 (mtd->writesize / nand_chip->ecc.size));
>>>  	if (mtd->oobsize < min_oobbytes) {
>>>  		dev_err(&info->pdev->dev,
>>>  			"not enough OOB bytes required = %d, available=%d\n",
>>>
>>
>> After the above changes BCH with HW ECC worked fine but BCH with SW ECC still failed.
>> I had to fix it up with the below patch. This is mainly because chip->ecc.steps wasn't
>> yet initialized before calling nand_bch_init().
>>
>> After the below patch it worked fine with bch4 (hw & sw), bch8 (hw & sw) and ham1.
>> I couldn't yet verify bch16 though.
> 

I just verified that bch16 works as well.

> Thanks for the fix, but I'd prefer fixing the bug for all soft BCH
> users.
> 
> Could you try this patch?

I tried your patch and it worked fine.
You will still need the below change to omap2.c

--
cheers,
-roger

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 0abfba6..33c8fde 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1715,7 +1715,7 @@ static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	int off = BADBLOCK_MARKER_LENGTH;
 
-	if (section)
+	if (section >= chip->ecc.steps)
 		return -ERANGE;
 
 	/*
-- 
2.5.0
