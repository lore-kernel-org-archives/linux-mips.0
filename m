Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792222;
	b=MDX7XdKK00pYffADvZ8U/nGwMO/3lbIQEmTOHJNgCBVhw83m5uivQFS4hEbWlt6FIMAL
	 FyrD4Ak6pMvyWnN2HHI5VtrMo8hc163UzDgfW1fHPn1GwktXBECl3iy3vDhx2L56ZYqmH
	 66nXMtdNCfxYdcSKXR+8ZBuk6QlAKzwx79yiPWaGFeEbZNAmcX9YsUKIcxGnsCXzLhiBP
	 nuNhj52nz+ete5jM1bCCNP9882etlJtYb5SQmYOjJ6qEfslip6+OewPw9BH2t4KDcm3Ty
	 p+ESxuvIK+KK6elRDIr63PYy+1DfVPRmyF+XxQ1CKzvN+DfAma871SLkv6fZA806Dow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792222;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=QtVfgqLf/FC1enRJUxfRRYjCBo1KOa0huSd7vZP6Rjc=;
	b=doVcU+IzYzhbWzcRNtR74rdFwt5REev3mOwj2ULW7nV769WwvyBhC0BPa4ApZMnrlH1N
	 K6/850EgN909Wx/qLnK7M5OvXjlpKh4Vp9qNz0YYEKa42YTvkUTYp+ivQ4lSOdNoPJ6uV
	 u3nsh0IE2eD+gjjGvbrdtQ3zxvBc5FE8OKbMxfHYGu4uv3M+ZmVwTa47cLbl3/NTC4K/G
	 FAVx5hEQRsr3YYNpEVdfxfcBI4FoXHYM9XuW8kNkashFQe6kENDCkxzu/8pL4iEt0rVw2
	 1TqKTSFkASt8PAtbnbi+PVq3jIxGTVuG/iBPD1KygMUKeFJuqkN5a6PCl9FXAOTkCBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JhPYiiDR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9AC606A332;
	Wed,  4 Nov 2026 11:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9AC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JhPYiiDR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpZTaepZhOkh3V8yZ5YaCkVMeNE2F0dBfVQckMV7E+qYD7I8Malo47C6oEeAqre8MHtLrjDQT+igtLCbepoI3l9oXMMuB8Hp/Ovvt4YCU/hp4CLckXES56Y1xNWHYS17N5IcASW6i9RrGfKRDtHgRf/WaaGjvYH7GwpT7VssBDibRJIozVMAcQb6A+xBtKBHHUpRSW9B5YVgDjsqVbhPpMZY3B12ZfL0sJHvEJOp/4UkN4qhVL3X0041pUQmnMM49Dv68MKFna6Rx5VDArxbsV5BqMJausTCaHMZNZaeVrMEK3fqasay574h8FDY59VlQJCL2N950xjkyg5AYyZEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtVfgqLf/FC1enRJUxfRRYjCBo1KOa0huSd7vZP6Rjc=;
 b=ANl0cLL8OCAdlvGSU9RbCNL63Jyinrhn/I7GH+Rsmxv8Idt4E78rk4EMxsM0lu/8UnjT4Z9aJjDBatpjT/zD4JeahIa0hFLxQSg9cPvecgXl3b04U5p4SB8T8/CGUORv93XyJ6gh6/jZ4E31zkfCnWwBOBGZNyHZI6O/5oYYKJ4hxha9vcJrvjrpvOYpSXjBejZFjbYllJnxFDChFjZWkiJOwdNnPuO/QjefrWwczrwFdMs8CTMaxfbRSZaG4M6EfJjdiUWCoQF2M52Q+3GiRU0+CfSQuXm6EnxcDaDdvDM+i7Y6re8lv/UFePzQReeZIuQLsqkgBW+YjuN/SaWKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtVfgqLf/FC1enRJUxfRRYjCBo1KOa0huSd7vZP6Rjc=;
 b=JhPYiiDRg3Bs1ZYCwPsDKNWPUZTBGqsXhdeSOOb3nmIR5D2/CMrwf/jFJ1+CMB9owGExJBn83u47/LsbYcmsRX87FWiNOtsvHEIYPNjVYx7Fc3NxymuhJDTlvBLUWm/2ArhxMqEqq/M0ayAzrHWzg0RrjRFwivdRZQmj7z6HqkDINbrSiJlTyPN34yKibJSqA3xdM0nUwfZsTQUU1AMbmGrvmGRKFlafcmZxMgm2nItgdqR1sBsHheZOmdU84n+i150kHwgAH73HoNLUnUNsFgrEf5e18bEP/bChPVBNgPxDxgFxWr41HtPNTaISNR1daT3ae5DxbcpCaC8HTNDK7w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:36:51 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:36:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH] dmaengine: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:33:02 +0800
