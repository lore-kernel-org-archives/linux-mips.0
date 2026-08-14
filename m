Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1F0334692;
	Fri, 14 Aug 2026 19:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736005; cv=fail; b=vBwkoU4CiGGgtqmWDgLLZjI3/Ar4AN1lnL/VnylDdx6M64L0wVTUgrTKOzS80qados31GL4OpYGla25gvo34O4OV0/OIHkmm9wVuDZu1wEFKwICnrURzWN1qEb1vJf3jQQlDeIMgQiEpl33qOIdTE57XpWHK6uEDpQpK7tQFsBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736005; c=relaxed/simple;
	bh=WnkUg/cvriBSQMgxpS/+8PWbh8YHi06rkRwnQXp0rRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=upYebKt4k726WmXQ8MpRjX/cTTPmccvesOUS+Qezcka3uppd1EH7uwJaK+YJMnL1+bLg0d4OguwCWPlcK51Kvfz5hBT1D1I0AWgtJZrRiAEia5wRzZK5MLzJaDO4uIbGjiGOeD3DsRir7dU2P9yZmvVFaBk2PLXsmDdjIcL+08g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vpPjAuoL; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vpPjAuoL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rN4wUrwAQM5ax0QUtenxFmM4coMym/GdQCI/e7FJGH78YcDRnkm9iRS4lwHkSlw1hjMh8B0S/MJhCv5O35sxRp3rM32WaPLymrAFZfqdsd9NYjcMPEzmDQZKTXYmYLYESGaV6T6P4ROiWxF6GY6f9PSa2lHXrR964NC+v2jDUX+NTRArNp8xIj51wRYAg7jIxk7faU+LGvs+7V2oBiDcfy52iLvzjNes4Z9QM8ed760nX1iJhBCV8Q4tH5gZnWo+UKEJ8Nr0HIMi2vpqJlOtz4AQHvGNIpoaZJuAio2jTUP8/UU9rDT0JoLDKYqjfwA09cu/iLvOlY/4swWI7LD6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGW0iY5Ndd0IwRLipvruarHLnyTFNYiMb7huRuJoG2o=;
 b=Hw+j2srNovTdyGbVpClOBwG9URQauN/DlJU/wkTD7MkSEX5CjpKO+AMoHPWJnpLMsFajK0vvVkDKsnm4FYhxds4w1j353N6wkzAW6lPmLcKqOBPc981F8/eDdPHygA6jqGICyHhlAMSmtYfQ2oh4Jyp5tmH3YL59QfDMk+8DFsZU11w0AxLY6ELtBiKUsUORaBbkAzje2DeVcWxJkkuSAFdStQL2eO/ybIUZ5e7jf+g0kzXCqfSsZciWPsFv0DhD9vgoGzqs4GWiY5NN2uKSOYFbzKM9DGVidLkxkWrUYF0yJitjR7IqDU/wU6iPq3M01p6SXsN2/k2yJ0AR5hceOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGW0iY5Ndd0IwRLipvruarHLnyTFNYiMb7huRuJoG2o=;
 b=vpPjAuoLIowckuGqOOuYTPywOvB+b/mkLRn5dlcDfnyB+FRm/gXbR8km4v8+HrhTqbvPAttpdHTNMLX17ZwpMaIjbfd3O42vvRFJS9/VPPjYzCbs+fyo2D78c/91Lvjox7/U67kFlqPQnysCg1rJOm9T3zdcrZgd9dLtYdypxvFIUQI2YJAlLpZP5eXlkR7Q8MhUSfiHAvx0Z9uAY59JIiU9eD1feBqAKLEOmycnKMwW3BNW1w22cHfzW2X0LOlQolJBqYwPxUTNIU+UcKPPQcbrbcAv8nn+l8Qc2nHQn6koSTTA/8QQGh+QaHnKzkjUMywoOGw9dVfhxEePUi6Wcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8786.eurprd04.prod.outlook.com (2603:10a6:20b:42d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 19:33:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 19:33:20 +0000
Date: Fri, 14 Aug 2026 15:33:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
Message-ID: <an9teadkgwUsmMnQ@lizhi-Precision-Tower-5810>
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
X-ClientProxiedBy: SA0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:806:130::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: f7588a00-97f6-4f74-b363-08defa3ae598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|10067099003|56012099006|4143699003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C8Kk+YmaOBs8GYVopXCyIIPS4CkTKj27gXOtu88xyTvGMAAMDgvs6yZl1/04Wo5WOIl69rpKgGzz9eRfxxTZCK0E1ebd/hrA9esANqnCA7cxh5kOkiwx9qKFzuekz0flyzvbEby3eFI5EWQGWGJyE63mXzwL5mbJXTn1ojupD8BUVSUIaO5vSCLMp5IxDRjIE4k6Pvn5XFg7qKXBkFUeSyvj91WeCF2fyiCXedQG7nK4aY49ktWPVFKlWiJ7T3ZRhrjpekble6AtmCYIGRJQt3TMna/oKP1Ilwg2rtpK8Wyh9sPyPiIkC1zLgsnKVSKaK+9k7y/TeZrNjHaFFGM6FlGxA6Ub87CGz128aORMszn92VkS/LVrIMLlkWuD763fnGzx3dG7mK/h4SqG67sqdDoynPDoYP9p9L5EKoGAIrmy2qPTFx0WDICUpwy+iY5tTHSswxchBprptfgs29MI2aE0gTfGuNdIo5WPH74OKCA4itAF47yX9trQumPPJt1D3KanSgthGqQYe9ORyNGObBBP9Q6p1ibU4pWAWK1Af5w1CW95qhr94wgf7cU+eKDiq3a5R3uaYnD67XyvegqfCDzgAjmbyCAza+qeDs+pAj0Di8HqoCxMq8qZDAoYYAGryBA4Rp+PD4HlZeoW6ZVW5D+EO03qN/w5tnuNLvOoarY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fl24qQejKW2wAz6cpKCuoIIhhQ3sAvPk6eVuuX76AA9UfIyP6yQFDOjiqu4D?=
 =?us-ascii?Q?iLmi31GDCnBTcSAYqgCHHAyGRXgUtdtzM5mupQy5bMECUX1hdLM6AlDO9ian?=
 =?us-ascii?Q?a9c8jf+qLyLsKnjcWsz0X+O+TNiA+cUNDkNqio0H/FYVSnBZYMMl3W0czpf7?=
 =?us-ascii?Q?va8sbcD2y5HePgnmC/qplqev2XRdRNlw+K8l4iewzk38v4o4ltfmZFmmjnfw?=
 =?us-ascii?Q?9d5PejPQT+/GgS6zIbdXByc8W0+lTL6UcjJ5IGOmYbBQf2lAYnkufcPHuO80?=
 =?us-ascii?Q?i8a+DVGAu15RHXYv6jA7Zt9f5eWBW62DICPGNSTL/8tN5rwPdzJkS844lRCo?=
 =?us-ascii?Q?tugNvX2EtjaidNomvrVUxorWdz+7rLHa9gEeYjBfjBFBlk0OQJKITHcFIbeT?=
 =?us-ascii?Q?72isG99SNmTsL0SsLwveWWN7OXut/j0wJ/M1MMTELHZnSm1EE8FMz0SNhdlS?=
 =?us-ascii?Q?7+QQwbKORy2XxLY5AZmMLcw9rhajTQXbCWpYvqYPUxMndN5APNRo5OIm1cQv?=
 =?us-ascii?Q?LyR2NKKR4gnCEQmycSFrsA+ci2F+GZhJm5rJrwB8YZ9/aBpIQMSKYYquO66u?=
 =?us-ascii?Q?28fUuQvCfBQyd2UCxjynv52bxMnV0OiUZS3IeF+mzILjlU1yzdasgfscZR9z?=
 =?us-ascii?Q?0T9ZruswunQtbh28BZoBKWybhmEWqTPa903RpfIsO6bAmNEQ93QpFPWGFCKl?=
 =?us-ascii?Q?2yfVTZvHo/dHCbdh4ssB7OI11Q4AH6vCtVS/OhU69ZteICJ8NDaAmK0i6SRx?=
 =?us-ascii?Q?JDCBBBtfx/MuKK2Vy0PocZAu7Ay39rtDWbfZgYHqKPqP+T2Ff2LJtdy7knHH?=
 =?us-ascii?Q?iUiTNABsJibfmbulU3/bb6tlS3ZXdB6Yac7S0HGfVuW0k+gpYzpwcL4KLsQx?=
 =?us-ascii?Q?7xjtsanaX6/yBk1l7uG4YPQTsMDjKbq9YtXVhCZEm37+DgGe2dvjoz+PYrOS?=
 =?us-ascii?Q?vSDq0hh0lFAhJLkEY1dqN9U5ImXmcuCU07PLLJyClJDE/lU7Tm4YuZnbsnQs?=
 =?us-ascii?Q?fTuFAEFDT2wiIibAl3vs8Pi3JOJ4aQ57cCJ2wxsnoye6Z4iJCvDub+dm++Y8?=
 =?us-ascii?Q?U9NfL9E6zmPo4i/6+eGEE/4NSbDVIdhFa8c7vbF9xvIbj+E/WKiwJzrdYPVi?=
 =?us-ascii?Q?jOYaJhWMrChC4pNqNKnRJxeXXRf0/ZyVIa836HMlD8ExnRt5+IjyJquBDjWH?=
 =?us-ascii?Q?D24tdP4p8ut2fD3Xz6yEwagWzAAMRNVlwnLC9DRZzoIperbWDR2xvNM1MfpJ?=
 =?us-ascii?Q?yJYBmEAtE6VD0TjA/H6xWnsCq5ddAO05wCqFivNcAzjlrDeN0EQqgHG8x0qk?=
 =?us-ascii?Q?PVbllq4prFLmO5Xs+4jTOhAckR/IMTTSZ9ywNb9kfNWfZhmjNkDtz49APTYw?=
 =?us-ascii?Q?5e+pptcibgZyFBAfdV09jkf0Lu18jEGC4EH3xaKBz8SX3DQl71yqXce9UJVQ?=
 =?us-ascii?Q?87HfBy+VMZ+gz04Cl0YT2/ToX7W2FM7wA67zh1ogyEIisPYP0n8im+Rc3R6V?=
 =?us-ascii?Q?51+OO7b9MpOWYl0x0GA9SD5oJBReGKiZjHzLTUN8lyQGcIsI8TQVaBz7CXLl?=
 =?us-ascii?Q?QoE5UcqhPc4y5IjnuE9gCJG1ifqOKOpKmmYGtZYwKqyzV0jNTnQd5LtEyW7E?=
 =?us-ascii?Q?xIs+zcVO0H4vl1xJkd/+3bA1kG3mAWhyHYmDH7/u+y9Myr4B4/KRJyg1h9oe?=
 =?us-ascii?Q?koPE8kicpQxQJeeHc8AscmwfySRqudQmZOmU7bjaIivycB47WwIZl8psbBVE?=
 =?us-ascii?Q?xGfmSk1/5XUpDj0RqO+zkHEQqZDDWo8gP3ywn1RBGUQQPmBqcYQd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7588a00-97f6-4f74-b363-08defa3ae598
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 19:33:20.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLThS6rkONxxTm/7ByKnkqDsaQhqAQN73BFqLMdUTZRxUpuxurqvwXdUfijb1vflhT7JQ30rxJiGD1nqx3GgHodusf65xAHlMUnqoMmls4WgmzXZ3x4BM3hKiLkg+bOj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8786

On Wed, Jul 29, 2026 at 02:32:47PM +0000, Mahad Ibrahim wrote:
> ls1x_dma_tx_status() locates the descriptor actively being processed by
> walking the LLI list and comparing the hardware reported next descriptor
> pointer against each element's next-descriptor pointer.
>
> A list_for_each_entry macro is used in the comparison phase. Which at
> the end of the loop leaves the lli pointer at the currently executing LLI.
> However this also subsequently runs for a non-match lli, in which it
> points at the head. This causes a type confusion bug which treats the
> head, which is a ls1x_dma_desc, as a ls1x_dma_lli object. Additionally it
> goes forwards and prints garbage via the dev_dbg.
>
> Fix the type confusion bug by only allowing matched LLI descriptor chains
> to print the current LLI and residue calculation, as failing to match
> should be treated as an unexpected condition.
>
> Found by the following Coccinelle check:
>
>   scripts/coccinelle/iterators/use_after_iter.cocci
>
>   drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
>   reference to the index variable of the iterator on line 450
>
> I did not see a bug upstream detailing this error, nor do I have the
> hardware to confirm this bug or error, all this is from a pure code
> examination.
>
> As I do not possess the hardware, I cannot test the patch. Compile tested
> only with mips64-linux-gnu-gcc.

Avoid post new patch on old email thread.

Just simple said

Compile test only.

>
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
> ---
>
> v2:
> - encapsulate residue calculation and dev_dbg inside the
>   list_for_each_entry() macro. Treat non-matching LLI as an unexpected
>   case.
>
>
>  drivers/dma/loongson/loongson1-apb-dma.c | 27 ++++++++++++++----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
> index 89786cbd20ab..8658d5377795 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -446,22 +446,27 @@ static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
>
>  			/* locate the current lli */
>  			next_phys = chan->curr_lli->hw[LS1X_DMADESC_NEXT];
> -			list_for_each_entry(lli, &desc->lli_list, node)
> -				if (lli->hw[LS1X_DMADESC_NEXT] == next_phys)
> -					break;
> +			list_for_each_entry(lli, &desc->lli_list, node) {
> +				if (lli->hw[LS1X_DMADESC_NEXT] != next_phys)
> +					continue;
>
> -			dev_dbg(chan2dev(dchan), "current lli_phys=%pad",
> -				&lli->phys);
> +				dev_dbg(chan2dev(dchan), "current lli_phys=%pad\n",
> +					&lli->phys);
>
> -			/* count the residues */
> -			list_for_each_entry_from(lli, &desc->lli_list, node)
> -				bytes += lli->hw[LS1X_DMADESC_LENGTH] *
> -					 chan->bus_width;
> +				/* count the residues */
> +				list_for_each_entry_from(lli, &desc->lli_list, node)
> +					bytes += lli->hw[LS1X_DMADESC_LENGTH] *
> +						 chan->bus_width;
> +
> +				dma_set_residue(state, bytes);
> +				return status;
> +			}
> +
> +			dev_warn(chan2dev(dchan),
> +				 "unable to locate current lli.\n");

most likely logic is correct, it is not obvious, hope some one who have
hardware help test it.

Binbin Zhou just add add this driver recently, he should have hardware to
test it.

Frank
>  		}
>  	}
>
> -	dma_set_residue(state, bytes);
> -
>  	return status;
>  }
>
> --
> 2.54.0
>
