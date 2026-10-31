Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463459;
	b=aNDGc2FG//a1iOmSvFkCUVgTUd3DjWuYhatR9VI7RJr7B0qMExyeYH8v516oko5kA11X
	 l/8nhRb0DXq+wgR6CUUCOlzbIzKVmWubZQt47BtBtNgnGQB5qikSliTp3d2/clMK/gvMp
	 F/ctFNW78eG9SQ4EG8Xtjw4FyXHkC1jztq8/dDG+l6nOyF1e0PkZh2HsKVldkn/FSkukX
	 crOz33jQpM/jPmDqAoHhIXJ7jrA0D06cZVwNUQPUWbshsP/Ul/E+SNp/kzZE0QxZ5jbsU
	 VtxY54DWdVflWd2udApJPq7ZA1Q1vrc0vcPPc61MdN76fv2GCdwSOQ/aY2+O/nN/yPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MKAF1yU3dsH3xPiGgQsiz0cRqHhH3deT2s3XLmIxZNU=;
	b=Ne2aI7RJ6jDLcDx3VGyELwOD5Z21llvx7neY6hggl+FRMZDvPH/eW/G2gBvQPUm95fQz
	 epw+T7EP1c0sFY7RFdSxpw8t4EIy5Fz2LcJfyb1PClTBLx+Sj8V7vkCJi7avwNW1telmF
	 bNTSy9gJvXCMyuuV6bPYXkldAmxY94//UaTmOgcfu2sLhG3F9y7+DoyQRGyWprRgOhsX+
	 4d4Om8xJ2PQN4Sigk33PzHat1RHvxDd98iqdfFA4XBu91e969JbGst15aP5csXRMNtDZI
	 70IoO5e++j/4mg/sljFK9qyuSJfx5oC8WH5w65KxwktdZE/4JChtiadKGEiYYrADwEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QvB72mTU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+aVREB1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B89606A320
	for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2026 16:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B89606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QvB72mTU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+aVREB1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxrgS2161136
	for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2026 16:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MKAF1yU3dsH3xPiGgQsiz0cR
	qHhH3deT2s3XLmIxZNU=; b=QvB72mTUHo6A4AVKQ/l4aWjqbBPj3k6hKKiOrc3L
	hko/uvjFzffkl1HUVLsn5ygrIgBumEyYSAVqFoS5aJIevbhKEHAu796ZnnnZ8dte
	SvtYqrSdcjlBgoZ8S9M5uuspxv7l/6ZJmNA4sFZxFlXWJ+FiRqRzwDFR7/GhOH+f
	8ZOsbpZABNQI3W9MRx7TIR6NnX8pGG7emNpI2f8NPIVfY3gVJOXVQc+DSlIl4IMf
	wBvsxmZeSV6Z8DoU6RwYuiI0ETAPT+13/Q7K3AfOhuTPOx7ShiQh51tFKZG81jv8
	oSaQjjIY7haoqZJB6sKeTaasKeplqJxhafHFUC2I7BAZFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2shv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2026 16:17:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so152795285a.0
        for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2026 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463457; x=1794068257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKAF1yU3dsH3xPiGgQsiz0cRqHhH3deT2s3XLmIxZNU=;
        b=S+aVREB10YupwNpet5YGmwdoWYCwpYkTdDjG1AvHTRNf9wQLI8fT6coX3BIr7DPZ5i
         i/pmUSCpJymmDrhsT+SdCq90QtVqYFKSPE3WlqNu0/yxwY8oshRyFNbersYOVWlBWTeK
         gReJXmTkx+aRsx//SblwjDiLYk/AiB0CuLoqcl+FfeQxBil7U+tpvfFCdefoO5dL9zRx
         SIm2qqfTHQbGxH6dUXWZMiEzlAyv/OQjTtiJ20npvwI/+IMQs6Qureta1TEnX2lV7l/z
         A9yvhwhnj0NouNzxPjax7zwHSb5WZPzyn8N8ThZ+nwvgQbuHcq9TB2y35bH01bfZoiMR
         6WVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463457; x=1794068257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKAF1yU3dsH3xPiGgQsiz0cRqHhH3deT2s3XLmIxZNU=;
        b=UtpLtlNzdv+0hfhXFI6hEXecm0k0/SzIXK0nkJs+fXOpZEjQcAIHGJK3gV/ybLwlcz
         d/DFXDxHLRbNHpUaIjsPuHY0WdI8eqyqxDXQbtssUyGV2bH5gdoSc8JtKJ+C+oXfoydL
         /A215PNFp7wHq9g9ndRvAXtt4yQ4f7nVbUOGmqOT4Xpz6gSjRJdzlGO5VxRX18rAgjW1
         VGY4s2DTRyVB1GK4dmVya0BnaxQxUXwVa8tj9xa5iUnmnRtz2+iPXaePuEpvbY1LE4Nx
         gUJ/OO7ypwyuDXCEMyRok7cEk4eGNMiu+M5uBkdVdKSdlrMrKCKMU1bcVnRBMkb1s11f
         nb1A==
X-Forwarded-Encrypted: i=1; AKwUvBwKaOGO2qfpmRf/iDXGrWGrgzUeNpptgTSMqGeYHvNqnS5FhvdCAh05MIxYfZp3sc/R8Dcz6TCW6NY7@vger.kernel.org
X-Gm-Message-State: AFq9FYI4CdxjX5HnBOh6GWZUuz6jv/+9eh+iq1oNkZqKUZxXDRCYTL9E
	XnXYScgRc3rZ73zNN43qX0tIBRZRCEpq9yaC9bADfKgS+Wlic2WB13fOjAijbMj/M9BO7OozXmd
	IzTS7RMmehk6gTBvmmsuwok7rVHM4JeVaxkU4Zu3C0fOP5x5O/y9R1mN8aDsRS4YS
