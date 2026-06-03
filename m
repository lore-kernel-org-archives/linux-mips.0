Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49478225397;
	Wed,  3 Jun 2026 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487322; cv=fail; b=cb3GclCfUesJfemhHU74n6zs4yEAxRbvw6OO8WKDE/gRW6W8gHIQezbQue7DtFQ+aTMCIP580MQIQ0zYjjnJA5r6eFAWFDqPKUXcAfl/+fNaLL+ek4J3wSIeMrgH6IXewi5Q0No1vJidxGtlK1ztgjLNEas1qXLfy4ouvpazHPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487322; c=relaxed/simple;
	bh=73IK15AgIz7wrWvmFWIAZJnt/Egt7ilBwzpkBZY+ops=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TeQgvqRgP0/cgPHooa+Jw/OvNblt2gLoxY1jCovgUaB8W4LUlx0I3zipxIr3CPNL0zWRiJE1U5Mh5y5B4FGZhheBPuh2XBf7u2NmPQGgnZR9F3znW2gBrgcCFZA8zIVCKNXMiXQPaoXxTIZIurAoQRVbOFiLDpzHIWV/qUME42U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sc8kp9co; arc=fail smtp.client-ip=52.101.53.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sc8kp9co"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7OBMz9X8NwLtBUwb3rUtV0vbgMdbdse5Y9XUdYRSwnAflGV81bNkg+detjHCnLbG/5lpcFoKaDQXEq6ODYuAh4aTbuOpll7jHJmo5u075L81QAhhlgi88kzWx2eT3sIk3QVXsyXB2Rpz/wJenKkp9swXlrgWYAMQWtk32+ON3BR+2N61H4WVmah6nn0WtUVMlrHquwC36Kp6KeSTPALY0cY7nArpxRzxOPyxCYfagNQDWehhWMjXmgUhHw1ngtQwx2hDJIAoOpTgrL5vNALxKmJfTd71COeWYj618oxL+KfBsKBYEa9V6oqs1r+nXpT9cFqRrppRnxiEnADH0Og3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwuAPWToelaOXq0IYGSV/6UlpSwjlYYLs0WXbfz+zcI=;
 b=O75FjxG3FJDS1a8j81fnl19oiwVrV9HZz5eYs/9FzAMY+DIMVj3XsfdCAnXSsncPamHcwqndxRq2ZtXNQIPPwqvorl/2tcaWhtP7cLkU7PyAf+XvxVSJpmb3YJSpd2CWGtNYtb+dMB2HJj14//5c+b1UcAFHnK5nohogJtR1yPOr1jWVNwRW809RgNeUu4BKD16uxSysx1IXYg30WD9rUOojizfdJMwPqXkUmF9mTDkoN3IyCMvRDSZ+KJpI3pkYLrjHB6GZ+t0u/AZ4/EpuF7jmP1yCsfHeaHxUuCTg64VzZr1Fc8IaxE5Ob586rCM+Ceajtc/BcWLC54AVaOA7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwuAPWToelaOXq0IYGSV/6UlpSwjlYYLs0WXbfz+zcI=;
 b=sc8kp9coCWHQYKhkrvvoQxI64nBgxHwPeNIJvZfnPkgQ5qI6jVReMSuXYiYeSmreB+mtG6enkPAeozhDZm5TlFc6u/57ZzoZXofY73GPKlXjqbNEk5PNRliC7POpK5gP3NChxz++oalIGNFMy0Hm4MZj+pc+NIDsOpDL8euKncc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 11:48:33 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 11:48:33 +0000
