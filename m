Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718994;
	b=yDuQewBKlKZHrTmy+GWah14S6xvD7NjCtrC2QZdaaQhrsZ8UOh/mXfsInD8OEYQ3jX20
	 zbmrZE0fKF8gPRi21N9NrrpGwprziFOdekujp9Qw7gnesg7UxGzJckhfYB5dPwDAUCi3X
	 0OraYkvB5JW0v/O9VS3C5RMr1y8XzoBuOgfTbvrYRv4+OO2znkqxleqEhjqjCzKYuCoHQ
	 UA7A0FwfgcXJfMOz/cWAKEqzDDcjPHFFYM6YUZjIbw/7sBWKyyROcUylaAssANrojmmAr
	 sq13JfBYTOViFYtZZETFWeD4BujxVGcjm3vgwmJkvi2awZY8NHZzD9uUnGZ9bSMU9Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718994;
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
	bh=TUKSV2LAuGKKlKGLTRBFuRObZ9b2YV7yYrkIV1dr+s0=;
	b=h4NVi8COVBtNNmfBwLz3ZmnE+BbANKHkh7aYcCAx6Eq6ckPYxzDpXR4o7nx68QG3l7V6
	 JhRN4GTBTGSw+NEBNFcr1T/whc0+EF6O2hyUIRoRkf6ofFnP9uFFuFa1VEnOSjEIlYHdH
	 mXiUGvLDlh1F1+VfNwMb215AS31cjL/PdmTo2/zIdKue1/o6vuIPmTm15FjfwX6rlGcJH
	 Xp2mD+7a2zu2WrQiKhwDjJh5Xf9g7iar7eakEq//w3hF0OUvpk0drgy2laAfWYstlxj28
	 EgRxWZIUQGI5K4IfA4NLbMlzASck82JGvpuh4lTBkSoQ0eRqhubDksPM906zUQzCmOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jM6BhiCg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.10
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97B606A7BC;
	Tue,  3 Nov 2026 15:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE97B606A7BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jM6BhiCg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxaYDeBJrS4Oz2OsJd0WgsaEyzS8VLn7hEge6krMcxr/w7K2yvnGZi6zJXjIdlzGm/WcSokW8s+Iz1kDP/2qqdBb25FWrE/sLGZrg0Ws2Luy6NriJGVSTbVsfmUACu6yQzu7HPuieeKB9yGvUcw7GSJOSxLW1OnKQLbZ1z3zanvjkin7+S3tw3udzN3ESZhvLCKDiZpZWaPxTkU2zvgHXV4te5EGTe1hG8ihF1437/Gd2Tn933tB1yX98HDXJpI+H/dNIz77k6wtcwfF0wkvbO5qFWYAZsj0WAwuys/j1hMS4bKJoiRslmcsXxzhVik/iJVyadWu7rwCKDdW/dsWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUKSV2LAuGKKlKGLTRBFuRObZ9b2YV7yYrkIV1dr+s0=;
 b=dvF+eFmyptHg503M+/OSKBRscPTkCI6/OPHVZ3mfXLQYm78rjD2yqkSJHaK4hqpvhqHWgdBf131FapwPFUhcBBpSLzRKI95BEvb0okk6dy/svWqxs9ZK2rtrPu5pxz0bdpmVFnupum0QGetU04UkYimd4m+4n2bM81oRVaL99DJZ5epz5zhnS1x6wt+yHT03lpw+LkR45UUomuWtoJ+f3MIcBDkmHvvZoj6+egWOQCaEvO66vr+E1vaj+Ki5l10AGeKNYRX78YhrNcJhlT2XExYZnvTesOFyl9hWCqa0zRnbOenYo4w3jHVia3YCIQZ1Rr0ofdkeX85ZSw9sjbkxvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUKSV2LAuGKKlKGLTRBFuRObZ9b2YV7yYrkIV1dr+s0=;
 b=jM6BhiCgph6JC+UEkLk9MpYoJo/2fSw3x93FEof53drzXCj/mtznvn/z07sEePmPe9FAlLEnQLdD0V3GEato8Q5p/CZFzZpn+BGbOWT8ENc99nyh0uLy96kS1t0gfUqfqvLqBZyDDTXVk2y+3auj6u09SBgfOQfevpkaMo+cWbLzT01x+wBhxZm1eIUEhiSlJimtTSF5Z0jgP8JKv3EsnHp3a8PBM54l4pjbdFQY+YEHEbP05ekqpsc1Qad5EimFeh+t164cgQUodgKJYhU8yu6LGiyTow5bwRmPxXFGs4vsJH/9wTFHuKnLfdv3uEOOW7w51cfS14MJQkr9ar6plw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:16:31 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:16:31 +0000
Date: Tue, 3 Nov 2026 09:16:23 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH v2 2/2] dmaengine: loongson1: guard issue_pending against
 empty lli_list
