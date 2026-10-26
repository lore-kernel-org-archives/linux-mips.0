Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013045;
	b=E+0YQzR0EFip7iEO4IbdxuWcKBGB1uVjXpIZvqBs1x9Oii7tl/PtvLwYPGh2QS43hLLR
	 Cpm2TXS93l4lYxEmmIN2hbCLTvz5uI2k+k5oAQSMqvtIwLdwaSmY3JYLz1+jqHtT8oNVf
	 SoxDpJ5qUEbdexXHRkE0gVY8sm1ADjudU151IWBciwQHxvqvPSuJknzTUZ7gAjE//Y+G1
	 l7VAKyGZQXVtITpvP/omNjATfB3aMEz/cnz+hAoEU+Y7O42J9gjQQY6LLXxGeLgYGS3RY
	 zddB98DlSY6wcaQaJX3u4eBEyLSEx5QRWQBD5twZmtqB33xRx7dHBeh3pbhrpCK554g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=;
	b=wri0D9tS5TOP+0bFKZOlbgByRcKYEvStn9u2rgySg20hW2eAiuYsJ6x8jO4ilT/4XCfy
	 ITIHdM76n6eHbxQOntpZOLyCmymQ12y6YQXJANiUPtrcjeKrg7kSjowiA11+H28eZ9sHR
	 4HC+lJqj7G7GAjD0ETuYnOi/A5INIh9QUJfrbZTWHYVEDxC6FuluyHivH4QvIPQEQLR89
	 oefIViQcp14Na7LeHT483OzrH42lbATwLmrbT2t6D9kbxIcQjarA4HbGfx29O5wmxKggD
	 Tf64zGr82FBtMf2Kgx18ulBdpGHAqJwf0lUVKlscvEajQENkAFeUqzsU5MIFYAl1Gkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6Wl2ZKT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqfKWCoq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C87E60A6F78
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C87E60A6F78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6Wl2ZKT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqfKWCoq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2tL4131986
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=; b=j6Wl2ZKT98xHbKEx
	/nU1pTxuHGauwXtw97DwI2vSbvSkNprXjQhSmRWrIFQp1V4LjR4fvRC56w2wjh8V
	GRlHhqRThB+X4gBAvEQ5tqBnh4OR09YzmcJ9I23KNbAQz/wfYptN534uiKGOvnTN
	BfFyH27eQEUbzKXUnPEpzKqtodNGDgqCKXSqsVxd2nK9C1MufKc4MCnzYCfJc3h/
	QaoFUr1TY/sZ8idYP2giGyfsHLqTVD9mgkMfxnVZ/T4DE2tIfvs72stR4rioyGCj
	3Rj+Mc5PfS7zgfKojRpyH6YViZxjvPqeYx9R0/1AAXvXygbbSyv9BnE4ZfByhzxz
	LQ2URQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q058p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b8c60c550so75745926d6.0
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013042; x=1793617842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=;
        b=QqfKWCoqkAvwoeUgCcgJlTl2k5GerAorxAviNUz6f0DM0G48NLvt3QdK64xNoNPyJe
         CnwvcaKhob8SaDtoWOn/h3/mwyWIpdqdjtq1gqr+o2LlyefzZF/jDe/FGboZI3Q4sSBa
         8AOsIj7N0leqAyV2l23oUbsdtzwgZMksAZNJRZHl9I5RR3G35HtarueUXwP+SEolINz4
         8tdOK5AIcZz/WjBRdVHEkJnZiAjPyjRTx52ulpbfI+g2TrgiaSYYhwrChk+7Av5aS7J7
         4A7FOiQKs0VMTR0EiKDCx+CLgpv+vEE9ZRcKv/lOo/Ap7GXwvMnZsqnuUQkK1yfWoICJ
         q0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013042; x=1793617842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2CxYTJXMNJu8w6PVYOlO+zhm/teDp2OHpxctIuY7Sg=;
        b=tmBVIDWE8ErozOJL4bMOWkCOr7snHID5L/41EfX/hcqD/KAGjJJ0h/4jV4Vr5M8azb
         8W4VDcb10tUG7Lth8BpzRDTm1AeyuvzhHodlJ1tmZLv4J3FWHGXVHOhpqfX0MsX4igQX
         gHxmAjpRztZK2/aPFiBGYCmxXyD8mydPlRqwKyrHWgjxzAJObi/Xw4cHn4i3/bmntuSu
         FaeFJrDRPJQsFr4OEiFp2mr1yqpliCdus66QmcCJO83VfPS7aQE/OSkfuHksG2eHoBhT
         5f1sjFLmdJ4RAJOUbH/fhj8C401+5lzVsgBGo7B3Mhn2W3UhDmXIhU8YAMlkuSs7bxFV
         Akjg==
