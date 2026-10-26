Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013034;
	b=GOYePLQPN+5coK3kiCTiHujetM3nedeYk/EVJ00zMdWKfo/7kVo+eZvRNEGEUX79M3rt
	 OQEP80HYdw11IWR1qtIo3IlB1HLrk5hTxSZJ9YfrSt9kaqlsr+x33p9rI5JIlU5g6cJ1i
	 myeI7dVRbTfw5k/DHEC5K0vEGXGKCKj8UM1r181CjYavayWVwtwAc7Vr7tIflEI6OaXF4
	 kKS3RztIYBQN1Y147bPFPD2DQ+zXzUscSBihiRziT6R2Fswit8rie5KDMY6uGc2gjM/bu
	 3/pJI0vlWpb72bjdZqpqsdbJ12CPTxNz1mzX2FgB6F8Z9RrGOtD76qaobKmZ/pWoJ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O/NYPa5aoqcu91RkIOpDv6ECYq/Y+3u1TbX3D34wWQM=;
	b=lzXFba+2bN1rPkdi4UqFe2sgFXDIDvNty7MDNjK4ce0PwDjwiPDAMWDD1CAfGepXFTZa
	 s7yIp0nBSwfTLws6fqWMoLzqrtMHNj8CwK98Xa9JGlyho27ik6bpDEQgukhRNogilxtqd
	 5Kx2VG3O24WY6r/3k4mJDxRgiHeBavRMwCL7/pzNAQ77FcvQ2JlrvFqtP3uq2hg6+qsvM
	 VR5Vl2X1hEiiMqi2Ns74gTxxvCUpuOWkcjawVYIpIhMcMgNXit53zMquRe1Y0o95Fo7NH
	 uyflmBVPm9GBbk7gzoef93IzmC7z5klVN9SR+aXxV09cEPImnARa0uV/2qMAIBoCa3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IildK/Ik";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zs63yNUl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8913E60A2608
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8913E60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IildK/Ik;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zs63yNUl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt86x2733524
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/NYPa5aoqcu91RkIOpDv6ECYq/Y+3u1TbX3D34wWQM=; b=IildK/IkT1oiGAcO
	0rkDGnQSndd5h8/Flx4igfFmv6pb1kJjABNierxgdw062CeIZZsS4itr/PuYBGhW
	0sTZXPCJBcGwBWbPaQ8Q8VSP6ufEvBUc0Ggn0evLqywRZ8yJY8HHHQ+wbP5YMXY/
	g6XOWO8oT4DQ7LoSVKtyPE5vA0brd/P9bZ3/gUO+tzpuOyqGSYarKOZeCbAhRyiC
	ERFl9weGsSjnEdxrZBC2vB2uw/splLIYdaDvCKFWRE72cUCUmBpwlWpNwJARIytv
	AKB5MZCK+LmWfuRcti8lnqbwGEKZUeEneqU5yxoY8xD+4+3dC0rhIcZGnjNDEnqv
	LeEc/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8b9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so580870885a.0
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 04:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013032; x=1793617832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/NYPa5aoqcu91RkIOpDv6ECYq/Y+3u1TbX3D34wWQM=;
        b=Zs63yNUl644PSWZe1s0kTtZlJhbp2dBw4YCC2Dvqp/SE5++ytL+/v8R2QMvgtZ2dNb
         ZCQIOyKn6eZfaovC3DjMjMh5pFkgLFIC3qZ22TvhnEasxjEgPPjsEP38f9/xXyNGuNLD
         3OGWxa4qEHaZaWiTHne7bkzUQaeJupsPJjNHbInoqhTWlAJj8Hd2T0ASYhBApsawXcFX
         wzCdP1S1KWoUgx8Q+KPJofkTI9T883qcSvkjLZd8jPSXhwv6Mk9u/3EaMNSqcGvLhKmy
         owdnDzeBIBidpLYJUaNPmtghIWE0Ojp0rmkVyOwcZT80krfPJRcC4VsTfSudqhbBRFqA
         O4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013032; x=1793617832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/NYPa5aoqcu91RkIOpDv6ECYq/Y+3u1TbX3D34wWQM=;
        b=vOTWufSGq3u9649Zlyv0wRbP1uOcxEehLUHG4Vw9hdn6rTaiKLUJhNicSDImbSOCa5
         41jalPtSIOxIDaVAYD93a5EaP/pX7aRCaM/GmzBrDvqe6tUcY/byBW8EgqYo+ORukjI6
         Id5yG6ZftZcGA42QvyOeZfwPpoTCBQzUImGdcs43VHh+JbNrdCU6twSSmwuiHpdAGj5D
         g73zmngibcfJIsm8tT4wWaelXmlwYEJ7N7FexlaIzNaQVOFtoRLKShjyVGbIymlFcIxz
         pis2vZl9eZcLqziz1NTa5LNLtbCV3eR8WcxnbWngYTfSCjteWwxqbebRhOZADWvyu2+L
         SCNA==
