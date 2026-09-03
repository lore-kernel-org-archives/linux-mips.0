Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2992F7EE3;
	Thu,  3 Sep 2026 01:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398032; cv=fail; b=bWQsWCy5TI+cIR9DdpkD21xpz1IW32v+H3ZG91CQ+TkTi8n5w1itAsXGofZ1y/FikHuWziGmF9WQlwEBeT7SMW+3O46Fn4GCt2YplNRQ8Fg2LuKrWGK/7LjBbUCSn/YomeArFIL6UI7cRQEWVc5XUsyUCAMcAnPFHiSOPmi4BTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398032; c=relaxed/simple;
	bh=4CSRDE8dyfO9vpQLDwfUBko/GAdoCQOUdOs1qxeazgc=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=olJzY0/5x6SQf/faGcSRpKFO5Apyt7Y9k0diql1z5JYDrn7QWKaFTZ3SSkfXR3Ffl+kATt+OoUx/jOMCNyELGzFT+k2y1MbUR0LpyqOzhVCKZf4AtjquGb2g15esx+JQFj0/gCDcqmzWMHBeny5RDuyXJx4JCcBIrrhKe9zumA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kyqGWlWs; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kyqGWlWs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vw4Msj9KsImwlbemG4BKPCb7Jutlzn61lP5abZl5vPrWh/nfEw0ofQ7QVkNafpCEFk3/GESLYWJs0Amqqw1JgVSb2pdtCoveEXFkUDfzlKJIQDqk145QSNDQv1cDLDo3aIOkgkkvDgE7yvAKjhxobYhPAs25upnTrXqV7lzSM1oAca7u847ZdlGr8o1NyqpC5YLan3glfMCP8UqWQbPU2a5ppVzidFqRrqYkctDFpmTwEgdDZCo5KdUD1EUnEqFqQZ8Yvqk/zhzX8bGNW53eXWMRRBPpHymctwF8QLjBqyfxeRixnxCw6ny9dUK1XogmqlL4jlqtLL5t6k0+PvP20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiPOOCSOa4rPThgV61Ix33AKg+gEYLQEZeeXLSJhQzc=;
 b=GIkcv8Yf+IBu6NfKxd4T7lsDTCmrwFszpsdh+i96tPiN+SEtFsDxHXTbn6eYjaJWxfJzfaUuE/EBw6iAdm8x5fAv2LGTvrXDzoyXZlSaw8dDa3++qcrFNuBDahSBBc8g530t2FXJ3l4DPIpc21jl3ugovRy9TNaf/ffKTob3H7EJ36oUl98wSeFWmVAGCtU3iZb5wuHclKMDtzTvPcqOsRMuLqKJ3HAYG6xDo1615EaAxRcL7hDqAtKoLrBGou1rbG1ZIy7e8OPlpN6nzUZq8dQ40JT7hP/JlA22ItLJTsI87mmBkyO5bXNncT3pnPu3FBxzbIAEBTlu0I831OrCnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiPOOCSOa4rPThgV61Ix33AKg+gEYLQEZeeXLSJhQzc=;
 b=kyqGWlWsNmQaarTL7zFYGI4o6mpnJqrxbG0kJBiqYxD+vJUjg4fDQlpcgefOqIGqe1nAuCM2rlb4HyFVH5ajQeZIOscbP+CGxVduYqc9R7vhTzXeZ9ZXPvwDGcg3PJTEbY69uZ4IVFRhooJSLPs0lHBnF6Lw3p+fUldRqCVhyVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:13:48 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:13:47 +0000