Message-ID: <aun6x4Br6rc0VXIc@SMW015318>
References: <20261103084638.1190232-1-lixicaicai@gmail.com>
 <20261103084638.1190232-2-lixicaicai@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103084638.1190232-2-lixicaicai@gmail.com>
X-ClientProxiedBy: PH7P221CA0033.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::25) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS4PR04MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0a5da4-1dbc-43a2-69ee-08df39bd7098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	sICXYI1i5Kd67jtkneCO9P5oNqzTtBgqlrwtMVfFnVDy3EWn+6s9yw0bVEE1wUpZ/aBOmwt9Z5ScYDSIQxzx3YreNzG4GjXGgJwhsoKTThd1mkrkHTzUWLlwhLq/eyE2+nU5HXZOYG2pNCV1EQlKVq/YANjn2t0qYfQfMda/q5Aaqt7dQfRNSsvXZ34ubv3NNpzGOegq1gCBcFo9it3acFOtsyHs2wlJQLuX+qvBUBF2/XYC37r2Ui3LZ0ZLHMjqvwb14EdXcen9lUtk5/IzSzO+uvylVrfo3UIrpnvm5VEPOI1sjoUBJi56fz9Uwm8K3uHhxQnkgzhZZp45marUT2B3INRaVQvpFTnc/RfhM3Yddc3dpsRkuVSCiVV4YCks0f9D8LkjUTX+SSye6Q7+1sgdBccAcz9epeET4N2+p2i2ffQl+gEe0SMbHJZ1ihWbIASjFMwcfXEmBd/XLXN2OJTdi+aMcbmr4SbK28qirnww4lfYWDVtTqrsE7WWStQajgBLRVTHToEjQ2O3zV276aTIzHvUDYcKBkLBzO0lLoiWBX9mTKfi5GAj5f3/ga7lvs5Py9IoqEZVh+mjKSrZhDFqxd4wkW/1J5ldi3HwTprExTpqWzZv7uCEeNUux5e2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RkCsFIGwa0/Ee8s4dfo9/6jix8k0IaTd92V6SQvBrM9VLLMu6DwXPaZnVlrF?=
 =?us-ascii?Q?rL7ToThokGPS7um4BBqkp1z5db3rORUIxV29BA6KvZOxKuxhlBIcuHdwSFi8?=
 =?us-ascii?Q?ycvB+ApkUh9BWE+mGENfnIyl9nhsqPjgBPh0IKy4/v0cxOo/jDb99AgL4Dk6?=
 =?us-ascii?Q?K7EnVmFhXnzzLRb7FPIbY8v4kI1ilWp0hZRs25Zek1VqJLmT0almjGMUld7o?=
 =?us-ascii?Q?nB2NkK5zsppF1Up4YzvLIJLjEqYCHW8b+/UTcDHcMloorY4URgTWf5CpNrNs?=
 =?us-ascii?Q?ybCVRH+9Y5NbegPir9GvgWGz3p8gteXjwGqMveJCDxZNj4RWtjCFcohGDNu/?=
 =?us-ascii?Q?iH6Sf5gJFPN506566CL4R2uNnxBZIqRNsy1Z8w2BMMo4q7Ov9ROb3jafCJGx?=
 =?us-ascii?Q?a019wM9djcBRIZmIm5Pjen6JxGgyhUksf4PQ3kdhLvDJDZIxWDU7V60oBJ1Z?=
 =?us-ascii?Q?4YO7g2uQVrWBBWr7yPQN8oYf8hKP7hMTZOlhr+QEWXmCr2wzNDRqEOuPD9CW?=
 =?us-ascii?Q?5O2icyWSh2ofer7vPQxI1h0yH0rqqFeTlsPoN4OPn3akSUWf9POV0mAJQguZ?=
 =?us-ascii?Q?/XBbmWJYBwGN5j+q5uaJJfMCNNCYAE9QO2P/OZKXtR6GVOGIQCHYFUZWOZ2t?=
 =?us-ascii?Q?CsoaAaqaaWL4zI0tMnZYIO5UMcZy/Q/SuZRfe8/Bn74KvW50pLWOGKRDjYqr?=
 =?us-ascii?Q?kMsPkyytCRSE0kX5s5/M2b/0ymxsfov/djH/6dNPwI0RHDQFcw6nP6OngN22?=
 =?us-ascii?Q?TE5jKv/q4i0GaSLfPBsD6T0znytNQXFKingFVYXCXQoU0mEcWTOHtLDiGDa8?=
 =?us-ascii?Q?7lE5X9DfbNcI4nKA5zsAPCoWGYdXD4h8yYnPUlqbIdOOYyDKR5LITGUNDFVo?=
 =?us-ascii?Q?wliE5+EwND5EGzSSMQ4drI8HwrxjYGhlYk0F2LSJoAq9mHrJ6HNxrMWxXawe?=
 =?us-ascii?Q?HJ2tIPLiOtWxhOrevdTtUkjjyXiM6g92sc9+R2ndS4Uto4JrUmAl9dINUZG4?=
 =?us-ascii?Q?ZMl7Pu2Gsbyku5ZHcGJYleSjv8ghTuxBV4hVgcsDHU9opUb7vd33S5K1UDLc?=
 =?us-ascii?Q?RjpscC/5rTI56e0k+nBXRQ0FsnMZakfrblZgoPPKpiQFTVimP0Hh9keFVNhN?=
 =?us-ascii?Q?O4uOz1jJpUS2Imdm/ZrP1H9PRRK1YVQy+eWi1WWneXs/dKrk6QcOIwbVK0LP?=
 =?us-ascii?Q?jYVHPqKjAVexXINHgNgmwpi+fqxI6pQtBfyQ5B7bfDVN1NmiwzAkc+tLf0u4?=
 =?us-ascii?Q?q890V8fJzegAIqLlVlb9wDx1R1ipsI1yvxL/oOk4zlrAEcXIxBsX5zBxJ1T+?=
 =?us-ascii?Q?pnk7qSkKPcA3E5QMGpBSDiLX/wlIHp1qbhU14N2Jrwx4V6eEYQTAR0hbNG3O?=
 =?us-ascii?Q?VK80rvXLqvDNS1UqfNITg4xRtZEhAG5qOjuK2eIDvaNMV8kskHQXK6bHYj8f?=
 =?us-ascii?Q?4/61CrSYW1UeLTK030w01UlZYKskeL8YgtFmO6jNEU1gAGU/W2mR3xzgpm90?=
 =?us-ascii?Q?i73hhmQoCJWnITkTEsJWZNAll2QYb7IxIfQDvAuUZI43Vxhm++v2n3ert9cb?=
 =?us-ascii?Q?jnVBCcOjs19nsJ5TXyQT6ku3tGRlbTse04ypsKaPEYtSOi5fnw3MhUK2x3Fc?=
 =?us-ascii?Q?JdMuOAcBxMYDGYAVjGzLDVbLxMcqJqOQ//gMQBQDbw223CB9Tinfbg/U5p1L?=
 =?us-ascii?Q?D/nbimbrIaP+xB+9Iq4qtofKLsjnJl1b4HjbhO7xYAvTK9DizUFO+xepAWKF?=
 =?us-ascii?Q?5W/9Z3rghXAnanLIaNDY+/U+O4RcCrBW/3g2b6wGjMto7Rr+W653?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0a5da4-1dbc-43a2-69ee-08df39bd7098
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:16:31.2751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNkTXjGCg4Jlj0XEiHrKcFAyelj9YutUFpa67EO+JXkxSXNa2sv2gvyPHRNbYIfweqd9eN7vBNG2do7kv9achOvn1iFk+C2nvF4Voa7ws7ialXjfYK5egjAG05fyw9NH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9624

