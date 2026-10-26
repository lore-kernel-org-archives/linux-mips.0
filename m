Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025722;
	b=fEovVzmR+MwT/6dJLKr23CqvcYI4C/SAy7Cxm4WkTZPfNJwha7bHDGa5uE4lkYMVgH37
	 IsymDBqDH4TuT7C+ksGV5G+cH6o8QFaboDOKLgROk5KSAzvUXWmoAAfCtdfEj/62jPm0m
	 vXBm/vOHoMt2MS+KZcQcfURp/Zp8AkZKmQfjp4YQ+io7Abei1DC5idXh8Q7ZcRYxr6dNA
	 9s9uAfSiTArWe6LOz7IMxFdAvuKNcn1oZEoRgaToFoWEIxIcQBkts9EWG6R6JjiZ0uboV
	 3NzUbGPEARwy4VcedXnL994QWXep85FrJ6Xt8VKyYkxxJQmBSxBDfF7cjh6BdEd24Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025722;
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
	bh=dO/lWpj7D8r3e/ZvnmniW3oUjTsil5vY1UdSCp7Yc7c=;
	b=WjV6RGxwF2w5w6io9i0807kT4CfS3nUcnyu94FtJJl8j7zYtDJwzSV8+GkTrA2ra/LJH
	 jcrodqavrsL9axbYCvVcX6JSjbBWv8Zl/yHBHgvFdUkPZPiousIujZeM5G6Aj0rZdzJeP
	 12/xcfVM54IOcNRdbCeC6bf1uKo2ntBV2xd+5LBUsJ9Mf15mXGmlE4cNZWpahkaRrp2of
	 Z7j+YpHonvPnIo1IfYQIdSRLhgx3hhY6f6Z81RsmnSabxig5o1mhlVT/w30VeXjvQtU3G
	 fDrHzKujfQrrsxQ01258i+Q9YDNV8fIlXt3kgSMtxVBQpCLpgt67v+bZ/hRuF+Xlj3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fPitPXtu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.32
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BE4606A31B;
	Mon, 26 Oct 2026 14:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29BE4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fPitPXtu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewYEd3VdoM+R2tgj+KV4qlG1P7D6zOrhxbidUmctFypOZto+2l9JikhCMqH0haeWPouwnv/goVOsOz2IRbMMU0LWmfqovvcf7P0x3PZambXy9e07CmMCumCTRy5noBnNrp8knSaNxEuMxjEYhIIQu091/ipk34a4oWDcw49JElEzgJQzcW3iWf6xkTkhbrNMGAK3YgKUbqILe0m/AsoZCo38iPB0/LWMAMoepKSYysID5nEuxA1yZntZOGSSGaAeOPd+I9ECKrzFP9+dZ65/Uv528fMr5dMvqvoNjeLDCX+ln5ur+fV4ucGtcgR4v6unaUF79YEDbN8fSFBt1CdPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO/lWpj7D8r3e/ZvnmniW3oUjTsil5vY1UdSCp7Yc7c=;
 b=Be3KY3CKDSzgMKasbPqkqHVyA+t12sYMAqJWQbXL9rv8RxFUxlAUvOog2YEiqiVxPQc3Rql98OX770RbsVnBxtvMckYnnFKf9qYQO40MI/HNI73UejBw5SEKEVAvMblLmC2HLwT+UxvR7x4ll4V8LkxFhQcOAJaI1TFUKSHfWG7WhAQEKQgYtwWd2FGbBg91MChYrlOIV034C9LpNaUB6tDul/LORX1FOe0WvR+a5gCRSJK8gSkXvXcgazMYYSRi0DV5k916TQG8XshMldLHwUl6p82YtbeFloqWUVyc5st4XentsfygaCHoi6wDUT2LqJZyt5+RABUCWo5vfGd88g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO/lWpj7D8r3e/ZvnmniW3oUjTsil5vY1UdSCp7Yc7c=;
 b=fPitPXtuHpIJJLmfJ3JB62z4GewWXxeaA/ElJPHY9iFvthF/z9inIow7YsTMM+AtYf38UurFjId2Mv3ocOzVcBOcgTDmvGmdAhdhXOjKZKa8PFYTfuxCMEfND9pFWOg/u6yPz++2zg39+pl5wXnGgHCFmPcLGKFXYfNiwAJlBnynopnDYihYDQfqBFbVgQs0UZ+5G6AtSCtb7QDhVjDJu8vG9kmJj8PAEy0Eoz1nx0+MSX+5HUKNOUDTv3GwEibWqv/qAd88/70Si4XxV08ASyGLWDyDSv0GDF7auEiYszPRVIVY/Cz80pGj0e2IF4ulcdPIr785JnBjHhK0h02JXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMBPR04MB437815.eurprd04.prod.outlook.com (2603:10a6:20b:7de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 14:41:59 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 14:41:58 +0000
Date: Mon, 26 Oct 2026 09:41:49 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH] dmaengine: loongson1: fix list_first_entry on possibly
 empty lli_list
