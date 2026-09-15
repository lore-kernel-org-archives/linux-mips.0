Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE30C43DEA1;
	Tue, 15 Sep 2026 19:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499958; cv=fail; b=WQf/Fh2Er9xmw+QgHiXd0WSsOYMQtgrpHa244ArMiLLdYRQnXts9xmuA8YdvFn6TcB1ZblQnQX28nUXlbOfz1Ua7wvoKutlTC0qblNb33qCnXzOl2wY4ymskgeLaRbnxLZKoEhZOt4fh6OoBdlSBq3fYrLWch1Bvz0aLKWKJdTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499958; c=relaxed/simple;
	bh=FkaJCv3z/MbtOdseLiQmQXexJ7RT4zsZA8v3q1lJRPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pzgOQbhd+yU+0XyIjpToCnvltPvuuA7wV2sLNrwFij0pqhzbADZzbr7G3YP4UNiNyxiDJIH4zXs7w9QVV3ezTfRWCi1BYFhRP22ltZElvz2FEivJfuAjAGknkhsaD4pyzA7LL9F7ivAt0sDUqsn0bG8FecG7vlAmwU1PFcinXYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MXtn+ypC; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MXtn+ypC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+jlpSHYb8Ub+7In69YuGfyaOJ+tFKySG2CDmEeUTaxMYBBnYQM2h+La/8RZpYmDkwVNJz7uNTodwy7iSec864rrEPm7kPksFGQE/+O2aMTeLo/4r6/kAvTkxcn98mpKvMkv5MDcIKiKoFPtNqivTwxgPKwLhFqycWRd7Eimmg1C0NDZHdfqJBKgqpIgjxbOVnI5gouG9QYxqdJHg744GpSFjsKPdFAij66qd07VIVBnFVI6FYxEGE5bdiqXbvLKe1KjFopyQvhK/QFCQYcSBLKVux8HjlpTSnv1P0IjBAds5MEYKsketfH9eRoTSAQTxkyhgHRmr7GIs7HZHgoSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGEyexUM3TOflQXxjBCztXzUGGHWXzucmQFVFrhlCZc=;
 b=J1gcm0UyOqq+RvEuGrH8f7AChy8RPdUcPBUwg74bu5SmmnZd4RE8nwOElWpjX2HTWDbcOxiQ66MuJUG26Esu3tx/Ye/o7gICBoWS7g8tWTc6OJ6bYWLP1g99loIkkEitRWNIPwlOh+TsK57H6m3djmP+QuGPwvrxxc0OVZYhUV0VNCVJRCVCWiq2oz4DOrVoSO8GS5F2iUW5w1WprsPd7XVlSwykhinYOFUM2qfqS4Ed3uvU9yHfTQ/0al9MP4WpO1iHaKnM4mu//BOkgAi+Q9XtkSgKPcZlCq4UcEhO6EV/yU4Ny14KjUcBBEdjKM6SPskOL5+ktXXF2xlKefwiXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGEyexUM3TOflQXxjBCztXzUGGHWXzucmQFVFrhlCZc=;
 b=MXtn+ypCju6sr5aiEBE1c0a3769o59wuvd9uXQlyhnHK6Jahxh6DNw7dBkgHI5GNj48P51H/6Er8lfWgaQHPgxzRQE3wBmnG4iVzeTTcYSzkFHXZ3WgfQ1zt0dmHSwzmY8T2EGfQtGJxmv9B+tcsMSCNhG037CEOlOJeHmapANoFrXhhpdqO+CvTHQgEqcOwFboBfIHGEuPVLMw1Q1qY8ghBsAJRyhhKQadUUBd+DzfATekE2H/gmzRp6bdfUH9CRQrAh/0lwxdqusL+WRB1g6LtgMj8dvrZvn4Ce+EPlL6lnEQ3GW6LhzIg+pPIwPRBvET1d6eekGHLQvxzEfxUmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MA6PR04MB716823.eurprd04.prod.outlook.com (2603:10a6:250:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 19:19:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 19:19:12 +0000
Date: Tue, 15 Sep 2026 15:19:05 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
Message-ID: <aqmaKaqt0tHiNtla@lizhi-Precision-Tower-5810>
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
 <an9teadkgwUsmMnQ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an9teadkgwUsmMnQ@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: CYXPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:930:cf::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MA6PR04MB716823:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a26c6d-30ac-4da0-bf9b-08df135e3969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	blbBOzsfP3QXF1yc2DaPZOoKpQJ8+mAVLqviES8l+0HLnXj6BHzufKJOEza27BrDjjp1XRDSFG0RxSNyyviGHd7xTkKoDFatj1JnCG+wpF0XdXlQI/sbR1F0HO0bVeIkuEVRN5S1Za3SETLJD6ksmKhcBeslOQ67mZs+EL3AuYaPgjc7F95ovjTEhJhfs0XBwleRPIYeOOHMRZBp1+HwY8K1UO/cW1499i9SNj421GzGULPTK6Mz7gWfH+44MAfYxOJnYVrVQkTWytK58DSXvGodMERjHIWFCAYYt/6OwOT2xYmg+RyL8FzxBSB57XeUsDq6FfwdWtCFsewMEt6KnVeuQgDSJoNvFXJH1Gd/7+K4MyzlZ59U7bYtFYbIhHqAuSvbfNKpDytt1woUETR4WWgQUHx0GSiEc3ghhM8rsNm4TDEDJ42vzkL3ZXzG0qCACKDa/Jli9JiPIyQT26cptFAkc7Z1x/qPXGW8WLTOuJXe7KDUEK/Vh4keb2VCufvZ9+cIBA9mJGlBznSOJwfsJuN5/1q5PisVewBzKZChW2Pz2qmn3mO5g0haGvcGmMSs5xSKC+7pquWboKU+oTMioZ/pWRUsnH4BIMdeDe/FPXlxtIQlleV0h9Sb2wVa4TOcbSZ3iDuXA3O9wyEfOxuEYsQmj/V7+u0kgmKc8Lqpiqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xV3lA81AqH6TR0n57DqibjR6MHPfyPclz7WxdMx+18HEW1sE/Bkay4086AoC?=
 =?us-ascii?Q?g/bb8zsAoB8XSmgOPqpCDpDK0I3mj533kxs4Pvt+o02EwhVGcQsxENcoAoAK?=
 =?us-ascii?Q?ndqCTYJkrgRagCuAHDvAhK57YZEkV/b0wsLa6/v2F9LYAdgRmHlAi2uczYrY?=
 =?us-ascii?Q?neDeysI1oKp7Jq5laWwDxCf4CXNqFaVpXbcheMqjqv2+lR+e0su9nPs/c0rU?=
 =?us-ascii?Q?DMKpEx4w51/xbhc1231hIdRqpjcZZ1RqCBH3b747/Ddi1KlKdKbTEX94cX8k?=
 =?us-ascii?Q?yhUodXFH2zH0PUkXOf6eyfj0hQQBG+f+9cLBYPxZwE4APRek2OLtOYfTsMyy?=
 =?us-ascii?Q?4KD+/LMoILkBZMWzBJc5o5i6Ncf36cJ2wR078nzdtOqM3d2QCo2oraxAIcZN?=
 =?us-ascii?Q?0QS7t2J5Akcd2IErNSJEAe7AEKNHdgVfBA5luUR/EbqP/kiwFNfLCpPsTZfx?=
 =?us-ascii?Q?ZJn7ZH8spcnyLfdV2jveHv4v6d3m+Iuhii3D/ZMA/pJyfG8WQrornescEBcu?=
 =?us-ascii?Q?0gC85Fa4AaVqH0KoyXIIfCQoDPQ4OPuR6yF4cc45l6ANPaMQQJ46hRI0fKc9?=
 =?us-ascii?Q?DtkM3hDkrQChInvk5hFd7Ugc5jqmeKqsU9YDM7bv65C7YGdneaTjJvxpfcq2?=
 =?us-ascii?Q?g+yy7HvF7AKy5+DzQL51fc3TWZb06eH86MSkOZR94uR1PNcZsmFHYApAwWX9?=
 =?us-ascii?Q?iSYr9KAsqDAW84aEUiK8NH/2IpEPDvMXA5lGUJrOl/BHII+QEIzwJDRqBrmv?=
 =?us-ascii?Q?io1fHoUy6GbPmTLM+UlC0rn36K44akOHebaclPpPcno3FVZGtAYWSJgbVLUN?=
 =?us-ascii?Q?A5IBfLOhMuMYjq9gbfxTWTl89JwuUYS83kN1YDk950ypWJ/ho050PUhdqDFx?=
 =?us-ascii?Q?kmY3vNf/lOobXUwJLwhaCYE+smpmLhLaLG5Koz2ebEWbk2ZpBreinSJ9guh6?=
 =?us-ascii?Q?cbEutdvBSec2l52K0/YT+u12encit0vRBp/7f2Iof8y2EH7+/bwkJlK4CKou?=
 =?us-ascii?Q?olLJUIPrNMrdnO3SXSpiKmAWyBE5K0LEIOmJ2ZybEuURFFkKnEsEGdP1hVW7?=
 =?us-ascii?Q?RbzuT6kR/6X22ZK7gqpNTpfpwsC1OXSVBRTozHe241ww0Spce/HHOZ2a+5OY?=
 =?us-ascii?Q?ENBJxAZHcLySq8I5it5Ed1hVSzNhVblyflBlWT3kZIguu4SQuuvbsXoj6dbk?=
 =?us-ascii?Q?MbpRq4Tm2kwynDyTtvsRg63aVtech2EDOyapKe7mwpwBVwfhXgUe2miY8U1u?=
 =?us-ascii?Q?Y0h/CaspuNeCtwT8H79v2vPpM/D66qlbNq9wwCSBDfPWdesdhfuTZsrLIBoM?=
 =?us-ascii?Q?MQ9VjTSz71j0Z7YMGjPpa92A2mvGkar7SyE5I2W7pk8rvo22wNtFJjWN/zO6?=
 =?us-ascii?Q?L1eUnRUNG8hmqqph4z0qsULogmtUFrlbSyfTovm6F6klDe2PxQkt2GSqdMzT?=
 =?us-ascii?Q?+zaIXfQbdVASyje2gMirxWMvGgwmxLEJjo7pu3K/UxNN34IXEmAcmTGZZC5L?=
 =?us-ascii?Q?hzENayNB9RRSHOH6r5K2a669a8a918UuFyg1G6tK9fkbQD03hz9gmiMcOwb4?=
 =?us-ascii?Q?HnT4ulYSAiw1YygbPgPG/EgcfSdH8o4KMk6IaoKQ1PHRrnVI+PqK/Wgo3QST?=
 =?us-ascii?Q?WuW8I3H90PXDeR3pVfJKoqghPh/vsybqEZWme+cZkuoLtnFlue0fl1howtZq?=
 =?us-ascii?Q?8uoFB4tubt/90yyRNkJc8axfvCMNqMwMwqaRJx5F9RoxXyMzs9xy2+yQj4va?=
 =?us-ascii?Q?ZrXv80fWlqGXPnjJt6E0WL0jrQIMNOyUfIU4oMxPC3pCOIqQiSVP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a26c6d-30ac-4da0-bf9b-08df135e3969
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:19:12.5004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbv3W+66YfLnR9um7Cr2z6V6XR9/8m9TpRAshmmli6EVmsYYEfSzh0JEyTOQqz9b6dTL2FWrDeAWxJCZok4J8zvF/o0o6RvKbrvtxkSpS9EvUAgAQrOXlmsXEZF4nG3S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB716823

On Fri, Aug 14, 2026 at 03:33:13PM -0400, Frank Li wrote:
> On Wed, Jul 29, 2026 at 02:32:47PM +0000, Mahad Ibrahim wrote:
> > ls1x_dma_tx_status() locates the descriptor actively being processed by
> > walking the LLI list and comparing the hardware reported next descriptor
> > pointer against each element's next-descriptor pointer.
> >
> > A list_for_each_entry macro is used in the comparison phase. Which at
> > the end of the loop leaves the lli pointer at the currently executing LLI.
> > However this also subsequently runs for a non-match lli, in which it
> > points at the head. This causes a type confusion bug which treats the
> > head, which is a ls1x_dma_desc, as a ls1x_dma_lli object. Additionally it
> > goes forwards and prints garbage via the dev_dbg.
> >
> > Fix the type confusion bug by only allowing matched LLI descriptor chains
> > to print the current LLI and residue calculation, as failing to match
> > should be treated as an unexpected condition.
> >
> > Found by the following Coccinelle check:
> >
> >   scripts/coccinelle/iterators/use_after_iter.cocci
> >
> >   drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
> >   reference to the index variable of the iterator on line 450
> >
> > I did not see a bug upstream detailing this error, nor do I have the
> > hardware to confirm this bug or error, all this is from a pure code
> > examination.
> >
> > As I do not possess the hardware, I cannot test the patch. Compile tested
> > only with mips64-linux-gnu-gcc.
>
> Avoid post new patch on old email thread.
>
> Just simple said
>
> Compile test only.

Please updated commit message at v3

Frank
