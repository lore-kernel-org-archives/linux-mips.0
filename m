Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013027;
	b=ewZY/qEhSE79GM0JZWyp+EFct0sdw3fRx1l6TsGijOWxr/r1W0P+NhoPdjjP7FuFxAdh
	 N1FRfWFkjrgmhRyfHXIVHFoJnGu2iGq2Ds+4wqmqmogFiHUMFOGd3ULEvEc3nXYkmikEw
	 TXIUpOwvMSvenaqwhmwznWg/8yOiz7zKIjsl1EmzkdduTQ8g2zLbwAtc36htGSMp6tlDg
	 Db3KCwYbNglqfH8Rx8MAeRVc7MdajNMvwhC9yMwD5Qn8ozJEXfQkqYmspkvDQEGjW3Ly7
	 DmRDclhCreb/EwQXRWRq6rxgkGEI9IGHADu/EHa3obYg3YFsJ/chUPQVyYiJJLSFlIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=;
	b=zpIQT+4EMXfpY/fwQRyXaF70s4mTi172FWI8zUTCIOMJpRflNcMbe4v6AiZaioKPlPr/
	 JyT08m9hh8afEiY89I8SJ84rsLpiNUb4zpS0F7iJa4zu3IQs6q0WpdhJGgYHy5dk/wvlw
	 SaQAyFVZz5tMReEZpY9migEOBBxTxwFiBqUZcnijQ6ykGmCnD7Cf9cfu/G1CPUUsanzzw
	 p6VnFS2DNks3+G6hnc/VcEQdEJBCsr2H1kVYB7uhzVJmy0lluQjWFtv1yUf5iPO+oilVt
	 0fhA6f4nET8Mpg9OsICGVHLTxsT3ia+Ev7gDjglXPaDLRfUsI6LO3EDKUebgmbEN4yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1IVgT0j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oa1lIdf0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C372360A2617
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C372360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1IVgT0j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oa1lIdf0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt08L2168793
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=; b=I1IVgT0jmhAC2asb
	J2XIZ6qxrePL3+97AuF+S4wz3Lt1dXjnZnF0T8sPuCfcUhoomUFYogeVOEyDrRjq
	+DJ31F/WW9Bj+SGuYuX/2kwO11o+3AK0FPpsD2WcFjdHo9/oElGoan0t6iKjoiIz
	nn3W8Zy4qp2I4p5sCEnh9f1dVeL/50uzJwn/LiQc1i8g6YO861aLZXFv4gWBXtNK
	acuYl5CXhJjRLGL+pAn/xd/9MbV+xu5JL4VrmXhd/ltSPAEYR+dVj95wmuXULgbN
	eA2r14pxbl+bggXOXXMG74BnntY+l+9tKi6SSQxT4o8HI5QHK8bFLjTLnBzGbGrJ
	Hd55bA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60fmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso722674585a.2
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 04:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013025; x=1793617825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=;
        b=Oa1lIdf0d7QxTx1LX+dPpjLyq+M5WkCGdxTQ7MhPvbo9Mx9FrFeYdzm3r1W5orG6WG
         23yf54vEYuD0zHnNICIYm/OVwRZwatuDiFxEOMvyj5hFu9DgXsYxbHHMXFWYvq+11SXm
         LyQuD48rNGT1B85CfGKc4qBsjWjPeRJ8ZohV0lASt+rMKZjqqrEK8R2qGAySETv3UZpy
         7NL8W4O259n7tuueM2VqlsLIYP6xSzLe193vpZkILmu/0DqG1qent0uyTQmasbYQ+AJS
         EkRnRBNAq4y+DfZEZBdRO067YAns8zAxyjxGFCMm0IiTWRLZddjZHY6F7Uau8vzLcaCE
         IsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013025; x=1793617825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=;
        b=nCRLvMeD720MNMX6cH4SBsJDr5Ezfqqe+Ha8oeb8Zl3WIkljg59tWkPIsiYC2z1q8X
         lW6DGhMs6qCAdSeFVBLHsm9aiX2Iq2X14+rDVhunj+WKjzIZzluoWuEURYeU+T/B6r15
         dtLre01R2g9z+VJsRNjevnhvAYx9tKmKYQLXna4y1EMCYFWBFIbgQNLsFST9Jbl2o7bA
         FfZp6UGPZZFjZTCEviXD8jAUY0DJ0Qy1BqoomuqNL8F34DXDPuPoWoAf9AQ7j+GlwcZU
         eqvHcMGwpujazDKEIKaVZnOoQM9bljkBFNiMN9GW51/8MkI6HxnuMLmI+ZO5OLHntVxJ
         C/Kg==
X-Forwarded-Encrypted: i=1; AKwUvBy7pQumDZi/39wfBCF+d97yJcfpN+fR6RFlsjPIAS87N+lM6q6LlGFevBI43R+x3nrm8EhP2zu3enE+@vger.kernel.org
X-Gm-Message-State: AFq9FYLD7iAy2wQbR3cet8JRQHFWPREkZzmC05NsxKJr2YGn7NQ9EgK7
	0XfRkNECN1D4wstqgFdohWCGxOEkvV4q3PQMz7/VpejPt3HJJxWRBFknKIjSmzSsyI1ufsIkvbe
	SjM4deIPaszlt6ffZp7OkBrq6ID9T1NoJ4dr21Dnn32ldHwspFEXTHdB0FsWo25yS