Message-ID: <a997db8a-b018-467f-a4ef-87a108817b1e@amd.com>
Date: Wed, 3 Jun 2026 17:17:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/83] ASoC: amd: use .auto_selectable_formats
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Baojun Xu
 <baojun.xu@ti.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Ben Bright <ben.bright@cirrus.com>, Benson Leung <bleung@chromium.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Binbin Zhou <zhoubinbin@loongson.cn>,
 Bram Vlerick <bram.vlerick@openpixelsystems.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Chen-Yu Tsai <wens@kernel.org>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Mack <daniel@zonque.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Rhodes <david.rhodes@cirrus.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Frank Li
 <Frank.Li@nxp.com>, Fred Treven <fred.treven@cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Guenter Roeck <groeck@chromium.org>,
 Guoqing Jiang <guoqing.jiang@canonical.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 HariKrishna Sagala <hariconscious@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Herve Codina <herve.codina@bootlin.com>,
 Hsieh Hung-En <hungen3108@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kevin Cernekee <cernekee@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Kevin Lu <kevin-lu@ti.com>, Kirill Marinushkin <k.marinushkin@gmail.com>,
 Kiseok Jo <kiseok.jo@irondevice.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 M R Swami Reddy <mr.swami.reddy@ti.com>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Max Filippov
 <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Paul Cercueil <paul@crapouillou.net>, Peter Rosin <peda@lysator.liu.se>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Ray Jui <rjui@broadcom.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Samuel Holland
 <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Sen Wang <sen@ti.com>,
 Sharique Mohammad <sharq0406@gmail.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@kernel.org>, Tim Bird <tim.bird@sony.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Yixun Lan <dlan@kernel.org>, Zhang Yi <zhangyi@everest-semi.com>,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sound@vger.kernel.org, spacemit@lists.linux.dev
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
 <87o6i3hqs7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <87o6i3hqs7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::8) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|PH7PR12MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a32328a-8c79-4641-da3e-08dec16609e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	plrdrnTKnoq/Umvw8e7UAY0T4yXzW05RciYvda1CO+KpwCR+EhDZyeuvzxpcrxUUfUyIe79smRoJ4VFFcPLjQk5m0wN89MdzGLXHVK7SjAYChNORL/CGv9kDeZpgPjxUCam3o5xE/TR+TYNwgDqtMIcQBVXLMEN9aAokBhzvLhBuQDCuIRQTRH2jFQZVOpLPWOf3bv/J7leSO5tBwjC56iyJtAusX79TJHO8z8s3L97TN2bGGfhqW2FDlrwJIqb8TImbPcnAJ3+kRf+9MVqQKKydz4AKCIhv/7y4gUkIJ8gHd6SqaRlYu2E7ofyeu46qb4aOJWo3Qocw2iRbHKdoCSJ1MwfoNtMU5usm1ogTTkM/70G5QBTUY50expJwKLfY4W1ZpXXBrQmscMcXaDOzZKY6KkwWHmo/UQ9AdhiIeqRTqm8ZCHu4xf0V290UEnBQvHzym3UmeQ7QgVPh0m2GC5Gb4yuvo3RrS+fRbQtody+f3gHXg8H1BpAl/JctZzfIUndZRhXf4RvlUfHpXGu+p70OgzLGmMLQvWcn+MkybNHEUuCFLr1gntCfhVtP2bW5uO6RhXDrQdLvR2fT3tllJ+KVc21GQe0oyAc085k+EUsXI7Bks43D6dMLwpGc2nE7JhHMwdi0yPvLrlcJyf34fIK1JNfMbWFfhK2tJPft9mAT0xllckwoGY04V6vOmcVjaABEMIcwnQR/VbX8h/t8Rn2RoQyWCEjhnQLPutY4mLZ21Yrhjki0B6BZa+CGpQi6h9oF2W91Qu6yEKaD2eauPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGNSTWFHOHJyMyt1anNPYVZ3V3lHblhKNGJ6cEY0d2poUEVZVzl1T3ZSdXhZ?=
 =?utf-8?B?cGpSQXdXY21qa0lFV2xKdlc3VlBpVEhkU3dUZGhLMWVLbnB1VlZFbzA5L2dQ?=
 =?utf-8?B?QTJ3WWNHOTh4RlZwQ2FPYUlMZURLTkovUlk4emc1ODdiZlZRVU91eUU4T1Na?=
 =?utf-8?B?a3BTYitXd1M4V2lDa0RlMTBHYnhSd21RWjRTZGo2SkF6a2tBTDkxaUQyTlZO?=
 =?utf-8?B?QWZkTm40THo2SWdOTG5MY3U5OW1rdDlpVzdDWERVVlVuelBQUVgwMlNabldN?=
 =?utf-8?B?dnJsdHNXZk1kREZXQ1ZuR0VUMGQrc2I5TEVjbkN2RGdLNXNTaDgvelZrNms0?=
 =?utf-8?B?SEFlQzBHdXJrL2ZOVG9OUDVMZzhBelZJR0xmZktvSERNTUN6eldDckUrK1Jq?=
 =?utf-8?B?WHQ4ejh6SVJxSDFESGY1RWszdDNmcXp3R1o2WkpwUVRMVVUyZ01lMnB1QkNE?=
 =?utf-8?B?RzNNUi9LVENZSGhtTWlIL3h3OXVVUzNWWTNGNVdIQkxnN05ieXhUVWNRQWxH?=
 =?utf-8?B?M3R4cmJMc3ZpaXE2QzlJN1UyeTFzQzBVRDdXSTU5eVp5ejAxVHJqZkdVcVRI?=
 =?utf-8?B?ZjF3QnNTbWFOQWNURHE4M3YreUlWNVdjZko4THFFNFdvallIOVh6UnRmZUZK?=
 =?utf-8?B?aWxMNlhrWS93TXdEOTZEMFFsMDBnRThrR2w5Sk9PYURLT0FXMlN1ZllpNnl6?=
 =?utf-8?B?Sy9VV0VZVitoQ2RJTnE3dytONW92ZXJXNjJPTWNPYXk2dWlLdUlNM1ZBVWFr?=
 =?utf-8?B?N29JMGJOK1FtSEFpZWdUWkFib0lhZDNwM2dKVGJVbFVqbHRtSmY5QnpydCs5?=
 =?utf-8?B?Z1lIR3VYYUtaQWpHSGE0NVN3cG55L2lDZU1TTExIUmFTVllzZmZYbWptL2h0?=
 =?utf-8?B?djQ3UHJ3c25NYU9lN2hVWWNHUFRrM1d0My9rVThtTFIwQ2xESlN5R3RERDhk?=
 =?utf-8?B?VWl5cGVQU2F1cUhQN2JFdVNvcnRuUUpldTZpU2lTTUdRaHBUR2tIR1J2V2dv?=
 =?utf-8?B?MUNFODAzSzM2clE1L2habWFFMENnTGJjdU0yWkJETmZzbjBlMGljMTdaVWZl?=
 =?utf-8?B?Y2M3UWh0cUpFTTcrdmpvTEw3RzBYTHdNakVVRWI4SlpITkxvN2tBZzFXNk82?=
 =?utf-8?B?SnN5SnNZOEx4cjNXYXNnenRUcm1KUnhwTkIvVHpPa1V1alVZdy9lWG5IRXJk?=
 =?utf-8?B?VS9xOVRmdWxnYm51MTNaOXFEOGhTdVJDVW1nVGVnQ2lCV2RSTWVZckErcUsy?=
 =?utf-8?B?Tm4xYTRhTU9CdkxUUCtRLzVud0wvdEFLeDA5QWZHUC9vNU12WGtramw0ZUlj?=
 =?utf-8?B?bVR6d2cwKzJlWWNIQm94ODdVTlpSRlEydXFsSzczNGpYdHMzWjE1ck9ib0wr?=
 =?utf-8?B?dndiSHNMUEpXTnlnbHg5amUvc2xrTXlzcXVaWGV0ZVpQeEJ6cWpIVUVsdTZi?=
 =?utf-8?B?ZnVENVBUUWxqa2UxSzRNKzl0WnVsYmlKVjN1bkNPby90RmxWN2NzT2dvKzRG?=
 =?utf-8?B?Tm8reC9qeWlmSnpZQlF4bnFiUzgvQUNnQnlGRUdaY3k2Z2lRbmZVdFltMndQ?=
 =?utf-8?B?OVgvTnFpdUorSHFzK0liVkhySjRyWXhIb0JMdVFIcGJXajI1WlU4TDI1dERB?=
 =?utf-8?B?SlQrMWNncVVCNTNNdGxBdlVsaDRSSHlMbG94MWY0N2M0NFJFOEtwaFhVNC91?=
 =?utf-8?B?TVJRbS9lSGMwd3VCNWtCc2VNY21ENFFkVWZva3lLallGelFycGRrVDQ4bkJu?=
 =?utf-8?B?RGZMdFAwNWlpMnFwVy93WkF2WXYyTEw3Z2hJQ0N6MzlZcjhpTlduSkxWODlN?=
 =?utf-8?B?YnNyN0lQdlpOalZzWWxITE5lbVg1V1JEY1kyUUFONEtYSUdOR2tiQTh1WVhx?=
 =?utf-8?B?d3pjcEN4Z2ZxWXloVG1BbXlzNXdibm5nbE1VK0ZTQnFsTU9NYzZHd1ZqMHo2?=
 =?utf-8?B?SGR1V0wrQkhlNC9oa2FNQXJvT240NklCSjlEQTZNZTlQN1N2SmJ4RHhCdlZw?=
 =?utf-8?B?ODZkajZIU1FLUGdNWjdGR3ZJQ0w4Z3Z4d0ZJaWZEcU9TMzZDckhzNm84N0xP?=
 =?utf-8?B?b29QWVZRZEk4d0pZK1pnZnBhL3ptbCtHRmc0MU9xd2d2cWJnMDh6WFVNSUkz?=
 =?utf-8?B?V0EvM1VaUVBvWHFNbEc2c2pPVnBsczhleE4zc1FuY2hyWWh6NE1tVGpkYU9O?=
 =?utf-8?B?QW1IbzdNYnBXRml3VmZGcUhrZjFvRTE1d3dUU2pSNXEwZExsRlEyUE9NRW1q?=
 =?utf-8?B?cGxwTVNTZW1GRVlTMFdKampCQnNJTyt0UkdTMkFoeUhwOFFsa1I1TzA1L0pw?=
 =?utf-8?B?SkRVZkI2N0ZMcW82SzE0K3NGSFYxcnNEN2dkZTVRVVoxcXJHd1NYUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a32328a-8c79-4641-da3e-08dec16609e5
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 11:48:33.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYxJgQh1DCtEC5w93zorPl1Ryr3GpinnzrTccGIprrdhUb6PA2z0tGOG3bEqzrriKi+QdRtKefaenK1ow0r5UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5596