On Tue, Nov 03, 2026 at 04:46:38PM +0800, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> ls1x_dma_issue_pending() calls list_first_entry(&desc->lli_list, ...)

list_first_entry()

> without checking whether the list is empty. list_first_entry() does not
> return NULL for an empty list; it returns the container_of() of the list
> head pointer, i.e. a wild pointer into the enclosing
> struct ls1x_dma_desc/virt_dma_desc area.

> The bogus &lli->phys is then
> passed to ls1x_dma_start(), which dereferences it (out-of-bounds read)
> and programs the DMA controller with the garbage address.
>

Cut this paragraph

> Switch to list_first_entry_or_null() with a NULL check so an empty
> lli_list can never reach the hardware programming path.

> The companion
> patch rejects the known producer of such descriptors (sg_len == 0 in
> ls1x_dma_prep_slave_sg()); this guard covers any remaining path.

Cut this paragraph.

This common issue about list_first_entry(). Keep commit message simple
and leave important informaiton.

Frank

>
> This issue was found by static analysis.
>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
> v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.com
> v2: split the two independent fixes into separate patches as requested
> by Frank Li; no code change.
>
>  drivers/dma/loongson/loongson1-apb-dma.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
> index 89786cbd2..e7eb40584 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -478,8 +481,11 @@ static void ls1x_dma_issue_pending(struct dma_chan *dchan)
>  			struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
>  			struct ls1x_dma_lli *lli;
>
> -			lli = list_first_entry(&desc->lli_list,
> -					       struct ls1x_dma_lli, node);
> +			lli = list_first_entry_or_null(&desc->lli_list,
> +						       struct ls1x_dma_lli, node);
> +			if (!lli)
> +				return;
> +
>  			ls1x_dma_start(chan, &lli->phys);
>  		}
>  	}
> --
> 2.30.2
