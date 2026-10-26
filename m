Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013053;
	b=FlTeqXU137Ox8WWX3P7BF+1/wE5M8Dnx2COo3cptIKexCevZBwLIpv0qpDu5fELo41/n
	 kOI935Zm1w5uM2Hzz6FksMehnnaJ0iXax1JP14YOj3EVlpBqSE/ujgAlRh6tT3Zcz4fu8
	 U57ejKtylyV4w4w2vHlOAjfmdnMbuETB/TZtaOK/tMNg2GrsHNqjx/os68Rw4R5zdytXA
	 jqe06vXA7PcgxRRABvyiVy9ttNEXGLuoRS64LkDQ9+v6/YwtdfjMUdx/NLBHkJ37RTQXh
	 I6KCLD6x9J9OWZawuMWSgODgj11R6TrGtzCqr8KGlrBqBqriA0SoCZtpaDz6tlr9+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013053;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CcjOekiXLWxe/7/1hEWEOJKSkOmsFR1V+/VqYLTRRqM=;
	b=uCZ+8qShSRNlnN0ChDmKiKO+stY0s+huHVHdq34Wp7T4VtYZFu9Pimw85tN4xkkkZTOD
	 ZmGqvIROynRLhSw/qP6hwqTKad/ZoBH4vXRvhTslbt7xi7F9RrqghFBra0czuIU3ABmYl
	 NIZ/wkTmFbuwESVVKhrzkFzqPEdHNRAwLHT4cT17aId9OEs2zv7N4MbkUTe/CoIgx0Bss
	 ExAFvt+50mpl/cRbfrQ5iXQ2DNd8D6B/81E7Y+iKNbKzArjbXrbzs6r4zvKzxrU3V8nG2
	 EwUSt18iHUHeAZO89OvHmnz062o65b0m0TWtNKKoA5EIbiOfrXrC7LJ58c08sH4Mu+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XgxWJLiP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDQ6wINu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D127606C9F0
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D127606C9F0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XgxWJLiP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDQ6wINu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsoJb2168542
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcjOekiXLWxe/7/1hEWEOJKSkOmsFR1V+/VqYLTRRqM=; b=XgxWJLiP9e2y8eBq
	+EMObEajhPjWxClKTTAqY0xfGvXsCvqBiLNsbkaPmujcpiI08Hr80htWgQ255ueL
	O0B+mwpc9QGF3hF1I67Zrs58Kacq/5VekmaebhrKkpKpYih/g3Udlj+vHPLK182Z
	dVsSkUL8nGbmwciqKYfCvd0ZWuWaHohDH7NGw0Dqk/E5Gbz0Nj505viuims5wSeV
	VrS1BqyE/MwJ3oDceomdfHmkGZq1wcfaSK7JpjsNuv04ya53FZas9Lmn0ltQPSVU
	lHiClo60O9P4qlJijeTv2sq1DmujfzPOAtolKYr+kwR3MbY6QIIUGMnuhwjmFM68
	KLLz3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60fsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so564988985a.2
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013051; x=1793617851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcjOekiXLWxe/7/1hEWEOJKSkOmsFR1V+/VqYLTRRqM=;
        b=LDQ6wINutC7j04aVQ7HV3cX21HYA9qul8ytkDSRC5rdVd3Rsx88qB7RvSBUs6ctnoQ
         a5cDaVvr06vxg7QFKzTW1HPfHEOoCbKf/z29kSenmMRm4Go9qS/LF1hhGlpqFOjyloIc
         88FNc67gC/HN814izGe4j1/c4fXELExA+HHIl1fy6c6KkR+1Twpn78N2SyIvBCTTvt9f
         aFOPE0fFK4fIgHnmGmOXXb6S+r1MeWFSMpRK5m/jFZyFJkChq0wE/j++UxuAHAzhUl2I
         fZSByAeyRwNxBogF1JEgfEyBuRGtu+nPbFVkUc7fMknYVbirrSgMWQqeHZEUO97/Xkje
         9EWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013051; x=1793617851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcjOekiXLWxe/7/1hEWEOJKSkOmsFR1V+/VqYLTRRqM=;
        b=k/NMXBa1xoi2kXMgNEGi04CB+b/mGygEc8gpeSktjgzHEyOnUdPKT1O/ZiASs+26/i
         fFocvF9jjKeZrk07+Gj9NPm74+jNgkX6A2N+YL7UclQ+1096+xZZ+pVNWyP1GfGODgIA
         K+eFLdBpS8UrURigWZFgyqIpudqFb7ZI1U3xqG8I9SxVJ7jA64yYoaK99ZS1OxtuJZFY
         ZQmMbW4/KAQEcTGFX2N1P50DMVJFiJ1E6YGHsQQ4qM0zGVhoaVXuhzxTGXYhEj1B45uc
         o4XWUNO7Wq9sQrx+A7XKaJckDjUQW211xOkb/mCj/z6c7MsrlEPM3UpYwsPugAsTyhcd
         Xcrw==