X-Gm-Gg: AYBFou1X9D5y3DYrMq5Hys8wRbBH0c//kk/TySEIH6nOAWtnYVTSHWYfpwyEdgCGOB1
	/vN0VHHZXg/euTG/lvXlB7fMAPM5le3b0mqRaiXORCBz/PdlFmmxt4g7ySjpIpWhANujeX6HzGg
	nk5DFndtbnsIC/l2BvH0JvdUslYEFebKhpvW1219/q67r+LoDDl7pKkBUJV9ZnxTpxkLT6jxBUx
	R5YkCO4VFfKMXOUMUJTTpGXp67jFxSGBq0wWv74lKf7yiiFYAWtmbwkpgbgaAT4i/j8IXt77Fm6
	0aAKu7qPionavPFvX7hUJ3l2nMTT+wIYjUlzWfeSaAnm3EJDedCqduvgqhkKswl8YG+LFpeheDy
	GYq5AqCkyRGAtQ1SYz2wZ78PBBEMq8QtvT2XC2Seor7+JIBryHzYug5BfZnK8DR8QMyzsiPmQv9
	UBlshBypauSjn55EjYkNnFsjX7oCf/fdytewa2eZH3RBNUoQpOA3h/GYj3siK9bw==
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr880674685a.44.1793463456302;
        Sat, 31 Oct 2026 09:17:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr880663185a.44.1793463455660;
        Sat, 31 Oct 2026 09:17:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07403cesm624624e87.58.2026.10.31.09.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:17:33 -0700 (PDT)
Date: Sat, 31 Oct 2026 18:17:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Douglas Anderson <dianders@chromium.org>,
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
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
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
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
        Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 04/35] drm/bridge: lvds-codec: use
 devm_drm_panel_bridge_add()
Message-ID: <dj5k6rjb2dcta3gq4jpimkhqimtx3cs2j3ghtgr3c7kofjnwqq@hsnx5km7bszj>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-4-5e3070a3478f@oss.qualcomm.com>
 <179338130512.3009485.15498623134248772053.b4-review@b4>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179338130512.3009485.15498623134248772053.b4-review@b4>
X-Proofpoint-GUID: DId7mZh2q898lb0BXkQKSDYAbcagD-r5
X-Proofpoint-ORIG-GUID: DId7mZh2q898lb0BXkQKSDYAbcagD-r5
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae614a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=rdXaneg_s35KUMNfVVkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfXzOcVyMo5ZeKK
 qGBOjHfDqCakuC+OAxfyL6PLNxFILFegbOGBM7Vi5i60r2iiSrTp47jMPCVy0IelCDSsQCmp0jR
 7xEexOTond6S+MuUPaaFGYkYodRgX5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX7DCw23obbL5G
 p5t56sU2EDQSFK0HJHnASAApzbJxOu4WswqZ/QhcA0JHlboRXfVwjLq6p9KwwlM501WVvkXQLY0
 GKKIoxfAaJy26ED9r1KIUBP9l7IcoB+4bz6Yg7HWYt1DsGLs2EVefqNRKxLSw8qfxOMUHtM4i6r
 +DBOohRFi3lRCEKNwFnLMR5EwpdCoKySa7GJM5SQ5hMfXsJDsScUtPx/KR+S7P1dg3e/gdgOI5T
 x4JAU4NUJIefreSktFD2Py6lOZ6zGq0EmgrqhUzw+WiAoQki2rivDGIYSluzQnUpqlEK60/vd2+
 KHm3FfjIEeuw2UutdFXsCRJfPN/Owc0We5V27tNeqgOhQq/fFdFNiCPSgIS4UfCYmBboMD4u8HK
 maeDr0DV9032o2dL6fxQdjI2wbfFrtUEqS019llpCiLodooNnuuUgqvr0Nroe63r2sGb96PxnRm
 R/24y1Y+XlM7Omr8Wew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

On Fri, Oct 30, 2026 at 06:28:25PM +0100, Luca Ceresoli wrote:
> > The connector type passed to devm_drm_panel_bridge_add_typed() has been
> > ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
> > every drm_panel"), the bridge always has the type of the panel.
> >
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> > index f97c8586273d..d25d8d777191 100644
> > --- a/drivers/gpu/drm/bridge/lvds-codec.c
> > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > @@ -154,8 +154,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
> >  	}
> >
> >  	lvds_codec->panel_bridge =
> > -		devm_drm_panel_bridge_add_typed(dev, panel,
> > -						lvds_codec->connector_type);
> > +		devm_drm_panel_bridge_add(dev, panel);
> >  	drm_panel_put(panel);
> >  	if (IS_ERR(lvds_codec->panel_bridge))
> >  		return PTR_ERR(lvds_codec->panel_bridge);
> 
> By now drm_of_find_panel_or_bridge() + devm_drm_panel_bridge_add_typed() is
> jsut a complicated wrapper to drm_bridge_get(), so this driver and those in
> the following commits could be simplified dramatically, without adding the
> deprecated devm_drm_panel_bridge_add().
> 
> However devm_drm_panel_bridge_add_typed() is _more_ deprecated than
> devm_drm_panel_bridge_add(), so this is already a good step forward.

Yes, I wanted to do a minimal steps, to simplify the reviews.

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
With best wishes
Dmitry