Message-ID: <20261104113302.1634102-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f480b9-bc30-43fc-21d4-08df3a67d8bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|1800799024|23010399003|376014|10067099003|18002099003|56012099006|11063799006|261021135927099003|261022105027099003|261009223027099003|261102130727099003|261022075727099003|261026121527099003|261028144727099003|261021123027099003|261026140227099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	wZ6QM4ShJnWZS5n4LDH4I6ev2Kns2yQpQlZ1k6BXjhw4UuZnjZ07eG76OKIMwn4EXzRHjbyw+rYX5s4Kr8yH3LGnMGrq2XRXV4Xg2V4R8MhGbUfBpvPWEQo7igPzOJe9tRK+20mumDGGIbtyseyPrtbaGl5IDg8Vd/vTJ53PdWWTjMILGuRZcXKdxhaqbbu+pJiEIOYdsjkilC5ocsEVcSf2aKXuHbZA+q0I68fOdiLmIVcTe0YsZJzDr7OmoM/yrNYT8LLJ0tOGyG7gTK4nhba2hkT89Q84xeTHe6P8sgrF42vpKWHx5weswBEu3rwZlqFCdgw10GqUt5Y3n3ccc3xetaohRw5kLPQQUKM42VH8tV6uQ1dD9M+2kolbaw8kE7ZAzERtE0fuT2gnBpY/df11DSD3QvM922p3+0Z6owLU0gNKSWiIAe/GOD02Lv/T504/p5qwdFRr08/Ow5vIXBQubO3Ra+BEE3UlLrBGAxeydZhrxtL9fVqxepvsloRUqvT18dkmUly/SSYeaOrFvkPi4pFBVkV91enBGcpiCbrKVEEvO8FL/QkChzfgZW7Fk0LEQXZu5WLlU0YG2anqeteHGDvQu9k4/rOe/G1XnXUXM3F0Kmf6GbV5SVgBhMrXUiH94F7m2YtJkPfXtk5Id5bagUfJ6ELgmrBn8LOdwKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006)(11063799006)(261021135927099003)(261022105027099003)(261009223027099003)(261102130727099003)(261022075727099003)(261026121527099003)(261028144727099003)(261021123027099003)(261026140227099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DbQPaK9hnQ+AEjcUgKtrOPC4Gre7Ka4Bmk0iOYpFJArqsgry86jvFJY1F9Jt?=
 =?us-ascii?Q?A3QQCHjKAaxWBK0XfUlPAqAtP0ILH93hx7SBf0qfdfACbtx5vKLNmll1oiWU?=
 =?us-ascii?Q?nWJFiQFepsuL2mZxzE3xtkkaFeYgumwyCekgpT7ARcsCPXZyGPACyn45CtbU?=
 =?us-ascii?Q?Njnfq1PdLAa89iMClSXyF3EwuZNg3Lheh0U28o0jeYu7izSvLZJU+ZyyqewP?=
 =?us-ascii?Q?AqMJ4Ve48m45G2Dv/Mc9sh+lu7UvlLpSLO6LLltA/bL9QYdXL1cSwCn7R/6D?=
 =?us-ascii?Q?jb1nED7NV4ntungbnisXLB+BCw2IRq9JtJnNoUohXzdeT6wiY5QvxVov26N8?=
 =?us-ascii?Q?KyEAeejrahNisLJjD2km/qLPdoYmiJtbQ96q15PqQrE28UICm0t2boXhbUtt?=
 =?us-ascii?Q?NYHUxmk4F38SOE5MRHfDrNnrXfhHdWi2bRcrhW2qHHvCEj0Dvaj053OShLvS?=
 =?us-ascii?Q?Fee3K1Y7jhJByPcjPSdnaGlawm9K0KZYSZXQnXSsn2D5BlP3qXdViG3BPDPZ?=
 =?us-ascii?Q?cLB8K9XgSi/oKFZddb0C1v+S3GyRy37f/1lMaHsVdKmeeqM/G2Gtjl7/1nQf?=
 =?us-ascii?Q?VEylFLO8HFDfbkFEilCVCdEJ1J5jrEHpSBL6b79eNiMaEfcWpBMP5gTEUjeJ?=
 =?us-ascii?Q?qzTMAlb280riJVvnfk4S8Bg9BUDn+/9mla9R4EslsZvaNsm7IlIQ3qtg/z0u?=
 =?us-ascii?Q?7+KiVOMJY7DC0ObqgA8aPP7QqTq3pKMAPDXL0DagMPfXzXaozVzdltg8TzKn?=
 =?us-ascii?Q?5OTDeF37AhVRghnaA0BlaZZITkEItrlGhtuRz2yuKLeAaFCQvjvuf1mbGB2q?=
 =?us-ascii?Q?GuDUXaY1aG/e11NEUnjy1wJKgYTKs7G0hLuE8hzyz5fHvjdhSh8mGLOzTF4J?=
 =?us-ascii?Q?YtaAJlJvAm8bHye+DeWGYiWU+w5gGDDGUH1kEksBHGogY+CXHykNJ6myB0DU?=
 =?us-ascii?Q?DYNl9TsPBNOX2TrqgqRdGCcqyYP5B01DSmWv9qtb16mgx17RG0j8ZNaP9GOm?=
 =?us-ascii?Q?LX3oUdbBvR9K4zKoif5BK+7qgdak/j8vmID+AdWVEYMcLjg7+EsvlemlBk/s?=
 =?us-ascii?Q?Slt7wcbRCDAalkIdtrbvK0CiLiGVU+E/g58AJWwVkZ+wuWzPW+eZXicDAi2A?=
 =?us-ascii?Q?9J+7x+yjoKp4GXdbtyXHCTz5GC0Jkh0ug86iKfbV0r20ljiCFxRfESCntrK0?=
 =?us-ascii?Q?Sw8hZvFbbZ5ZFZ93hEAHgVERn1XHM77djP+xosN3g767Y4K/TZ2tDcJSnCPh?=
 =?us-ascii?Q?TrXebq3gPL3xYO6Viiw0JIjXWDkz5tYZeB/vhGQUuBBe+YL97tHtf2wUSVVh?=
 =?us-ascii?Q?Pxsvvu4EcHX3x0YZVL4TAX7AvcHc8QMIWs0MdvMfbbSCt14wctKDOb6XQiW2?=
 =?us-ascii?Q?6ZipSGG0vWBvboFuIv83YMQaq1GT75yejTN1f0J8I7eZ0GIiny1/NbCOZgAL?=
 =?us-ascii?Q?4s5q+4vbyJTgWrA21eZ3DIhE6IphWMbnCRIDX9PzB5cp87jCAJN5OKAPjumT?=
 =?us-ascii?Q?bj6ZGMwcBX1c53IAE2FcmxVZjWcr8N2vV/CHB6Qc4fphi+1LnQtDDZH0uCrT?=
 =?us-ascii?Q?ZKb/yf0ulBJHZHSPexush7GYWBc240o2R6ZQlFKerl7ZYRTa4ooO8awx1YMB?=
 =?us-ascii?Q?+nVh107Y56+p3rfWonizaEWvJCz1F8mAXRb1W9OAj13UP29GK4KSRp2Sq+/Y?=
 =?us-ascii?Q?eTqQfPBKmOc17zTfDnFDVt3ViURimXaHwxUprum6R7PK3g9Wzf2SGFVnFctq?=
 =?us-ascii?Q?+VlqTyu7zpQ3f5sJdXG9G+6p20W3YlaE+Wye9vsywdLn5wYSvuo8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f480b9-bc30-43fc-21d4-08df3a67d8bc
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:36:20.4858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1KWq1UZEvFoZdDCC7AJp3RNP0rWhC2UIYGQLE9uUasxMK9giBsHxcfaizI+BoTmwI5FbC0ONJ2r71iNZ+xciKxVs/IbgF12f0SGZrYtDVM3krbzsPOA+kJ2PG0Mhr7q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/at_xdmac.c          | 13 +------------
 drivers/dma/bestcomm/bestcomm.c | 20 +-------------------
 drivers/dma/dma-jz4780.c        | 13 +------------
 drivers/dma/dw/platform.c       | 13 +------------
 drivers/dma/fsl-edma-main.c     | 13 +------------
 drivers/dma/mcf-edma-main.c     | 13 +------------
 drivers/dma/sa11x0-dma.c        | 13 +------------
 drivers/dma/sf-pdma/sf-pdma.c   | 13 +------------
 8 files changed, 8 insertions(+), 103 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index d40a8b40dddc..3e83883cc17d 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2487,18 +2487,7 @@ static struct platform_driver at_xdmac_driver = {
 		.pm		= pm_ptr(&atmel_xdmac_dev_pm_ops),
 	}
 };