Message-ID: <at9mrd3a_nhqVGUc@SMW015318>
References: <20261026115113.3359939-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026115113.3359939-1-lixicaicai@gmail.com>
X-ClientProxiedBy: DS7P220CA0101.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::7)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMBPR04MB437815:EE_
X-MS-Office365-Filtering-Correlation-Id: 7312e31b-ee27-4460-e81b-08df336f498c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|261009223027099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|10067099003|56012099006|261026140227099002|6133799003|261026121527099002|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	hUHzQquTVB8PL9wgiO5f53oN5tMEsHTpbr2qGZiVjB/pA1Fb0RRwVZ2v5dRHi+v/fkZ6CjVdGOt1sYdg0iLLmIneYXmyod3OCN62/xey+DZMl07VmTzDnZSufXBIiZ0KmlwGUUuzDPPVx7ZM0BRUYQCAwwyOLtrcOgNeT8F2YeUfLsUw1thsAXF2Q3s3/+n5114E/6+6cuioJ+H9NDM9C5p6pU15gjgyqQtvw9+yol8zu/4G4mXVT2RcRj3EXu7nOcsJZ1jkEFhKixfst3GOXVYmqRCnjALxboXIWsW3uV3Re7J08sqa8tIb9Z7M9MX9iDU1Bm/XCfe/Av6wsq+CUoKmFrHLs9CavWA8qB+Z8pRW2hiIvtxqLS74K18atfoX0PTFzSe1OJ8lziPpXLZxFbquifXXY0nOxIWpSPgFSiTeL7jT06ROy1Y2/dQpBcw8Qn4edQJEy1pIyV3kjDcF60rdwbd48XjfY8zLpaLN6dVLveD4/l4vsM7bZbFQvsQSiNA9Niu/+UGs0D5YyOKZzdKP51+v3lIl6jkegYz+g1fV4tndN/L/4lnMuHUgsk5g4WZZRC9W3sxb2FEnmzdGoJNHgl03aEmsKgOo9c2bek5RmAxITOphrlKRDwZI2iq6mXCCIOFphaiyDh+rIRkZoETIltz0vxOo0JGkOQnsYrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(10067099003)(56012099006)(261026140227099002)(6133799003)(261026121527099002)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v5Egvx4xixEHVmSGsobOYP3s0uS735J5BKth0LvZQESXGN9n1R9RMkBqcNSI?=
 =?us-ascii?Q?aat4fiNfoyGdPFHyq4pdiVWu+v6uyHz7Rg7fdK2iKeT0FBQTOTMkBKMfYmEw?=
 =?us-ascii?Q?SobOEuUiqYk07cv0Nz+H2mUKntTcyAxCwguuqXOLTkNR4bcp1rXA1AlGT7VM?=
 =?us-ascii?Q?e++/8QlzZVkIZjBLnhCk3DSuPLuQV1PYwb2arMNFgpke0gl7RhEmG889OVqz?=
 =?us-ascii?Q?u2ju7Zexo9y7ZRIVExSaqydM2br1bRnaAqT952lY8PyTg8ibGdriK5qqBMfQ?=
 =?us-ascii?Q?Wf1UN0rkPA3wnczKhuAJLweRJM83uu416H9NgQzFSmJN8s3UpKYE1NVIdOh/?=
 =?us-ascii?Q?s9JKy5ZNwR04rqXqrXoxNjriFv98xGzRK9H6JLE+ydhfzL/zaw8zJfUVb60o?=
 =?us-ascii?Q?ZhATQ/sKD9Iicujw5YkJBj76CzW7YN0N9ZB7D91OFjlW6TMw/Q8LvPUoW9Gk?=
 =?us-ascii?Q?GKCtJOmw6xnAwxSjKb0CMsonlbVSKNRgAWNspGZnKaXZLs2Zz+tnr6xUAlx1?=
 =?us-ascii?Q?onyKRrWtx/83gfv/mRneYrh9sROINivCyxwfVg+U64SfZU4a44gGXU37Q5LQ?=
 =?us-ascii?Q?VRDp/z13ARpS9BCrlGS3/wsaX3w6s9hIfHNErbkipm0L61inkwszcpu+gNr7?=
 =?us-ascii?Q?fq8hx5ymMbNpnX3O2/xK7bQ3IeSIU9qrxao2CNJ9hZhYFpNARDW2fcktercX?=
 =?us-ascii?Q?6DtOP/KGfLVYbDrPBeE7ya6kW6RInF4n60L8K9GmJRTuhKMR1eZfHeD6/na/?=
 =?us-ascii?Q?IDoc7o0claPF4d+L7KKuRdmSvLL5U23G+PRNircEDFIHzJm+118W3Ig3ZLXe?=
 =?us-ascii?Q?UdicIslpe0D5siB2sZ3CybNw9KQ1IQWr6ymI7M0gNwYZdDREsl54IQjb288M?=
 =?us-ascii?Q?b93m2y6YYRgNOCppQybXWb9mCU5bO+roUjkLqTAa1Q7ieOBZ76/pzZsnw4PS?=
 =?us-ascii?Q?FiM0Kn3cfAvYJLdVQcgV20HUVZlV5yDa081togqPLhzXEA+1WfS0jLak6ckU?=
 =?us-ascii?Q?F/YW0yDKFHBfGPrQEwttvp3i/A9JceBJGZV5aWL+P/HFkKGyGm66K4pOObSc?=
 =?us-ascii?Q?IzFilFN7i3R5rcD3ZN+Baeo8EXoP9vaL+4HczCo/+1LX5I71qhlHnmLbzq/2?=
 =?us-ascii?Q?bDOhjyENMyozD7HXd3oWH5ZC+5unPhmi1nehecX1YrBIjCCW9zUgq2Xbqh2t?=
 =?us-ascii?Q?evDq6yB0wjHpJQYgOHkVXiuzu2O6WfHQqPWBCMwEHLAHzxrTLxXNxWalMz2f?=
 =?us-ascii?Q?P/wU7Vl05Uq2N9FQ4zRFDgjJkfDvBZPpHFN8+NXcYjDwIk9G4CO5wFWHlnU6?=
 =?us-ascii?Q?PcZpWlrTNrd4wZLXgymiYqkYHTu7Y8rZBlqyxZgLMVsEbgszpDnT/F3RNJ2x?=
 =?us-ascii?Q?90XBQLlPfkVSNrXXxswhS+7YJpJ4tcpKIPdAzRh3IEyXVJVtP6xsaNWwciom?=
 =?us-ascii?Q?UuTvgR7pbfSVazqLkXYBPVsWghpjIsON2GfGNio+A86scPeDT19d5xWW0UP+?=
 =?us-ascii?Q?ilAOk2QkNN1mDEa0NM9+BxocTg1yfdwidTuD7fY2GxwqgFG+TCcL7lB8jr7j?=
 =?us-ascii?Q?9EsuE1WAzCoBfesimiyQ1krh/Db7awFmb8OC5PAhzh4kdPtiYxo1t966XsEI?=
 =?us-ascii?Q?ZwiDuxOlvIPk52z5lH3w/qkvJcfiU96VpRuRCDzPTOpMLdwBSlrKoBOdoya8?=
 =?us-ascii?Q?WWw4XR0WPZ3bc4KdMmuD3FlIpro6HSy7+v4yvcB/jlrwRMxSe3heWdBM//Df?=
 =?us-ascii?Q?5lhGcPmdk6BAVWQ948mv1wStOhQu1XljNbUejdltcnRM/LoFdkTQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7312e31b-ee27-4460-e81b-08df336f498c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 14:41:58.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzY1P7NcuYaOFDbYVOcDQTWiJrfIrBBPiAMWw2Ha1BY1PQCt2CpYNwjscqxlCUbmfn2W6jW8RsMroFJmO5VbNnbS+PvhWQ99glfDGI6OJisEtUmMPowBT5x5+oJhl6U2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB437815