X-Forwarded-Encrypted: i=1; AKwUvBxWRgaimIMIAPGDaS2tUkXUtveq7jgd2IOOzqQ7QFHUtOtHTJgZggppgVfkKk5yqH+fkv/bUhaVJjk1@vger.kernel.org
X-Gm-Message-State: AFq9FYK5G5/r94zFYOXPYqe90KOPqERMpwPIy2MuLkGZjuL+5yMKx+oL
	VTm2iBkekBXto48Ul0QgsiNmKfm3XUTtLeA8OZpU3WuXAJYn7ynv8dOGjVev1jLcWH1tVDkzens
	jqK9N3erEWpFp6KoFeIdfEse5U3WJ1gjLnU7ynb5V1rLNSRl2egkfgJJm821HPbKZ
X-Gm-Gg: AYBFou2UPHZRPJEhmsxnea/4rRKAIAVCpQMYOoREskkOXPqTnBjqT2SKl5i8KlJ373C
	HBWSFBqtTLuZYXq7C232snrVjFu5FXH4T3BhxniXsvesLoav3WVsBdEeKnR0txRcK/+kRNDKPAE
	cGLOKa0eAu9qBjzePMc4WDzi6vr4Mm6GjkCNL2FPD8cVrSK+z3ZTS0BeKElrnScKT0l4rYws0aw
	OEARex85qzuTauocIxZHcCCsfOTW6vqPnAzyy3yiYueC0T1FUPl5Ydj8JBGc4KVSYnjN3hnITm2
	3yOUHeYnG49YCbrSZyr/63dBcnLOwfRIhkDs86cUvlHWXo5HQa56Rgg1fbmgrs325/ye4Zu8Tmj
	hhB2sM8alPmld6MM/ahrSR8iyy8i6k5zOtSrCsx7wmsjK20S4bVFbfi6skd2SwXKrC+7suSiajm
	JMfEd5Vx3sU4Y2
X-Received: by 2002:a05:620a:2985:b0:93e:f499:43b0 with SMTP id af79cd13be357-940ef8fcd8fmr993252485a.22.1793013051330;
        Mon, 26 Oct 2026 04:10:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93e:f499:43b0 with SMTP id af79cd13be357-940ef8fcd8fmr993247785a.22.1793013050795;
        Mon, 26 Oct 2026 04:10:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:02 +0200
Subject: [PATCH 13/35] drm/panel: remove the _typed() panel bridge
 functions
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
Message-Id: <20261026-drm-panel-funcs-v1-13-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5701;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PsyqjoGaSgNE7nK0s4wZMtJ1rwL2WBpxNDlkW4hwgwI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUMPeK3u+Ehpvg+nMYckz20XnOB2X6DrWiGp
 ivt9hZIDiaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DAAKCRCLPIo+Aiko
 1WCTB/49xjv8bT+E14FUhCWg1zJPgoKza1B4TkNDaSoxvqp2OzTbFSqDJVoOzZPRr2MZ5GSnxer
 PafN5kN4s9ZxGzoCeVnc0VHsyHqFCcxnF7/hpJTvvFhU03b8zIAqv7yYymvLZECWUjw7pQFz8pj
 VPdwH4SZwjWC3IlxeHsEPyxrDkKW/cxusJcsm4QO/WPwH8Gh9qKc3q49M9tq3B0Tk1WHuyIOz4+
 +ATu84VfzohwMW4fT8dc7CCYV3NoPjk5ZGu0SKiX3XtNkbVmUn1mbQyjoaEZykmJM1426/jx6s8
 eVvXGxGPRQs+/82naDh7UwjuDT5PG7dnoGZoD79A48SIHg/O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cyuLXpAxMN4xOxkjl1AFIZn-ad7dzwUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX6r6IJT9E8pHE
 iFlBWr/lcb4o4jwuVjjbDWig7TX5zL8SHaT93EFqd/LwN3OcObAKmSTf8ijCbrHAYtIZxXWM6he
 eUQl43AVZ5/xojYxBGVuuZEMxey7Z7etx0wiQRe/0zxBVs9GQePTcRxcUd1+g0Eq2DW0ghPZJyv
 oDviwLXYQr4q5Zk0wuh5n2pCg3WSwC2tZl/8qydEYKValuPt49DJGVov1M+0/kpvUd1NlzytAXZ
 T4cg+FrMjy8k758ZIm/ddZsYwYmwyvmEo0XvuKCbhEkSvRFc79iWKV87a6rEs4Az2HAJNr7lHEx
 Oy4VC9ySCxtb65zVmlIcekp5Ar+uR2K/CPdOhJG9055fNNnl7/Pp0A8QFy6dETmrnzhbFkKU4O4
 MG72rRioovyBPPOqdfHYxc2ioFVRRBRDnUq323DeqRS6n0LmooyC8ZbN3iMefSYc+BKlP4omPjD
 WsOc448PV5WQMMYmeNQ==