-
-static int __init at_xdmac_init(void)
-{
-	return platform_driver_register(&at_xdmac_driver);
-}
-subsys_initcall(at_xdmac_init);
-
-static void __exit at_xdmac_exit(void)
-{
-	platform_driver_unregister(&at_xdmac_driver);
-}
-module_exit(at_xdmac_exit);
+subsys_platform_driver(at_xdmac_driver);
 
 MODULE_DESCRIPTION("Atmel Extended DMA Controller driver");
 MODULE_AUTHOR("Ludovic Desroches <ludovic.desroches@atmel.com>");
diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 241a91936fe8..1ec700c2c996 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -469,28 +469,10 @@ static struct platform_driver mpc52xx_bcom_of_platform_driver = {
 	},
 };
 
-
-/* ======================================================================== */
-/* Module                                                                   */
-/* ======================================================================== */
-
-static int __init
-mpc52xx_bcom_init(void)
-{
-	return platform_driver_register(&mpc52xx_bcom_of_platform_driver);
-}
-
-static void __exit
-mpc52xx_bcom_exit(void)
-{
-	platform_driver_unregister(&mpc52xx_bcom_of_platform_driver);
-}
-
 /* If we're not a module, we must make sure everything is setup before  */
 /* anyone tries to use us ... that's why we use subsys_initcall instead */
 /* of module_init. */