Message-ID: <87se3ryw50.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Cercueil <paul@crapouillou.net>, Takashi Iwai <tiwai@suse.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/21] ASoC: jz4740: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:13:47 +0000
X-ClientProxiedBy: TY4PR01CA0069.jpnprd01.prod.outlook.com
 (2603:1096:405:370::12) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbd3802-337c-4f0c-f618-08df09589b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	1XMPhAJms+Zg/r8YPBT8vlOuW3VqZ/NoX3hRIOwzjn7RSShfBUIZwys8vbI/OQD03Q8hS9tygYC9UXocisrE1Ss04T9cR9YbO+ZqlQ6W08iNblUQAq7/GuQUhg8BHv13ik8yBvsZEBJ1v/+OaGWL+pL9BFCh6hHDByLq2NxDuD4rsuwnPJJ5pdRO0uY27nQonDPKNnkfLnuGGPnb4JRFg5M59ECd1tUye2XXhabRB7prdowzxm9zVa9TI18fVbYo3vIoN9lzhMN/0XhFG3XNm75/rF3b3xGvQ+i1Url1t2snb5AW9HIzz9OpBoS8K/N/6UukceUXdIcCbW8TUS8MYN5DGI+I0pvF212e0si40f2wEmX/pADATNIF46ckrmV0bjAMhG3kZcOOhH6+oZph1X8vYrOBzyMiWbCu3naanaymwfExKe4eC9+0WIiNRFT5pVGzv293nrNWGLSa2lJZKEATSyhLN3N9116FoKFPxG9VMz+qUr4cP46gSQf6QHLhmqdmK7kYrfkCfa1XwadrVuMQ2IUNbRfSaS5mfLWFiWk8IEeAs/fvyA1n1LXraVp/B44rcfn096UzMAwiOK6ZiRA52eY1/PYCp5hEOA1MMmBlIoYabNIA2E5fo0C05lyxoBmf5q1/8zTkohzvnwjZMBJhcxSuabslhv0GEYuSO0yulwJGPalRrSELBHwRLjA3tpfZ+DeEZrHv1fgLV1nqb2E3b785i8nNdTd+NSitYQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ak8ob1UkaxKaFx9ncGemrQl9OKiKODBA96+YdNPBBdTXkIYVtKdVbtB1HhhY?=
 =?us-ascii?Q?Pj5GkMhAKDZ3oktuMx1aIjcNr2WbHsi2vVE0WhVzbEsnIPj1aTEr/TVqURz5?=
 =?us-ascii?Q?5SMRlMMgWvfbx98qXbyuo+NHzYtwrfrM/lMsO/MBo8QxCwfim6umDCMIswbh?=
 =?us-ascii?Q?k7FpeW77scYlnS5V6+m0npgzF0RTYYEML7UOzGAUPGq0Oxgtkhka4HqUs2Cf?=
 =?us-ascii?Q?eEQ6GMHQPlpMtzBz67gqaQVyMlgH12pg64rFiysmS931ZjM2OqKGKEqeEXqa?=
 =?us-ascii?Q?0Ci1za9VzplwHfrm41ptrfeVrEqgUHSUP/7ivMTN4Cq4xkpu4wN1WhI4ITBw?=
 =?us-ascii?Q?PxC7Yc2lKf8KFhkcREkg7cRDMDMaMjqcChqDRTzJEuCQx0NWV+bENsDohm2p?=
 =?us-ascii?Q?LPxJJS9Vz96KvEtbabR28QE9HZOenNr2IQqstEAd5tsn9Dt3Pteuec/a5FMw?=
 =?us-ascii?Q?PMkl6Y42+BhzQC1PWpKD3P9MYCTI9pH6wPLZTsR2qnfVs9nXZqu2sNZXSd4m?=
 =?us-ascii?Q?LbudrGM9SdgLPl95MgtDXw4RI1gav2Lpovg9mp57ourFKDaaM1nql/99/KXq?=
 =?us-ascii?Q?uv5uwLVc8Gj36wtchsYMkCqdPfrSnwOo4XR/g+WwOBeD64PNJXrb1NbJ7zAj?=
 =?us-ascii?Q?07ItiSgtEw94CeNKp5xEsQG9E5sm1tNAhFwWH8/EwoPbmEjCRFDv5eRrGvfM?=
 =?us-ascii?Q?NGJYe8BEre8wSuu8C6kT0KYHIBxLl975FZTI9WEP6lw84PlaJK/+pf9MKfHz?=
 =?us-ascii?Q?pVi3NHP5HrRmw3jX9KQFryWm1KLeKjVJgfvumxP3IDh/009SKOzl5Hmzm4hc?=
 =?us-ascii?Q?jDqa/9ZZ/3QJFkSxgYqhxq6oajlo8PRwynUXISBGq9sPCZd080cXC7/gfUwI?=
 =?us-ascii?Q?mdCKxADYk8HS1hCCvQfL3XVBp/zowr+gUYTn52ba3UA+J38b8JzL02zOor3W?=
 =?us-ascii?Q?iuad4has1RoKY7VBKtJPDKkQ75HuiP45M/E0Ec/92BJRJGFA7PVvhbT3fvVf?=
 =?us-ascii?Q?2OKhpl8JKQc5F85myv/1x0KFI0ZCWzqKdp61hMA+cNa44tWWsv0He2cYEoIt?=
 =?us-ascii?Q?2bKUEoiCR7IL+T0OEg3HuwiViYhB8RANDUICTmW+g/Qmd1IUih2m0wdU/NCF?=
 =?us-ascii?Q?s0GpkguztdwjovJ4OgP2Avk62dZMX49DqEnWbqBPId3Yyz+YXWMnPLC8RGIV?=
 =?us-ascii?Q?mXtqbQ4iGutBtyl2OS1zYmxFB4o12ZSEzoAVu2zkN9ATEVQoy3JPuD7PsD8S?=
 =?us-ascii?Q?E3bslqey4qNEswzzYSPN8RLEla9rILqzyLGTX37uZo5LVeTgWVf8AkvEC3e4?=
 =?us-ascii?Q?jzLQ07PlI4UcjuQDN+9z/z2mG2P9kEihml5yMQm0o9WdfI0ctS15V+KNFhkt?=
 =?us-ascii?Q?fTtxeAQt8zfdBDZCLH4Zu3pKqSXgkAv0NKHRC5q2vt8CJc9jyXuYykoNP4kP?=
 =?us-ascii?Q?KSQSA1/3r7BYxnFpWdjN3+Q7xn5EbZSWux1vaNUi3TsWV7zCGj2DS/w9wlw7?=
 =?us-ascii?Q?9WNc3Myn8NpasVkU7vwoAqfRt9NxkJ3X0jWbDZwZotLjNEZnMoJ2cOZrWCnS?=
 =?us-ascii?Q?6PLhbCVQCznGlCer2QKAwKVctrN+AHzPjvVZG8EfEBLrGLly2kvaKtazWjOg?=
 =?us-ascii?Q?Zlpu3NmoWkXdnvvSPN+8OaXiAGBmm0r4F5M4+lTHopIiSHMDYhK8r+yjxWQ7?=
 =?us-ascii?Q?rF28TMJ4kKGMV+rwvUFCxM5PRREmncTaiqDlkFOhhaLPJvl45IsiOBCqJtwr?=
 =?us-ascii?Q?12MaA3WzK4hGZuuf/PlyPQyIOSfkjmfOCHsuOybuzVDwdn8tlz5m?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbd3802-337c-4f0c-f618-08df09589b47
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:13:47.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66BDwJA6L7W5lyMG959XasWaOnUQIOmzdy2JcqYoXiimrEmYIm3IvRxDb0zNezfEVaQgjMlaofuiR/jkY8Vh8pmbaKCnkl9xn6EqI3rKFMTzIAp9z6JcUBHfID+eX7bK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index d36bbc820618b..7a1589cb775a9 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -326,6 +326,11 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 jz4740_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 	.probe = jz4740_i2s_dai_probe,
 	.startup = jz4740_i2s_startup,
@@ -333,6 +338,8 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 	.trigger = jz4740_i2s_trigger,
 	.hw_params = jz4740_i2s_hw_params,
 	.set_fmt = jz4740_i2s_set_fmt,
+	.auto_selectable_formats = &jz4740_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define JZ4740_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | \
-- 
2.53.0

