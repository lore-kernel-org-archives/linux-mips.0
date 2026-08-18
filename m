Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080FE35DA61;
	Tue, 18 Aug 2026 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070488; cv=fail; b=GgBScxUa41gkg7/YmnibgtistwyCFx0iU1OMwWSn+nLq89H8qkhfW6zVklSQANWizjiCrs/hA8x8QNFnmO9BXWHVybAR1w0kdD8gapQijVbaAkDw9VUK3/xZnu1XFnbZ1WG2Wd70DHClUCzGoARqZbbxKZm+gvAbAxNu9W6P7yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070488; c=relaxed/simple;
	bh=rqjO7Z8KFDjpokZU5M4+6eXq/2gjMFf2UR9tEIjSZOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oUmJMiiFtjM9U/SfTCZNg3RBtr1iLu33zs3pe+BM1JkkWFeRAaEru75ObvkczzMHap7qEpRUikZvzgAWeNbe1b7Deaxk94J/qdn5K9QdYJ9wRzNLVM8XOpo71JdxmJRsfI5rQwG5Oo0uyPVGpFMolEO1Lw+yhsGqRTC7jZ0shGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GQSbmC+S; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GQSbmC+S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM9/cJY+XrMBE5jeaaaMuOfBQS8bNXBRGfRK5dzVtyqDIfdTr4UfIsOho2CFiZPaWrIIu0jhEvwk4Ah/W+qcRsd9degU4LhHIGwuguZSyyZfq6tAAIvaunkGRqqijwLSXQHLHX3X/2SzXUIBj9l5OittPdoIn5iFNcXsyqg+a97IOL15EcxxxAeiEu3oz4AQYbuNVrh430WS6Wfm66BGjikie8lvkxDwq1nQKDuA30FSM3AMXgTOsyqn6TDtOZkzxCfd+ToK5RCmxZQtdjFCD8Sc2SDqtbSzcFvfz95B2LeKaZ15eG40Ac5Wm4t9e4GTUZ51/dcE4mX8nHQfZg7b5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVC8/HhcLiOOqfpPluOTLmClQEURFuEhzwGX0guqnhA=;
 b=edQ4x/IrL/9jLhlnfGqJsaSZzAJGQdNgkktT6+XPpJooIBOTPEVm5hOIFBWbkBATRfeQeLenGp1vrZD8uymmOFxnMH5nUlhztNAtFUqasIKxkVFChUodu35o5YwBAJJMeMNT2gQ4C3/FAtxduI65OPRdZ1RztUGD/T4PPTKTgnIYFvDd88EOEot8nxKQq242tDkSqghjNLCK9OfH9yODZYYIcoCD/kXSnKKSkExehbHl+5+A+YpH3UT6g5mpQ3x/H3eIuUyv4aENMVvV0wNnBinVuUav9+Axd46nyZQBBzRjdZe2JFVL2AYkhk+IQZ1XvuCrnj+Mi+J5w6uA9Cb5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVC8/HhcLiOOqfpPluOTLmClQEURFuEhzwGX0guqnhA=;
 b=GQSbmC+SEOKaigqpaJ5tlttkJ9G74apVQDdBurKiwqpqXpSWMtiP268wXgA/wcpkVQobaYoK44DDxSgrUIWv8WsXCKOMwaZ/SKOUZoua/1dOPjMNHLlwH/2kBhteyaYzMSCG87N6J42uO8qcPnImjvznweODkO0d6rJUlj/dSKB26BSXFzzLoucY6Y7f7RiERTfC3ha7FfqwasMkg+sRagGHVTBiE5fx4qpUI5kbzNR3oDsmZZ+C3h2/pHoUoyCUi9JfTK4n4sZeMJpUzFXHFRIBoOkKLw3K1dL6yzZKnYMQ0J6p70KsFQt9je5RCgFkW8+pejg832rQolMhw+5YcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB511889.eurprd04.prod.outlook.com (2603:10a6:910:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 16:28:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 16:28:03 +0000
Date: Tue, 18 Aug 2026 11:27:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiawen Liu <1298662399@qq.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
	linux-mips@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dma: jz4780: handle clk_prepare_enable() failure in probe
Message-ID: <aoSIC1r-xAelQ9s1@SMW015318>
References: <tencent_BE00B17EBF2A95EADD8B80203B745B9C7609@qq.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_BE00B17EBF2A95EADD8B80203B745B9C7609@qq.com>
X-ClientProxiedBy: PH7PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:510:323::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB511889:EE_
X-MS-Office365-Filtering-Correlation-Id: 0257e788-40a0-46d0-455a-08defd45acf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	hqFM/NyRkToihFBSeB+ZNgBP1Dp90YBAI6jHu4NQD/bBhTayb9NIveplqwW6MUaiZel8ncE9QBLZ+nbb2npTS415MWFhQNjoKYj7z103DcfZXoJk2w4dPc+45YOsudE8P6o8KM66tLuNUdgC0/aBElz6eqgTuJ+/jDqHCpX9R5Z735wtHIKskDDDax0EvItlsnyL8t/tzSWhKrYTtF66XrYSv3VtV5Q5qXmnvQPHwo+//jHsvjzuPnPu2tcL2tnY5H3qW0r3+FtT8rYm7qaQo+K8YjKuer29Nf6wtQA3Ay/JHhadNpAm3FHUlY5r6mGv4/BFw6AP6eU0Gc1SwHjZ0uuWz4Equc0pkZIFmQMllmFo0zpYGiNS/h8T+WLRWCfAWbtQdqPmx+RMPgmlvPkc9qb61HelnOXOSLUghHeGlkQ+swcCsePx1QQwnAv3SIaxnE7BjXtAUid7KvhMBeRjQMGYFRATOwzzEjQMyJaO3M2HPG9lRqLJERja4jli3iZ5wxTMXtc4iv0IB6psBeu7GYEbaX+lDqH1gjWrgQTV5YIjP+O55o5xiZXEeSdSt5CEu36NwsFisaRIVHzv47EgPOfw1WLaqWOsZXEbzcgrjPalKqo+UJi9ApabLAkpYJQNINDjftEkhqjkGcV8jnGq1El8b0/VInLMRwYPQa+HOhg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lvabB70Nydyp1MoineRRK2OeCjZ8x2P6CyVbZGdEw/mD5Tc/cdafPAmuzpkR?=
 =?us-ascii?Q?jiVAmRC8jr/QkApJ5GLViJ45eUv61zoH1VQp32ycazPhLmROK8qVIxlL4u6w?=
 =?us-ascii?Q?D/5jCJf4srLmZ17flIdabK0r02tEjSWNaH9mTwgivKXpaPJgJjAPkVkBEGXV?=
 =?us-ascii?Q?k7ApQuMxvBzxIon9woTG/qtAkhu62HZkZ2DhkXhWzT05k6djaQsTfMKFicRb?=
 =?us-ascii?Q?g2CUJYq4iPCuFd1WDTgsvXADUbKw0PMM68VN+bAdbBX7qPIgKrfTcR4L9ah1?=
 =?us-ascii?Q?LFLkEKV2stX/cDxIiXC+aLrDteD3mh3WJY35XWTpZt53ae2QgbWiv3/lqIqr?=
 =?us-ascii?Q?kdiUUoKwQc2ks+5XTHielovlJ4fLKAgGPZfPd4p4o5f5qU944+eqOx+qnlqG?=
 =?us-ascii?Q?kZfIUDJ/dpyt5rRfya7/+1IUmkvzUj7Vem0FvHQGae/xr79o5fN1Ya7ZN9Cj?=
 =?us-ascii?Q?DvS9fQWn+/OoEKxeWxegIdHgyEaRNcZzrmFZC1jyJ4gw74i0k2k5VlLox3E3?=
 =?us-ascii?Q?zuCVHE8EBTxhctKqulAzqhsjD5AWZ+nE7BADkpXS4m3cOqGgl2s4HRIdyiz4?=
 =?us-ascii?Q?T+rIbt2/AwEXc8OvDmkHf84Nf/iRtSN2NfFoyDPkbP6EmBsNtlUSrqM55cpQ?=
 =?us-ascii?Q?CgNc3PTktly7A5pR3rG+yKEz29nPZb1G+7n27gVeDa6op4nxlFyWO7kjCpO0?=
 =?us-ascii?Q?Guw7e2w4ptMuguEFZ1xnQEw7kR9ANqaF/XftaefaNyEQr20ClVbwvHsi0S5b?=
 =?us-ascii?Q?0x9ZDlBMzird53DjVJ8pBCgbf52cV9ROyA9QfrmNd9itoZxEDlx9T0LVl6t4?=
 =?us-ascii?Q?QKCiZqh72XGrthxJSxjziz/1uGmmybZPKOOIxg6436/ZXtq1Bt1k1Z0chlTH?=
 =?us-ascii?Q?27e8U2I0ppzItRT5GVoYpdJggORLih5JvW27jytGb/SPcIzGrcaM0NIlQPZa?=
 =?us-ascii?Q?nUEX9e7X5hv95wtjY5Y/R1s40pXZvKIj6OWWH7pyK2ryjK89/g/lbfV/9MBg?=
 =?us-ascii?Q?c06ifrtW46tDUEOEiwM6tPjxFZRGJgUxxNQCLSpz0yDlYcIvcg3AxiCIQE8e?=
 =?us-ascii?Q?D+pfiERnY05Y1tZN9F7qSNXdnfqSOcHY00nQPNumPZy/49RX2lEaXSiqDSTb?=
 =?us-ascii?Q?ro0WtdT8zt3EAxMDbYnQ45HPJCcVib5lhhixUMs2zBjUEzweDf5oQn2pBwII?=
 =?us-ascii?Q?9Hu8U75ViwCfb5SBQiVMHeXmR5IsYUkJVmjN7IFIcb9xJd+K/GIdhkHl0VFT?=
 =?us-ascii?Q?JKkWixsbhJCn5BxC5jz7KqnYKxtreJKPNlop7G6JZEkufVLBLaotlkNs/SdU?=
 =?us-ascii?Q?xqT1MHFWInhjIQe3Ga3ZIe2ghbssqZzJoOMX1vg8wp7Abq0VFAzqD9zhRees?=
 =?us-ascii?Q?4/4w/dPziNFL2Nt+FKy7OUNAFXBaOg5PIhjudpo6Jzutf8m8eJMzSYAeVwcR?=
 =?us-ascii?Q?0bU9pb351S0YzA9McyeyWhjXA//OBDhSogY4HJPcuKqXnV5MM+21v/mDusdM?=
 =?us-ascii?Q?gU3fGzoCJAaD5edueqhKbsFoPp9E0U8O6CTTxltHckV5l4ntWcOW3RgBIuB8?=
 =?us-ascii?Q?8VHB0FKUI3K3el0sUYrq3R3ME9zqi4QldLVtPE+oDl0JAiQmNGbZ6gmTN2fX?=
 =?us-ascii?Q?xnM4oDgGdrvFaVhFLW2OOBqmwgLcyP0FI6PsfZ6pZKygmNoFRSOOgu6LwfHP?=
 =?us-ascii?Q?X1t3my/9SIX3IZr6A0QIVDUlGuixIiIhO0D7qz976TczKv7FIHccSz2bss7g?=
 =?us-ascii?Q?Y1ja756COZQOC92MDPwXPfC1nWLHTH2xLGP1oNwrbDwmzp6FOqJC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0257e788-40a0-46d0-455a-08defd45acf1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 16:28:03.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWqfEWQ6Xpw17QuOMPYBdEi+K3Mrr+uzxl4pkLvrFDAGl6A6hOGc7Oheqd5Pf3C7FKICi/+nI7olFO22uDENT16QjfLqYQ2Fh9hbmVMUtUXMAt+3fzMkL45cxFcrZ7BS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB511889

On Tue, Aug 18, 2026 at 04:41:31PM +0400, Jiawen Liu wrote:
> From: jiawen <1298662399@qq.com>

subject:

dmaengine: jz4780: propagate the return value of clk_prepare_enable() in probe

Frank
>
> jz4780_dma_probe() ignores the return value of clk_prepare_enable(). If
> the clock fails to enable, the driver continues and may later attempt to
> disable an unprepared clock on error paths, leading to unbalanced clock
> operations.
>
> Check the return value and propagate the error immediately, avoiding the
> erroneous cleanup.
>
> Signed-off-by: jiawen <1298662399@qq.com>
> ---
> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -903,7 +903,9 @@
>  		return ret;
>  	}
>
> -	clk_prepare_enable(jzdma->clk);
> +	ret = clk_prepare_enable(jzdma->clk);
> +	if (ret)
> +		return ret;
>
>  	/* Property is optional, if it doesn't exist the value will remain 0. */
>  	of_property_read_u32_index(dev->of_node, "ingenic,reserved-channels",
>
