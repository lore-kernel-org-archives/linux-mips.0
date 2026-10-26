Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013067;
	b=Q7REE/jhBo/sGHxyQxIc0fypsD3EQZmgoIuaEakT34JDVqjfll9Hj5lMtme+wcOduAxj
	 /Hf7v4lE84oLforv5e6Fx4dECKl2qD6D6S798AB91yZy0c7YvjDXgG11cWnlRhGJFolg8
	 v4pZRSoYUITH6iUVg6Ns/Kf6AAw3QmCJRVVZPDs75ZqmYYbnunjueZaCybUObNtyfTG1A
	 62CCrvzRU3steT8GYOu8RTfuO7DHYVvewId3WuhkTmrAqjnLMFpZTR5OC89AfqQ8CXSHX
	 WHUjTkRfMoN1cDpW6m2RrYmnd/MOFgiBbVyoKMhq7CIO4VzaBLvBIBEWcx1MSUfxczw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
	b=wdGPdI8w8O33jQIraPUDRj6Nn0EdSVSInCIYm8vC15XMp0NIRnsaxrzcGELYTcQEidLe
	 4PtyKnUTjZm3CKuGNDxCp21JayulZmuOh3AsvRiCyZehMYuwzNmWmcTdzAmyi17fTAIiM
	 W78YRQ6YdvAaS2uZUtqW/6LTnnbcJT1wit8mtGJrCac5KqKEhGTaP3148ohTewoGtFFfB
	 lMMDmCVw95SNv6m2DZUMW3XHGxlB6bIW7wbeJiWvssP6jAZWyq9z3Wig2yFL4GNvnuIZ3
	 zVhZN+cDip+oQbjkq/g1aQ1nwcLgPrDfMHVisn2Io2wfo6Tq2LG0Ti05vqA2dKupXrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SoOl5FT4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUnjui7X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFDC60A3822
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFDC60A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SoOl5FT4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUnjui7X
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKXE2541823
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=; b=SoOl5FT4oUwWlrup
	w602dzJ/8d0kluDERn7rgovsGk3r3RrwLNwQY1CGhhoo1cP0kQrBjgHAValXUwzg
	/nXzV3W953+C71g7MRN0LcfE4CEo9jT1GuCfnk06b89a/woNyI++7gScIFEAXtXe
	iBU40U15wQItKd263vXug6XGe1F/e01tDeKIxRGvjOqR35y9cpdgYQXUUb8fqkuu
	xg0spNtF1KCFop80bJfrQH13wlV56QhqN8bw39wHLMVAyJMVJ5Jb1zvjAjpmDZL3
	A+U9NqRS2GAIdMQak8y8608vMdKzlSj/UtHQP2JtpbLO9fpjLmkf+VaC3vtMr2xG
	JLbPEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda5pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:11:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so364859985a.2
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 04:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013065; x=1793617865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
        b=QUnjui7X6DOl8UXWlO2p5/cCCOe6yhc7wKRF6xsZ6BehAn7hhpPi22obMG1zCZl7lF
         SIT3MofOVOePFBouO7vlF5g5EOngFA0vzGFKadMxfmGAop/bljabTMo/fYbfx8ZLhQVQ
         qPcQ28KgZHM6VYV5LDW/R4i/OfP060tC9ov7Joig3Dgg7VjdSu2OZpm4pYMkSCQefpPt
         Hoknn2mdN7Vicd00zGSgg6/Y5UplYic9ExFyzeJ35H1GC6vWxQtc3v+q2sI8+Xk4TpHh
         tku8s7E/HE/RfTwXK681E0GU1Np0Yms+3CVeiX5HJdX5VPS5DRLTawpNCSq2N0kzfzCl
         W7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013065; x=1793617865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
        b=zxWPcSteg3G1YfP2hr4Ms1LKa8XhVP11WUgWPL+bdAd3EwwvqmDoPKd/+jHLGQklk8
         FF7bw/db04W3m4v27JGHavokzIXtS0KAP4iaAgH0CyQ4wUZF9xEZKLiu8Yffmu8EXs52
         UUtkFCFjzfbUbMsdVY7fgO8Pn3xPxV2Cs8DkxgR1qBu44eJayTeOSEQHP+nIB9FLqER3
         1qh18xxZp4pCoXuQglhJK/BIVQ3S+f7Kh9sbQwzq3xWZhFf18c5ICdX6LiIbtYZgZzmf
         yV53dYVWq5X7uR/Ac2kysGYHGlsGCwNsQHHvvMohL0shC6svgWvUBFGbOrp8yv6uuUek
         Tr6g==
X-Forwarded-Encrypted: i=1; AKwUvByZeztAqdZYwbISbFKmhgdceX6dAZKj2fjffzPETTjGaFLKiPovGQxuZ3+WPNZu4+1b7xYsrsMWRYPY@vger.kernel.org
X-Gm-Message-State: AFq9FYJtRdZS+GnWvOHL/S1EXmODCutfewL5oUu9g9syTWeYCcCEgVsZ
	ZsqSDKvfAH1/dX04N4XiMkJaAzm8vYQCRFqH4BDbDcJ90RPZ3nW630M8XFLqJYWKHq+VjYpqt44
	qGG0xgqpxQxgfcZJe9AQV+p/lr3Kzc1FSZbNFbgCcBhE2hHXGW/4fY5Iv3u8ExlC8