X-Gm-Gg: AYBFou21P+jc3fAu91uXivpVuS/afuAsxR2KAkBKUBoeLmHIaz/P7mEMqO6i6QKI8HT
	rOc/pPH6RvDb4LPSkkarW+Bwva9BI4oFxnf69fwJnHsSgeBXpUg/Orhy4cLgAUHxMtR5DK9EEdX
	9TF4eViRjO6i55SZlV77C+WwS1a6OW91Ib4zwb+pRcAnQTvW/4JYqlyoI8Afc/k6PlKUicGLGse
	rfj508MZ4dGTgIrao4D4jq6H71MIHQlEGct06h+nGajGPWDnphBXM21sdcPMLpsWj+mHbZTnKBB
	dmfzvnP3mlsLof0/q7xqnMPJFnjWAsOPScLmd+jQMfS+QnnNu+1KwwP8Si6ZwxqyOGMdxlREulj
	fmvkrKMcQQQYEgetLDgI69BVHc+WTvDufbyQWCyZEKkusF3s/JWfeK0IrJeLoTf4epKFkIR6piR
	dMMUG4LkbxR+OX
X-Received: by 2002:a05:620a:448a:b0:93a:3d67:391f with SMTP id af79cd13be357-940ef7d5658mr870022885a.7.1793013025086;
        Mon, 26 Oct 2026 04:10:25 -0700 (PDT)
X-Received: by 2002:a05:620a:448a:b0:93a:3d67:391f with SMTP id af79cd13be357-940ef7d5658mr870018485a.7.1793013024566;
        Mon, 26 Oct 2026 04:10:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:52 +0200
Subject: [PATCH 03/35] drm/tidss: get the panel type from the embedded
 bridge
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
Message-Id: <20261026-drm-panel-funcs-v1-3-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ahWXP0kp+S5t7qf5z3TmyzjNxmZan19MSz4+hCT4HOY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUGItgb6kKK4AjO3W9Om73g2vCXma6yznbKl
 LFUKHSAbf+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BgAKCRCLPIo+Aiko
 1c1kB/9LbGiOdDtx2eRR0gizf/fYpmreaM6z8w6EdAOFy1t/Abha1FUFd3caC3ERdnTesJb3RMt
 MQXRJn836BfxLcfr9grvPR645KCe339m9p6BgSfw+vPkemOuMfeMue4u5SDVupVid25yf4z7/0O
 /TXoov8P6bhXWyVeULl+m3JETg3qSoN99E9vQSJYSVTlWET+ZjFIjiHJfBHNNzKnVHYftfAHQsr
 VRe9z3PgswquJGQe/caiFzqlKOR6D3WWeU8ZHiOdVVf46Rm8u/Cm4seRvZ88SAHSwh4bHqD3nZD
 uzSrdXcMs4kpU2bLoFGLD29eYswEr61gzU/IKo39B93AULEn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: afHmfvmSUlfhP-GlmZS7UtOhKEmyrbRi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7vY1iQhj/Uqs
 L+/Ev4yI59N3sI4VPuOWGHd527k4q8XZtxMTO+itnP4EZWu+rllouQ9US72bLL4F4kpvU33MfI5
 RwjNiAfkKHoMGyUg1LRjNYaZWRtaOQf9PXkqWnfPELEVLZVTF00AsxafVOV53mcrnveYWkY0yhX
 HIrgyCcN8FPnKUjp8UpQhul8Dqg/RFga545Fxg2/YYjNRNdIpANxCJNqkVoGcbEwHOI1gSqUex4
 +VzrfgJON00TA5+SqBNp9zOxQdKCOgIGmjbcHG3kxyla72ri5znl3DHYtk6iVlyBW5aoh2apYo+
 /vreLA4DWZ4ZCMEd+FLNSqQUd/7o6pt5NiP11fP9G6l0auc4BB0n7UteGUmioXr8NUtLWNC0eHJ
 HuawjnD2huVGjpYF1eb25haKvaY1sy18hSDMLHHRRpHQajcL7xYlB0mDOJGmXdjQ6HWb2JbeYOo
 xL80wOxxTFLBprTc3TA==
X-Proofpoint-ORIG-GUID: afHmfvmSUlfhP-GlmZS7UtOhKEmyrbRi
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf3522 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PT7dRZsv_P8SEcnFsy0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX1vRSF3R7hr33
 rMNK+KJaI9/qmwhN/t8bg0lhIls6LvEPhL94wfYmmYCzVjPZwbIGO/MecUpHsw0FrYAdK9fv7z7
 IpX9s2snALtMV9xBvTGBcPio01mBPoo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type of a panel is also available as the type of the bridge
embedded into it. Use that one, so that drm_panel.connector_type can go
away.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 70c14c3be10d..b98a48085db1 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -181,11 +181,11 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 				goto put_panel;
 			}
 
-			if (panel->connector_type != conn_type) {
+			if (panel->bridge.type != conn_type) {
 				dev_err(dev,
 					"%s: Panel %s has incompatible connector type for vp%d (%d != %d)\n",
 					 __func__, dev_name(panel->dev), i,
-					 panel->connector_type, conn_type);
+					 panel->bridge.type, conn_type);
 				ret = -EINVAL;
 				goto put_panel;
 			}

-- 
2.47.3