-subsys_initcall(mpc52xx_bcom_init);
-module_exit(mpc52xx_bcom_exit);
+subsys_platform_driver(mpc52xx_bcom_of_platform_driver);
 
 MODULE_DESCRIPTION("Freescale MPC52xx BestComm DMA");
 MODULE_AUTHOR("Sylvain Munaut <tnt@246tNt.com>");
diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index ac2094e65ecf..57ab0f621105 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -1128,18 +1128,7 @@ static struct platform_driver jz4780_dma_driver = {
 		.of_match_table = jz4780_dma_dt_match,
 	},
 };
-
-static int __init jz4780_dma_init(void)
-{
-	return platform_driver_register(&jz4780_dma_driver);
-}
-subsys_initcall(jz4780_dma_init);
-
-static void __exit jz4780_dma_exit(void)
-{
-	platform_driver_unregister(&jz4780_dma_driver);
-}
-module_exit(jz4780_dma_exit);
+subsys_platform_driver(jz4780_dma_driver);
 
 MODULE_AUTHOR("Alex Smith <alex@alex-smith.me.uk>");
 MODULE_DESCRIPTION("Ingenic JZ4780 DMA controller driver");
diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 5c1c97eb28a4..95a36af613e8 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -194,18 +194,7 @@ static struct platform_driver dw_driver = {
 		.acpi_match_table = ACPI_PTR(dw_dma_acpi_id_table),
 	},
 };