X-Gm-Gg: AYBFou3z3FrAKUgvQue2TovSvO5VO4q5rs/xH9f/V6Ct3L5ZJ6ZTJTiJNhxOP1JM+hZ
	atE2LW/qLj5SpEdjAEV4VlfSHYDmHbYssPLk2PE1ZC3/iwEme4YO8BK0j2qYkZqRtuSgklz/isr
	T5G8pKn+UH0TNlC3CVaUtZFwESv+M4yWMXTojRx22ceg05TAy+FoPeA+udn3KSqLSZYzy0XXnRn
	6JEURiynSGp6/eWE3cNqCroO6hNhVcI+W6Wy/CEv9T1myCFF7mGjT/GLRDIBGUhCp7FFkTOIlNO
	XOYY/AIJuj9ToETtv9y+mTUtM7UAmxKB9nqthHdqBUEg79ciKkkwmJoNrs7opqe9mKfbZ74j8Dn
	8Yklw7b8EvxQVx/d1Vho83m/Osz5+EN1aGP5QlQ9LWRSmGXZUjePoRskIf7qIHvQyhNPrACGzGH
	wDhPtAmSma0dHj
X-Received: by 2002:a05:620a:4016:b0:93c:8e3f:3036 with SMTP id af79cd13be357-940ef795b3fmr912286785a.4.1793013064587;
        Mon, 26 Oct 2026 04:11:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4016:b0:93c:8e3f:3036 with SMTP id af79cd13be357-940ef795b3fmr912276285a.4.1793013064036;
        Mon, 26 Oct 2026 04:11:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:07 +0200
Subject: [PATCH 18/35] drm/logicvc: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-18-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qdajy+ZxizCGYRHwcySOH98TyzKssLnXiyy5l4MYQ6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUOSPb5SkROiJ1qgWHeJ/0zI3xpF33LRg7Kl
 3E+JMtrfDKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DgAKCRCLPIo+Aiko
 1fCrB/sG4pFH+B9sQNL86lviJf0md4fWW8kPrNEAXeSTrNauPGWoN+5qU86gqZnym81fcvJGHWt
 eidB4GCk2J5yvG2doNP8Mgu5fQwLl91HF7cy1j/D0y3dqSMl3DZ4Bx6bni/p1jmv25RYm5RDwWV
 9pUznhEgK6pJdKm5YVNoOIlduKYbWWVGMEvzwSvXdNTYFH8RiG70sb4ThrUeLCmKUSF38QGdbdg
 SqZrAkA4nt1QYH9Y9EVqohUn/NIGzsKGvBK8yURwP9QQvtHIFXvTtWwnoT+jm71gG/gkc8aAvk3
 5dwraj1xDfN8EgWs5GT3ujM5ENWatL+090SyEKJp6JNnP1PC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 496wwzlSjEYkMKYgJUwTJQrJaWIEkXpR
X-Proofpoint-GUID: 496wwzlSjEYkMKYgJUwTJQrJaWIEkXpR
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf354a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1mv1z9nBhO4L486rGt0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXyMSngPw7zW4n
 ke7guoCf1L8/z7edktq3lh97oihDHm236nTQeUj8f9BVs85NLgSI+mjwIp2T/qI9pq6hI+YBoNN
 oZZ+xTyGmReq+4xQZpi1XaKDiYGwLw8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX+bK+iAVJ7mAL
 9SuT0L+T9pOfClUjnRaGZ/i1+wsMhQ48vJ6zWVhm/x8PbpdMnPbOKrrexdUW+FbPJg7YnxA6V/W
 6KN+LtSK12WbTEkYZ4YkfB2yE33PMPpSlTRQGxCYsFg4cg7xS/Ge8hu7sm/zHcZwXdwQw8bLhMj
 qoamFVkiXnyUnOQaYHSyD330ccJLSHVktYI73a2xVySC4aMZk3lcG7MQSrgTM4aGjN04xOhqSOW
 qctmgl860BHUZmmd4zNRXfYN4iLK3N8jaI1yw6evkMb8BflOc/lFYObfahNX3QTo2JztpFJGuCs
 +i6L7VWCQPOt4Qem9SCjyxv+Pwq184Wc9COKg1s7jRJ7tY02j/w/DQKyIjOy1j9+uJm5UbK9891
 4Wbs2KaRTkXprz2pembFEzd5/YU8o81wFuKmoqajMySoKVcICwzpEIB/yRAnmOuzJ3xGdYQm6JP
 d4mKp4RsTzSLCdZ2l7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_interface.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
index 81f760dc07f8..bcbb837c9675 100644
--- a/drivers/gpu/drm/logicvc/logicvc_interface.c
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
@@ -194,6 +194,13 @@ int logicvc_interface_init(struct logicvc_drm *logicvc)
 		drm_connector_helper_add(&interface->drm_connector,
 					 &logicvc_connector_helper_funcs);
 
+		ret = drm_connector_set_orientation_from_panel(&interface->drm_connector,
+							       interface->drm_panel);
+		if (ret) {
+			drm_err(drm_dev, "Failed to set panel orientation\n");
+			goto error_encoder;
+		}
+
 		ret = drm_connector_attach_encoder(&interface->drm_connector,
 						   &interface->drm_encoder);
 		if (ret) {

-- 
2.47.3

