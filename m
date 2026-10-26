Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013073;
	b=JoGhTxIsGPstRcB+Wm8V8dHRQPpsWJIxonQJ63CWNjWgjenxRW4YeJnkbxfu09u7KXxH
	 9OCFQ1pgBp3DEfTVPaUySQ147Z+n6TELGSj9Rl7OmHWZP/9HOoisAxkJhntjTr2V6p4kz
	 LyxBsDYaRa/XxeEps75bsY1tbCjnUxlU8RW1Ovb3bwIAtuNEh3ZoRVhW6pbqyw2IWL1SO
	 yrkEobYWHBp4bEagjIyTSqvCimIabg2BOfkZ9uzxmbuRwveuFGpcCskV/3GbawZrzljq0
	 aU6Jm4gBPtOSULhNn5LiawmrvmecAPzVuHCdvghGwMUns1QdwGvhHga1nGD4GZu4qMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mvK2BhmWsNwqcy/G+J7S3TLd2RKrJI5wiEQ1uROoR7s=;
	b=PRiuzJFEzXM+c6gGbmczR1UeGsU+nrpQh4JZwg9wHksNPyDAQJK6NAjmgovBJJyItTzz
	 7LUGQuS0cKmedNoiBLYyHZe+PGFu2mUXgS1G6V4iZaGoQIADaVfpdTNR+TKZ8s1N0htYw
	 tJbHymGEMMN3Fn7xxiVO7hDNOwh5ka05mdjsSEPfxPuN7nKdL03fTfO0CsQ80xmG/S+Eo
	 5BbzH10oQLRZZvVIQsr7JCqsmyqWaKSxT5tzHi7idE7BpvkNUydNK40u6C2Am+RxURLu6
	 dF7iS5x0Oxfha7SZim8sVwI0uHTsMoB/jysW0yzMoP/J2azaorXf8JKPb0bTM1FhoHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DykbsvWL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AEeitSJ9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA4606F822
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ADA4606F822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DykbsvWL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AEeitSJ9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9VY3049882
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvK2BhmWsNwqcy/G+J7S3TLd2RKrJI5wiEQ1uROoR7s=; b=DykbsvWLY7taka22
	WFhCOCc+jiWbv7/S+XWueMgqhVAkqS7Phn9UFvxPT6TvmPzu3+nrWrK/NaTYUPk4
	1poFdFxFRRYKhwkQaRCLfhZ+lGWZukgtoFL/TP9nwOoxWRZLMMyAvhGWcuDDNrM4
	UUqTfwwr7Bk5CsVw0HSyroMdoSrP89/JYfqNdUkyZn8M6xZJfrxRzgah95V6rmRZ
	0nFn95+pEZHHHkoXVfVPzwtS/nYeT6tggGLrK9ZW5WQ6N3FZHJAUNOc8tx1Wzj9y
	GMi2zLhYtg+6nYRTTAW7sy6nV2gWM/wfxF52DrOi3GqThoDV0pgEh2kTo3Z9RWr5
	UjKWKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:11:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so720122085a.3
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013071; x=1793617871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvK2BhmWsNwqcy/G+J7S3TLd2RKrJI5wiEQ1uROoR7s=;
        b=AEeitSJ9Y69rzM7EtwrsIgwwpRbWHGfsKAT5r56bR0ygoIZ1o/WiyjF79B7YRd0NTk
         XKG4uzZzwLQyX52T6oPA4nQyBPUtXXpSTsf+H00ka8ONXdiJfJIJpIFJI87nK9k3LowL
         KGLnoGVS+soItSz/0/mDtY1TgWPcbJaAGBGn0PIb2SbElkC3PdDMAX8GKa6pHv2CnIgl
         TkZvXS+pu29XU2RnUqZScdQ5/NBaw8rNOiaxNFjE9U22cfTECPW+HZm1DCT0yi55mI4G
         5TEd1p9KoEh7VMPOxAR5kfxuY0ZmeGuyFQVr7fn2dyoPG2InHL8dgncyPWg18XJ8fRNf
         9+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013071; x=1793617871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvK2BhmWsNwqcy/G+J7S3TLd2RKrJI5wiEQ1uROoR7s=;
        b=A3Yz9TQNVBwfEQPL1Am4HeHHjWGnOkP4JtTldgoXI8o572fp09/ow8Oucao2VpMhej
         ziE+qgiVRK8Z0qGzfjnPyAOU0rfT09/DrdPTZCeXckp2QxqfQJJxgP6PsVqrICicZ1lD
         Vtex8Jm3uEYHLJ8BeA/gO2yO00NkPFojg0uD2SsSfIobZUadJ+ER0141Mm/OSG3wE4cS
         a6dZTBSI/kBD64P4DYl34hZ4LOh0ShD1KbfcVo1/gQXpAgPXT4b8R1OTcsN+ZaCMeMcW
         DTxKNABkyeH5sZ3s1ZD4XJMqhsm1CV9iuMKvgsdnuTgW1vxNy31IanOpvYwaVXLcI1EL
         Xbag==
X-Forwarded-Encrypted: i=1; AKwUvBxUKuFAFngPVgYGGeZ0hXq8VVIcoJ+Py8bfK67uZEs9ot46rwflCz3Dm6iq91O5PEeJmF57GVEEa7zD@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0ebCZqYhOhvfuJFRLLbb+uDNvmouODDwWw9QRRqELdH2wCZ+F
	MZP/h/wEKSw+A2ItJykTTjkebOywCUEyxGqgX/K/SodhwXX4jL5Rm8ZdYS7H2qD3F39CJDyXaUX
	+UcHLYoAmvTojRo3DCNXkJhjDXrbJtdw3rfkVMaHa+yXJKPHb8X6ubpUman+RAANf
