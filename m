Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013025;
	b=ygFpMFpzGWSsJorPJMbNWld6WVBxtXMH1r+o1hMFaMmRfjx6sbhQ252km4advswFb9+9
	 2phqko2qXbhQh6aIHX1IC2q617Q+XbQZy1xKGetFcakTtGIDTpJww29erVTsmBWeqhqjX
	 V076mxjTWpe2i5R2xBj/4S03TMFDuUmm+rUcTBl/tiHCATYVeFAw1Fon7+Uaj3Bh9U+/o
	 d8e2+J2b7Vy4TqCK4x8HuVYNunKcAIv0zmPJ+e9YsRJlEJXujTXVfaUuL0VnUqXoeHMYn
	 xt2zGFiXwbHXaB5TCGkeYXDvsenhJdsbn9/2bDwuwFnC/WhD5MbdtN3oXvw+pp8aHSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
	b=vAf2XguVyYJ3DhBO8y/6y4EksUqUwLj0v0AGU2gPptVvdiqcx4v8jhobqm4lpg13D1FG
	 lJLJJs9M56ZyNyQZwkcul6GktEROR6sQSRC8TJ0zA0CE1Pv81LrP24GTZnmGiCk6liToH
	 XbIt3wGkIk6taL9eElFlbCQ9zJ4KCiLCdymuuCc2ShvFlEGOmqWshCPzH29tyU6et/H4q
	 oGhTDBKzyIjfBmDmbCDkjksNV85JnOcd0xeSpMX3Ezw6v6CXx813/BBIO2m7TqtiAax6/
	 FVTChZ90l+hH75rNF6QrlPE+6gEc/Lo1NU9TqeUb+VYpUWUXMcI2T2Im62YgpBzEGXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0YP207V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EsGlWkIp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C7D606A32D
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C7D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0YP207V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EsGlWkIp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2GU3034264
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=; b=J0YP207Vsr8a41lL
	AjZTyKZDrAyn6bMHQJEp6Ht/FIehVV8eEF5YoNyoeaCmc+rNObWKjQv04DCUX2Cl
	VzBO5vsuY1C0jjwasjHYfSjKhp+pYBppemRDlZLoeyl4HiG8CbqT5feR0nzz+DT4
	EXdRZ/rt4k08qFVuNJzDRn3JQAYr2ZH/EkhSsvcLfrueanalun4EA9pfys3hT+JN
	cPyncc/64E8luL/m3DfyPGWFUjze2XB0vIJ5q40Hz82xHoa0llHpl5i0Ghdq3WZ7
	RmliTjsI0u41dBQAdUx/R/Q7iaj8HSOhMQhLXhNVQYIAju56QTXiXiaS6x8FSj28
	SDLxZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0441-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so564912485a.2
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013023; x=1793617823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
        b=EsGlWkIpbkrsI199mfcGZXi8WD0cYo/YDxYPnq6Y20fTpZ6kHfbLmw8LtRYRXUNP2A
         sJz2D9S6kofeQnuC4isgMJ8TdndHZLgbwHBMZANe0SJoWUmcIbbLiKkRYaiWLWTH4nXk
         Y2C1ydQZHxLxC8alohtLtUANapQTqtZ+8mzwE4stjyfKH+PNIiHGPznhwIHiTwgWND7X
         CZaLPPbr5b/NUpfq7RdTmDqXgtUmE492Dm+LEmY0KErAqTg0/kL1G/J4mgNDsLcLs+HJ
         CpwtZAq2uyXYltCEa54iSDftbWt+qAlqeFEpbqB3vziXB3928/aG9tLO1SQnc7297o5k
         mkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013023; x=1793617823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
        b=iZMcGFEMXNHLd6HnRDwD5Udja85Gd3pLl+nMEMuy+9HPvW6fuIYTPwTaK2x3Nb4I3/
         hIP9RuDXQ23A3LGs4pmKAU8x0Z6wIz9fAIvZTTPOvf9S/Zm1WCYoIkfmLJz+ZmdehWhl
         zAgyZvzAN8bcuqwsvAepDIMP+NCpy7ntoUKVGRVEoK4I8/TZGYcRUqmxUqTQK2ZNTbai
         +0JcHE5ZHxeXgkDesnNu/3+VaoAERRg+VbdpFxxPGm951i0QFahTWgmh9b+PWp7PbA/M
         qPvMDmST/e1nc9tQbOF/WYf3jy4mm2el4q12i8Gc4lt5bO0EBfA7H5CVe+W0TaUpOdfe
         oOUw==
X-Forwarded-Encrypted: i=1; AKwUvBxMQpavid/7ZaLRjAOWSf7grruHdilSJc+aFBZPWPAMKtOqiaaRFqxG9hKkTgdPGPht9K462VwOEIP2@vger.kernel.org
X-Gm-Message-State: AFq9FYLbtbCuFQkAkh9TKFKOlSul1vzZJYzM1jVY9gTd54rzBAT4mrIP
	l77WI50+z3ks5CrXmIxFmXB37dGcM4vFP5AHzjrzlWXqBmeBaFq8xamqxlokGT28ca3N4HvkFNq
	z0n30aRYQ5NdfkzuRT/pd1Vr5FKoIjOW5W2bv13dOmUtr41xcQDEYq7tjLsBx6v/M