X-Forwarded-Encrypted: i=1; AKwUvBwfo1sXn+sJveb68opM86oioU9xtuvywj2cbrH82WOEXgx1YVsirlVxmZBOTxySIAsyvP4jjF8QZ8zD@vger.kernel.org
X-Gm-Message-State: AFq9FYLjQQKeMSOxj5GSp44sMxj8D/E3/1GNI87AWHZ71mQ6Szd/+fJ4
	bv/DCm9I2ZOCrnmX2kf4SwCPKcWOgafpL+7WP7VzKMiOuNvSd+eDt5jCNY8bJNQm8m/u04VXWcX
	n4WVII2BjvonBkLcHPJiqkc7YZnKLFt04unYy3sSO3rQThRV2qvz6k4dwFEtl2v9O
X-Gm-Gg: AYBFou0mXej6X3n/mYedqWLM2JBu2vl4dGxu/RDOHYjOXA3LTh5jDcqetiSMxbUiYTO
	Yj10vtBxdM31VGrM30TPcklIzDKXXmSjNBudNgXdCzsS3arDb7E/GVyTDqHnep2FzZagpQkGArV
	A8HBDiPysDfLnSi+x5lxf19LWmFbBIG5f9Gt8SCxTMHobLfvrIdt5h4tFX3lG1kPG4aqgEu5uR+
	2Fb77Z0Se3/FC9Uxgts1Gl9tL7625MyT3OgoCgjK3xhx2hFrT5hW12Vnu3CmYnmK/7y1Q72A3qU
	BIRbIsrKw3MZlk0RT+KOA7lxHBVDzh6sgriLX9hf5JBtuphc0rVPICn+Zn4PiScvMw/CWgauXC6
	ABc5ACDqQqNUN8+F9LCBwvRrJGUPUB3DXde7GdPUb1QinNqE/PoR3dClfkAlwgf+WndJKkv1B0j
	gOLFQ9SSBYnXkE
X-Received: by 2002:a05:620a:2556:b0:93f:2b65:593b with SMTP id af79cd13be357-940ef9dbe6emr819423685a.38.1793013031634;
        Mon, 26 Oct 2026 04:10:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2556:b0:93f:2b65:593b with SMTP id af79cd13be357-940ef9dbe6emr819414885a.38.1793013030960;
        Mon, 26 Oct 2026 04:10:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:55 +0200
Subject: [PATCH 06/35] drm: mxsfb: use devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-6-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=a/x7dJOBA8FZd0WveKfgICj2FZ9z8HimB+uvZN8QIWU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUISjjZ32quLsYppeLFnZUubyw89xz2vLjqK
 a3kaiRXP8mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CAAKCRCLPIo+Aiko
 1VJ/B/9LPMsd5msSwfbNUnNBey/TrEJCBg+N3SgDXzl24HorxEMN7u3LYz/NyZ1TNOd/pIxFBCM
 c0okzzGsnMswVRglGXqaUvX9vE5lqiTny2ZL8obWRimVF1xDFheDtJ2CSeNm5Y3PnwdPV02HNSv
 29s4K/p1PBi4kRNtnOyr1JA0Qa75YEf5wk4SxSu8CpIJz/d2FYGtEJJw8E2wK6wa3Q1vtbh5kWC
 aDAwkLp3U1nKh5fpbQD1Do6o6BQ5S2krzDRMlNc1l6x/tX2Osci+bjKcYnSBEG/QnSX+74m6PMn
 xg1urETPEc65fac+BXQquFP3uOsqz3Wr4HYj670K8yOIqW5b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX1+CieRh8jImv
 LOsVvPJhvpw4dDKHO0GOAX65VX50G87ibE8RWzWyTxVrYh5YgnluKuoAAKV2xOexVzADzhZOaTF
 iMlSrwC8SYSWZfjO+gNHtX/ClffB0PExvzeOq1oBq/Ym4uiKW9OZ53+WqvbiQ8PAVBS+lQB+WuC
 TgYc5MDpPHQSVJ7UKfXz8aPFNEAmJAxfOeX1gZscVrGh+FXZg8RXoH8E2H6pn8Bef+pJ/s2aSj+
 Q9YYEO5I5SShjIHcY57mKFwk/2hGWbxJ5YCukAfYnH0f3ew+BDuv+m9ykbt0h7aDowAZ6I1VSZL
 xeJPa2kYImpCVynPqccuRzG96Z3Mcn70YwTE09PKELA7vvlwDeH++2G6j5R3cfEwu32sz6hab6M
 rFDVJBRMK1rvptoh89WLUldRMbubvuwWvvZhnLrD5ZXJECmhQ1jodoMdjBNZk/n7q8K8gHAZ+eP
 N1RXzGZxI9WxQ5VvQ0g==
X-Proofpoint-GUID: 0r452PxP1nX5o2F8yOLpGg9F_d1CgdtY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5/1oiDEAizb3
 3XfHjGEnjbKy3fUytaLrxO/hMHFF24ajN3UROVCDNAbUWL6BSTzr2Ud+QtuYwyZGAmFKlnRrEQL
 9tYkd/bk+Wlwl5U7EXU23eqQFZAaRN4=
X-Proofpoint-ORIG-GUID: 0r452PxP1nX5o2F8yOLpGg9F_d1CgdtY
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf3528 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=JPWqk69mNThXLZiqCgwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 641691fc92c8..75c7e869393b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -129,8 +129,7 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 		return ret;
 
 	if (panel) {
-		bridge = devm_drm_panel_bridge_add_typed(drm->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
+		bridge = devm_drm_panel_bridge_add(drm->dev, panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);

-- 
2.47.3

