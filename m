Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794517438;
	b=Kyw4N2PTRf67CU/C7cJDPuUhjJ6qzPrqQbaqEQq1fFeCsOWQrGvNYKf6j3l2fNgCLAWR
	 DV28CSwgKPWbVtcAc5yuZ3sio4AofOkeEnvRPyq3gJjofK/mCKLh8Bm6uylPKBZYXGn1W
	 Rvyma+nW9cVBQvrgkkK2fqP9ACLeH/j2PZDg6uXYmr7Y2MFPapQpgOZVWlvIQb07pNH6d
	 571kzrt2ylxG/PwhhYZ5Kad0PTtYizzHL30mqkTA2f6gyVXPpIbrCcYoKNOAmSpzQr3ys
	 JM/NbY9zGhHySxCqBxy6g3Euaj6h4bbbsXhqiON4iFj2D/nGuumxP0Fxq+kESvOR1TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517438;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IYZBVQt2cpCHLIr5IDzlFgEVBIZ4QCoZS7uavLK58mA=;
	b=U0p1cvnV0QE2P0y9PtQCfWIaXJ4X0wl3zv0qj3dE2IDC0exTn6SyRnK7UaSk1QwooB+6
	 MxGkTdkQyBVTiN58H52y1JOZltnwYYx/R+9vZ2iQA3d0fSBqbbX2QuveOSuafvT+UYnDZ
	 7vquKXqktDlznaM/uCDHvNW86dMYyHKNFLZfcZfvMYzz703t5MbJETb9bNfFmgKG+EtZ4
	 T9gn+d5xUCRN5/7HPMXOOlOOnNbFXuuhOWSMiYGG6pLl5MVP4Pu0JuU8P+upFCMsrFSbT
	 onHKrsRli3TqmbwkmhCwpRvjqz97Zzx6JIWfF11x+1uM2f61AOM8oI9nogrUHVrTTmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CyX94klC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4BD606A31C;
	Thu, 12 Nov 2026 21:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CyX94klC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNgC3/BrWlii+yiJmDwc8aHPgZCEXgWdfx24IEGRMI4s89vmCD1jlrS3hXtM3JegPe5YDy37kQG+EkdhYF1catylv3++CHM5OZhTuajCfYoRKeHcnIaOnUqiaiD7ANU0s1L2/txXpxVvznbfYdPNIzOp2eOjNZ2w5WlTX+acm5fOSZkiIvorpE+lq+bRhPz0fNQIz5ISoGKQCwXMgH8smwji3Z5UuzdoCci80/qlKZJAlH9yESKxkM7bEV2wgJd7qbau6YHM8pX2xKX7PXskcjPAD7U4Ww0cCZ8/sxx5v9DdJYmH+QfxG8p/onVaYj8d2dBBX20zOIObyIsOm+FhqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYZBVQt2cpCHLIr5IDzlFgEVBIZ4QCoZS7uavLK58mA=;
 b=Sfy2FFYeLHbxi3YSKCUaFC+EiEd6xWifM2k/MjM4BCwCVjeXoygw3pnUXOGCu5XdWlX6bEwo6+UFKxSzGrM5Bf1Pj0YEhdL95Orlxth0BDiGedvmjVBRLPPes90Ra4Yjb+R4R+3D72/xqLPuf9G8/o4P8jt6U9oi3WeuwRddM/GW3dDO3PjLAU/oBswg5qXFGBNUmaTYz3KEDI4Ha6nA8KK9Glmco8NBmLtwp3DQrLDYDjxOH58cqA0HF/nUUsNVB7OucqYlaIfOw3SCNKQLZsGNdXknYY2IjarfmBO66rs7DPwCZSdhKscbWL9rE2KOVkD0GKfUgHMCX0dtQ/cdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYZBVQt2cpCHLIr5IDzlFgEVBIZ4QCoZS7uavLK58mA=;
 b=CyX94klC16tA02cvyjwP7qjR2jexXCtL27RQUkAE/a4nHtK/jIhpDVqCjV5V0THUfILd96fgz3BykPpzm+ZA9Xzo1d/bD/hEpiahpY5Ml1Ops2S40GL8htX/XUqwV1TbM5WZw+mm1d+wnPFxljJfQHKLwMkyPGcJel6yM1sMlDJTLHHW5h+k8FCHMYy0vJzJdYZXai/wZs0rCbxkJd4MR4hB4A9MbYfuoz7bSm2dJwy+WWLQkOwAFz8yM4ltwAEXL7/iC1HU7lRniHqOLrbF86gpc/3KIZeDuW/2Tc+bWU+sI4lVYDMrA+hwjIzzVYz1gkjYMkUnLu9jc/9myAtVBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR0PR04MB715228.eurprd04.prod.outlook.com (2603:10a6:2c8:44::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 21:03:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 21:03:55 +0000
Date: Thu, 12 Nov 2026 15:03:38 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dmaengine: Convert to subsys_platform_driver()
Message-ID: <avYpkpoqf9NInTA6@SMW015318>
References: <20261104113302.1634102-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104113302.1634102-1-peng.fan@oss.nxp.com>
X-ClientProxiedBy: VI1PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:803:64::46) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR0PR04MB715228:EE_
X-MS-Office365-Filtering-Correlation-Id: 337b04f2-1dac-4d74-aa9f-08df410075c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|22082099003|18002099003|56012099006|10067099003|11063799006|261102130727099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003|261022075727099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	vhuOxMon8a4QdCncetJsnKE5ESdqzbKbfpy3Hq867EQOMCpfeKbQqWrcI5vjL99CS5LGG7MYauAppxBfkEC/i2U0+/CCNIM2VJ/DYEWnMdPtUK3ZX+gqP/5DZ9mxfq3ruRNFcb5bTo8Jpv/zuhug7T7C9FVRXhR5kjhQpWtVTwTQSj134Tpv/8BBcY2T0dK3QsCmjlpCqKm12AGwlt/eaj7veAQuv9QUQa8zSVGa/4YPDLBUQkU+7ZMNjOiZYto9cAmRmGZR9EnahYOK9bA6S3t2uBBwo3E41/CzDe0l+Hu+prrEtSsoU8wMqvd7tpVoxmQr/or9DRUhWAvI4Vca1esWaCqWInIAMLCoK95s8LKznkjGMHPWhtoYWvFFqb/foTuxi7bFQFuYzna0etd/pKGf3TJNIvIVXBtiLvE6rdgFjwV4P9vEyFxxoU9fthDkReGBtdt9vYSeaw4Qa/XqB7tY14UBWqrrUA6e/+YssobT29o2Y/dNuQgyE0SbVieIbQeg8ilvwvh6DjVpvH6jIA4Oicn2zFyMEphzDFnTWYRNSGlDp53oIT2fERlRfAXrXhdFyZPaXIB9YpOWu86b7AjyU2OY+CCbtSy32oFocny7qoE97COB7RUoqkYA9BvXM2ixujpmD8yVBNd9kx5EZgIysoirL0YgaB/Qu9nkBMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003)(261022075727099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lkm+qluc+7yw5OKn+s0Yh3U/oV/uOR6iKcsQgIBVBa+fgv9xLuS1AvK9FRLV?=
 =?us-ascii?Q?AhBX8KIGX9nWr+G5rLxNjCp6loYHXAIJokzy7XUTXnkmwHe30XGXEc+KaFBo?=
 =?us-ascii?Q?VMiFQOQSkOGGrGprWhV8tQWIiiU24v1LCl1yXCsQPKq9DAL6UPOpR3lT8Ng7?=
 =?us-ascii?Q?TBBwYYVblEMomdqu4i0VjRYHpu6rd74F1phDF25AHrf5SjIcNkBekoIghgYp?=
 =?us-ascii?Q?XU7x+gCNGUGVh/LU0nVfl32vW8oDZDFsAxgkfVCfXqM7nYBa7gb9q2IC7kFn?=
 =?us-ascii?Q?OowQMasoInScnhm3FlippYaoRH8ZB5mA5zve52IixSK6CpbtT+GReyM4U6UL?=
 =?us-ascii?Q?sPaz67anhK+ucox6bjvm+wqLPwTEmRJi80IL6OoN+uMEFjlA2l0o4q9RPAwr?=
 =?us-ascii?Q?mMx+tZxjv6g7MDkHLrvrtWbvTWGek9EcrrWM4CaQi3hnqDxuWoYArdNlDkO7?=
 =?us-ascii?Q?S7IGLK662UfE403yI0XJa6wMNmwBLlCSjhdiC6fmtRzXjaqBuqPyih3aFXrN?=
 =?us-ascii?Q?3jyoQh6uaixYEZy7+hVElYE9/mBEoMzz2aBB9f9mNIehxLegfIQmD41oHrIK?=
 =?us-ascii?Q?kcga1d1uIe6cGwW26hWKwtB7ry5fbT94UVG9iKkQ6+bRU6NU/y6YPzrvwm9r?=
 =?us-ascii?Q?Xq5iJVl+queTLo2KmWJ+dfSuKxIijUNmTZiHJQPw7m2Y/ho3GdmyTt6hghn2?=
 =?us-ascii?Q?qwIb4LJZ4svGEM1LcvL7RswcHSJnsT0HIYrTJiZo+GszeTim4eI+GXsek3jU?=
 =?us-ascii?Q?9uw9gl2Qvuib0ywl3fVjtg15G1cNaNZ9VX/ZCkaN2bmeJyg1erVJCTJJudcD?=
 =?us-ascii?Q?g3bmolkO7iXvobrlxTBlW5/RVSty/HL6PiUz44K9QHa4bp2jW1GiEPobAkBA?=
 =?us-ascii?Q?dc0gxMnvGDqK3VWWscBvDOUJw8W4E+3FOAkWhXSe/8CQK5amjIQMkYvBqlOp?=
 =?us-ascii?Q?5hWlmj6McuAiNhsBhhyptxzIPgDNb7R7HuUdwydgcV0u6s9/R0KnBfeGVR+6?=
 =?us-ascii?Q?qq6Tkmg2dxCoPWfPRipsGeHt7NqTg62OqgIT36FtGp9itFaJMAVV4L8yG4so?=
 =?us-ascii?Q?f9Mbo5DCs1LzqA3HernRgtxPWRBYNEOIr3kdU9enCDvOQLswWPPuib8qdh3t?=
 =?us-ascii?Q?Q4J2pNBQeLbwpvH9MPqUcnaSe36VJgC5pWu9yZPdVKeDIOP9YBSdE7MqXgt5?=
 =?us-ascii?Q?qKpzB9bLnM6xwY8frL9K7g3qb6elGxaB2rJLFPc4bo9a09JHlEQkTxEcbsfR?=
 =?us-ascii?Q?9ZFXj8riKqntlCP5I03SYxY0WKURQVpX4bK1L8fwmMgs0BWy+l5DNqGqOacV?=
 =?us-ascii?Q?o3jlYM6kJ6CaIeeNedMFyBOn5x4isDDzYEChW7mdrQsTyBdi/O8SohP4qRD1?=
 =?us-ascii?Q?HO/fa85pSSq8KvDcbqyJq4BSj+dUxV5S5lo+JhDnWcA4GSWlDhtOLG4bx0Je?=
 =?us-ascii?Q?PHDmx+n2tc4qoHjeUzYeRnEZOrKTdVQs+GJuEUwxMZwkkPPHgAwJjh8SnvmA?=
 =?us-ascii?Q?ugeTTBmET8HIaaFbuNPs05ZIjb+vAXqoWoNDNbhfwHXTbp7OOChDW/Xr7H29?=
 =?us-ascii?Q?jlH5qvpvMHZXcCd5Mz4P70iYtoDL74wUeNljXsbjto7bk/PgNXavQAPmkzuv?=
 =?us-ascii?Q?HiMf3FdHkVbJ8MOZSYl1kGHO8XZ40P1QKBDJdJJmNfVGBEMDoH1Ac+tXeN1S?=
 =?us-ascii?Q?CNwWME+bBYuGocI4hSeHCFToa6AMRjWTtbD8ByGudvn1MU/k6eDTlFtBJqq8?=
 =?us-ascii?Q?LLIrbD8BuuuCU7SqvNW9v6u8YCsKN9Qto4oPg0OlVLHoMqp7jb2d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337b04f2-1dac-4d74-aa9f-08df410075c0
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 21:03:54.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OZsGrz/vcViGpyqG4hUhrcTdDUl0p9xM6aqMMsXmveyfKpxsYnOJVf4ducCvTQgChHQ2iz7XS28Q5py3NCgeXVUdAKBe45gupHaO7nTCqTO7XBdhla8FGxNe2UCAazK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB715228

On Wed, Nov 04, 2026 at 07:33:02PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/at_xdmac.c          | 13 +------------
>  drivers/dma/bestcomm/bestcomm.c | 20 +-------------------
>  drivers/dma/dma-jz4780.c        | 13 +------------
>  drivers/dma/dw/platform.c       | 13 +------------
>  drivers/dma/fsl-edma-main.c     | 13 +------------
>  drivers/dma/mcf-edma-main.c     | 13 +------------
>  drivers/dma/sa11x0-dma.c        | 13 +------------
>  drivers/dma/sf-pdma/sf-pdma.c   | 13 +------------
>  8 files changed, 8 insertions(+), 103 deletions(-)
>
> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index d40a8b40dddc..3e83883cc17d 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
> @@ -2487,18 +2487,7 @@ static struct platform_driver at_xdmac_driver = {
>  		.pm		= pm_ptr(&atmel_xdmac_dev_pm_ops),
>  	}
>  };
> -
> -static int __init at_xdmac_init(void)
> -{
> -	return platform_driver_register(&at_xdmac_driver);
> -}
> -subsys_initcall(at_xdmac_init);
> -
> -static void __exit at_xdmac_exit(void)
> -{
> -	platform_driver_unregister(&at_xdmac_driver);
> -}
> -module_exit(at_xdmac_exit);
> +subsys_platform_driver(at_xdmac_driver);
>
>  MODULE_DESCRIPTION("Atmel Extended DMA Controller driver");
>  MODULE_AUTHOR("Ludovic Desroches <ludovic.desroches@atmel.com>");
> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> index 241a91936fe8..1ec700c2c996 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
> @@ -469,28 +469,10 @@ static struct platform_driver mpc52xx_bcom_of_platform_driver = {
>  	},
>  };
>
> -
> -/* ======================================================================== */
> -/* Module                                                                   */
> -/* ======================================================================== */
> -
> -static int __init
> -mpc52xx_bcom_init(void)
> -{
> -	return platform_driver_register(&mpc52xx_bcom_of_platform_driver);
> -}
> -
> -static void __exit
> -mpc52xx_bcom_exit(void)
> -{
> -	platform_driver_unregister(&mpc52xx_bcom_of_platform_driver);
> -}
> -
>  /* If we're not a module, we must make sure everything is setup before  */
>  /* anyone tries to use us ... that's why we use subsys_initcall instead */
>  /* of module_init. */
> -subsys_initcall(mpc52xx_bcom_init);
> -module_exit(mpc52xx_bcom_exit);
> +subsys_platform_driver(mpc52xx_bcom_of_platform_driver);
>
>  MODULE_DESCRIPTION("Freescale MPC52xx BestComm DMA");
>  MODULE_AUTHOR("Sylvain Munaut <tnt@246tNt.com>");
> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> index ac2094e65ecf..57ab0f621105 100644
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -1128,18 +1128,7 @@ static struct platform_driver jz4780_dma_driver = {
>  		.of_match_table = jz4780_dma_dt_match,
>  	},
>  };
> -
> -static int __init jz4780_dma_init(void)
> -{
> -	return platform_driver_register(&jz4780_dma_driver);
> -}
> -subsys_initcall(jz4780_dma_init);
> -
> -static void __exit jz4780_dma_exit(void)
> -{
> -	platform_driver_unregister(&jz4780_dma_driver);
> -}
> -module_exit(jz4780_dma_exit);
> +subsys_platform_driver(jz4780_dma_driver);
>
>  MODULE_AUTHOR("Alex Smith <alex@alex-smith.me.uk>");
>  MODULE_DESCRIPTION("Ingenic JZ4780 DMA controller driver");
> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index 5c1c97eb28a4..95a36af613e8 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -194,18 +194,7 @@ static struct platform_driver dw_driver = {
>  		.acpi_match_table = ACPI_PTR(dw_dma_acpi_id_table),
>  	},
>  };
> -
> -static int __init dw_init(void)
> -{
> -	return platform_driver_register(&dw_driver);
> -}
> -subsys_initcall(dw_init);
> -
> -static void __exit dw_exit(void)
> -{
> -	platform_driver_unregister(&dw_driver);
> -}
> -module_exit(dw_exit);
> +subsys_platform_driver(dw_driver);
>
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Synopsys DesignWare DMA Controller platform driver");
> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index 630285c85482..0feb878a03ff 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -977,18 +977,7 @@ static struct platform_driver fsl_edma_driver = {
>  	.probe          = fsl_edma_probe,
>  	.remove		= fsl_edma_remove,
>  };
> -
> -static int __init fsl_edma_init(void)
> -{
> -	return platform_driver_register(&fsl_edma_driver);
> -}
> -subsys_initcall(fsl_edma_init);
> -
> -static void __exit fsl_edma_exit(void)
> -{
> -	platform_driver_unregister(&fsl_edma_driver);
> -}
> -module_exit(fsl_edma_exit);
> +subsys_platform_driver(fsl_edma_driver);
>
>  MODULE_DESCRIPTION("Freescale eDMA engine driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
> index 9e1c6400c77b..5b72af393ec3 100644
> --- a/drivers/dma/mcf-edma-main.c
> +++ b/drivers/dma/mcf-edma-main.c
> @@ -281,18 +281,7 @@ bool mcf_edma_filter_fn(struct dma_chan *chan, void *param)
>  	return false;
>  }
>  EXPORT_SYMBOL(mcf_edma_filter_fn);
> -
> -static int __init mcf_edma_init(void)
> -{
> -	return platform_driver_register(&mcf_edma_driver);
> -}
> -subsys_initcall(mcf_edma_init);
> -
> -static void __exit mcf_edma_exit(void)
> -{
> -	platform_driver_unregister(&mcf_edma_driver);
> -}
> -module_exit(mcf_edma_exit);
> +subsys_platform_driver(mcf_edma_driver);
>
>  MODULE_ALIAS("platform:mcf-edma");
>  MODULE_DESCRIPTION("Freescale eDMA engine driver, ColdFire family");
> diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
> index a6fa431530e3..6a7a519910ec 100644
> --- a/drivers/dma/sa11x0-dma.c
> +++ b/drivers/dma/sa11x0-dma.c
> @@ -1079,18 +1079,7 @@ static struct platform_driver sa11x0_dma_driver = {
>  	.probe		= sa11x0_dma_probe,
>  	.remove		= sa11x0_dma_remove,
>  };
> -
> -static int __init sa11x0_dma_init(void)
> -{
> -	return platform_driver_register(&sa11x0_dma_driver);
> -}
> -subsys_initcall(sa11x0_dma_init);
> -
> -static void __exit sa11x0_dma_exit(void)
> -{
> -	platform_driver_unregister(&sa11x0_dma_driver);
> -}
> -module_exit(sa11x0_dma_exit);
> +subsys_platform_driver(sa11x0_dma_driver);
>
>  MODULE_AUTHOR("Russell King");
>  MODULE_DESCRIPTION("SA-11x0 DMA driver");
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index 6f79cc28703e..c7d6774d0970 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -639,19 +639,8 @@ static struct platform_driver sf_pdma_driver = {
>  	},
>  };
>
> -static int __init sf_pdma_init(void)
> -{
> -	return platform_driver_register(&sf_pdma_driver);
> -}
> -
> -static void __exit sf_pdma_exit(void)
> -{
> -	platform_driver_unregister(&sf_pdma_driver);
> -}
> -
>  /* do early init */
> -subsys_initcall(sf_pdma_init);
> -module_exit(sf_pdma_exit);
> +subsys_platform_driver(sf_pdma_driver);
>
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("SiFive Platform DMA driver");
> --
> 2.51.0
>