On Mon, Oct 26, 2026 at 07:51:13PM +0800, Li Ximo wrote:
> [You don't often get email from lixicaicai@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> ls1x_dma_issue_pending() calls list_first_entry(&desc->lli_list, ...)
> without checking whether the list is empty. list_first_entry() does not
> return NULL for an empty list; it returns the container_of() of the list
> head pointer, i.e. a wild pointer that points backwards into the
> enclosing struct ls1x_dma_desc/virt_dma_desc area. The bogus &lli->phys
> is then passed to ls1x_dma_start(), which dereferences it (out-of-bounds
> read) and programs the DMA controller with the garbage address.
>
> The list can indeed be empty: dmaengine_prep_slave_sg() forwards an
> sg_len of 0 to the driver unmodified, ls1x_dma_prep_slave_sg() does not
> reject it, and ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg
> loop body never executes) yet still returns success. The resulting
> descriptor with an empty lli_list is queued as a valid transfer and the
> problem only blows up later in issue_pending. This was found by code
> audit; we do not have Loongson1 hardware to reproduce it at runtime.
>
> Fix it in two places, following defense in depth: reject sg_len == 0
> requests early in ls1x_dma_prep_slave_sg() (a zero-length transfer is
> meaningless anyway), and switch ls1x_dma_issue_pending() to
> list_first_entry_or_null() with a NULL check so an empty lli_list can
> never reach the hardware programming path. Neither change affects the
> normal non-empty path.
>
> One related pre-existing issue is deliberately not addressed here:
> ls1x_dma_prep_dma_cyclic() derives sg_len as buf_len / period_len, so a
> caller passing buf_len < period_len gets sg_len == 0 and crashes even
> earlier (sg_init_table() on a zero-entry table), before issue_pending
> is ever reached. That is a separate bug in the cyclic prep path and is
> left for a follow-up patch.
>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
>  drivers/dma/loongson/loongson1-apb-dma.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
> index 89786cbd2..e7eb40584 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
>         dev_dbg(chan2dev(dchan), "sg_len=%u flags=0x%lx dir=%s\n",
>                 sg_len, flags, dmaengine_get_direction_text(dir));
>
> +       if (!sg_len)
> +               return NULL;
> +
>         desc = ls1x_dma_alloc_desc();
>         if (!desc)
>                 return NULL;
> @@ -478,8 +481,11 @@ static void ls1x_dma_issue_pending(struct dma_chan *dchan)
>                         struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
>                         struct ls1x_dma_lli *lli;
>
> -                       lli = list_first_entry(&desc->lli_list,
> -                                              struct ls1x_dma_lli, node);
> +                       lli = list_first_entry_or_null(&desc->lli_list,
> +                                                      struct ls1x_dma_lli, node);
> +                       if (!lli)
> +                               return;
> +

This two problem, please use seperate patch to fix it.

Frank

>                         ls1x_dma_start(chan, &lli->phys);
>                 }
>         }
> --
> 2.30.2
>