X-Proofpoint-ORIG-GUID: cyuLXpAxMN4xOxkjl1AFIZn-ad7dzwUT
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf353c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5Yw8aHIVc0SrouX_YTsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXxlTleoAg5I3Y
 t5W2MAYucj5GkB22ARvaRczxV/+tj3ZqPGJSWnmcmfsX03Ozngd3PakzMknjVdvgZkQdgyk+mkW
 Sy2Fu6zdk0/jYBAqa8AwacjzEnzP3Hw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type argument of drm_panel_bridge_add_typed() and
devm_drm_panel_bridge_add_typed() has been ignored since commit
b7797081ccfe ("drm/panel: embed a drm_bridge into every drm_panel"),
and they have no users left.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/gpu/todo.rst  |  1 -
 drivers/gpu/drm/drm_panel.c | 55 ++++-----------------------------------------
 include/drm/drm_panel.h     |  5 -----
 3 files changed, 4 insertions(+), 57 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..f78455e4c97b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -475,7 +475,6 @@ not needed anymore. Its APIs are just accessing the embedded drm_bridge
 transparently, and the are deprecated.
 
 The funcions to remove are:
- - drm_panel_bridge_add_typed()
  - devm_drm_of_get_bridge()
  - drmm_of_get_bridge()
  - drm_panel_bridge_remove()
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 268e655140ac..ab701a526ef9 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -270,31 +270,9 @@ struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel)
 	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
 		return ERR_PTR(-EINVAL);
 
-	return drm_panel_bridge_add_typed(panel, panel->connector_type);
-}
-EXPORT_SYMBOL(drm_panel_bridge_add);
-
-/**
- * drm_panel_bridge_add_typed - Pretend to create a &drm_bridge and &drm_connector with
- * an explicit connector type.
- * @panel: The drm_panel being wrapped.  Must be non-NULL.
- * @connector_type: The connector type (DRM_MODE_CONNECTOR_*)
- *
- * This is just like drm_panel_bridge_add(), but forces the connector type to
- * @connector_type instead of infering it from the panel.
- *
- * This function is deprecated. A drm_bridge is embedded into every panel.
- * Don't use it in new drivers and update your driver to stop using it.
- */
-struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
-					      u32 connector_type)
-{
-	if (!panel)
-		return ERR_PTR(-EINVAL);
-
 	return drm_bridge_get(&panel->bridge);
 }
-EXPORT_SYMBOL(drm_panel_bridge_add_typed);
+EXPORT_SYMBOL(drm_panel_bridge_add);
 
 /**
  * drm_panel_bridge_remove - Unregisters and frees a drm_bridge
@@ -362,31 +340,6 @@ static void devm_drm_panel_bridge_release(struct device *dev, void *res)
  */
 struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 					     struct drm_panel *panel)
-{
-	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
-		return ERR_PTR(-EINVAL);
-
-	return devm_drm_panel_bridge_add_typed(dev, panel,
-					       panel->connector_type);
-}
-EXPORT_SYMBOL(devm_drm_panel_bridge_add);
-
-/**
- * devm_drm_panel_bridge_add_typed - Creates a managed &drm_bridge and
- * &drm_connector with an explicit connector type.
- * @dev: device to tie the bridge lifetime to
- * @panel: The drm_panel being wrapped.  Must be non-NULL.
- * @connector_type: The connector type (DRM_MODE_CONNECTOR_*)
- *
- * This is just like devm_drm_panel_bridge_add(), but forces the connector type
- * to @connector_type instead of infering it from the panel.
- *
- * This function is deprecated. A drm_bridge is embedded into every panel.
- * Don't use it in new drivers and update your driver to stop using it.
- */
-struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
-						   struct drm_panel *panel,
-						   u32 connector_type)
 {
 	struct drm_bridge **ptr, *bridge;
 
@@ -395,7 +348,7 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	bridge = drm_panel_bridge_add_typed(panel, connector_type);
+	bridge = drm_panel_bridge_add(panel);
 	if (IS_ERR(bridge)) {
 		devres_free(ptr);
 		return bridge;
@@ -406,7 +359,7 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 
 	return &panel->bridge;
 }
-EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
+EXPORT_SYMBOL(devm_drm_panel_bridge_add);
 
 static void drmm_drm_panel_bridge_release(struct drm_device *drm, void *ptr)
 {
@@ -436,7 +389,7 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 	struct drm_bridge *bridge;
 	int ret;
 
-	bridge = drm_panel_bridge_add_typed(panel, panel->connector_type);
+	bridge = drm_panel_bridge_add(panel);
 	if (IS_ERR(bridge))
 		return bridge;
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index deae4753a594..07612e9791cd 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -393,16 +393,11 @@ static inline int drm_panel_of_backlight(struct drm_panel *panel)
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
-struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
-					      u32 connector_type);
 void drm_panel_bridge_remove(struct drm_bridge *bridge);
 int drm_panel_bridge_set_orientation(struct drm_connector *connector,
 				     struct drm_bridge *bridge);
 struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 					     struct drm_panel *panel);
-struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
-						   struct drm_panel *panel,
-						   u32 connector_type);
 struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 					 struct drm_panel *panel);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);

-- 
2.47.3

