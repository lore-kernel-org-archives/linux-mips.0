Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4329C3BD642;
	Wed, 19 Aug 2026 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153847; cv=fail; b=qmyIKbwrNcj3ZJC5W2jz6rSJ6Z46T1jPl1J7uzd1hO2gQT73sPbe+FdH2qofoZQyXsvlhTKqmiyEWMEHQTwZKKEYSxlgwU07vUiMciXxUCNWQCGk/fbKqrnvGRXzCWKbG1MCFJGpqN4F3nwY2OZoRneo/3vfVN4Udg8anpIkq/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153847; c=relaxed/simple;
	bh=EOQPpNgBcJvGX4uxjfMzNO+rhWzOYjUjd8lH2Y4FPZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kfAT1zSyVvCU6Nhx1rgnCQzCBjWD58J/OJzEyRd6m7VoYTKtcamAM6Y6nkA03LkdDZqOkGtYh4LNR2+dmdOVO5hS/ppJWEhacURttFhkraHVMHidFX37pqCBjzVZlCBDFuD0grzhzwIjiqGek22H2hofFsmcako+pl1hQNHgZf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pukOJoel; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pukOJoel"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hk8Ugzsf0UPi60OFLsibmidbym0YrwvBEMv3Vlu07n/8gOyQCO+TbRjOARbAi/2JArKc55zqt0AVVN4x2oFKpSpTJjgp/6qpD75aysDWbkHeHX7cXfVMqRd3tzGd9A+mERPzVmZaq14ReZJyIpCf3ern1ZoyCA1NfTBihWokyfaQa2BdTnTHdfDEf7stm1OC1u+yshKgH5VZTrK33cQ7gd+91jeNE+w+iKnRXLHTsycHxr7Z4N9929j0OP/uMSHQtl/D9HhTBzOt6YxQA2h1BXsnbHbpZT9Aau2DdPEvATWTGSz3exHomSpJGj21jDG34UCbd5A4hWQRkm25Ih6KIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOQPpNgBcJvGX4uxjfMzNO+rhWzOYjUjd8lH2Y4FPZA=;
 b=h6kw8TDzfz12faEfySopCvm0YTWNURcibrR8Z5an0F6lDCFvznSTH1VmzFJY6G11YDEJoeZ8CVp4gA8ss9qjQCUHoxw6Mgshhxmmk0qYTRnFfMmGo4AhBeX5TTw7XxZPI0HMC6VSH/F1+pCGF8CmzMT/bvAQsU5NmJXlzqu6myQ+yszNymh81BTBOUF7R5iOpPPcTaXfn+PEbBORNJHxFEcHR3zDFVU1JvhH7ZquiJE62QBuY9QrPQj1TiItcF1oZ/ORUvxRQUCuqoY2W0B3weLFDIf05akXMqd+DrTpOy9CbJATpBqqY1BKkeciDn1AZx6vzoDkx06X17Sg33iLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOQPpNgBcJvGX4uxjfMzNO+rhWzOYjUjd8lH2Y4FPZA=;
 b=pukOJoelDXWIAy42PpUfjyGnpFb0BchNoF4QKrGfxcCUzZ+L+p6eP0Qf8gJ7GtfhA4n2szgS9wm663kCaW5XxUXZjsOuReck4HvOpeXtnOVtqGQ5SCJVjXK/8bbNbxRELeFDjf0cVeVW40Z0TYotGxrFjxdt50753Sz9o54RFo2r7/TfhMyHHitFR8W2hSb7uHqXNY2bnf7/PkbQ0aVTkLJL9ZjDVJqZnMnpWGyb7KS9Lu67pE0YC2lDDN+eXer7CwQdWBgHx0YpIlgYFcEsobvQAuyjYlrbKALdrTC0J8r2nXIBgSmyBu5BClYZrQX9bE1m5WrHQQklQ3QP2rCV7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6852.eurprd04.prod.outlook.com (2603:10a6:208:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 15:37:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 15:37:20 +0000
Date: Wed, 19 Aug 2026 10:37:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
Message-ID: <aoXNqDisf6NPAbdR@SMW015318>
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
 <an9teadkgwUsmMnQ@lizhi-Precision-Tower-5810>
 <735044e7-07e8-462e-b94f-4fea1b5b1838@loongson.cn>
 <DKT0L6TUJDS0.1USKEHYON3OZJ@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKT0L6TUJDS0.1USKEHYON3OZJ@gmail.com>
X-ClientProxiedBy: PH7P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: e4563243-0f84-479d-2f1e-08defe07c170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	NiDvSnuoh/OMNoDVzdUPqyVSsA35mcMAyVlgwDKfLK/KlKxzqJvyXG3/q8f0F8JtYCLST528lvphk+BNHk0uTOmpwl75QRFS5tF8+x+Zz5um25t5WujngASBs3rlyt5UiS4sp3IzI6M9wOiwmf7kzSLiYtczmFyUdUQp3UQdiDnCV9/wDgWXV+42DjjmdMkEG60CvNWz45SO14tR2qW4nX+vk2BUE1+GJ5fDH0zqeLkeheA7FfGeC4ki5WhT0BNBuI1JtzUaGV8QTZEbSy853xaRPOOLrjEGecsLQDIaAVFTOqfAxJ65etIdAgvyhUDneG7xZeR2e8NQkcHWqr1wn9XvFN1v1I0thCTpj8az8OGsE5l7sSbUbrPXBZ9BQyWSpDHc9zKD6vH/Ck4GX0LARvrb+LEZphfiS8dj9OdWnolz5xUdowZ+3xM3f7KYm9J751R7Al5cp02fgHo/PNHC11hadT0c3G42mIAh1OwwfSEAgwsFV9oCPOuhoV3rStbciFvHs6mNhc9ujzS0tPS8SSS1RZWlbAtDnKoefyOVtyW+pO5q92BIzMMz+4f7XsLrkizH/pye0tiI1itNx02eCTeMLmO/VqktyIjlCA0Q7HCosjpfqYNx7UKdyYFQQYFIuLe2krSdQVCCsM+7ss6/lfYShkN0W4lC6AEpqAkjw6E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oBbTEXFny3GiDoyPLFByq+tQHc0Mj0oM/Bnf2cZj1rwvTCNEb2Bp1ljn+OHj?=
 =?us-ascii?Q?0wGxJhTnYKcOtVqtjZ7AIA3gIrJqKk6yePxVuM/YIQgXpe0FptnfwFwVHOyg?=
 =?us-ascii?Q?tSIL6dPYO2Cpidl/PE+anXPblVb0J289tUfKWmX9HRIeqhxr7k2Hdr3RF5uK?=
 =?us-ascii?Q?pX3Ql2Kb4gwBjo8ZDqILb2NxljjSiXAaAorj+ZsIJDw6gJYZXMD9iA5HVqI2?=
 =?us-ascii?Q?RYm68j0rRUVlAAmuGHF9og90W/I6V1BP/Xyxngsg/wODZApx8Z6QvSlzv4ji?=
 =?us-ascii?Q?RnJC8W/MksCbyyRAkXdGwmQ9sKljMat3tk6tE0AA1IB93d18t7xZZf+BorBZ?=
 =?us-ascii?Q?GJzl8+rLNkGQOu4hG202nXDxDmpXsGOJkL+eGW4jCkrUwkAiSWIkmGrWZpWc?=
 =?us-ascii?Q?Sr4Md2lvhpT+2QLU5EfWPi4ICDJpNRub1kp+6ID9cpzhx+gHDA8QDMzvUGOG?=
 =?us-ascii?Q?t34eI94RM+5o0o4tSziBwmol01xzWJ2Y5x2tpKfnHbOi8ZSZDyoJqJyRy3If?=
 =?us-ascii?Q?yM6Tp2MfmxC0iohha7881T8w/BzMK1Bv5gjBf9LHpgytPq0TWRtKQs3L50hq?=
 =?us-ascii?Q?SM7QvK2jCwZmQsDiIddC/1jxVmaLhI8ykSeYINShFj6UeKNyqdPlGBUg/yOY?=
 =?us-ascii?Q?oI8/zPhmR2MRyp87rfNyrQNNzHi07++zPpqj5NZeGFql0JISFxe7JGaWV1f8?=
 =?us-ascii?Q?LXXdRTSnFsMYMTCpKk9kgBBVfEgQP82Uwm0WrNroJszlWeaX8ZaZmWXeWP+T?=
 =?us-ascii?Q?ROh0AUUw4kW+njYTTgSRezRhBQPc4yEiLEM42euqcSx9Pt2ugfPSOAt2qx8q?=
 =?us-ascii?Q?4/1OpPuLND5YlQJ+B+HhiRGlQOx2AXSIq6O2p8WAnYD1y6yTwLX7x5jDI0hV?=
 =?us-ascii?Q?XJIUwdu1yMRq25BTi8VGYZ1N8FMqoXJWMSzKUXcb/391UWZJD9UUW2EoqO+6?=
 =?us-ascii?Q?CeC1nQxQfqPY9RvMgVV15sLr/N6YfjOYk/xzyWWAl8vAh3cAmZhM9UC/Z0Uh?=
 =?us-ascii?Q?qSy1D1OJbMnQILa0xKfDAWzn+chBocIrv3OE0shoY9KqAWtxLrftgP7Noy61?=
 =?us-ascii?Q?gPkATie9P/lgG7lgoxF/ke2UmlDu3DeJrTxjpD8xeHeKPDwvMwkviXFDpPna?=
 =?us-ascii?Q?F+zXK2omUwdb5nCmF3NFPCRGgXPk2ge11JpRFOpJGnBa4YsXk4zsUzMc5gL2?=
 =?us-ascii?Q?UWSX5zIBF1rZHCX5S8cXvyo0NB7roCCLBsN9cutxV/3U270RP94cZLqZDIHr?=
 =?us-ascii?Q?o6hdkZZclzsL8iFCvsNnlFsiNXGY7qQsoJlRWaBDzSPKNVJtY6LzISwucyr7?=
 =?us-ascii?Q?gSr4HO3d9fm0vsvTOYFLzayOXWv1xiHSUmkdr2+zbqfS0MXrqrNCB0Z2ad3E?=
 =?us-ascii?Q?gTVYpPUJS3puT/tu7bFCY6Gvtyjx4bRimmLmtieGASHvKOn84f46q21M3U5T?=
 =?us-ascii?Q?Ec5K8ttaO9OxhXR/bvu9kZ8CVaezYwxPGXmivSxPF3AAc2mw5SKfetQJpLud?=
 =?us-ascii?Q?IhDfFu4lY3+jnFPd80Ffz92dnmS/kEbnbbxuzHTXhIV5TrOLdb5MaFzpIpHa?=
 =?us-ascii?Q?STlWAGIC6QyDriK6Vseb1ZN7KchX7UYvpCzxLJXGq6GjErReARvqgE0zg/6f?=
 =?us-ascii?Q?KeZjH0RpcCx3DwFYv+r5NJOUe8pfWdmqYTKELx5BTpiXBFZOpbxtUO16//mN?=
 =?us-ascii?Q?D+nVQnsB/LIb/1ZcQ7lg97zvtG9SnnMik4P09I36Pa/CKDfgHzOJ1Y6KttGN?=
 =?us-ascii?Q?yGPLoQ+yIYwPZLJtbxtKpmAgeyNBCHGV8YSWKEUeMfCvwKBixW4/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4563243-0f84-479d-2f1e-08defe07c170
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:37:19.9658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvoMMB680csre3kfobyeO95gKvTfCDK8fgc7aqt3As8mBkdpUKoCbA60MsyD/vOdoqX0Rl9e8bxBVeea+rzukVBxTasVD5oUjMSbM6TWRc6bJ2TPdrGqjJ0SqVOH5ni6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6852

On Wed, Aug 19, 2026 at 08:10:18PM +0500, Mahad Ibrahim wrote:
> [You don't often get email from mahad.ibrahim.dev@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Mon Aug 17, 2026 at 7:07 AM PKT, Binbin Zhou wrote:
> > Emm, sorry, I don't have any test equipment available right now. As far
> > as I know, Keguang is the maintainer of this driver, and he has the
> > necessary test equipment.
>
> I apologize for the late reply Frank and Binbin.
>
> This patch has already been tested and reviewed by Keguang Zhang who is
> the maintainer for this driver. v2 was based on his suggestion.
>
> Link:
> https://lore.kernel.org/all/CAJhJPsUmpie6NkrzuTK-8C4NP2FFKQMG3nY8626_C9Qjdu4M0g@mail.gmail.com/

You missed their tags in this version. And avoid post new patch at old
thread

Frank

>
> Thank you for your time,
> Mahad Ibrahim