X-Forwarded-Encrypted: i=1; AKwUvByPrPQq1ntsIopgOTLWpqm3bczlcGlNokHk14XaprEGF0LEynxIVYE/9grc9fyTPUqgs9j7owE50P9s@vger.kernel.org
X-Gm-Message-State: AFq9FYLcBH9cLQsAJ6NXGjLIvz+jXSfhEjgjF6VKO59lMTdr98SE7jAY
	wQC6CKtWNUYsMDoEkccPCIYDYswZ47ID9Bv6r5O16daWQC7vivq2Y4cbR3QSwkGYYSb0zCqjJvR
	UN8d/9YZeZuaYT3FqxFnYlbMf/thftmikUS5/hQjXXfKnA1weYuGxnPhXsEe9NNGj
X-Gm-Gg: AYBFou1fFg3k2wYPGSSCMp7lm8U8MLr3c32XdB0uVWgYB7ym+XjbL7QrkEXaxqgnqLv
	GNvJY2WGUHvNn44L3wc+8f1nIYPvScCDiqqKDDPhajg5Rz3nqEznJ1z+pd7Tsifh3eApzQhJez7
	fIA+ws7LeIVYfoirft2gRQIPgtO4f9/DKo951BKUssgEmjDMJQiS+h7/k2/xsNThbgtAzpHVBiZ
	tlVsCKPF+N/sOkIRynI4R/EGdwP/GzOiotFlYRxlxTEzj4Udr+lllytbqfaXx+mVA9D+cRO6XMY
	SIrAoCIJdJEk0Jhj/kMRe3OHqiwV2c2gSpzBtwg4vnMtKUzeUjyIQeob2NMcRTLQ+2HmhnzAH8V
	B5kBC62AI7CJO16FoA8Jr2b0x+L+imm7eM/SC5JQqCibBKj6rPiVhkHQqQeHp0RYuhsZa+8DvJt
	4obtB8SnhEHz4b
X-Received: by 2002:a05:620a:25c7:b0:93e:e531:b78d with SMTP id af79cd13be357-940ef7ca684mr861750385a.7.1793013041743;
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:93e:e531:b78d with SMTP id af79cd13be357-940ef7ca684mr861744385a.7.1793013041149;
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:59 +0200
Subject: [PATCH 10/35] drm/pl111: use drm_panel_bridge_add()
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-drm-panel-funcs-v1-10-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CmM8Wphvynv0lIRI1+4+EqPH050ei17LGuNpAlAxYlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUKQ7TIU2XRP7HZmWCiTiNqZj11gfIKhJErO
 DHDY9rbRdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CgAKCRCLPIo+Aiko
 1YPGB/9rhW1ooU6FBzQ1pckqwHPnHHWFmRJFIB1Fpi/hiCtnjoh9PtNUR4MQKjC/rH3//hU3uFC
 nozE52P+NNx700phAyOXXZC7YRZJaCErlJn5BFFr1JiexNs20CTS6K7tejSh8TK2Y76rZUxhrrV
 Y2loDvttO806mSD/DRpUdu9ahHaiE+NhyJI0EW7G4jjWOQyvpEpueI9gklyFlhdEPlnarBK/s3f
 K5h9NwlLkyegQ9nvNlccObPXL5xrzNK+KqqmPhcUyPmVR3mJ1zA9ApXMADNC6Vdjq2EOaPrBcBs
 8rGmFy+GqfVfwsz798jK6AMPQ1yrjM6732SGR4Ykn3ZWK5IA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5DToTj55EXnA
 Iz84VeWUr5FCQbVZMseb1triB5qIbPp3DXMTV1lfBELieuRo5IQ1aLzHkrN75ybJel5ki0nukpH
 RNC3b5X5KtM3CQ6FErEu6o49zrBT7DM=
X-Proofpoint-ORIG-GUID: aUvYoQaDsqC7AGyrbLp6FEiPTc6xLZqm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXwc1RQ8KZFRBT
 UFIKODMMGkO3lHe0t8afMjExQvEhJkSCR04B/zjjEg9AZrkv/ZQ75Ri36G5MRNkZhNQoqlewDEN
 oF6bO31FDV+LG0NS5jJWYXh3vfMLM+BRhJ28cayv7kAj0MS3sq25Opl5JLnp3r264rLIF5Jws8w
 DByIVUjQ8dGjLnEHFVgLyPWVVt7tgDf4BlgtKMT0EG2tmaAbeGYXiVuCoASGiFJfMvF3UNUC5E2
 JP+HSeLjM/otjs6dIVk6MoH8+rr/4Ov07nwujFmqicilW4qjH0MMqMPNdtRk0Jg09mILhR7qX+2
 W9PBxmKic6wtPUXRffb9Ufg778IwfShlfroKDLYby5YXV5hriVXVCVEVh3NegQKSIn1XhSOUFUv
 SAqb1Z9DHb7qrxlI4/lM1ezrkxBaqt3QhbHBE18jJl2W2oINnuSiRJ6dud+7T0WCBsPk42r1+P+
 b2WLolNZnAjj/P0PyzQ==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf3532 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6PQUdDDLQLJ_jpbVOC0A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: aUvYoQaDsqC7AGyrbLp6FEiPTc6xLZqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 89d44e970510..d172cbb95d02 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -143,8 +143,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 		return -EPROBE_DEFER;
 
 	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_Unknown);
+		bridge = drm_panel_bridge_add(panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge)) {
 			ret = PTR_ERR(bridge);

-- 
2.47.3