X-Gm-Gg: AYBFou0Kz9S8BkGruSN4m7NAJcfkxUYq8HP9SFUZfx4utO4PNCVZSeM2a5YgFkHM0aP
	h3bIHU/RZvR/OPpC3TsCyu0qq9a8Fj14oJ+6CuXM++9ns7hro4zVF06C4k9m1gDf5itKpehjEwg
	DXN4JcP1/h3N+SZOayCejhGfHrWKE4yhnY6SDgMT3Vq96amQ6IBc7kj7+OdT+BZh2Dq8nht3uXx
	jlPnFvcKQGvLNM01AmVKaKG+6KrlNjDkDk9B2fYQBh6ZkOuvCBiy5vl7wMv+XWmREGdfMHE72vO
	9NgJqAM4v0d0Y4i4S2wKOHd7dHZKzjO9hXzqEgOCcFVuWk4nkf10pFhx7ksg+duTbnpSO8tja0Z
	3kI16HWIAkhrAI+FeYYTeyAdVdHwW5+vBc60blQb0Ksjd8vB0fLfZLr6lZs8wq+Rh5uvLjdrxYV
	wDIfuZkcwWYAfp
X-Received: by 2002:a05:620a:2984:b0:93f:4cfb:2a8a with SMTP id af79cd13be357-940ef8bea4amr938995285a.26.1793013071233;
        Mon, 26 Oct 2026 04:11:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:93f:4cfb:2a8a with SMTP id af79cd13be357-940ef8bea4amr938985985a.26.1793013070598;
        Mon, 26 Oct 2026 04:11:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:09 +0200
Subject: [PATCH 20/35] drm/sun4i: set the panel orientation on the
 connector
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
Message-Id: <20261026-drm-panel-funcs-v1-20-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ew/aRxbQkoMcy5WEM3fmByje6NiumMVLXKmZITcWKQY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Z9U4HNlYFOfzVOyJXwhnLG6uhqrdTOk9YMXLtOb0662
 FvpgL2djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiITCz7f99/Xmt+n7hQn7Q5
 oiVJ6pv+XP79lYExnj13dBk+zvlx6fLRCyn/vuRw+Fx35u97yD/j/XlfRYmQxlLJixKe91p0tqe
 c5VbMDC199d60Q0rhh71ExOTZ3z4aJep/k1I5+GeykeTH6E/X4xUOSAtN/HeUQ/y3pjfrhH5m+9
 3phrlJzvXT2pPCu9tCJ+lwfq+TO+11L07N79CeHVMsfs2vV13Mu0/luc28bxfrE5NyTf9IxMeuU
 1juEVsnvKDT/tOXtiVpSnOay7KtWAPdgxZvffGkvOPp2hmVu4S+8gsyH4ve/0DI2f7gRqck+4sZ
 d3jWv5w0hW3Ft3VHw6RmZ+VWc+hbNwVutjnEcjxEfGMDAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: E7UHfrZNxircYtQHD6_1Dfc6unPEXVbD
X-Proofpoint-GUID: E7UHfrZNxircYtQHD6_1Dfc6unPEXVbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7RcvW2IfVwLN
 9vP1m8Mz4zNS52HVyqzr5cIyIjs1GXeCpkc3OJsk61SwWWB0B5jJNObpIhX47pRW/TBiNphIIOo
 C7WW+VDzcHFAWOB9QoUYigbJn2fKvmejI5b4TytxlWRSsPNFeWfssPRDKzcLaoos6NML8VP6b6i
 SoZVeHALxNAWVcYwRAwrScOVis7oHdmBM6YVXNSx7Dv07HQM1awNFvA0wEK44gswzdOrMbgUTNo
 T1Pz8jcO2Rak0wOeoncGSlfprcQ9lDsG7g7bI54Hmzsb+KP+sjSE3RKQWcxNvzDF69vwP5sd8+O
 lYXrrxtvz78i7+fBZvyhLLlIp2/alfZJcQwU1V+Pm6/AT3/VdclqAZwvXF/xWkZU7gzOwSTrrdS
 bOPD+5iDjh+u6/6nw8pYodS/7qBdNFdwePpWieiLhcaYUFCaiQxpKq9I+XmRUCpRF/hcxHXc+q1
 Uq1L0G3mDyCgXQf60IA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3550 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=uNaPwJEBfYLeFD5OJSkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX8Z+7sC45Xpw1
 sbBi1QnlTKEZXVVtnL1c8nixv9R9dtPCxjHW4zXwOWld6N9tqsP4eM1AsoxmieEuNOR2A9sixMi
 66SEKBA6yDCs8JyCzrCSttKSPTdymfM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_lvds.c | 2 ++
 drivers/gpu/drm/sun4i/sun4i_rgb.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 6b98d20a8890..448e8a70b1aa 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -153,6 +153,8 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 			goto err_cleanup_connector;
 		}
 
+		drm_connector_set_orientation_from_panel(&lvds->connector,
+							 lvds->panel);
 		drm_connector_attach_encoder(&lvds->connector,
 						  &lvds->encoder);
 	}
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 3da9a9283c6e..5414afcb10b5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -245,6 +245,8 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 			goto err_cleanup_connector;
 		}
 
+		drm_connector_set_orientation_from_panel(&rgb->connector,
+							 rgb->panel);
 		drm_connector_attach_encoder(&rgb->connector,
 						  &rgb->encoder);
 	}

-- 
2.47.3