On 5/26/26 07:32, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/acp/acp-i2s.c       | 6 ++++++
>   sound/soc/amd/raven/acp3x-i2s.c   | 6 ++++++
>   sound/soc/amd/vangogh/acp5x-i2s.c | 6 ++++++
>   3 files changed, 18 insertions(+)
>
> diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
> index 283a674c7e2c3..bb58a9d34993b 100644
> --- a/sound/soc/amd/acp/acp-i2s.c
> +++ b/sound/soc/amd/acp/acp-i2s.c
> @@ -686,6 +686,10 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
>   	return 0;
>   }
>   
> +static const u64 acp_i2s_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
> +
>   const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
>   	.startup	= acp_i2s_startup,
>   	.hw_params	= acp_i2s_hwparams,
> @@ -693,6 +697,8 @@ const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
>   	.trigger	= acp_i2s_trigger,
>   	.set_fmt	= acp_i2s_set_fmt,
>   	.set_tdm_slot	= acp_i2s_set_tdm_slot,
> +	.auto_selectable_formats	= &acp_i2s_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   };
>   EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, "SND_SOC_ACP_COMMON");
>   
> diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
> index 352485dd98b14..b0147e88ba54c 100644
> --- a/sound/soc/amd/raven/acp3x-i2s.c
> +++ b/sound/soc/amd/raven/acp3x-i2s.c
> @@ -250,11 +250,17 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
>   	return ret;
>   }
>   
> +static const u64 acp3x_i2s_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
> +
>   static const struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
>   	.hw_params = acp3x_i2s_hwparams,
>   	.trigger = acp3x_i2s_trigger,
>   	.set_fmt = acp3x_i2s_set_fmt,
>   	.set_tdm_slot = acp3x_i2s_set_tdm_slot,
> +	.auto_selectable_formats = &acp3x_i2s_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   static const struct snd_soc_component_driver acp3x_dai_component = {
> diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
> index bf719f6286174..dbfb87e2fe929 100644
> --- a/sound/soc/amd/vangogh/acp5x-i2s.c
> +++ b/sound/soc/amd/vangogh/acp5x-i2s.c
> @@ -337,11 +337,17 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
>   	return ret;
>   }
>   
> +static const u64 acp5x_i2s_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
> +
>   static const struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
>   	.hw_params = acp5x_i2s_hwparams,
>   	.trigger = acp5x_i2s_trigger,
>   	.set_fmt = acp5x_i2s_set_fmt,
>   	.set_tdm_slot = acp5x_i2s_set_tdm_slot,
> +	.auto_selectable_formats = &acp5x_i2s_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   static const struct snd_soc_component_driver acp5x_dai_component = {