-
-static int __init dw_init(void)
-{
-	return platform_driver_register(&dw_driver);
-}
-subsys_initcall(dw_init);
-
-static void __exit dw_exit(void)
-{
-	platform_driver_unregister(&dw_driver);
-}
-module_exit(dw_exit);
+subsys_platform_driver(dw_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Synopsys DesignWare DMA Controller platform driver");
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 630285c85482..0feb878a03ff 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -977,18 +977,7 @@ static struct platform_driver fsl_edma_driver = {
 	.probe          = fsl_edma_probe,
 	.remove		= fsl_edma_remove,
 };
-
-static int __init fsl_edma_init(void)
-{
-	return platform_driver_register(&fsl_edma_driver);
-}
-subsys_initcall(fsl_edma_init);
-
-static void __exit fsl_edma_exit(void)
-{
-	platform_driver_unregister(&fsl_edma_driver);
-}
-module_exit(fsl_edma_exit);
+subsys_platform_driver(fsl_edma_driver);
 
 MODULE_DESCRIPTION("Freescale eDMA engine driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
index 9e1c6400c77b..5b72af393ec3 100644
--- a/drivers/dma/mcf-edma-main.c
+++ b/drivers/dma/mcf-edma-main.c
@@ -281,18 +281,7 @@ bool mcf_edma_filter_fn(struct dma_chan *chan, void *param)
 	return false;
 }
 EXPORT_SYMBOL(mcf_edma_filter_fn);
-
-static int __init mcf_edma_init(void)
-{
-	return platform_driver_register(&mcf_edma_driver);
-}
-subsys_initcall(mcf_edma_init);
-
-static void __exit mcf_edma_exit(void)
-{
-	platform_driver_unregister(&mcf_edma_driver);
-}
-module_exit(mcf_edma_exit);
+subsys_platform_driver(mcf_edma_driver);
 
 MODULE_ALIAS("platform:mcf-edma");
 MODULE_DESCRIPTION("Freescale eDMA engine driver, ColdFire family");
diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index a6fa431530e3..6a7a519910ec 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -1079,18 +1079,7 @@ static struct platform_driver sa11x0_dma_driver = {
 	.probe		= sa11x0_dma_probe,
 	.remove		= sa11x0_dma_remove,
 };
-
-static int __init sa11x0_dma_init(void)
-{
-	return platform_driver_register(&sa11x0_dma_driver);
-}
-subsys_initcall(sa11x0_dma_init);
-
-static void __exit sa11x0_dma_exit(void)
-{
-	platform_driver_unregister(&sa11x0_dma_driver);
-}
-module_exit(sa11x0_dma_exit);
+subsys_platform_driver(sa11x0_dma_driver);
 
 MODULE_AUTHOR("Russell King");
 MODULE_DESCRIPTION("SA-11x0 DMA driver");
diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6f79cc28703e..c7d6774d0970 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -639,19 +639,8 @@ static struct platform_driver sf_pdma_driver = {
 	},
 };
 
-static int __init sf_pdma_init(void)
-{
-	return platform_driver_register(&sf_pdma_driver);
-}
-
-static void __exit sf_pdma_exit(void)
-{
-	platform_driver_unregister(&sf_pdma_driver);
-}
-
 /* do early init */
-subsys_initcall(sf_pdma_init);
-module_exit(sf_pdma_exit);
+subsys_platform_driver(sf_pdma_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("SiFive Platform DMA driver");
-- 
2.51.0