X-Gm-Gg: AYBFou1k7/7I17ziLcgCiZMnkzZsesbRbkgXJuy6Gko0D7LREUB06rY7+AIgRgdKpcA
	FMQlqneYw7PxyRcwTCkgeyCaevDmh6P9VsL8WVnV71JoWE0Hmf/Uy3Rup496BLJ4eE+TU0l14wq
	5YxGN+jrB/nKKErxTrlZg5hdkuKMhN4K3j/ni7QJ8tvqd6J7cqQFCaTHDLLUqq8FGU+Irrl3LHC
	kipM7F+r4wj/b/EwxWJIKtO5D6WTSRUsmk3XGl7QweSFzVS0C2TfbFwKaWypDu/KAMWxPD0Eeet
	tWJir+7zQ0xdiXQHbUpA5Czg3RAGFoFlByqq9/vBDIKGjnQk6AwKFzO3zAthFypr6q2l7xd2jTh
	Ip4XAricK0i25llmQXgkV934ndCDpy3jaDWhd4MnTVPnpZnxwZXVmCw+4Cul+0Tyu+a4cu2xbxZ
	N1ekSZikzH3931
X-Received: by 2002:a05:620a:6009:b0:93c:c2d5:1ae5 with SMTP id af79cd13be357-940ef79f4b8mr835903085a.7.1793013023208;
        Mon, 26 Oct 2026 04:10:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6009:b0:93c:c2d5:1ae5 with SMTP id af79cd13be357-940ef79f4b8mr835894685a.7.1793013022577;
        Mon, 26 Oct 2026 04:10:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:51 +0200
Subject: [PATCH 02/35] drm/panel: remove the unused struct panel_bridge
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
Message-Id: <20261026-drm-panel-funcs-v1-2-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sZu+gCCAPK/+XC2UapLGIknKvJV9j0SOSwR5V3S29Kg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUGKchAASinmtwtPvMmwc3Sq3F9KCOYzdxgN
 pt0G7G3yiiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BgAKCRCLPIo+Aiko
 1Q8ZB/9UTlwRaNEBaGZxc0IwmW24VtC9wkBG+oXCJSl5rdTbX9zSnAGHOPU42S8Nlb1GuDWUcCd
 u8AC1Glm1GPXlGJRPo0AbB3a7ktQTdDgK6JaD+b2r9Hoc47OdhOBGIVXM4vYHqFgZiSHqjhnvzx
 Dhv7BjRRQ3C0W/HD15S/GIPnlNoNiLX5I8xbdFlTSl6S5wJ50QKkOO1Mc9a5yef6o+FVeOZDDE2
 1OOg1OrJ+lx2dkO0aE0ZEz3LFOlpM1pJsE0AeR+twAepe3OIl00+EzUnqQKGESS355y8wohb7lg
 43i2QjbtSdWp/qaxCdogJSgBLYlMQGzeD9sI+8HSJPnUZO0R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2z3jKxqX9/nd
 toBvwYT3+zyDzt2QxIdIqb9voEd6296H3BgsFqUGvUx41LBIEuzqCVtvVUG8Mp5afTB4oNuRgMH
 Bi+wP0eGRtyhdWzSIQV/8ZbMKg07ZgA=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf351f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=a_a0KNV-W32lKMFKthYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0QaOHuuDG7fY
 oZvmnhi0il9ucL1PcdLBJfCXv1W2DxQj0bpjGzTyXMkFcTOl3TMGPvuYfmFZnWoicYTbYrYB18M
 xy5qvtzsv4QpFkvgiYqwRoDHNrMnt6R/n1bW5qV5DcuVvDgC+8Y9RG3GPFG1fS1GaIFCq8G9t51
 GyhgJrUJ+3u6hcKnTavoL6Wqh1xPWMA2AMGsRnwwXyr9AabOtlA5kgddCuyGrC6gNKIWeyYpMJm
 JIdLFsExv7w2ceLCN6pjxBE4S6cXa5Fo1is9Nu5qXgYtFzSkrOhGglaHIh2NNLz5pVnaiTQRmOO
 Kv+f6eHo/OfjlU6Fy+Y5/OphCeDka/vvx9G08mkKFWhFkmvwPYM1BMb8lLkyTzPlHKNWv0IYLlk
 DZtTJoVk9J6bbwGVa0SVjmUsvsEcr1d3x2Yq6uBhRMxwrVGvfmAwFNM1MCssXhV9/4oRVbmFy6n
 sk25VRXeaUSmYpUu+0A==
X-Proofpoint-GUID: iq7ODiJB7dOFLraQqYDRth7Abe4Opql3
X-Proofpoint-ORIG-GUID: iq7ODiJB7dOFLraQqYDRth7Abe4Opql3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The bridge is embedded into struct drm_panel now, nothing uses the
separate wrapper struct any more.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c00529bfb706..268e655140ac 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -50,13 +50,6 @@ drm_connector_to_panel(const struct drm_connector *connector)
 	return container_of(connector, struct drm_panel, connector);
 }
 
-struct panel_bridge {
-	struct drm_bridge bridge;
-	struct drm_connector connector;
-	struct drm_panel *panel;
-	u32 connector_type;
-};
-
 static int panel_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_panel *panel = drm_connector_to_panel(connector);

-- 
2.47.3

