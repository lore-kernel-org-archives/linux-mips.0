Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718698;
	b=IzT881iirwEBkMeWONyuX+Hw8NwuX2clFNePGBolTxjAAvfNebXaBFGfUoapuM0vlxj7
	 FGiGyrhGsPnpnO3T8KWildrh7aeFjAIyENOd3usGXOwiSb9XTO0uu2O91Rz7ZpjyUOYGJ
	 MlkTh8yM373w8M2TxTmJ2HRWwD5stAp9RUH/DI4Cyor+cfRMqmgQkYUOe5DeT/qY2kEr4
	 N3L1EcvB55qzn8B5da8zqffBVnY18mRKj7LKv6cyDhcRmE3Xk1Otbir13g2TOIV34+LVH
	 gvfYuuy4/jfYTmDTffR5hwlZKkJpLzACHKU9i2aPd9Wsw0MQsn7zOxWJftQoU1tRTQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718698;
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
	bh=idrNoi6VfIRiaPCVqzjTLarE45/cOlSZ3/PfbIBtSxg=;
	b=CjBPdiFue+CbVRPyTEPG8xaWr8u2pfrdqtr5QW9kP3l77IFR+bsK3xALCbnk4aLi7cIR
	 Nf6juaARRZaW4sbIU3vr3A9tVbk79D04qiUd2Y1rovngdbn2cLxLbv1gmAWKE/GNQTNB/
	 ZB6s2VBIUHp5aA0IRrmbWRIuzlDU2NGS89Pcyis5gVqvswfr2yOMLXcMQL9tKcxyXh990
	 b1NerZAM3SzWE9iTtVBy8/iXBg2g8Gkm7nTpFrY7QLQ95IADNON+8viQOHut3RZc6/qdu
	 N1vQlHrmU/lMLh2mpLpF+f7ZeYIzt43U1q4/WQh+8oyppZjKGpaWt3kX5bAe0D91+SA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YEywif0o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.13
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010013.outbound.protection.outlook.com [52.101.69.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1536A606A79C;
	Tue,  3 Nov 2026 15:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1536A606A79C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YEywif0o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTCA9wZHAZb953jLqANVZPNgdXa77DF8jn9A65ZJzN7QO4RLAQtOQUtOjq91/6sOm5zAbinO0ISUFf5pWfNMZWyqUiaQEbqoJlJJ8g8qoJIjGYSP+rDrgJ4/uCtzhUe6vzNIFiLLYXp62tjVaC/ILKdTSdT3MK3rICTABc8ka+IPfsC1PMiEm7oJlp8Mz1jG701oP7OcA9kRQUrMcTR1soxqPCOmqF51McpaMrf/Y0hAcxVbCISmAzejnR3p1iRAM+Tf4zexWoYe2i/5VhFZ+66h3quIUhoySSkOrhYgZGkfLjcmuTHDWiz59AYuDUks+2brvMA76xygzvY4fC13cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idrNoi6VfIRiaPCVqzjTLarE45/cOlSZ3/PfbIBtSxg=;
 b=XgZbrJ67MK6jQEj9hnh6thyyIvN01BZdvqv3hHZALBSNEHRzpGpAwmXPkjgErdeRJ0qE2260rLxXtxDVgYTEDK+0dNZg8uaiW2z0tLWiC5WTG85FHE9F+PgEWPMKbp5l4+wLNeaK25A9j7tQ7IiOijflmBy6vWxr0MYy/t6J3SkumQKquu/so+eq2A9zokR7Jq10cl5PRVFY632o6rfgub4u+m/PSa1wJ3D8TlQwAwJLz94avW5Czzdt6nNe30c2JuFQm0d7kuO2vu5/7RkFAzw8wcgQVbVF2QrHJBQhX7xKpFc9ld/H7ZcVevBrrFIbVMfh1e+z3YPZqBYT4RNnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idrNoi6VfIRiaPCVqzjTLarE45/cOlSZ3/PfbIBtSxg=;
 b=YEywif0osdxZXhD0nee5zQ2g6a+ldayrWNx72amlRqaRwzC2fQov8QSWU8OHdUCI7ZOwHhoR/b8vUZI2X16+vPhWLuwDc5UiF+qwc6mgvSUohEwQhjhZmosD+b6hPvj+aqldpzMXavJjrFKfFYa8AWz7m4vhEE+6T8RmgNY/5nUAusKFfa7S/oj5HD9rZIIusQemDRedplDkAkC0F1aN70zqmwz7gsgjUhVMrEwS6BAvRVswhjrQquGB/vq63Zk6k+VJgruh8grXzLMRDVacfN4qR/5HXUptG11ytmY77xliDbIgGHr5ndFb1m9lsjNkUx1wKXnZt3KiKKId43JFDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8759.eurprd04.prod.outlook.com (2603:10a6:10:2e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 15:11:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:11:34 +0000
Date: Tue, 3 Nov 2026 09:11:26 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH v2 1/2] dmaengine: loongson1: reject zero-length sg
 requests in prep_slave_sg
Message-ID: <aun5niTJg-qCa6ht@SMW015318>
References: <20261103084638.1190232-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103084638.1190232-1-lixicaicai@gmail.com>
X-ClientProxiedBy: PH0PR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:510:e::35) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: 4886a404-53e4-4819-db84-08df39bcbfba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|6133799003|10067099003|18002099003|261102123227099003|22082099003|56012099006|11063799006|261022105027099003|261026121527099003|261022075727099003|261026140227099003|261009223027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	PBu9pxoelEznO1PGmRJLDN1MoQXNfwKm4apw53AeTX4uzv9PtM4Tkykx3YgGYZEPkZLXj8r1L52T4g4SGhD8AFqgfMQYuG1nqUeZJ6qaS7EVmrbrzPNBBGt3hgTuAFVQPR+U3XhSZnGeIwxTAxt6/OAKoSH4x3KAwXwLlpgyDIbld7tPXMb+3Lv0sda9CFe6td4JRXsFTtqIsdh4FIqZ4mB7z4+ZEG2XA6oYycwRJJnIm+lbDv648SwORKb3uDSvJBbowVW5oujvSOCe5aMPfBUX4ZxsqzQ+sbJRhY64uwI/lz8IKEsWKSoUdAVUNdjcPuPeHYj+XTfbW/alvmaNG60L05LrbT1pd6vuwT0lOqzoHlBKgv2VzLVokRAqjmG4If/S3P/1cuhZC9j85HqjQS1R/nVQ3go5mB6ZEc/vMgVaM+fPG9N9hNA7aK3yBAXXECfetdbZVoVHtzKLUJ2Dl/cl0sykmNFLhfgXwli6dkdlsMbSUNp2lz67UAgtL0r2Pr3/5M27/N5QunSO1AgcgM8uIBSkWiX9jdd4Uhb1P9G7lRPNTGcUmw0CGhXfxiIajiADGeWPJjt1MTUMlS6FlBATFNv94tEVdYdOKlMq5Tpkf7k32PEqRq4pH2ZbfzYC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(11063799006)(261022105027099003)(261026121527099003)(261022075727099003)(261026140227099003)(261009223027099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dRpDIg7PuhhL4xF2iXTtuOIMHIE1BmJRxIFMej4tFQs4NgQ3j3rZCEEQ2xfk?=
 =?us-ascii?Q?HVqGLIMgimerORX0vPvJy0hmdVnmMmrF36rq8pBnYYgetSWGwBxxJ/xt6GUS?=
 =?us-ascii?Q?rzyNe7Hr3gqpwBPCWQW4fro0X/zfxI/kV6YR2sGlLRJ4toEM3jIbQXZlPrVo?=
 =?us-ascii?Q?A22JQev4K+krXINRudNGu/d5waO+C5fPaLfWKM3NgwL5+x0XKLxWgsgkjyaX?=
 =?us-ascii?Q?PkN9OCV65pRTfFLaxvAc6BLll9c9bbpc1EvFRPigV+XzdhO1fGfQ8Q+obqZJ?=
 =?us-ascii?Q?XUnFbYB+vsJe5xrQqjS5yBiuViXMQqhwXYYorWFwEEiTY6Hf2/pHsDnR88VR?=
 =?us-ascii?Q?x5PnMm8ttcd/GMjpln/fb0pv95t7vyn3Vu8QuBvYWOk6ba4T3xw516DmE2P1?=
 =?us-ascii?Q?SIcCqQquzbOanPRk9rDeHkTYihFuntf//YkMdBvcrQUyGsUwnkDgYjaJBu5U?=
 =?us-ascii?Q?gfhP8/9oUyU8I1lGMzgtq+JxhqwdGqHnpuQ/mFKnwgtPg01yHsqHWiUfDHOZ?=
 =?us-ascii?Q?KQPvUzsaGF/V9MTSLiDf075Z8YzIiM28bTI3eSOqPgGmeIMnQsi9X+P5fPna?=
 =?us-ascii?Q?47JG01/mY1KO5MJY6BCqOuscAacySyB/9k5XvnZiQ0uNnpu5hL2BAizhVXIL?=
 =?us-ascii?Q?GAH2ow1L65z9T6MbU3pqfwRA65ye+Yz3H8E+2/08LPtOutbodb6iRRrCkwUj?=
 =?us-ascii?Q?HT9wPBKhUdVlCuDLmKHT3vuwo4v8isI6LeDiWN+NmC+Zb7N3dzCgeT9EwfSE?=
 =?us-ascii?Q?yHDgFjuLP8w/gdPlZgJuHs2LXB6psZmAw38EMZFqj+o66nzoZ/2E0G+S0qt0?=
 =?us-ascii?Q?h0gfapZ4mDm/EMVWYh8j3yihPLBlLHznAo9TV+so3zO98xK66V8JdhJlC922?=
 =?us-ascii?Q?pHoDbmE+U4zkrJoZg0JdC/6Y1YvhNms58tcqy5uIycrKSFf1najsDXvZYbie?=
 =?us-ascii?Q?foVXJtfl6J0ImPHuUnXN4p4GG3zWGpbTuB0rnZi+XW78X0+83MAljy6BzjcC?=
 =?us-ascii?Q?BsxxR8goOJ0YQgML1DM6pEDKRjVjeK+cDx1YFOTlMtOoQMrHtV5USr51hfVS?=
 =?us-ascii?Q?77NVERCuHsR/2AjK2T5zGCsju+oZW46Hr5IkuLmNzenRLhCe49tlGf0K7jOI?=
 =?us-ascii?Q?qj5XokYq41z+QyaNz3c4wln0p0WwcYWKeNILOkKKD81Lfo+Gzr0smPQmkQGb?=
 =?us-ascii?Q?h+DkVkV8XHmueCJl83JP85Ij4v1E7uKAI1SB1uawpIy1iJ3qcYoE2nC/wztb?=
 =?us-ascii?Q?0yUq9hqHUXhMRBVCMUvRnbV9BFkR6sMNaQMobL5VAyH8zANO/8zoeyi7a6C+?=
 =?us-ascii?Q?N5EmduYm+aUx+unVxZEaKv1/7Ac8Rlckg1aMNmpVGQYbDpJ4PnHGyUdhectS?=
 =?us-ascii?Q?OsxuWrMuxTF/SwmkHxhWymOjpX+WyUm7ZUJgOmHH5uDFF1KI/GwYz9Wmfyyp?=
 =?us-ascii?Q?Z8DU77gUu6BLRA9HHDNVip22GWTVzNLltc9vaVfsMOYhv8InYOZlY4LnmuWY?=
 =?us-ascii?Q?BuBMuDFNHfFQ1o9XKb0spPJ5DoISsSCFpQQ1rQap8PW7WHynRKQowyPyIM0g?=
 =?us-ascii?Q?BfvO77mBvUU+jA1WewwYw3ATlXI1hFkLvwKCWDCsS8cK02igvmYgdmLJNyK3?=
 =?us-ascii?Q?L9q/F5Yk8pT5a3O3XvIyRHxDgD1KK/Ky16Fnznpv6biCXztNP2bIDBRM3IdD?=
 =?us-ascii?Q?OAA9zXSehVRXZqobFQIjn5RUXEPDjuzHHaskPtGP0eMlkcSrigRqw2yDtvt7?=
 =?us-ascii?Q?xI4FwN1gfQnJEbepEduR045s6jVDDYf2+Wykm5CDDxMLdt5LyfOk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4886a404-53e4-4819-db84-08df39bcbfba
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:11:34.5226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nY7vWJ2PCii5Fz29DZTDSWS9H/9qjv3XrtTwd7tV1JAD764iIiZ5m9ic8KhIn6aSiy7pE04qxn3MZYmRnxCimpBYMyhQ0tIC7fjckXy12YNljK30RRAe0oiS4PhPZe97
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8759

On Tue, Nov 03, 2026 at 04:46:37PM +0800, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> dmaengine_prep_slave_sg() forwards an sg_len of 0 to the driver
> unmodified. ls1x_dma_prep_slave_sg() does not reject it, and
> ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg() loop body
> never executes) yet still returns success, producing a descriptor with
> an empty lli_list that is queued as a valid transfer.
>
> Reject sg_len == 0 requests early; a zero-length transfer is meaningless
> anyway.
>
> This issue was found by static analysis.
>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.com
> v2: split the two independent fixes into separate patches as requested
> by Frank Li; no code change.
>
>  drivers/dma/loongson/loongson1-apb-dma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
> index 89786cbd2..e7eb40584 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
>  	dev_dbg(chan2dev(dchan), "sg_len=%u flags=0x%lx dir=%s\n",
>  		sg_len, flags, dmaengine_get_direction_text(dir));
>
> +	if (!sg_len)
> +		return NULL;
> +
>  	desc = ls1x_dma_alloc_desc();
>  	if (!desc)
>  		return NULL;
> --
> 2.30.2
